#!/bin/bash

# Base Images
sed -e 's/FROM .*/FROM zhengcan\/sbt:11-1.2.8/g' -e 's/# Dockerfile Template #/# Auto Generated #/g' base/Dockerfile > base/Dockerfile.11
sed -e 's/FROM .*/FROM zhengcan\/sbt:8-1.2.8/g' -e 's/# Dockerfile Template #/# Auto Generated #/g' base/Dockerfile > base/Dockerfile.8

# Main Images
sed -e 's/FROM .*/FROM zhengcan\/scala-sbt-node:11-base-node12/g' -e 's/# Dockerfile Template #/# Auto Generated #/g' main/Dockerfile > main/Dockerfile.11
sed -e 's/FROM .*/FROM zhengcan\/scala-sbt-node:11-base-node10/g' -e 's/# Dockerfile Template #/# Auto Generated #/g' main/Dockerfile > main/Dockerfile.11-node10
sed -e 's/FROM .*/FROM zhengcan\/scala-sbt-node:8-base-node12/g' -e 's/# Dockerfile Template #/# Auto Generated #/g' main/Dockerfile > main/Dockerfile.8
sed -e 's/FROM .*/FROM zhengcan\/scala-sbt-node:8-base-node10/g' -e 's/# Dockerfile Template #/# Auto Generated #/g' main/Dockerfile > main/Dockerfile.8-node10

# Cache Expo
sed -e 's/FROM .*/FROM zhengcan\/scala-sbt-node:11/g' -e 's/# Dockerfile Template #/# Auto Generated #/g' cache-expo/Dockerfile > cache-expo/Dockerfile.11
sed -e 's/FROM .*/FROM zhengcan\/scala-sbt-node:8/g' -e 's/# Dockerfile Template #/# Auto Generated #/g' cache-expo/Dockerfile > cache-expo/Dockerfile.8



