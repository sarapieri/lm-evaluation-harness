export HF_HOME="~/sara.pieri/hf"
CUDAVER=cuda-11.8
export PATH=/home/fahad.khan/sara.pieri/cuda/$CUDAVER/bin:$PATH
export LD_LIBRARY_PATH=/home/fahad.khan/sara.pieri/cuda/$CUDAVER/lib:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=/home/fahad.khan/sara.pieri/cuda/$CUDAVER/lib64:$LD_LIBRARY_PATH
export CUDA_PATH=/home/fahad.khan/sara.pieri/cuda/$CUDAVER
export CUDA_ROOT=/home/fahad.khan/sara.pieri/cuda/$CUDAVER
export CUDA_HOME=/home/fahad.khan/sara.pieri/cuda/$CUDAVER

python /home/fahad.khan/sara.pieri/eval/lm-evaluation-harness/scripts/write_out.py \
    --tasks mmlu_anatomy,mmlu_clinical_knowledge,mmlu_college_biology,mmlu_college_medicine,mmlu_medical_genetics,mmlu_professional_medicine,medqa,medqa_4options,medmcqa,pubmedqa,usmle_self_assessment \
    --num_fewshot 5 \
    --num_examples 10 \
    --output_base_path /home/fahad.khan/sara.pieri/eval/lm-evaluation-harness/output_explore

    #--tasks mmlu_arabic,medqa_arabic,medmcqa_arabic,pubmedqa_arabic,usmle_self_assessment_arabic \