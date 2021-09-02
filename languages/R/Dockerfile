FROM ubuntu:focal
RUN : \
    # https://askubuntu.com/questions/496549/error-you-must-put-some-source-uris-in-your-sources-list
    && sed -i 's/^# deb-src /deb-src /' /etc/apt/sources.list \
    && apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get -y --no-install-recommends build-dep r-base \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends curl \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

ARG R_VERSION
ARG R_SHA256
RUN : \
    && set -x \
    && mkdir /tmp/r \
    && cd /tmp/r \
    && curl --silent --location --output r.tgz "https://cran.rstudio.com/src/base/R-${R_VERSION%%.*}/R-$R_VERSION.tar.gz" \
    && echo "${R_SHA256}  r.tgz" | sha256sum --check \
    && tar -xf r.tgz \
    && cd "R-${R_VERSION}" \
    && mkdir -p /opt/r/ \
    && ./configure \
        --prefix=/opt/r/ \
        --enable-memory-profiling \
        --enable-R-shlib \
        --with-blas \
        --with-lapack \
        --without-recommended-packages \
    && make \
    && make install \
    && rm -rf /tmp/r \
    && :
