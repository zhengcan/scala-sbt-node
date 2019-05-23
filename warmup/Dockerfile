# Dockerfile Template #

FROM zhengcan/scala-sbt-node:11_base

COPY ../warmup warmup

RUN \
  ./warmup/expo-cli/build.sh && \
  ./warmup/play-2.7.1/build.sh && \
  ./warmup/play-2.7.2/build.sh && \
  rm -rf ./warmup

