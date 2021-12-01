runner-image:2021-11-30-f9c36eb-full
====================================

to pull this image:

```bash
docker pull ghcr.io/pre-commit-ci/runner-image:2021-11-30-f9c36eb-full

# or from dockerhub

docker pull precommitci/runner-image:2021-11-30-f9c36eb-full
```

## pre-commit

```console
$ pip freeze --all
backports.entry-points-selectable==1.1.1
cfgv==3.3.1
distlib==0.3.3
filelock==3.4.0
identify==2.4.0
nodeenv==1.6.0
pip==21.3.1
platformdirs==2.4.0
pre-commit==2.16.0
PyYAML==6.0
setuptools==58.3.0
six==1.16.0
toml==0.10.2
virtualenv==20.10.0
wheel==0.37.0
```

## os

```console
$ cat /etc/lsb-release
DISTRIB_ID=Ubuntu
DISTRIB_RELEASE=20.04
DISTRIB_CODENAME=focal
DISTRIB_DESCRIPTION="Ubuntu 20.04.3 LTS"
```

## python

default `python` / `python3`

```console
$ python --version --version
Python 3.8.10 (default, Sep 28 2021, 16:10:42)
[GCC 9.3.0]

$ python3 --version --version
Python 3.8.10 (default, Sep 28 2021, 16:10:42)
[GCC 9.3.0]
```

others

```console
$ python2.7 -c 'import sys; print(sys.version)'
2.7.18 (default, Mar  8 2021, 13:02:45)
[GCC 9.3.0]

$ python3.7 --version --version
Python 3.7.12 (default, Sep 10 2021, 00:20:04)
[GCC 9.3.0]

$ python3.9 --version --version
Python 3.9.7 (default, Sep  9 2021, 23:20:13)
[GCC 9.3.0]

$ python3.10 --version --version
Python 3.10.0 (default, Oct  4 2021, 22:09:55) [GCC 9.3.0]
```

## conda

```console
$ conda --version
conda 4.10.3
```

## dart

```console
$ dart --version
Dart SDK version: 2.13.4 (stable) (Wed Jun 23 13:08:41 2021 +0200) on "linux_x64"
```

## dotnet

```console
$ dotnet --info
.NET SDK (reflecting any global.json):
 Version:   6.0.100
 Commit:    9e8b04bbff

Runtime Environment:
 OS Name:     ubuntu
 OS Version:  20.04
 OS Platform: Linux
 RID:         ubuntu.20.04-x64
 Base Path:   /opt/dotnet/sdk/6.0.100/

Host (useful for support):
  Version: 6.0.0
  Commit:  4822e3c3aa

.NET SDKs installed:
  6.0.100 [/opt/dotnet/sdk]

.NET runtimes installed:
  Microsoft.AspNetCore.App 6.0.0 [/opt/dotnet/shared/Microsoft.AspNetCore.App]
  Microsoft.NETCore.App 6.0.0 [/opt/dotnet/shared/Microsoft.NETCore.App]

To install additional .NET runtimes or SDKs:
  https://aka.ms/dotnet-download
```

## go

```console
$ go version
go version go1.16.7 linux/amd64
```

## node

```console
$ node --version
v14.18.1

$ npm --version
6.14.15
```

## r

```console
$ R --version
R version 4.0.2 (2020-06-22) -- "Taking Off Again"
Copyright (C) 2020 The R Foundation for Statistical Computing
Platform: x86_64-pc-linux-gnu (64-bit)

R is free software and comes with ABSOLUTELY NO WARRANTY.
You are welcome to redistribute it under the terms of the
GNU General Public License versions 2 or 3.
For more information about these matters see
https://www.gnu.org/licenses/.

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
