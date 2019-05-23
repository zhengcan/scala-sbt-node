# Auto Generated File#

FROM zhengcan/scala-sbt-node:8_base

COPY ./warmup warmup

RUN \
  cd ./warmup/expo-cli/ && ./build.sh && \
  cd ./warmup/play-2.7.1/ && ./build.sh && \
  cd ./warmup/play-2.7.2/ && ./build.sh && \
  rm -rf ./warmup

