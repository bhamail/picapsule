GitHub Actions Notes
====================

Local Builds
---------------
You can locally test the GitHub Actions defined in this directory using [nektos act](https://github.com/nektos/act).

This allows you to run an equivalent CI build on your local machine. For example:
```console
    $ act
    ...
    [Run Link Tests/build]   ✅  Success - Main Run Tests
    [Run Link Tests/build] 🏁  Job succeeded
```
A failed CI build will resemble this:
```console
    $ act
    ...
    | domain failed: links.sonatype.com
    | make: *** [Makefile:38: test] Error 1
    [Run Link Tests/build]   ❌  Failure - Main Run Tests
    [Run Link Tests/build] exitcode '2': failure
    [Run Link Tests/build] 🏁  Job failed
    Error: Job 'build' failed
```
Note: The first time you run [act](https://github.com/nektos/act), it can take a long time (with no output) to download
the various docker goodies. Give it time before deciding it is stuck.

If running on Apple silicon, and you see docker errors, try launching act with this flag:
```console
   act --container-architecture linux/amd64
```
Without this flag, I saw this warning:
```console
WARN  ⚠ You are using Apple M-series chip and you have not specified container architecture, you might encounter issues while running act. If so, try running it with '--container-architecture linux/amd64'. ⚠
```
and this error:
```console
[Run Link Tests/build] ⭐ Run Main Run Tests
[Run Link Tests/build]   🐳  docker exec cmd=[bash --noprofile --norc -e -o pipefail /var/run/act/workflow/1] user= workdir=
| docker compose build
[+] Building 0.0s (0/0)                                                         
| permission denied while trying to connect to the Docker daemon socket at unix:///var/run/docker.sock: Get "http://%2Fvar%2Frun%2Fdocker.sock/_ping": dial unix /var/run/docker.sock: connect: permission denied
| make: *** [Makefile:36: test] Error 1
[Run Link Tests/build]   ❌  Failure - Main Run Tests
[Run Link Tests/build] exitcode '2': failure
[Run Link Tests/build] 🏁  Job failed
Error: Job 'build' failed
```