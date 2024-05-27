#!/usr/bin/env bash

GPUS_PER_NODE=2
MODEL_NAME="resnet18"
BATCH_SIZE=256
N_WORKER=3
EPOCHS=2

# checkpoint prefix
CHK_PREFIX=/datadrive/home1/chk/
# data prefix
DATA_PREFIX=/datadrive/data/imagenet/official/

if [[ -z $1 ]]; then
    echo "Usage: $0 [ckpt|nockpt]"
    exit 0
fi

if [[ $1 == "ckpt" ]]; then
    echo "Enable checkpointing"
    python3 -m torch.distributed.launch --nproc_per_node=${GPUS_PER_NODE} models/image_classification/pytorch-imagenet-cf.py --dali \
                                        -a ${MODEL_NAME} \
                                        -b ${BATCH_SIZE} \
                                        --workers ${N_WORKER} \
                                        --epochs ${EPOCHS} \
                                        --deterministic --noeval --barrier --checkfreq \
                                        --chk-prefix ${CHK_PREFIX} \
                                        --cf_iterator \
                                        --data ${DATA_PREFIX}
else
    echo "Disable checkpointing"
    python3 -m torch.distributed.launch --nproc_per_node=${GPUS_PER_NODE} models/image_classification/pytorch-imagenet-cf.py --dali \
                                        -a ${MODEL_NAME} \
                                        -b ${BATCH_SIZE} \
                                        --workers ${N_WORKER} \
                                        --epochs ${EPOCHS} \
                                        --deterministic --noeval --barrier --checkfreq \
                                        --chk-freq 0 \
                                        --chk_mode_baseline \
                                        --chk-prefix ${CHK_PREFIX} \
                                        --cf_iterator \
                                        --data ${DATA_PREFIX}
fi
