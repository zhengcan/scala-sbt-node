# Auto Generated File#

FROM zhengcan/scala-sbt-node:11_base

COPY ./warmup warmup

RUN \
  cd ./warmup/ && \
  cd ./expo-cli/ && (./build.sh || true) && cd .. && \
  cd ./play-2.7.1/ && (./build.sh || true) && cd .. && \
  cd ./play-2.7.2/ && (./build.sh || true) && cd .. && \
  rm -rf ./warmup

