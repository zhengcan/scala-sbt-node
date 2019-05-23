# Auto Generated File#

FROM zhengcan/scala-sbt-node:8_base

COPY ./warmup warmup

RUN \
  cd ./warmup/ && \
  cd ./expo-cli/ && ./build.sh && cd .. && \
  cd ./play-2.7.1/ && ./build.sh && cd .. && \
  cd ./play-2.7.2/ && ./build.sh && cd .. && \
  rm -rf ./warmup

