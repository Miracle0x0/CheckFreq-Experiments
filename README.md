# CheckFreq baseline for PipeCheck

存放 CheckFreq baseline 实验的相关魔改代码和脚本。

- [setup.sh](setup.sh): 在 Docker 容器中安装 PyTorch 等环境。apex 可能需要禁用 CUDA 版本检测才能成功安装。
- [launch.sh](launch.sh): 在 Docker 容器中启动训练，需要一个参数指示是否进行 checkpoint。`launch.sh ckpt` 表示进行检查点，`launch.sh nockpt` 表示不进行检查点。
- [docker.sh](docker.sh): 从宿主机启动 Docker 容器。
