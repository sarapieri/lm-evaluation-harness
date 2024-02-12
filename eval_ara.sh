#!/bin/bash
CUDAVER=cuda-11.8
export PATH=/home/fahad.khan/sara.pieri/cuda/$CUDAVER/bin:$PATH
export LD_LIBRARY_PATH=/home/fahad.khan/sara.pieri/cuda/$CUDAVER/lib:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=/home/fahad.khan/sara.pieri/cuda/$CUDAVER/lib64:$LD_LIBRARY_PATH
export CUDA_PATH=/home/fahad.khan/sara.pieri/cuda/$CUDAVER
export CUDA_ROOT=/home/fahad.khan/sara.pieri/cuda/$CUDAVER
export CUDA_HOME=/home/fahad.khan/sara.pieri/cuda/$CUDAVER
# source ~/miniconda3/etc/profile.d/conda.sh
# Activate the environment
export HF_HOME="/home/fahad.khan/sara.pieri/hf"
# conda activate eval2
# cd /home/fahad.khan/sara.pieri/lm-evaluation-harness
# Define the model name
# '/home/fahad.khan/sara.pieri/output/output_vicuna13b_arabic_deepspeed'
MODEL_NAME="mistralai/Mixtral-8x7B-v0.1"
FOLDER_NAME="Mixtral-8x7B-v0.1"
# export CUDA_VISIBLE_DEVICES=0,1,2,3
# export ZENO_API_KEY="zen_b7yjUcraOBm12BEnFgtLq4zCANjf5ERRZtMxPKrufE0"

lm_eval  --model hf \
    --model_args pretrained=${MODEL_NAME},parallelize=True,trust_remote_code=True \
    --tasks mmlu_arabic,medqa_arabic,medmcqa_arabic,pubmedqa_arabic,usmle_self_assessment_arabic \
    --batch_size 8 \
    --log_samples \
    --output_path "output_ara/${FOLDER_NAME}" \
    --num_fewshot 5

# python ~/sara.pieri/eval/lm-evaluation-harness/scripts/zeno_visualize.py  --data_path output_ara --project_name "Eval2 Ara"


