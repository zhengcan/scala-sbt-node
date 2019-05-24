#!/bin/bash

echo "Build Play 2.7.2"

export SBT_VERSION=1.2.8
export SCALA_VERSION=2.11.8
export SCALA_VERSION_CROSS=2.11.7

sed -e "s/sbt\.version=.*/sbt.version=${SBT_VERSION}/g" project/build.properties > project/build.properties
sed -e "s/\${SCALA_VERSION}/${SCALA_VERSION}/g" -e "s/\${SCALA_VERSION_CROSS}/${SCALA_VERSION_CROSS}/g" build.tmpl > build.sbt

sbt compile
