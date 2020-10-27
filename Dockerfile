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
        libyaml-dev \
        python2-dev \
        python3-dev \
        python3-distutils \
        ruby-dev \
        software-properties-common \
    && add-apt-repository -y ppa:deadsnakes \
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
    && curl -sSL https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add - \
    && echo deb https://deb.nodesource.com/node_14.x focal main > /etc/apt/sources.list.d/nodesource.list \
    && apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        nodejs \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && :

COPY requirements.txt /tmp/requirements.txt
ENV PRE_COMMIT_HOME=/pc PATH=/venv/bin:$PATH npm_config_cache=/tmp/npm
RUN : \
    && curl --silent --location --output /tmp/virtualenv.pyz https://bootstrap.pypa.io/virtualenv/3.8/virtualenv.pyz \
    && python3 /tmp/virtualenv.pyz /venv \
    && pip install \
        --disable-pip-version-check \
        --no-cache-dir \
        --requirement /tmp/requirements.txt \
    # ensure the virtualenv appdata cache is populated
    && rm -rf ~/.local && virtualenv /tmpvenv && rm -rf /tmpvenv \
    && rm /tmp/virtualenv.pyz \
    && :

ENTRYPOINT ["dumb-init", "--"]
