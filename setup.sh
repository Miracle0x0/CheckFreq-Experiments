#!/usr/bin/env bash

# Pre-requirements
pip install packaging

# PyTorch 1.8.2
pip3 install torch==1.8.2 torchvision==0.9.2 torchaudio==0.8.2 --extra-index-url https://download.pytorch.org/whl/lts/1.8/cu111

# NVIDIA apex previous version
git clone https://github.com/NVIDIA/apex
# TODO: checkout to previous tag
# TODO: disable CUDA version check
pip install -v --disable-pip-version-check --no-cache-dir --no-build-isolation --global-option="--cpp_ext" --global-option="--cuda_ext" ./

