#!/bin/bash
export HF_HOME="~/sara.pieri/hf"
CUDAVER=cuda-11.8
export PATH=/home/fahad.khan/sara.pieri/cuda/$CUDAVER/bin:$PATH
export LD_LIBRARY_PATH=/home/fahad.khan/sara.pieri/cuda/$CUDAVER/lib:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=/home/fahad.khan/sara.pieri/cuda/$CUDAVER/lib64:$LD_LIBRARY_PATH
export CUDA_PATH=/home/fahad.khan/sara.pieri/cuda/$CUDAVER
export CUDA_ROOT=/home/fahad.khan/sara.pieri/cuda/$CUDAVER
export CUDA_HOME=/home/fahad.khan/sara.pieri/cuda/$CUDAVER
source ~/miniconda3/etc/profile.d/conda.sh

# Activate the environment
# conda activate eval2
# cd /home/fahad.khan/sara.pieri/lm-evaluation-harness

# Define the model name
MODEL_NAME="lmsys/vicuna-7b-v1.5"
FOLDER_NAME="vicuna-7b-v1.5"
#export CUDA_VISIBLE_DEVICES=0,1,2,3

lm_eval  --model hf \
    --model_args pretrained=${MODEL_NAME},parallelize=True,trust_remote_code=True \
    --tasks mmlu_anatomy,mmlu_clinical_knowledge,mmlu_college_biology,mmlu_college_medicine,mmlu_medical_genetics,mmlu_professional_medicine,medqa,medqa_4options,medmcqa,pubmedqa,usmle_self_assessment \
    --batch_size 8 \
    --log_samples \
    --output_path output_eng/${FOLDER_NAME} \
    --num_fewshot 5


# python scripts/zeno_visualize.py --data_path output_eng --project_name "Eval2 Eng"
