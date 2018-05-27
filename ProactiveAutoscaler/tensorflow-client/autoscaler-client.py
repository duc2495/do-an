from __future__ import absolute_import
from __future__ import division
from __future__ import print_function

import numpy as np
import tensorflow as tf
import requests
from grpc.beta import implementations
from tensorflow_serving.apis import predict_pb2
from tensorflow_serving.apis import prediction_service_pb2
from influxdb import InfluxDBClient
from requests.auth import HTTPBasicAuth

tf.app.flags.DEFINE_string('server', 'tensorflow-serving:9000',
                           'Tensorflow server host:port.')
tf.app.flags.DEFINE_string('influx', 'monitoring-influxdb.kube-system:8086',
                           'InfluxDB server host:port.')
tf.app.flags.DEFINE_string('web', 'web-ui:8080',
                           'Web UI server host:port.')
tf.app.flags.DEFINE_string('namespace', 'default',
                           'Namespace on K8S.')
tf.app.flags.DEFINE_string('name', 'myapp',
                           'Application name.')
tf.app.flags.DEFINE_string('model', 'cpu',
                           'Model name.')

FLAGS = tf.app.flags.FLAGS

def _float_feature(value):
  return tf.train.Feature(float_list=tf.train.FloatList(value=[value]))

def _bytes_feature(value):
  return tf.train.Feature(bytes_list=tf.train.BytesList(value=[value]))

_init_feature = lambda value: tf.train.Feature(float_list=tf.train.FloatList(value=value))

def main(_):
  tfHost, tfPort = FLAGS.server.split(':')

  #Instantiate a connection to the InfluxDB.
  influxHost, influxPort = FLAGS.influx.split(':')
  user = 'root'
  password = 'root'
  dbname = 'k8s'
  
  client = InfluxDBClient(influxHost,  int(influxPort), user, password, dbname)
  query_usage = """SELECT sum("value") FROM "cpu/usage_rate" WHERE "namespace_name" =~ /""" + FLAGS.namespace + """/ AND "container_name" =~ /""" + FLAGS.name + """/ AND time > now() - 8m GROUP BY time(1m)"""
  query_request = """SELECT sum("value") FROM "cpu/request" WHERE "namespace_name" =~ /""" + FLAGS.namespace + """/ AND "container_name" =~ /""" + FLAGS.name + """/ AND time > now() - 8m GROUP BY time(1m)"""
  result_usage = client.query(query_usage, database=dbname)
  result_request = client.query(query_request, database=dbname)
  list_usage = list(result_usage)[0]
  list_request = list(result_request)[0]

  input_data = [0,0,0,0,0,0,0,0]
  for num in range(1,9):
    if list_usage[num]['sum'] is None:
      tmp = 0
    else:
      tmp = (list_usage[num]['sum']/list_request[num]['sum'])*100
      input_data[num-1] = int(tmp)
  print (input_data)

  channel = implementations.insecure_channel(tfHost, int(tfPort))
  stub = prediction_service_pb2.beta_create_PredictionService_stub(channel)

  request = predict_pb2.PredictRequest()
  request.model_spec.name = FLAGS.model
  #request.model_spec.signature_name = 'serving_default'

  feature_dict = {'inputs': _init_feature(input_data)}

  example = tf.train.Example(features=tf.train.Features(feature=feature_dict))
  serialized = example.SerializeToString()

  request.inputs['inputs'].CopyFrom(
        tf.contrib.util.make_tensor_proto(serialized, shape=[1]))

  result_future = stub.Predict.future(request, 5.0)
  prediction = result_future.result().outputs['outputs'].float_val
  print('Prediction: ' + str(prediction))

  current_cpu = input_data[7]
  future_cpu = int(prediction[0])
  time = list_usage[8]['time']
  measurement = "cpu/predict"
  json_body = [
    {
      "measurement": measurement,
      "tags": {
        "container_name": FLAGS.name
        "namespace_name": FLAGS.namespace
      },
      "time": time,
      "fields": {
        "value": future_cpu
      }
    }
  ]
  print(json_body)
  client.write_points(json_body)

  webHost, webPort = FLAGS.web.split(':')
  url = 'http://' + webHost + ':' + webPort +'/admin/project/' + FLAGS.namespace + '/app/' + FLAGS.name + '/current/' + str(current_cpu) + '/future/' + str(future_cpu)
  r = requests.get(url , auth=HTTPBasicAuth('admin', 'admin'))

if __name__ == '__main__':
  tf.app.run()
