#!/bin/bash
curl -i https://bintray.com/fnproject/fnproject/fn-java-fdk/_latestVersion | grep "Location:" | sed 's:.*/::'

latestFdkVersion=$(curl -i https://bintray.com/fnproject/fnproject/fn-java-fdk/_latestVersion | grep "Location:" | sed 's:.*/::' | tr -d '\r')
#latestFdkVersion="$(tr -d '\r' <<<$latestFdkVersion)"
#| tr -d '\r'

set | grep latest

sed -i .orig "s/{fdk.version.latest}/$latestFdkVersion/g" pom.xml
