#!/bin/bash

# Base Images
sed -e 's/FROM .*/FROM openjdk:8-stretch/g' -e 's/# Dockerfile Template #/# Auto Generated File#/g' base/Dockerfile > base/Dockerfile.8
sed -e 's/FROM .*/FROM openjdk:11-stretch/g' -e 's/# Dockerfile Template #/# Auto Generated File#/g' base/Dockerfile > base/Dockerfile.11

# Cache Play
sed -e 's/FROM .*/FROM zhengcan\/scala-sbt-node:8-base/g' -e 's/# Dockerfile Template #/# Auto Generated File#/g' cache-play/Dockerfile > cache-play/Dockerfile.8
sed -e 's/FROM .*/FROM zhengcan\/scala-sbt-node:11-base/g' -e 's/# Dockerfile Template #/# Auto Generated File#/g' cache-play/Dockerfile > cache-play/Dockerfile.11

# Cache Expo
sed -e 's/FROM .*/FROM zhengcan\/scala-sbt-node:8/g' -e 's/# Dockerfile Template #/# Auto Generated File#/g' cache-expo/Dockerfile > cache-expo/Dockerfile.8
sed -e 's/FROM .*/FROM zhengcan\/scala-sbt-node:11/g' -e 's/# Dockerfile Template #/# Auto Generated File#/g' cache-expo/Dockerfile > cache-expo/Dockerfile.11



