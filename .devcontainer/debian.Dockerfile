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
