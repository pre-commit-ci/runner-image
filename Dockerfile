FROM ubuntu:jammy AS minimal

ENTRYPOINT ["dumb-init", "--"]

RUN : \
    && apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        bzip2 \
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
        libfile-homedir-perl \
        libgcc1 \
        libgdiplus \
        libgssapi-krb5-2 \
        libicu70 \
        liblapack3 \
        libssl3 \
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
        xdg-user-dirs \
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
        python3.7-dev \
        python3.7-distutils \
        python3.8-dev \
        python3.8-distutils \
        python3.9-dev \
        python3.9-distutils \
        python3.11-dev \
        python3.11-distutils \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && :

ENV \
    PATH=/venv/bin:$PATH \
    PRE_COMMIT_HOME=/pc \
    npm_config_cache=/tmp/npm \
    PIP_DISABLE_PIP_VERSION_CHECK=1 \
    PIP_NO_CACHE_DIR=1 \
    PIP_ONLY_BINARY=numpy,pandas,scipy,scikit-learn \
    VIRTUALENV_ACTIVATORS=bash \
    VIRTUALENV_NO_PERIODIC_UPDATE=1 \
    VIRTUALENV_PIP=embed \
    VIRTUALENV_SETUPTOOLS=embed \
    VIRTUALENV_WHEEL=embed \
    XDG_CACHE_HOME=/tmp/cache \
    XDG_DATA_HOME=/tmp/data
COPY requirements.txt /tmp/requirements.txt
RUN : \
    && curl --silent --location --output /tmp/virtualenv.pyz https://bootstrap.pypa.io/virtualenv/3.8/virtualenv.pyz \
    && python3.11 /tmp/virtualenv.pyz /venv \
    && pip install --requirement /tmp/requirements.txt \
    && rm -rf "$XDG_DATA_HOME" /tmp/virtualenv.pyz \
    && :

# ensure virtualenv appdata cache is populated
ENV \
    VIRTUALENV_OVERRIDE_APP_DATA=/opt/virtualenv/cache \
    VIRTUALENV_SYMLINK_APP_DATA=1
COPY build/* /tmp/
RUN /tmp/seed-virtualenv-cache
ENV VIRTUALENV_READ_ONLY_APP_DATA=1

# pre-commit.ci requires cross-user readonly `/src` repo access
RUN git config --system --add safe.directory /src

ARG GO=1.20.2
ARG GO_SHA256=4eaea32f59cde4dc635fbc42161031d13e1c780b87097f4b4234cfce671f1768
ENV PATH=/opt/go/bin:$PATH GOFLAGS=-modcacherw
RUN : \
    && mkdir -p /opt \
    && curl --location --silent --output go.tgz https://golang.org/dl/go${GO}.linux-amd64.tar.gz \
    && echo "${GO_SHA256}  go.tgz" | sha256sum --check \
    && tar -C /opt -xf go.tgz \
    && rm -rf /opt/go/doc /opt/go/test \
    && rm go.tgz

RUN echo 'end: minimal'

FROM minimal AS final

ARG NODE=18.17.1
ARG NODE_SHA256=2cb75f2bc04b0a3498733fbee779b2f76fe3f655188b4ac69ef2887b6721da2d
ENV PATH=/opt/node/bin:$PATH
RUN : \
    && echo 'lang: node' \
    && curl --silent --location --output /tmp/node.tar.gz "https://nodejs.org/dist/v${NODE}/node-v${NODE}-linux-x64.tar.gz" \
    && echo "${NODE_SHA256}  /tmp/node.tar.gz" | sha256sum --check \
    && mkdir /opt/node \
    && tar --strip-components 1 --directory /opt/node -xf /tmp/node.tar.gz \
    && rm /tmp/node.tar.gz \
    && :

ARG RUST=1.65.0
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

ARG SWIFT=5.7.3
ARG SWIFT_SHA256=312a18d0d2f207620349e3a373200f369fc1a6aad1b7f2365d55aa8a10881a59
ENV \
    PATH=/opt/swift/usr/bin:$PATH \
    LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/swift/usr/lib
RUN : \
    && echo 'lang: swift' \
    && . /etc/lsb-release \
    && curl --silent --location --output /tmp/swift.tar.gz https://download.swift.org/swift-$SWIFT-release/ubuntu$(echo $DISTRIB_RELEASE | tr -d ".")/swift-$SWIFT-RELEASE/swift-$SWIFT-RELEASE-ubuntu$DISTRIB_RELEASE.tar.gz \
    && echo "${SWIFT_SHA256} /tmp/swift.tar.gz" | sha256sum --check \
    && mkdir /opt/swift \
    && tar --strip-components 1 --directory /opt/swift -xf /tmp/swift.tar.gz \
    && rm /tmp/swift.tar.gz \
    && :

ARG DOTNET_URL=https://download.visualstudio.microsoft.com/download/pr/7fe73a07-575d-4cb4-b2d3-c23d89e5085f/d8b2b7e1c0ed99c1144638d907c6d152/dotnet-sdk-7.0.101-linux-x64.tar.gz
ARG DOTNET_SHA512=cf289ad0e661c38dcda7f415b3078a224e8347528448429d62c0f354ee951f4e7bef9cceaf3db02fb52b5dd7be987b7a4327ca33fb9239b667dc1c41c678095c
ENV \
    PATH=/opt/dotnet:$PATH \
    DOTNET_ROOT=/opt/dotnet \
    DOTNET_CLI_HOME=/tmp \
    DOTNET_CLI_TELEMETRY_OPTOUT=1 \
    DOTNET_NOLOGO=1 \
    DOTNET_SKIP_FIRST_TIME_EXPERIENCE=1
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
    && curl --silent --location --output /tmp/r.tgz https://github.com/pre-commit-ci/runner-image/releases/download/ubuntu-22.04-r-4.2.1/r-4.2.1.tgz \
    && echo 'c42675b6612c617d4eeee1eef1635eab2c2db4067bcabfc9b1b2bbde9df0f930 /tmp/r.tgz' | sha256sum --check \
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

ARG CS=v2.1.0-RC6
ARG CS_SHA256=ef2bc32c8d1975d9373f518ee24ecbd9a96e99cbb523afa309a45cb44009eeb7
ARG JDK_SHA256=aef49cc7aa606de2044302e757fa94c8e144818e93487081c4fd319ca858134b
ENV PATH=/opt/coursier/bin:$PATH
RUN : \
    && echo 'lang: coursier' \
    && curl --location --silent --output /tmp/cs.gz "https://github.com/coursier/coursier/releases/download/${CS}/cs-x86_64-pc-linux.gz" \
    && echo "${CS_SHA256}  /tmp/cs.gz" | sha256sum --check \
    && curl --location --silent --output /tmp/jdk.tgz "https://download.java.net/openjdk/jdk17/ri/openjdk-17+35_linux-x64_bin.tar.gz" \
    && echo "${JDK_SHA256}  /tmp/jdk.tgz" | sha256sum --check \
    && mkdir -p /opt/coursier \
    && tar --strip-components=1 -C /opt/coursier -xf /tmp/jdk.tgz \
    && gunzip /tmp/cs.gz \
    && mv /tmp/cs /opt/coursier/bin \
    && chmod +x /opt/coursier/bin/cs \
    && rm /tmp/jdk.tgz

RUN : \
    && echo 'lang: meta' \
    && /tmp/language-info --dest /opt/meta
