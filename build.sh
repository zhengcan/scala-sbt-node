#!/bin/bash

./update.sh

# Base Images
docker build -f base/Dockerfile.11 --build-arg NODE_VERSION="12.4.0"  -t zhengcan/scala-sbt-node:11-base-node12 base
docker build -f base/Dockerfile.11 --build-arg NODE_VERSION="10.16.0" -t zhengcan/scala-sbt-node:11-base-node10 base
docker build -f base/Dockerfile.8  --build-arg NODE_VERSION="12.4.0"  -t zhengcan/scala-sbt-node:8-base-node12  base
docker build -f base/Dockerfile.8  --build-arg NODE_VERSION="10.16.0" -t zhengcan/scala-sbt-node:8-base-node10  base
docker tag      zhengcan/scala-sbt-node:11-base-node12                   zhengcan/scala-sbt-node:11-base
docker tag      zhengcan/scala-sbt-node:8-base-node12                    zhengcan/scala-sbt-node:8-base

# Main Images
docker build -f main/Dockerfile.11                -t zhengcan/scala-sbt-node:11-node12 main
docker build -f main/Dockerfile.11-node10         -t zhengcan/scala-sbt-node:11-node10 main
docker build -f main/Dockerfile.8                 -t zhengcan/scala-sbt-node:8-node12  main
docker build -f main/Dockerfile.8-node10          -t zhengcan/scala-sbt-node:8-node10  main
docker tag      zhengcan/scala-sbt-node:11-node12    zhengcan/scala-sbt-node:11
docker tag      zhengcan/scala-sbt-node:8-node12     zhengcan/scala-sbt-node:8
docker tag      zhengcan/scala-sbt-node:11           zhengcan/scala-sbt-node:latest

# Cache Expo
docker build -f cache-expo/Dockerfile.11 -t zhengcan/scala-sbt-node:11-expo cache-expo
docker build -f cache-expo/Dockerfile.8  -t zhengcan/scala-sbt-node:8-expo cache-expo



