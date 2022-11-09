FROM debian:bookworm

RUN : \
    && apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get -y install --no-install-recommends --fix-missing \
        bash make nano git procps curl perl \
        biber \
        texlive-full \
        python3-pygments \
    && rm -rf /var/lib/apt/lists/* \
    && :

# installing cpanm & missing latexindent dependencies
RUN : \
    && curl -L http://cpanmin.us | perl - --self-upgrade \
    && cpanm Log::Dispatch::File YAML::Tiny File::HomeDir \
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
