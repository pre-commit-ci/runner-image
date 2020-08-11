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

COPY requirements.txt /tmp/requirements.txt
ENV PRE_COMMIT_HOME=/pc PATH=/venv/bin:$PATH
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
