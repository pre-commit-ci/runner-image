runner-image:2025-07-14-d0107cd-full
====================================

to pull this image:

```bash
docker pull ghcr.io/pre-commit-ci/runner-image:2025-07-14-d0107cd-full
```

digests:

```python
IMAGE = 'runner-image:2025-07-14-d0107cd'
DIGESTS = (
    Image(
        name='public.ecr.aws/k7o0k5z0/pre-commit-ci-runner-image',
        minimal='sha256:94380d2437b261225f67186cee9a928be71738b2c59bee0de386e0d64d66210c',  # noqa: E501
        full='sha256:223c7dc2c7428b4b172835c56f57c0602e61f10339d5c9a1927364dbe8b1037a',  # noqa: E501
    ),
    Image(
        name='ghcr.io/pre-commit-ci/runner-image',
        minimal='sha256:94380d2437b261225f67186cee9a928be71738b2c59bee0de386e0d64d66210c',  # noqa: E501
        full='sha256:223c7dc2c7428b4b172835c56f57c0602e61f10339d5c9a1927364dbe8b1037a',  # noqa: E501
    ),
)
```

## pre-commit

```console
$ pip freeze --all
cfgv==3.4.0
distlib==0.3.9
filelock==3.18.0
identify==2.6.12
nodeenv==1.9.1
pip==25.1.1
platformdirs==4.3.8
pre_commit==4.2.0
PyYAML==6.0.2
setuptools==80.3.1
virtualenv==20.31.2
```

## os

```console
$ cat /etc/lsb-release
DISTRIB_ID=Ubuntu
DISTRIB_RELEASE=24.04
DISTRIB_CODENAME=noble
DISTRIB_DESCRIPTION="Ubuntu 24.04.2 LTS"
```

## python

default `python` / `python3`

```console
$ python --version --version
Python 3.12.3 (main, Jun 18 2025, 17:59:45) [GCC 13.3.0]

$ python3 --version --version
Python 3.12.3 (main, Jun 18 2025, 17:59:45) [GCC 13.3.0]
```

others

```console
$ python3.9 --version --version
Python 3.9.23 (main, Jun  4 2025, 08:55:39)
[GCC 13.3.0]

$ python3.10 --version --version
Python 3.10.18 (main, Jun  4 2025, 08:56:00) [GCC 13.3.0]

$ python3.11 --version --version
Python 3.11.13 (main, Jun  4 2025, 08:57:30) [GCC 13.3.0]

$ python3.13 --version --version
Python 3.13.5 (main, Jun 12 2025, 08:56:14) [GCC 13.3.0]

$ pypy3 --version --version
Python 3.9.18 (7.3.15+dfsg-1build3, Apr 01 2024, 03:12:48)
[PyPy 7.3.15 with GCC 13.2.0]
```

## conda

```console
$ conda --version
conda 4.10.3
```

## coursier

```console
$ cs version
2.1.0-RC6
$ java --version
openjdk 17 2021-09-14
OpenJDK Runtime Environment (build 17+35-2724)
OpenJDK 64-Bit Server VM (build 17+35-2724, mixed mode, sharing)
```

## dart

```console
$ dart --version
Dart SDK version: 2.13.4 (stable) (Wed Jun 23 13:08:41 2021 +0200) on "linux_x64"
```

## dotnet

```console
$ dotnet --info
.NET SDK:
 Version:   7.0.101
 Commit:    bb24aafa11

Runtime Environment:
 OS Name:     ubuntu
 OS Version:  24.04
 OS Platform: Linux
 RID:         linux-x64
 Base Path:   /opt/dotnet/sdk/7.0.101/

Host:
  Version:      7.0.1
  Architecture: x64
  Commit:       97203d38ba

.NET SDKs installed:
  7.0.101 [/opt/dotnet/sdk]

.NET runtimes installed:
  Microsoft.AspNetCore.App 7.0.1 [/opt/dotnet/shared/Microsoft.AspNetCore.App]
  Microsoft.NETCore.App 7.0.1 [/opt/dotnet/shared/Microsoft.NETCore.App]

Other architectures found:
  None

Environment variables:
  DOTNET_ROOT       [/opt/dotnet]

global.json file:
  Not found

Learn more:
  https://aka.ms/dotnet/info

Download .NET:
  https://aka.ms/dotnet/download
```

## go

```console
$ go version
go version go1.22.4 linux/amd64
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
v20.19.2

$ npm --version
10.8.2
```

## perl

```console
$ perl -E 'print "$^V
"'
v5.38.2
```

## r

```console
$ R --version
R version 4.4.2 (2024-10-31) -- "Pile of Leaves"
Copyright (C) 2024 The R Foundation for Statistical Computing
Platform: x86_64-pc-linux-gnu

R is free software and comes with ABSOLUTELY NO WARRANTY.
You are welcome to redistribute it under the terms of the
GNU General Public License versions 2 or 3.
For more information about these matters see
https://www.gnu.org/licenses/.

```

## ruby

```console
$ ruby --version
ruby 3.2.3 (2024-01-18 revision 52bb2ac0a6) [x86_64-linux-gnu]
```

## rust

```console
$ cargo --version
cargo 1.85.0 (d73d2caf9 2024-12-31)

$ rustc --version
rustc 1.85.0 (4d91de4e4 2025-02-17)
```

## swift

```console
$ swift -version
Swift version 6.0.3 (swift-6.0.3-RELEASE)
Target: x86_64-unknown-linux-gnu
```
