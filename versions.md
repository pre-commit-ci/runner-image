runner-image:2024-06-19-6348a73-full
====================================

to pull this image:

```bash
docker pull ghcr.io/pre-commit-ci/runner-image:2024-06-19-6348a73-full
```

digests:

```python
IMAGE = 'runner-image:2024-06-19-6348a73'
DIGESTS = (
    Image(
        name='public.ecr.aws/k7o0k5z0/pre-commit-ci-runner-image',
        minimal='sha256:0245eb90893d3008687a9c15fdb83efc062c6d85bd8db4eac4453108fbd60521',  # noqa: E501
        full='sha256:f68abf05516b5eb89a4366fae24b9c446374784323d8ea2d827aad958a16a2b4',  # noqa: E501
    ),
    Image(
        name='ghcr.io/pre-commit-ci/runner-image',
        minimal='sha256:0245eb90893d3008687a9c15fdb83efc062c6d85bd8db4eac4453108fbd60521',  # noqa: E501
        full='sha256:f68abf05516b5eb89a4366fae24b9c446374784323d8ea2d827aad958a16a2b4',  # noqa: E501
    ),
)
```

## pre-commit

```console
$ pip freeze --all
cfgv==3.4.0
distlib==0.3.8
filelock==3.13.4
identify==2.5.36
nodeenv==1.8.0
pip==24.0
platformdirs==4.2.0
pre-commit==3.7.1
PyYAML==6.0.1
setuptools==69.5.1
virtualenv==20.25.3
wheel==0.43.0
```

## os

```console
$ cat /etc/lsb-release
DISTRIB_ID=Ubuntu
DISTRIB_RELEASE=22.04
DISTRIB_CODENAME=jammy
DISTRIB_DESCRIPTION="Ubuntu 22.04.4 LTS"
```

## python

default `python` / `python3`

```console
$ python --version --version
Python 3.12.4 (main, Jun  8 2024, 18:29:57) [GCC 11.4.0]

$ python3 --version --version
Python 3.12.4 (main, Jun  8 2024, 18:29:57) [GCC 11.4.0]
```

others

```console
$ python3.8 --version --version
Python 3.8.19 (default, Apr  6 2024, 17:58:10)
[GCC 11.4.0]

$ python3.9 --version --version
Python 3.9.19 (main, Apr  6 2024, 17:57:55)
[GCC 11.4.0]

$ python3.10 --version --version
Python 3.10.12 (main, Nov 20 2023, 15:14:05) [GCC 11.4.0]

$ python3.11 --version --version
Python 3.11.9 (main, Apr  6 2024, 17:59:24) [GCC 11.4.0]

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
go version go1.21.0 linux/amd64
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
v18.17.1

$ npm --version
9.6.7
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
cargo 1.77.0 (3fe68eabf 2024-02-29)

$ rustc --version
rustc 1.77.0 (aedd173a2 2024-03-17)
```

## swift

```console
$ swift -version
Swift version 5.7.3 (swift-5.7.3-RELEASE)
Target: x86_64-unknown-linux-gnu
```
