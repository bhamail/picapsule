PiCapsule
=======

[![Build Status](https://github.com/bhamail/picapsule/actions/workflows/build.yml/badge.svg)](https://github.com/bhamail/picapsule/actions)

Build your own Time Capsule backup server using a [Raspberry Pi](https://www.raspberrypi.org).

Website:
https://bhamail.github.io/picapsule/

### Release Process

Do the following to redeploy the web site:
1. Pull latest from `main` branch.
2. Setup local JDK 8 (required for maven-linkcheck-plugin)
3. Run:
```shell
$ ./mvnw clean package site -Plinkcheck site-deploy
```
Note: You will likely be prompted for the ssh key for your git login. You do have 
a password on your git ssh key correct? ;)
