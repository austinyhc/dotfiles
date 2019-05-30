# ==================================================================
# module list
# ------------------------------------------------------------------
# python        3.6    (apt)
# jupyter       latest (pip)
# pytorch       latest (pip)
# tensorflow    latest (pip)
# jupyterlab    latest (pip)
# keras         latest (pip)
# opencv        4.0.1  (git)
# ==================================================================

FROM nvidia/cuda:10.0-cudnn7-devel-ubuntu18.04

#FROM nvidia/cuda:10.0-devel-ubuntu18.04
#LABEL maintainer "NVIDIA CORPORATION <cudatools@nvidia.com>"
#ENV CUDNN_VERSION 7.5.1.10
#ENV CUDNN_VERSION 7.4.1.5
#LABEL com.nvidia.cudnn.version="${CUDNN_VERSION}"

#RUN apt-get update && apt-get install -y --no-install-recommends \
#            libcudnn7=$CUDNN_VERSION-1+cuda10.0 \
#            libcudnn7-dev=$CUDNN_VERSION-1+cuda10.0 && \
#    apt-mark hold libcudnn7 && \
#    rm -rf /var/lib/apt/lists/*

RUN APT_INSTALL="apt-get install -y --no-install-recommends" && \
    PIP_INSTALL="python -m pip --no-cache-dir install --upgrade" && \
    GIT_CLONE="git clone --depth 10" && \

    rm -rf /var/lib/apt/lists/* \
           /etc/apt/sources.list.d/cuda.list \
           /etc/apt/sources.list.d/nvidia-ml.list && \

    apt-get update && \

# ==================================================================
# tools
# ------------------------------------------------------------------

    DEBIAN_FRONTEND=noninteractive $APT_INSTALL \
        build-essential \
        apt-utils \
        ca-certificates \
        cmake \
        wget \
        git \
        vim \
        libncurses5-dev \
        libncursesw5-dev \
        htop \
        curl \
        tmux \
        && \

# ==================================================================
# python
# ------------------------------------------------------------------

    DEBIAN_FRONTEND=noninteractive $APT_INSTALL \
        software-properties-common \
        && \
    add-apt-repository ppa:deadsnakes/ppa && \
    apt-get update && \
    DEBIAN_FRONTEND=noninteractive $APT_INSTALL \
        python3.6 \
        python3.6-dev \
        python3-distutils \
        && \
    wget -O ~/get-pip.py \
        https://bootstrap.pypa.io/get-pip.py && \
    python3.6 ~/get-pip.py && \
    ln -s /usr/bin/python3.6 /usr/local/bin/python3 && \
    ln -s /usr/bin/python3.6 /usr/local/bin/python && \
    $PIP_INSTALL \
        setuptools \
        && \
    $PIP_INSTALL \
        numpy \
        scipy \
        pandas \
        cloudpickle \
        scikit-learn==0.20.0 \
        matplotlib \
        Cython \
        && \

# ==================================================================
# boost
# ------------------------------------------------------------------

    wget -O ~/boost.tar.gz https://dl.bintray.com/boostorg/release/1.65.1/source/boost_1_65_1.tar.gz && \
    tar -zxf ~/boost.tar.gz -C ~ && \
    cd ~/boost_* && \
    ./bootstrap.sh --with-python=python3.6 && \
    ./b2 install --prefix=/usr/local && \

# ==================================================================
# jupyter
# ------------------------------------------------------------------

    $PIP_INSTALL \
        jupyter \
        && \

# ==================================================================
# pytorch \ fastai
# ------------------------------------------------------------------

    $PIP_INSTALL \
        future \
        numpy \
        protobuf \
        enum34 \
        pyyaml \
        typing \
        && \
    $PIP_INSTALL \
        https://download.pytorch.org/whl/cu100/torch-1.1.0-cp36-cp36m-linux_x86_64.whl \
        && \
    $PIP_INSTALL \
        torchvision \
        fastai \
        && \

# ==================================================================
# tensorflow
# ------------------------------------------------------------------

    $PIP_INSTALL \
        tensorflow-gpu \
        && \

# ==================================================================
# keras
# ------------------------------------------------------------------

    $PIP_INSTALL \
        h5py \
        keras \
        && \

# ==================================================================
# nvtop
# ------------------------------------------------------------------

    DEBIAN_FRONTEND=noninteractive $APT_INSTALL \
        libncurses5-dev \
        libncursesw5-dev \
        && \
    $GIT_CLONE https://github.com/Syllo/nvtop.git ~/nvtop && \
    mkdir -p ~/nvtop/build && cd ~/nvtop/build && \
    cmake .. && \
    make -j"$(nproc)" install && \

# ==================================================================
# jupyterlab and extensions
# ------------------------------------------------------------------

    curl -sL https://deb.nodesource.com/setup_11.x  | bash - \
        && \
    DEBIAN_FRONTEND=noninteractive $APT_INSTALL \
        nodejs \
        && \
    $PIP_INSTALL \
        jupyterlab \
        && \
    jupyter labextension install jupyterlab_vim  && \
    jupyter labextension install @jupyterlab/toc && \

# ==================================================================
# customization
# ------------------------------------------------------------------

    $PIP_INSTALL \
        librosa \
        nvidia-ml-py3 \
        PyWavelets \
        seaborn \
        && \

# ==================================================================
# config & cleanup
# ------------------------------------------------------------------

    ldconfig && \
    apt-get clean && \
    apt-get autoremove && \
    rm -rf /var/lib/apt/lists/* /tmp/* ~/*

