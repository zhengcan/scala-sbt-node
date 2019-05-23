#!/bin/bash

echo "Build Play 2.7.2"

sed -e "s/\${SCALA_VERSION}/${SCALA_VERSION}/g" -e "s/\${SCALA_VERSION_CROSS}/${SCALA_VERSION_CROSS}/g" build.tmpl > build.sbt
sbt "+ dist"
