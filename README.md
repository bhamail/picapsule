PiCapsule
=======

[![Build Status](https://github.com/bhamail/picapsule/actions/workflows/build.yaml/badge.svg)](https://github.com/bhamail/picapsule/actions)

Build your own [Time Capsule](https://www.apple.com/ph/airport-time-capsule/specs/) backup server using a [Raspberry Pi](https://www.raspberrypi.org).

[GH Pages Website](https://bhamail.github.io/picapsule/) <--
 This is likely what you really want: The steps to build your own Time Capsule.

#### Other fun Pi Projects

[PiNexus](https://github.com/bhamail/pinexus) - Tools to play with [Sonatype Nexus Repository 3](https://help.sonatype.com/en/sonatype-nexus-repository.html) on a Raspberry Pi.

### ToDo

1. Fix the [maven-linkcheck-plugin](https://maven.apache.org/plugins/maven-linkcheck-plugin/) to work with java 9+.

### Release Process

Do the following to redeploy the website:
1. Pull the latest from the `main` branch.
2. Setup local JDK 8 (required for maven-linkcheck-plugin). I use [sdkman](https://sdkman.io): 
```shell
sdk use java 8.0.372-zulu
```
3. Run:
```shell
./mvnw clean site-deploy -Plinkcheck,project-info-unreleased 
```
Note: You will likely be prompted for the ssh key password for your git login. You do have 
a password on your git ssh key correct? ;)
