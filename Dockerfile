FROM ubuntu:focal

ENTRYPOINT ["dumb-init", "--"]

RUN : \
    && apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        ca-certificates \
        cmake \
        curl \
        dumb-init \
        g++ \
        gcc \
        git \
        gnupg2 \
        libblas3 \
        libc6 \
        libedit2 \
        libffi-dev \
        libgcc1 \
        libgdiplus \
        libgssapi-krb5-2 \
        libicu66 \
        liblapack3 \
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
        unzip \
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
        python3.6-distutils \
        python3.7-dev \
        python3.7-distutils \
        python3.9-dev \
        python3.9-distutils \
        python3.10-dev \
        python3.10-distutils \
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

ARG GO=1.18
ARG GO_SHA256=e85278e98f57cdb150fe8409e6e5df5343ecb13cebf03a5d5ff12bd55a80264f
ENV PATH=/opt/go/bin:$PATH XDG_CACHE_HOME=/tmp/cache GOFLAGS=-modcacherw
RUN : \
    && mkdir -p /opt \
    && curl --location --silent --output go.tgz https://golang.org/dl/go${GO}.linux-amd64.tar.gz \
    && echo "${GO_SHA256}  go.tgz" | sha256sum --check \
    && tar -C /opt -xf go.tgz \
    && rm -rf /opt/go/doc /opt/go/test \
    && rm go.tgz

RUN echo 'end: minimal'

ARG NODE=18.0.0
ARG NODE_SHA256=6260d3526dff25d43451ea8e90e0174975b4cd067e8535dc1d85a6d6b29f3043
ENV PATH=/opt/node/bin:$PATH
RUN : \
    && echo 'lang: node' \
    && curl --silent --location --output /tmp/node.tar.gz "https://nodejs.org/dist/v${NODE}/node-v${NODE}-linux-x64.tar.gz" \
    && echo "${NODE_SHA256}  /tmp/node.tar.gz" | sha256sum --check \
    && mkdir /opt/node \
    && tar --strip-components 1 --directory /opt/node -xf /tmp/node.tar.gz \
    && rm /tmp/node.tar.gz \
    && :

ARG RUST=1.56.0
ARG RUSTUP_SHA256=3dc5ef50861ee18657f9db2eeb7392f9c2a6c95c90ab41e45ab4ca71476b4338
ARG RUSTUP_VERSION=1.24.3
ENV \
    CARGO_HOME=/tmp/cargo/home \
    RUSTUP_HOME=/opt/rust/rustup \
    PATH=/opt/rust/cargo/bin:$PATH
RUN : \
    && echo 'lang: rust' \
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

ARG DOTNET_URL=https://download.visualstudio.microsoft.com/download/pr/17b6759f-1af0-41bc-ab12-209ba0377779/e8d02195dbf1434b940e0f05ae086453/dotnet-sdk-6.0.100-linux-x64.tar.gz
ARG DOTNET_SHA512=cb0d174a79d6294c302261b645dba6a479da8f7cf6c1fe15ae6998bc09c5e0baec810822f9e0104e84b0efd51fdc0333306cb2a0a6fcdbaf515a8ad8cf1af25b
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
        "$DOTNET_URL" \
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

ARG DART=2.13.4
ARG DART_SHA256=633a9aa4812b725ff587e2bbf16cd5839224cfe05dcd536e1a74804e80fdb4cd
ENV PATH=/opt/dart/dart-sdk/bin:$PATH
RUN : \
    && echo 'lang: dart' \
    && curl --silent --location --output /tmp/dart.zip "https://storage.googleapis.com/dart-archive/channels/stable/release/${DART}/sdk/dartsdk-linux-x64-release.zip" \
    && echo "${DART_SHA256}  /tmp/dart.zip" | sha256sum --check \
    && mkdir /opt/dart \
    && unzip -q -d /opt/dart /tmp/dart.zip \
    # permissions are wrong in the archive?
    # https://github.com/dart-lang/sdk/issues/47093
    && chmod -R og+rX /opt/dart \
    && rm /tmp/dart.zip \
    && :

ENV \
    PATH=/opt/r/bin/:$PATH \
    RENV_CONFIG_CACHE_ENABLED=false \
    RENV_CONFIG_CACHE_SYMLINKS=false \
    RENV_PATHS_ROOT=/tmp/renv
RUN : \
    && echo 'lang: r' \
    && curl --silent --location --output /tmp/r.tgz https://github.com/pre-commit-ci/runner-image/releases/download/ubuntu-20.04-r-4.2.0/r-4.2.0.tgz \
    && echo 'c07ffc4bb2a18886191c1cad0a9bc1b4535f8c07650b7ed780590e529cb8f0c2 /tmp/r.tgz' | sha256sum --check \
    && mkdir /opt/r \
    && tar -C /opt/r -xf /tmp/r.tgz \
    && rm /tmp/r.tgz \
    && :

ARG LUA=5.4.3
ARG LUA_SHA256=f8612276169e3bfcbcfb8f226195bfc6e466fe13042f1076cbde92b7ec96bbfb
ARG LUAROCKS=3.8.0
ARG LUAROCKS_SHA256=56ab9b90f5acbc42eb7a94cf482e6c058a63e8a1effdf572b8b2a6323a06d923
ENV PATH=/opt/lua/bin:$PATH
RUN : \
    && echo 'lang: lua' \
    && curl --location --silent --output /tmp/lua.tgz "https://www.lua.org/ftp/lua-${LUA}.tar.gz" \
    && echo "${LUA_SHA256}  /tmp/lua.tgz" | sha256sum --check \
    && curl --location --silent --output /tmp/luarocks.tgz "https://luarocks.org/releases/luarocks-${LUAROCKS}.tar.gz" \
    && echo "${LUAROCKS_SHA256}  /tmp/luarocks.tgz" | sha256sum --check \
    && tar -C /tmp --strip-components=1 --one-top-level -xf /tmp/lua.tgz \
    && make -C /tmp/lua INSTALL_TOP=/opt/lua all \
    && make -C /tmp/lua INSTALL_TOP=/opt/lua install \
    && tar -C /tmp --strip-components=1 --one-top-level -xf /tmp/luarocks.tgz \
    && cd /tmp/luarocks \
    && ./configure --prefix=/opt/lua \
    && make install \
    && rm -rf /tmp/lua /tmp/luarocks /tmp/lua.tgz /tmp/luarocks.tgz
