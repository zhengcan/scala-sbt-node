#!/bin/bash

./update.sh

# Base Images
docker build -f base/Dockerfile.8 -t zhengcan/scala-sbt-node:8-base base
docker build -f base/Dockerfile.11 -t zhengcan/scala-sbt-node:11-base base

# Main Images
docker build -f main/Dockerfile.8 -t zhengcan/scala-sbt-node:8 main
docker build -f main/Dockerfile.11 -t zhengcan/scala-sbt-node:11 -t zhengcan/scala-sbt-node:latest main

# Cache Expo
docker build -f cache-expo/Dockerfile.8 -t zhengcan/scala-sbt-node:8-expo cache-expo
docker build -f cache-expo/Dockerfile.11 -t zhengcan/scala-sbt-node:11-expo cache-expo



