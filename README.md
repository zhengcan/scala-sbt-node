# scala-sbt-node

This repo provides scala, sbt, node and more.

## Content

This repo will build 3 kinds of images:
- base
- main
- with-expo

### base

It includes:
- openjdk `8-stretch`, `11-stretch`
- scala `2.12.8`, `2.12.7`
- sbt `1.2.8`
- coursier `1.1.0-M14-2`
- node `10.16.0`, `12.4.0`
- npm `6.9.0`
- yarn `1.16.0`
- lerna `3.14.1`

Tags:
- `11-base-node12`, `11-base`
  - from `openjdk:11-stretch`
  - node `12.x`
- `11-base-node10`
  - from `openjdk:11-stretch`
  - node `10.x`
- `8-base-node12`, `8-base`
  - from `openjdk:8-stretch`
  - node `12.x`
- `8-base-node10`
  - from `openjdk:8-stretch`
  - node `10.x`

### main

It includes:
- all in base
- local cache for
  - Play Framework `2.6.23`, `2.7.2`

Tags:
- `11-node12`, `11`, `latest`
  - from `11-base`
- `11-node10`
  - from `11-base`
- `8-node12`, `8`
  - from `8-base`
- `8-node10`
  - from `8-base`

### with-expo

It includes:
- all in main
- expo-cli `2.19.4`

Tags:
- `11-expo`
  - from `11`
- `8-expo`
  - from `8`

## Usage

https://hub.docker.com/r/zhengcan/scala-sbt-node

```
docker pull zhengcan/scala-sbt-node

docker run -v `pwd`:/app zhengcan/scala-sbt-node sbt
```
