runner-image:2025-02-12-d953524-full
====================================

to pull this image:

```bash
docker pull ghcr.io/pre-commit-ci/runner-image:2025-02-12-d953524-full
```

digests:

```python
IMAGE = 'runner-image:2025-02-12-d953524'
DIGESTS = (
    Image(
        name='public.ecr.aws/k7o0k5z0/pre-commit-ci-runner-image',
        minimal='sha256:77e16f2c22793c39979e232469f9b2f350c952c8b9eea8c9389a53d887e4811a',  # noqa: E501
        full='sha256:e5104bbf8f8ace2eb5cd34ac11e9404cc1ded3d22938084db255a8a7109f4826',  # noqa: E501
    ),
    Image(
        name='ghcr.io/pre-commit-ci/runner-image',
        minimal='sha256:77e16f2c22793c39979e232469f9b2f350c952c8b9eea8c9389a53d887e4811a',  # noqa: E501
        full='sha256:e5104bbf8f8ace2eb5cd34ac11e9404cc1ded3d22938084db255a8a7109f4826',  # noqa: E501
    ),
)
```

## pre-commit

```console
$ pip freeze --all
cfgv==3.4.0
distlib==0.3.8
filelock==3.16.1
identify==2.6.1
nodeenv==1.9.1
pip==24.3.1
platformdirs==4.3.6
pre_commit==4.0.0
PyYAML==6.0.2
setuptools==75.8.0
virtualenv==20.26.6
wheel==0.45.1
```

## os

```console
$ cat /etc/lsb-release
DISTRIB_ID=Ubuntu
DISTRIB_RELEASE=22.04
DISTRIB_CODENAME=jammy
DISTRIB_DESCRIPTION="Ubuntu 22.04.5 LTS"
```

## python

default `python` / `python3`

```console
$ python --version --version
Python 3.12.9 (main, Feb  5 2025, 08:49:00) [GCC 11.4.0]

$ python3 --version --version
Python 3.12.9 (main, Feb  5 2025, 08:49:00) [GCC 11.4.0]
```

others

```console
$ python3.9 --version --version
Python 3.9.21 (main, Dec  4 2024, 08:53:33)
[GCC 11.4.0]

$ python3.10 --version --version
Python 3.10.12 (main, Jan 17 2025, 14:35:34) [GCC 11.4.0]

$ python3.11 --version --version
Python 3.11.11 (main, Dec  4 2024, 08:55:07) [GCC 11.4.0]

$ python3.13 --version --version
Python 3.13.2 (main, Feb  5 2025, 08:49:07) [GCC 11.4.0]

$ pypy3 --version --version
Python 3.8.13 (7.3.9+dfsg-1ubuntu0.1, Nov 15 2022, 06:22:50)
[PyPy 7.3.9 with GCC 11.3.0]
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
 OS Version:  22.04
 OS Platform: Linux
 RID:         ubuntu.22.04-x64
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
v20.17.0

$ npm --version
10.8.2
```

## perl

```console
$ perl -E 'print "$^V
"'
v5.34.0
```

## r

```console
$ R --version
R version 4.3.1 (2023-06-16) -- "Beagle Scouts"
Copyright (C) 2023 The R Foundation for Statistical Computing
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
ruby 3.0.2p107 (2021-07-07 revision 0db68f0233) [x86_64-linux-gnu]
```

## rust

```console
$ cargo --version
cargo 1.83.0 (5ffbef321 2024-10-29)

$ rustc --version
rustc 1.83.0 (90b35a623 2024-11-26)
```

## swift

```console
$ swift -version
Swift version 5.7.3 (swift-5.7.3-RELEASE)
Target: x86_64-unknown-linux-gnu
```
