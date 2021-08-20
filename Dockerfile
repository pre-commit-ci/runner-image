FROM ubuntu:focal

ENTRYPOINT ["dumb-init", "--"]

RUN : \
    && apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        ca-certificates \
        curl \
        dumb-init \
        g++ \
        gcc \
        git \
        gnupg2 \
        libc6 \
        libedit2 \
        libffi-dev \
        libgcc1 \
        libgdiplus \
        libgssapi-krb5-2 \
        libicu66 \
        libssl1.1 \
        libstdc++6 \
        libxml2 \
        libyaml-dev \
        libz3-dev \
        make \
        python2-dev \
        python3-dev \
        python3-distutils \
        ruby-dev \
        zlib1g \
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

RUN echo 'end: minimal'

ARG RUST=1.54.0
ARG RUSTUP_SHA256=3dc5ef50861ee18657f9db2eeb7392f9c2a6c95c90ab41e45ab4ca71476b4338
ARG RUSTUP_VERSION=1.24.3
ENV \
    CARGO_HOME=/tmp/cargo/home \
    RUSTUP_HOME=/opt/rust/rustup \
    PATH=/opt/rust/cargo/bin:$PATH
RUN : \
    && export CARGO_HOME=/opt/rust/cargo \
    && rustArch='x86_64-unknown-linux-gnu' \
    && curl --silent --location --output rustup-init "https://static.rust-lang.org/rustup/archive/${RUSTUP_VERSION}/${rustArch}/rustup-init" \
    && echo "${RUSTUP_SHA256} rustup-init" | sha256sum --check \
    && chmod +x rustup-init \
    && ./rustup-init -y --profile minimal --no-modify-path --default-toolchain "$RUST" --default-host "$rustArch" \
    && rm -rf rustup-init \
    && rustup component add clippy rustfmt \
    && :

ARG SWIFT=5.3.2
ARG SWIFT_SHA256=dc360633c85ba16371646da55bcea9f4cf442e3312af2d3f5bb6e85f88d00f7c
ENV \
    PATH=/opt/swift/usr/bin:$PATH \
    LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/swift/usr/lib
RUN : \
    && echo 'lang: swift' \
    && . /etc/lsb-release \
    && curl --silent --location --output /tmp/swift.tar.gz https://swift.org/builds/swift-$SWIFT-release/ubuntu$(echo $DISTRIB_RELEASE | tr -d ".")/swift-$SWIFT-RELEASE/swift-$SWIFT-RELEASE-ubuntu$DISTRIB_RELEASE.tar.gz \
    && echo "${SWIFT_SHA256} /tmp/swift.tar.gz" | sha256sum --check \
    && mkdir /opt/swift \
    && tar --strip-components 1 --directory /opt/swift -xf /tmp/swift.tar.gz \
    && rm /tmp/swift.tar.gz \
    && :

ARG DOTNET_VER=6.0.100-preview.7.21379.14
ARG DOTNET_SHA512=c8757325407b5eb1e3870f0db87eeaf44df978313c0b2a7f465ec7d0a5647317cba597264ec81577ea0b3bd97bd33d782234392e8e592e073126792a0406df7b
ENV \
    PATH=/opt/dotnet:$PATH \
    DOTNET_ROOT=/opt/dotnet \
    DOTNET_CLI_HOME=/tmp \
    DOTNET_CLI_TELEMETRY_OPTOUT=1
RUN : \
    && echo 'lang: dotnet' \
    && dotnet_root=/opt/dotnet \
    && mkdir -p $dotnet_root \
    && curl \
        --location \
        --fail \
        --silent \
        --output /tmp/dotnet.tar.gz \
        https://dotnetcli.azureedge.net/dotnet/Sdk/"$DOTNET_VER"/dotnet-sdk-"$DOTNET_VER"-linux-x64.tar.gz \
    && echo "${DOTNET_SHA512} /tmp/dotnet.tar.gz" | sha512sum --check \
    && tar -C $dotnet_root -xf /tmp/dotnet.tar.gz \
    && rm /tmp/dotnet.tar.gz \
    # Trigger first run output
    && dotnet build > /dev/null || true \
    && :

ARG CONDA=py39_4.10.3
ARG CONDA_SHA256=1ea2f885b4dbc3098662845560bc64271eb17085387a70c2ba3f29fff6f8d52f
ENV PATH=/opt/conda/bin:$PATH CONDA_PKGS_DIRS=/tmp/conda/pkgs
RUN : \
    && echo 'lang: conda' \
    && curl --silent --location --output /tmp/conda.sh "https://repo.anaconda.com/miniconda/Miniconda3-$CONDA-Linux-x86_64.sh" \
    && bash /tmp/conda.sh -p /opt/conda/install -b \
    && mkdir /opt/conda/bin \
    && ln -sf /opt/conda/install/bin/conda /opt/conda/bin \
    && rm -rf /tmp/conda.sh /root/.conda \
    && :
