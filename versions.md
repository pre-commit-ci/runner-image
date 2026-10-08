runner-image:2026-10-08-39c53db-full
====================================

to pull this image:

```bash
docker pull ghcr.io/pre-commit-ci/runner-image:2026-10-08-39c53db-full
```

digests:

```python
IMAGE = 'runner-image:2026-10-08-39c53db'
DIGESTS = (
    Image(
        name='public.ecr.aws/k7o0k5z0/pre-commit-ci-runner-image',
        minimal='sha256:fb447aa367057de8b05be6b53cfa11eba5e77d0c69e873d2ac243168e303824f',  # noqa: E501
        full='sha256:df71ea2a2cbe5b5eb3108de04242545e868271215fcd6e83cf2f80b32f91a8d3',  # noqa: E501
    ),
    Image(
        name='ghcr.io/pre-commit-ci/runner-image',
        minimal='sha256:f7f87a360e168c0ccd540bf39a4924d20d69e5edb9cedc1d0aba53d882aaf414',  # noqa: E501
        full='sha256:6c8b6ef54127d63acba666737b92b187e18b56ec5ec4434389250859738e8cbb',  # noqa: E501
    ),
)
```

## pre-commit

```console
$ pip freeze --all
cfgv==3.5.0
distlib==0.4.0
filelock==3.20.0
identify==2.6.19
nodeenv==1.9.1
pip==26.2.1
platformdirs==4.5.0
pre_commit==4.6.2
PyYAML==6.0.3
setuptools==84.0.0
virtualenv==20.35.4
```

## os

```console
$ cat /etc/lsb-release
DISTRIB_ID=Ubuntu
DISTRIB_RELEASE=24.04
DISTRIB_CODENAME=noble
DISTRIB_DESCRIPTION="Ubuntu 24.04.5 LTS"
```

## python

default `python` / `python3`

```console
$ python --version --version
Python 3.14.8 (main, Oct  1 2026, 15:42:08) [GCC 13.3.0]

$ python3 --version --version
Python 3.14.8 (main, Oct  1 2026, 15:42:08) [GCC 13.3.0]
```

others

```console
$ python3.10 --version --version
Python 3.10.22 (main, Oct  1 2026, 15:39:47) [GCC 13.3.0]

$ python3.11 --version --version
Python 3.11.17 (main, Oct  1 2026, 15:41:07) [GCC 13.3.0]

$ python3.12 --version --version
Python 3.12.3 (main, Aug 31 2026, 10:18:26) [GCC 13.3.0]

$ python3.13 --version --version
Python 3.13.16 (main, Oct  1 2026, 15:40:24) [GCC 13.3.0]

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
go version go1.25.3 linux/amd64
```

## julia

```console
$ julia --version
julia version 1.12.6
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
v24.18.0

$ npm --version
11.16.0
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
cargo 1.89.0 (c24e10642 2025-06-23)

$ rustc --version
rustc 1.89.0 (29483883e 2025-08-04)
```

## swift

```console
$ swift -version
Swift version 6.0.3 (swift-6.0.3-RELEASE)
Target: x86_64-unknown-linux-gnu
```
