#!/bin/bash
WORKSPACE=${1:-"./workspaces/audioset_tagging"}   # Default argument.

CUDA_VISIBLE_DEVICES=0,1 python3 pytorch/main.py train \
    --workspace=$WORKSPACE \
    --data_type='full_train' \
    --window_size=1024 \
    --hop_size=320 \
    --mel_bins=64 \
    --fmin=50 \
    --fmax=14000 \
    --model_type='MobileNetV3' \
    --loss_type='clip_bce' \
    --balanced='balanced' \
    --augmentation='mixup' \
    --batch_size=512 \
    --learning_rate=1e-3 \
    --resume_iteration=0 \
    --early_stop=100000 \
    --cuda \
    --use_wandb

# Plot statistics
#python3 utils/plot_statistics.py plot \
#    --dataset_dir=$DATASET_DIR \
#    --workspace=$WORKSPACE \
#    --select=1_aug
