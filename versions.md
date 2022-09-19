runner-image:2022-09-19-e3362ca-full
====================================

to pull this image:

```bash
docker pull ghcr.io/pre-commit-ci/runner-image:2022-09-19-e3362ca-full

# or from dockerhub

docker pull precommitci/runner-image:2022-09-19-e3362ca-full
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
DISTRIB_RELEASE=20.04
DISTRIB_CODENAME=focal
DISTRIB_DESCRIPTION="Ubuntu 20.04.5 LTS"
```

## python

default `python` / `python3`

```console
$ python --version --version
Python 3.10.7 (main, Sep  7 2022, 15:22:19) [GCC 9.4.0]

$ python3 --version --version
Python 3.10.7 (main, Sep  7 2022, 15:22:19) [GCC 9.4.0]
```

others

```console
$ python2.7 -c 'import sys; print(sys.version)'
2.7.18 (default, Jul  1 2022, 12:27:04)
[GCC 9.4.0]

$ python3.7 --version --version
Python 3.7.14 (default, Sep  8 2022, 00:06:29)
[GCC 9.4.0]

$ python3.8 --version --version
Python 3.8.10 (default, Jun 22 2022, 20:18:18)
[GCC 9.4.0]

$ python3.9 --version --version
Python 3.9.14 (main, Sep  7 2022, 23:43:29)
[GCC 9.4.0]
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
v18.0.0

$ npm --version
8.6.0
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
cargo 1.62.0 (a748cf5a3 2022-06-08)

$ rustc --version
rustc 1.62.0 (a8314ef7d 2022-06-27)
```

## swift

```console
$ swift -version
Swift version 5.3.2 (swift-5.3.2-RELEASE)
Target: x86_64-unknown-linux-gnu
```
