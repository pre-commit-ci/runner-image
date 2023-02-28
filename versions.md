runner-image:2023-02-28-f0093fb-full
====================================

to pull this image:

```bash
docker pull ghcr.io/pre-commit-ci/runner-image:2023-02-28-f0093fb-full

# or from dockerhub
docker pull precommitci/runner-image:2023-02-28-f0093fb-full
```

digests:

```python
IMAGE = 'runner-image:2023-02-28-f0093fb'
DIGESTS = (
    Image(
        name='ghcr.io/pre-commit-ci/runner-image',
        minimal='sha256:d00a25d0b306a2f808190cc7140eb7dee59af06c1554c51cdd17ad7607bff407',  # noqa: E501
        full='sha256:61a0b1929c5691cb462281ffe28eb2cdb8d9d4a259d524bf9c3acea71931c1fc',  # noqa: E501
    ),
    Image(
        name='registry-1.docker.io/precommitci/runner-image',
        minimal='sha256:663c33b412a03fd70a8627f6a6caa0fd0a7da3341fd6251f4a9b7574ae25dfc3',  # noqa: E501
        full='sha256:ef0559c9de1e4bbcdf2125cda2ad5a68271faec41768e7b8dd790f3a3293d35f',  # noqa: E501
    ),
)
```

## pre-commit

```console
$ pip freeze --all
cfgv==3.3.1
distlib==0.3.6
filelock==3.9.0
identify==2.5.18
nodeenv==1.7.0
pip==23.0
platformdirs==3.0.0
pre-commit==3.1.0
PyYAML==6.0
setuptools==67.4.0
virtualenv==20.19.0
wheel==0.38.4
```

## os

```console
$ cat /etc/lsb-release
DISTRIB_ID=Ubuntu
DISTRIB_RELEASE=22.04
DISTRIB_CODENAME=jammy
DISTRIB_DESCRIPTION="Ubuntu 22.04.1 LTS"
```

## python

default `python` / `python3`

```console
$ python --version --version
Python 3.11.1 (main, Jan 28 2023, 18:47:50) [GCC 11.3.0]

$ python3 --version --version
Python 3.11.1 (main, Jan 28 2023, 18:47:50) [GCC 11.3.0]
```

others

```console
$ python2.7 -c 'import sys; print(sys.version)'
2.7.18 (default, Jul  1 2022, 10:30:50)
[GCC 11.2.0]

$ python3.7 --version --version
Python 3.7.16 (default, Dec  7 2022, 01:12:33)
[GCC 11.3.0]

$ python3.8 --version --version
Python 3.8.16 (default, Dec  7 2022, 01:12:06)
[GCC 11.3.0]

$ python3.9 --version --version
Python 3.9.16 (main, Dec  7 2022, 01:12:08)
[GCC 11.3.0]

$ python3.10 --version --version
Python 3.10.6 (main, Nov 14 2022, 16:10:14) [GCC 11.3.0]
```

## conda

```console
$ conda --version
conda 4.10.3
```

## coursier

```console
$ cs version
2.1.0-RC5
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
go version go1.19.4 linux/amd64
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
v18.0.0

$ npm --version
8.6.0
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
R version 4.2.1 (2022-06-23) -- "Funny-Looking Kid"
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
ruby 3.0.2p107 (2021-07-07 revision 0db68f0233) [x86_64-linux-gnu]
```

## rust

```console
$ cargo --version
cargo 1.65.0 (4bc8f24d3 2022-10-20)

$ rustc --version
rustc 1.65.0 (897e37553 2022-11-02)
```

## swift

```console
$ swift -version
Swift version 5.7.3 (swift-5.7.3-RELEASE)
Target: x86_64-unknown-linux-gnu
```
