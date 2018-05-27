#!/bin/bash
tensorflow_model_server --port=$PORT --model_name=$MODEL_NAME --model_base_path=$MODEL_PATH
