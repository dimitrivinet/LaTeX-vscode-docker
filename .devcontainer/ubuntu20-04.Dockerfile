FROM ubuntu:20.04

RUN : \
    && apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get -y install --no-install-recommends --fix-missing \
        locales \
    && locale-gen en_US.UTF-8 \
    && update-locale LANG=en_US.UTF-8 \
    && :

RUN : \
    && apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get -y install --no-install-recommends --fix-missing \
        bash make nano git procps curl perl wget \
        biber \
        texlive-full \
        python3-pygments \
    && rm -rf /var/lib/apt/lists/* \
    && :

# https://code.visualstudio.com/remote/advancedcontainers/add-nonroot-user
ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=$USER_UID

# Create the user
RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    #
    # [Optional] Add sudo support. Omit if you don't need to install software after connecting.
    && apt-get update \
    && apt-get install -y sudo \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME
