## Fn Init Image for Java 11 - `java-11-init`

`tar cf java-11-init.tar func.init.yaml pom.xml src Dockerfile`

`docker build -f Dockerfile-init -t java-11-init .`

`fn init --init-image java-11-init myfunc`


## To Do

* Switch to a slim image!
* Add Function Test
* fn-cache image (`libfnunixsocket.so`)
* `jlink` option
* `fn init --runtime java` alias
* Check/tune JVM params
* Populate `<fdk.version>` with https://api.bintray.com/search/packages/maven?repo=fnproject&g=com.fnproject.fn&a=fdk
`curl -i https://bintray.com/fnproject/fnproject/fn-java-fdk/_latestVersion | grep "Location:" | sed 's:.*/::'`



### Deps 

/function/app

* com.fasterxml.jackson.core.jackson-annotations-2.9.0.jar -> not 2.9.7, req 2.9.1 minimum for JPMS https://github.com/FasterXML/jackson-annotations/commit/c8eb466a12c6c15fcb6873118f698b057e84cc94
* com.fasterxml.jackson.core.jackson-core-2.9.7.jar
* com.fasterxml.jackson.core.jackson-databind-2.9.7.jar
* com.fnproject.fn.api-1.0.75.jar
* com.fnproject.fn.runtime-1.0.75.jar
* commons-io.commons-io-2.6.jar -> should be OK for JPMS https://issues.apache.org/jira/browse/IO-551
* net.jodah.typetools-0.5.0.jar -> https://github.com/jhalterman/typetools/
* org.apache.httpcomponents.httpcore-4.4.10.jar -> req 4.5.6 for JPMS (https://www.apache.org/dist/httpcomponents/httpclient/RELEASE_NOTES-4.5.x.txt)
* + hello-1.0.0.jar

```
com.fasterxml.jackson.core.jackson-annotations-2.9.0.jar -> java.base
com.fasterxml.jackson.core.jackson-core-2.9.7.jar -> java.base
com.fasterxml.jackson.core.jackson-databind-2.9.7.jar -> /function/app/com.fasterxml.jackson.core.jackson-annotations-2.9.0.jar
com.fasterxml.jackson.core.jackson-databind-2.9.7.jar -> /function/app/com.fasterxml.jackson.core.jackson-core-2.9.7.jar
com.fasterxml.jackson.core.jackson-databind-2.9.7.jar -> java.base
com.fasterxml.jackson.core.jackson-databind-2.9.7.jar -> java.logging
com.fasterxml.jackson.core.jackson-databind-2.9.7.jar -> java.sql
com.fasterxml.jackson.core.jackson-databind-2.9.7.jar -> java.xml
com.fnproject.fn.api-1.0.75.jar -> java.base
com.fnproject.fn.runtime-1.0.75.jar -> /function/app/com.fasterxml.jackson.core.jackson-core-2.9.7.jar
com.fnproject.fn.runtime-1.0.75.jar -> /function/app/com.fasterxml.jackson.core.jackson-databind-2.9.7.jar
com.fnproject.fn.runtime-1.0.75.jar -> /function/app/com.fnproject.fn.api-1.0.75.jar
com.fnproject.fn.runtime-1.0.75.jar -> /function/app/commons-io.commons-io-2.6.jar
com.fnproject.fn.runtime-1.0.75.jar -> java.base
com.fnproject.fn.runtime-1.0.75.jar -> /function/app/net.jodah.typetools-0.5.0.jar
com.fnproject.fn.runtime-1.0.75.jar -> /function/app/org.apache.httpcomponents.httpcore-4.4.10.jar
commons-io.commons-io-2.6.jar -> java.base
net.jodah.typetools-0.5.0.jar -> java.base
net.jodah.typetools-0.5.0.jar -> jdk.unsupported
org.apache.httpcomponents.httpcore-4.4.10.jar -> java.base
```

```
java.base
java.logging
java.sql
java.xml
jdk.unsupported
/function/app/com.fnproject.fn.api-1.0.75.jar
/function/app/com.fasterxml.jackson.core.jackson-core-2.9.7.jar
/function/app/com.fasterxml.jackson.core.jackson-databind-2.9.7.jar
/function/app/com.fasterxml.jackson.core.jackson-annotations-2.9.0.jar
/function/app/commons-io.commons-io-2.6.jar
/function/app/net.jodah.typetools-0.5.0.jar
/function/app/org.apache.httpcomponents.httpcore-4.4.10.jar
```
