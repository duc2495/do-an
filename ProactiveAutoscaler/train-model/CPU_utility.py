import tensorflow as tf
import numpy as np
import argparse
from time import time

def parse_args():
	parser = argparse.ArgumentParser(description='Duc')
	parser.add_argument('--num_epochs', type=int, default=10,
	help='No. of epochs')
	parser.add_argument('--hidden_size', type=int, default=256,
	help='No. of lstm cells in each layer')
	parser.add_argument('--output_keep_prob', type=float, default=0.7,
	help='keep_prob factor')
	parser.add_argument('--num_layers', type=int, default=5,
	help='No. of layers')
	parser.add_argument('--learner', nargs='?', default='Adam',
	help='No. of epochs')
	parser.add_argument('--learning_rate', type=float, default=0.001,
	help='Learning rate')
	return parser.parse_args()


def get_rnn_model(features, labels, mode, params):

	#config params
	hidden_size = params['hidden_size']
	num_layers = params['num_layers']
	learning_rate = params['learning_rate']
	learner = params['learner']

	#input
	inputs = features['inputs']
	time_steps = inputs.shape[1]
	inputs = tf.reshape(inputs,[-1,time_steps,1])
	def _create_one_cell():
		lstm_cell = tf.nn.rnn_cell.BasicRNNCell(hidden_size, activation=tf.nn.relu)
		# lstm_cell = tf.nn.rnn_cell.DropoutWrapper(lstm_cell, output_keep_prob=keep_prob)
		return lstm_cell
		
	cell = tf.nn.rnn_cell.MultiRNNCell(
		[_create_one_cell() for _ in range(num_layers)],
		state_is_tuple=True
	) if num_layers > 1 else _create_one_cell()
		
	val, _ = tf.nn.dynamic_rnn(cell, inputs, dtype=tf.float32, scope="dynamic_rnn")
	outputs = val[:, (time_steps-1):, :] # last one only
	
	#flatten lstm output and pass through a dense layer
	lstm_flat = tf.reshape(outputs, [-1, cell.output_size])
	h1 = tf.layers.dense(lstm_flat, cell.output_size//2, activation=tf.nn.relu)
	predictions = tf.layers.dense(h1, 1, activation=None) # (?, 1)
	
	export_outputs = {
		'out_put': tf.estimator.export.RegressionOutput(predictions)
	}
	predict_op = {
		'predict_one': predictions
	}
	if mode == tf.estimator.ModeKeys.PREDICT:
		return tf.estimator.EstimatorSpec(mode=mode, predictions=predict_op, export_outputs=export_outputs)
	target = tf.reshape(labels,(-1,1))
	# loss = -tf.reduce_sum(labels * tf.log(tf.clip_by_value(prediction, 1e-10, 1.0)))
	loss = tf.losses.mean_squared_error(target, predictions)
	if mode == tf.estimator.ModeKeys.TRAIN:
		if learner.lower() == "adagrad": 
			optimizer = tf.train.AdagradOptimizer(learning_rate=learning_rate)
		elif learner.lower() == "rmsprop":
			optimizer = tf.train.RMSPropOptimizer(learning_rate=learning_rate)
		elif learner.lower() == "adam":
			optimizer = tf.train.AdamOptimizer(learning_rate=learning_rate)
		else:
			optimizer = tf.train.GradientDescentOptimizer(learning_rate=learning_rate)

		train_op = optimizer.minimize(
			loss=loss,
			global_step=tf.train.get_global_step())
		return tf.estimator.EstimatorSpec(mode=mode, loss=loss, train_op=train_op, export_outputs=export_outputs)

	# Separated from train loss.
	eval_metric_ops = {
		'loss_rmse': tf.metrics.root_mean_squared_error(target, predictions),
		'loss_mae': tf.metrics.mean_absolute_error(target, predictions)
	}

	return tf.estimator.EstimatorSpec(mode, loss=loss, eval_metric_ops=eval_metric_ops, export_outputs=export_outputs)

def get_data(filename):
	data, x_batch, y_batch = [], [], []
	fin = open(filename)
	fin.readline()
	for line in fin:
		token = line.split(",")
		data.append(int(token[1]))
	for i in range(len(data)-12):
		x_batch.append(data[i:i+9])
		y_batch.append(data[i+11])
	return np.array(x_batch).astype('float32'), np.array(y_batch).astype('float32')


def main(unused_argv):
	args = parse_args()
	num_epochs = args.num_epochs
	params = {
	'hidden_size' : args.hidden_size,
	'output_keep_prob' : args.output_keep_prob,
	'num_layers' : args.num_layers,
	'learning_rate' : args.learning_rate,
	'learner' : args.learner
	}
	# Train model
	print('Training model...')
	x_test, y_test = get_data("testset.csv")
	config = tf.estimator.RunConfig(keep_checkpoint_max=20)
	rnn_model = tf.estimator.Estimator(model_fn=get_rnn_model, model_dir="/home/duc2495/Models/"+str(time()), params=params, config=config)
	inputs, labels = get_data("dataset.csv")
	for i in range(num_epochs):
		
		train_input_fn = tf.estimator.inputs.numpy_input_fn(
			x={
				"inputs": inputs,
			},
			y=labels,
			num_epochs=1,
			shuffle=True
		)

		rnn_model.train(input_fn=train_input_fn)
		# Test model
		print('Testing model...')
		eval_input_fn = tf.estimator.inputs.numpy_input_fn(x={"inputs" : x_test}, y=y_test, shuffle=False)
		test_result = rnn_model.evaluate(input_fn=eval_input_fn)
		print(test_result)

	serving_input_receiver_fn = tf.estimator.export.build_parsing_serving_input_receiver_fn(
		{'inputs': tf.FixedLenFeature(dtype=tf.float32, shape=[10])},
		default_batch_size=None
	)
	rnn_model.export_savedmodel("/home/duc2495/Models/Serving/",serving_input_receiver_fn)

	print('Done Training!')
if __name__ == "__main__":
	tf.app.run()




	
