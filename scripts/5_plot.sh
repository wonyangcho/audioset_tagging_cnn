#!/bin/bash
WORKSPACE=${1:-"./workspaces/audioset_tagging"}   # Default argument.


# Plot statistics
python3 utils/plot_statistics.py plot \
    --dataset_dir=$DATASET_DIR \
    --workspace=$WORKSPACE \
    --select=mobilevit
