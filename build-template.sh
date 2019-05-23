#!/bin/bash

# Base Images
sed -e 's/FROM .*/FROM openjdk:8-stretch/g' -e 's/# Dockerfile Template #/# Auto Generated File#/g' Dockerfile > 8/Dockerfile_base
sed -e 's/FROM .*/FROM openjdk:11-stretch/g' -e 's/# Dockerfile Template #/# Auto Generated File#/g' Dockerfile > 11/Dockerfile_base

# Warm Up
sed -e 's/FROM .*/FROM zhengcan\/scala-sbt-node:8_base/g' -e 's/# Dockerfile Template #/# Auto Generated File#/g' warmup/Dockerfile > 8/Dockerfile
sed -e 's/FROM .*/FROM zhengcan\/scala-sbt-node:11_base/g' -e 's/# Dockerfile Template #/# Auto Generated File#/g' warmup/Dockerfile > 11/Dockerfile





