#!/usr/bin/env bash
set -euxo pipefail

R_VERSION=4.6.1
R_SHA256=4da6e61d2c0aac5f14a2e7e432cb5fcc269efe83da4293050ba7f03dff4e2cf4
# https://www.r-project.org/

cd "$(dirname "$0")"

podman build \
    --build-arg=R_VERSION="$R_VERSION" \
    --build-arg=R_SHA256="$R_SHA256" \
    -t runner-image-r .

cid="$(podman create runner-image-r sleep infinity)"
trap 'podman rm -f "$cid"' exit

podman start "$cid"
podman exec "$cid" rm -rf /opt/r/lib/R/doc /opt/r/share
podman exec "$cid" \
    tar -C /opt/r \
    --sort=name \
    --mtime="1970-01-01 00:00:00Z" \
    --owner=0 --group=0 --numeric-owner \
    -czf /tmp/r.tgz .

podman cp "$cid:/tmp/r.tgz" "r-${R_VERSION}.tgz"
sha256sum "r-${R_VERSION}.tgz"
