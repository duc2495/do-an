#!/bin/bash
python autoscaler-client.py --server=$TF_SERVER --influx=$INFLUX_SERVER --web=$WEB_SERVER --namespace=$NAMESPACE --name=$NAME --model=$MODEL_NAME
