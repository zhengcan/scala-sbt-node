# scala-sbt-node

This image includes:
- openjdk:11-stretch
- scala 2.12.8, 2.12.7
- sbt 1.2.8
- coursier 1.1.0-M14-2
- node 10.15.3
- yarn 1.16.0
- lerna
- expo-cli

## Usage

https://hub.docker.com/r/zhengcan/scala-sbt-node

```
docker pull zhengcan/scala-sbt-node
```

## Tags

- `11-base`
  - openjdk:11-stretch
- `8-base`
  - openjdk:8-stretch
- `11`, `latest`
  - openjdk:11-stretch
  - cache Play 2.7.1 & Play 2.7.2
- `8`
  - openjdk:8-stretch
  - cache Play 2.7.1 & Play 2.7.2
- `11-expo`
  - openjdk:11-stretch
  - cache Play 2.7.1 & Play 2.7.2
  - cache Expo
- `8-expo`
  - openjdk:8-stretch
  - cache Play 2.7.1 & Play 2.7.2
  - cache Expo

