runner-image:2022-05-01-1c03a9b-full
====================================

to pull this image:

```bash
docker pull ghcr.io/pre-commit-ci/runner-image:2022-05-01-1c03a9b-full

# or from dockerhub

docker pull precommitci/runner-image:2022-05-01-1c03a9b-full
```

## pre-commit

```console
$ pip freeze --all
cfgv==3.3.1
distlib==0.3.4
filelock==3.6.0
identify==2.4.12
nodeenv==1.6.0
pip==22.0.4
platformdirs==2.5.1
pre-commit==2.18.1
PyYAML==6.0
setuptools==62.1.0
six==1.16.0
toml==0.10.2
virtualenv==20.14.0
wheel==0.37.1
```

## os

```console
$ cat /etc/lsb-release
DISTRIB_ID=Ubuntu
DISTRIB_RELEASE=20.04
DISTRIB_CODENAME=focal
DISTRIB_DESCRIPTION="Ubuntu 20.04.4 LTS"
```

## python

default `python` / `python3`

```console
$ python --version --version
Python 3.8.10 (default, Mar 15 2022, 12:22:08)
[GCC 9.4.0]

$ python3 --version --version
Python 3.8.10 (default, Mar 15 2022, 12:22:08)
[GCC 9.4.0]
```

others

```console
$ python2.7 -c 'import sys; print(sys.version)'
2.7.18 (default, Mar  8 2021, 13:02:45)
[GCC 9.3.0]

$ python3.7 --version --version
Python 3.7.13 (default, Apr 24 2022, 01:05:22)
[GCC 9.4.0]

$ python3.9 --version --version
Python 3.9.12 (main, Apr 18 2022, 22:40:46)
[GCC 9.4.0]

$ python3.10 --version --version
Python 3.10.4 (main, Apr  8 2022, 17:35:13) [GCC 9.4.0]
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
go version go1.18 linux/amd64
```

## lua

```console
$ lua -v
Lua 5.4.3  Copyright (C) 1994-2021 Lua.org, PUC-Rio

$ luarocks --version
/opt/lua/bin/luarocks 3.8.0
LuaRocks main command-line interface

```

## node

```console
$ node --version
v14.19.1

$ npm --version
6.14.16
```

## r

```console
$ R --version
R version 4.2.0 (2022-04-22) -- "Vigorous Calisthenics"
Copyright (C) 2022 The R Foundation for Statistical Computing
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
cargo 1.56.0 (4ed5d137b 2021-10-04)

$ rustc --version
rustc 1.56.0 (09c42c458 2021-10-18)
```

## swift

```console
$ swift -version
Swift version 5.3.2 (swift-5.3.2-RELEASE)
Target: x86_64-unknown-linux-gnu
```
