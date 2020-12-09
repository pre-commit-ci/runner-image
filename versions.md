runner-image:2020-12-09-c169444
===============================

to pull this image:

```bash
docker pull ghcr.io/pre-commit-ci/runner-image:2020-12-09-c169444

# or from dockerhub

docker pull precommitci/runner-image:2020-12-09-c169444
```

## pre-commit

```console
$ pip freeze --all
appdirs==1.4.4
cfgv==3.2.0
distlib==0.3.1
filelock==3.0.12
identify==1.5.10
nodeenv==1.5.0
pip==20.3.1
pre-commit==2.9.3
PyYAML==5.3.1
setuptools==51.0.0
six==1.15.0
toml==0.10.2
virtualenv==20.2.2
wheel==0.36.1
```

## os

```console
$ cat /etc/lsb-release
DISTRIB_ID=Ubuntu
DISTRIB_RELEASE=20.04
DISTRIB_CODENAME=focal
DISTRIB_DESCRIPTION="Ubuntu 20.04.1 LTS"
```

## python

default `python` / `python3`

```console
$ python --version --version
Python 3.8.5 (default, Jul 28 2020, 12:59:40)
[GCC 9.3.0]

$ python3 --version --version
Python 3.8.5 (default, Jul 28 2020, 12:59:40)
[GCC 9.3.0]
```

others

```console
$ python2.7 -c 'import sys; print(sys.version)'
2.7.18 (default, Aug  4 2020, 11:16:42)
[GCC 9.3.0]

$ python3.7 --version --version
Python 3.7.9 (default, Aug 18 2020, 02:07:21)
[GCC 9.3.0]

$ python3.9 --version --version
Python 3.9.0+ (default, Oct 20 2020, 08:43:38)
[GCC 9.3.0]
```

## go

```console
$ go version
go version go1.15.6 linux/amd64
```

## node

```console
$ node --version
v14.15.1

$ npm --version
6.14.8
```

## ruby

```console
$ ruby --version
ruby 2.7.0p0 (2019-12-25 revision 647ee6f091) [x86_64-linux-gnu]
```

## rust

```console
$ cargo --version
cargo 1.48.0 (65cbdd2dc 2020-10-14)

$ rustc --version
rustc 1.48.0 (7eac88abb 2020-11-16)
```
