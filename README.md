## Fn Init Image for Java 11 - `java-11-init:latest`

`tar cf java-11-init.tar func.init.yaml pom.xml src Dockerfile`

`docker build -f Dockerfile-init -t java-11-init .`

`fn init --init-image java-11-init myfunc`


## To Do

* Switch to a slim image!
* Add Function Test
* fn-cache image (libfnunixsocket.so)
* `jlink` option
