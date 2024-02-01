PiCapsule
=======

[![Build Status](https://github.com/bhamail/picapsule/actions/workflows/build.yml/badge.svg)](https://github.com/bhamail/picapsule/actions)

Build your own Time Capsule backup server using a [Raspberry Pi](https://www.raspberrypi.org).

[GH Pages Website](https://bhamail.github.io/picapsule/) <--
 This is likely what you really want: The steps to build your own Time Capsule.

### Release Process

Do the following to redeploy the website:
1. Pull the latest from the `main` branch.
2. Setup local JDK 8 (required for maven-linkcheck-plugin). I use [sdkman](https://sdkman.io): 
```shell
$ sdk use java 8.0.372-zulu
```
3. Run:
```shell
$ ./mvnw clean package site -Plinkcheck site-deploy
```
Note: You will likely be prompted for the ssh key password for your git login. You do have 
a password on your git ssh key correct? ;)
