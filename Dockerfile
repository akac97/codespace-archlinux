# Use Arch Linux base image
FROM archlinux:base-devel

# Update the system and install necessary packages
RUN pacman -Syu --noconfirm \
    && pacman -S git git-lfs nano fish bash --noconfirm \
    && mkdir -p ~/miniconda3 \
    && wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh \
    && bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3 \
    && rm -rf ~/miniconda3/miniconda.sh \
    && ~/miniconda3/bin/conda init --all --system \
    && mkdir /pyenv \
    && conda install -p /pyenv/ python=3.11 \
    && conda update --all \
    && usermod -s /usr/bin/fish root
