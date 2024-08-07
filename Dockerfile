FROM nvidia/cuda:11.7.1-cudnn8-devel-ubuntu22.04 as base

# ARG MODEL="yolo_world_l_dual_vlpan_l2norm_2e-3_100e_4x8gpus_obj365v1_goldg_train_lvis_minival.py"
# ARG WEIGHT="yolo_world_l_clip_base_dual_vlpan_2e-3adamw_32xb16_100e_o365_goldg_train_pretrained-0e566235.pth"

ENV FORCE_CUDA="1"
ENV MMCV_WITH_OPS=1

RUN apt-get update && apt-get install -y --no-install-recommends \
    python3-pip     \
    libgl1-mesa-glx \
    libsm6          \
    libxext6        \
    libxrender-dev  \
    libglib2.0-0    \
    git             \
    python3-dev     \
    python3-wheel


RUN pip3 install --upgrade pip \
    "numpy<2" \
    && pip3 install torch==1.13.0 torchvision==0.14.0 torchaudio==0.13.0

RUN pip3 install --upgrade pip \
    && pip3 install   \
        gradio        \
        opencv-python \
        supervision   \
        mmengine      \
        setuptools    \
        openmim       \
        transformers   \
        tokenizers    \
        mmdet==3.0.0  \
        mmcv-lite \
    && mim install mmcv==2.0.0

# COPY . /yolo
WORKDIR /yolo

# RUN pip3 install -e . --no-deps

# RUN apt-get -y update && apt-get -y install curl

# RUN curl -o weights/$WEIGHT -L https://huggingface.co/wondervictor/YOLO-World/resolve/main/$WEIGHT

ENV PYTHONPATH=$PYTHONPATH:/yolo:/yolo_world.egg-info

WORKDIR /yolo

