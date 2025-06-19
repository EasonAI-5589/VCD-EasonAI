seed=${1:-55}
cd_alpha=${5:-1}
cd_beta=${6:-0.2}
noise_step=${7:-500}

cd /root/autodl-tmp/VCD-EasonAI/experiments/eval
python -m object_hallucination_vqa_llava \
    --model-path /root/autodl-tmp/llava-v1.5-7b \
    --question-file /root/autodl-tmp/eval/MME/llava_mme_test.jsonl \
    --image-folder /root/autodl-tmp/eval/MME/MME_Benchmark_release_version \
    --answers-file /root/autodl-tmp/eval/MME/answers/vcd/llava-v1.5-7b.jsonl \
    --use_cd \
    --cd_alpha $cd_alpha \
    --cd_beta $cd_beta \
    --noise_step $noise_step \
    --temperature 0.0 \
    --conv-mode vicuna_v1

cd /root/autodl-tmp/eval/MME

python convert_answer_to_mme.py --experiment vcd/llava-v1.5-7b

cd eval_tool

python calculation.py --results_dir answers/vcd/llava-v1.5-7b

cd /root/autodl-tmp/VCD-EasonAI

# 运行脚本
# bash mme.sh

# /root/autodl-tmp/VCD-EasonAI/experiments/eval/object_hallucination_vqa_llava.py