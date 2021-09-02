#!/usr/bin/env bash
set -euxo pipefail

R_VERSION=4.0.2
R_SHA256=d3bceab364da0876625e4097808b42512395fdf41292f4915ab1fd257c1bbe75

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
