FROM ubuntu:focal

RUN : \
    && apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        ca-certificates \
        curl \
        dumb-init \
        gcc \
        g++ \
        git \
        gnupg2 \
        libffi-dev \
        libyaml-dev \
        make \
        python2-dev \
        python3-dev \
        python3-distutils \
        ruby-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && :

RUN : \
    && . /etc/lsb-release \
    && apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys F23C5A6CF475977595C89F51BA6932366A755776 \
    && echo deb http://ppa.launchpad.net/deadsnakes/ppa/ubuntu $DISTRIB_CODENAME main > /etc/apt/sources.list.d/deadsnakes.list \
    && apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        python3.6-dev \
        python3.7-dev \
        python3.7-distutils \
        python3.9-dev \
        python3.9-distutils \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && :

RUN : \
    && . /etc/lsb-release \
    && curl -sSL https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add - \
    && echo deb https://deb.nodesource.com/node_14.x $DISTRIB_CODENAME main > /etc/apt/sources.list.d/nodesource.list \
    && apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        nodejs \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && :

ENV \
    PATH=/venv/bin:$PATH \
    PRE_COMMIT_HOME=/pc \
    npm_config_cache=/tmp/npm \
    PIP_DISABLE_PIP_VERSION_CHECK=1 \
    PIP_NO_CACHE_DIR=1 \
    VIRTUALENV_ACTIVATORS=bash \
    VIRTUALENV_NO_PERIODIC_UPDATE=1 \
    VIRTUALENV_PIP=embed \
    VIRTUALENV_SETUPTOOLS=embed \
    VIRTUALENV_WHEEL=embed
COPY requirements.txt /tmp/requirements.txt
RUN : \
    && curl --silent --location --output /tmp/virtualenv.pyz https://bootstrap.pypa.io/virtualenv/3.8/virtualenv.pyz \
    && python3 /tmp/virtualenv.pyz /venv \
    && pip install --requirement /tmp/requirements.txt \
    && rm -rf ~/.local /tmp/virtualenv.pyz \
    && :

# ensure virtualenv appdata cache is populated
ENV \
    VIRTUALENV_OVERRIDE_APP_DATA=/opt/virtualenv/cache \
    VIRTUALENV_SYMLINK_APP_DATA=1
COPY build/seed-virtualenv-cache /tmp/seed-virtualenv-cache
RUN /tmp/seed-virtualenv-cache
ENV VIRTUALENV_READ_ONLY_APP_DATA=1

ARG GO=1.15.6
ARG GO_SHA256=3918e6cc85e7eaaa6f859f1bdbaac772e7a825b0eb423c63d3ae68b21f84b844
ENV PATH=/opt/go/bin:$PATH XDG_CACHE_HOME=/tmp/cache GOFLAGS=-modcacherw
RUN : \
    && mkdir -p /opt \
    && curl --location --silent --output go.tgz https://golang.org/dl/go${GO}.linux-amd64.tar.gz \
    && echo "${GO_SHA256}  go.tgz" | sha256sum --check \
    && tar -C /opt -xf go.tgz \
    && rm -rf /opt/go/doc /opt/go/test \
    && rm go.tgz

ARG RUST=1.48.0
ARG RUSTUP_SHA256=ee7ade44063c96c6a37012cc599cb560dce95205c86d17b247c726d2285b230c
ARG RUSTUP_VERSION=1.23.0
ENV \
    CARGO_HOME=/opt/rust/cargo \
    RUSTUP_HOME=/opt/rust/rustup \
    PATH=/opt/rust/cargo/bin:$PATH
RUN : \
    && rustArch='x86_64-unknown-linux-gnu' \
    && curl --silent --location --output rustup-init "https://static.rust-lang.org/rustup/archive/${RUSTUP_VERSION}/${rustArch}/rustup-init" \
    && echo "${RUSTUP_SHA256} rustup-init" | sha256sum --check \
    && chmod +x rustup-init \
    && ./rustup-init -y --profile minimal --no-modify-path --default-toolchain "$RUST" --default-host "$rustArch" \
    && rm -rf rustup-init \
    && rustup component add clippy rustfmt \
    && :
ENV CARGO_HOME=/tmp/cargo/home

RUN : \
    && . /etc/lsb-release \
    && curl -sSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - \
    && echo deb https://download.docker.com/linux/ubuntu $DISTRIB_CODENAME stable > /etc/apt/sources.list.d/docker.list \
    && apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        docker-ce-cli \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && :

ENTRYPOINT ["dumb-init", "--"]
