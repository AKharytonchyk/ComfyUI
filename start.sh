#!/bin/bash
# Start ComfyUI with AMD Radeon 7900 XTX (ROCm)

# Set ROCm architecture for Radeon 7900 XTX
# echo "Setting ROCm environment for Radeon 7900 XTX (gfx1100)"
export PYTORCH_ROCM_ARCH=gfx1100
# Uncomment the next line if you encounter issues with ROCm version detection
export HSA_OVERRIDE_GFX_VERSION=11.0.0
#export PYTORCH_HIP_ALLOC_CONF=expandable_segments:True
#export PYTHONPATH=/opt/rocm-6.4.2/lib:$PYTHONPATH
#export MIGRAPHX_MLIR_USE_SPECIFIC_OPS="attention"
#export TORCH_ROCM_AOTRITON_ENABLE_EXPERIMENTAL=1
#export PYTORCH_TUNABLEOP_ENABLED=1
#export PYTORCH_KERNEL_CACHE_PATH=/tmp/pytorch_kernel_cache
#export HIP_FORCE_DEV_KERNARG=1
# Fix bitsandbytes ROCm compatibility issue
export BNB_BACKEND=cpu

# Environment variables for ReActor stability on ROCm
export OMP_NUM_THREADS=1
export ONNXRUNTIME_PROVIDERS=CPUExecutionProvider

# Optionally, activate your Python virtual environment here
# source ../venv/bin/activate
source ~/github/venv/bin/activate

# Start ComfyUI
# python3 main.py --lowvram --use-split-cross-attention --fp16-unet --listen 0.0.0.0 "$@" 
python3 main.py --lowvram --listen 0.0.0.0 "$@"
