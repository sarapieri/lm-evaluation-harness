#!/bin/bash
CUDAVER=cuda-11.8
export PATH=/home/fahad.khan/sara.pieri/cuda/$CUDAVER/bin:$PATH
export LD_LIBRARY_PATH=/home/fahad.khan/sara.pieri/cuda/$CUDAVER/lib:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=/home/fahad.khan/sara.pieri/cuda/$CUDAVER/lib64:$LD_LIBRARY_PATH
export CUDA_PATH=/home/fahad.khan/sara.pieri/cuda/$CUDAVER
export CUDA_ROOT=/home/fahad.khan/sara.pieri/cuda/$CUDAVER
export CUDA_HOME=/home/fahad.khan/sara.pieri/cuda/$CUDAVER
source ~/miniconda3/etc/profile.d/conda.sh

# Activate the environment
conda activate eval2
cd /home/fahad.khan/sara.pieri/lm-evaluation-harness

# Define the model name
MODEL_NAME="core42_jais-13b-chat"

lm_eval  --model hf \
    --model_args pretrained=${MODEL_NAME},parallelize=True,trust_remote_code=True \
    --tasks mmlu_arabic,medqa_arabic,medmcqa_arabic,pubmedqa_arabic,usmle_self_assessment_arabic \
    --batch_size 8 \
    --log_samples \
    --output_path "output_ara/${MODEL_NAME}"

python scripts/zeno_visualize.py --data_path output_ara --project_name "Eval2 Ara"
