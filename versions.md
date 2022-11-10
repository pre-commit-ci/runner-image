runner-image:2022-11-10-3d97fb9-full
====================================

to pull this image:

```bash
docker pull ghcr.io/pre-commit-ci/runner-image:2022-11-10-3d97fb9-full

# or from dockerhub

docker pull precommitci/runner-image:2022-11-10-3d97fb9-full
```

## pre-commit

```console
$ pip freeze --all
cfgv==3.3.1
distlib==0.3.4
filelock==3.7.1
identify==2.5.1
nodeenv==1.7.0
pip==22.2.2
platformdirs==2.5.2
pre-commit==2.20.0
PyYAML==6.0
setuptools==63.1.0
six==1.16.0
toml==0.10.2
virtualenv==20.15.1
wheel==0.37.1
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
Python 3.10.6 (main, Nov  2 2022, 18:53:38) [GCC 11.3.0]

$ python3 --version --version
Python 3.10.6 (main, Nov  2 2022, 18:53:38) [GCC 11.3.0]
```

others

```console
$ python2.7 -c 'import sys; print(sys.version)'
2.7.18 (default, Jul  1 2022, 10:30:50)
[GCC 11.2.0]

$ python3.7 --version --version
Python 3.7.15 (default, Oct 12 2022, 19:14:01)
[GCC 11.2.0]

$ python3.8 --version --version
Python 3.8.15 (default, Oct 12 2022, 19:15:16)
[GCC 11.2.0]

$ python3.9 --version --version
Python 3.9.15 (main, Oct 12 2022, 19:14:37)
[GCC 11.2.0]

$ python3.11 --version --version
Python 3.11.0 (main, Oct 24 2022, 19:56:13) [GCC 11.2.0]
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
 OS Version:  22.04
 OS Platform: Linux
 RID:         linux-x64
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
v18.0.0

$ npm --version
8.6.0
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
Swift version 5.7 (swift-5.7-RELEASE)
Target: x86_64-unknown-linux-gnu
```
