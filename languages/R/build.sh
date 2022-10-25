#!/usr/bin/env bash
set -euxo pipefail

R_VERSION=4.2.1
R_SHA256=4d52db486d27848e54613d4ee977ad952ec08ce17807e1b525b10cd4436c643f
# https://www.r-project.org/

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
