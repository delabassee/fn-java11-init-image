## Fn Init Image for JDK 12 Early Access 


`tar cf jdk-12ea-init.tar func.init.yaml pom.xml src Dockerfile`

`docker build -f Dockerfile-init -t jdk-12ea-init .`

`fn init --init-image jdk-12ea-init myfunc`


jdk-12ea-init:latest