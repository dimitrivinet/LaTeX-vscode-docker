FROM alpine:3.16

RUN : \
    && apk add --no-cache \
        bash make nano git procps curl perl \
        biber \
        texlive-full \
        py3-pygments \
    && :

# installing cpanm & missing latexindent dependencies
RUN : \
    && curl -L http://cpanmin.us | perl - --self-upgrade \
    && cpanm Log::Dispatch::File YAML::Tiny File::HomeDir \
    && :
