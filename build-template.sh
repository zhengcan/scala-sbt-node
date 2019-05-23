#!/bin/bash

# Base Images
sed -e 's/FROM .*/FROM openjdk:8-stretch/g' -e 's/# Dockerfile Template #/# Auto Generated File#/g' Dockerfile > 8/Dockerfile
sed -e 's/FROM .*/FROM openjdk:11-stretch/g' -e 's/# Dockerfile Template #/# Auto Generated File#/g' Dockerfile > 11/Dockerfile

# Warm Up
sed -e 's/FROM .*/FROM zhengcan\/scala-sbt-node:8/g' -e 's/# Dockerfile Template #/# Auto Generated File#/g' warmup/Dockerfile > 8/Dockerfile_warmup
sed -e 's/FROM .*/FROM zhengcan\/scala-sbt-node:11/g' -e 's/# Dockerfile Template #/# Auto Generated File#/g' warmup/Dockerfile > 11/Dockerfile_warmup





