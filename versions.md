runner-image:2021-05-21-00e5555
===============================

to pull this image:

```bash
docker pull ghcr.io/pre-commit-ci/runner-image:2021-05-21-00e5555

# or from dockerhub

docker pull precommitci/runner-image:2021-05-21-00e5555
```

## pre-commit

```console
$ pip freeze --all
appdirs==1.4.4
cfgv==3.3.0
distlib==0.3.1
filelock==3.0.12
identify==2.2.5
nodeenv==1.6.0
pip==21.1.1
pre-commit==2.13.0
PyYAML==5.4.1
setuptools==56.0.0
six==1.16.0
toml==0.10.2
virtualenv==20.4.6
wheel==0.36.2
```

## os

```console
$ cat /etc/lsb-release
DISTRIB_ID=Ubuntu
DISTRIB_RELEASE=20.04
DISTRIB_CODENAME=focal
DISTRIB_DESCRIPTION="Ubuntu 20.04.2 LTS"
```

## python

default `python` / `python3`

```console
$ python --version --version
Python 3.8.5 (default, Jan 27 2021, 15:41:15)
[GCC 9.3.0]

$ python3 --version --version
Python 3.8.5 (default, Jan 27 2021, 15:41:15)
[GCC 9.3.0]
```

others

```console
$ python2.7 -c 'import sys; print(sys.version)'
2.7.18 (default, Mar  8 2021, 13:02:45)
[GCC 9.3.0]

$ python3.7 --version --version
Python 3.7.10 (default, Feb 20 2021, 21:15:28)
[GCC 9.3.0]

$ python3.9 --version --version
Python 3.9.4 (default, Apr  9 2021, 01:03:21)
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
v14.16.1

$ npm --version
6.14.12
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
