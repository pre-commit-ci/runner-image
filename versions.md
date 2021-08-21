runner-image:2021-08-21-40b0fd9-full
====================================

to pull this image:

```bash
docker pull ghcr.io/pre-commit-ci/runner-image:2021-08-21-40b0fd9-full

# or from dockerhub

docker pull precommitci/runner-image:2021-08-21-40b0fd9-full
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
pip==21.2.3
pre-commit==2.13.0
PyYAML==5.4.1
setuptools==57.4.0
six==1.16.0
toml==0.10.2
virtualenv==20.4.6
wheel==0.37.0
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
Python 3.8.10 (default, Jun  2 2021, 10:49:15)
[GCC 9.4.0]

$ python3 --version --version
Python 3.8.10 (default, Jun  2 2021, 10:49:15)
[GCC 9.4.0]
```

others

```console
$ python2.7 -c 'import sys; print(sys.version)'
2.7.18 (default, Mar  8 2021, 13:02:45)
[GCC 9.3.0]

$ python3.7 --version --version
Python 3.7.11 (default, Jul  3 2021, 17:58:19)
[GCC 9.3.0]

$ python3.9 --version --version
Python 3.9.6 (default, Jul  3 2021, 16:40:50)
[GCC 9.3.0]
```

## conda

```console
$ conda --version
conda 4.10.3
```
## dotnet

```console
$ dotnet --info
.NET SDK (reflecting any global.json):
 Version:   6.0.100-preview.7.21379.14
 Commit:    22d70b47bc

Runtime Environment:
 OS Name:     ubuntu
 OS Version:  20.04
 OS Platform: Linux
 RID:         ubuntu.20.04-x64
 Base Path:   /opt/dotnet/sdk/6.0.100-preview.7.21379.14/

Host (useful for support):
  Version: 6.0.0-preview.7.21377.19
  Commit:  91ba01788d

.NET SDKs installed:
  6.0.100-preview.7.21379.14 [/opt/dotnet/sdk]

.NET runtimes installed:
  Microsoft.AspNetCore.App 6.0.0-preview.7.21378.6 [/opt/dotnet/shared/Microsoft.AspNetCore.App]
  Microsoft.NETCore.App 6.0.0-preview.7.21377.19 [/opt/dotnet/shared/Microsoft.NETCore.App]

To install additional .NET runtimes or SDKs:
  https://aka.ms/dotnet-download
```

## go

```console
$ go version
go version go1.15.6 linux/amd64
```

## node

```console
$ node --version
v14.17.5

$ npm --version
6.14.14
```

## ruby

```console
$ ruby --version
ruby 2.7.0p0 (2019-12-25 revision 647ee6f091) [x86_64-linux-gnu]
```

## rust

```console
$ cargo --version
cargo 1.54.0 (5ae8d74b3 2021-06-22)

$ rustc --version
rustc 1.54.0 (a178d0322 2021-07-26)
```

## swift

```console
$ swift -version
Swift version 5.3.2 (swift-5.3.2-RELEASE)
Target: x86_64-unknown-linux-gnu
```
