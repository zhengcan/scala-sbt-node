# Import OpenJDK
FROM openjdk:11-stretch

# Environment
ARG SCALA_VERSION=2.12.8
ARG SBT_VERSION=1.2.8
ARG SBT_COURSIER_VERSION=1.1.0-M14-4
ARG NODE_VERSION=10.15.3
ARG YARN_VERSION=1.16.0
ARG INIT_SCRIPT

# Scalar
RUN \
  curl -fsL https://downloads.typesafe.com/scala/$SCALA_VERSION/scala-$SCALA_VERSION.tgz | tar xfz - -C /root/ && \
  echo >> /root/.bashrc && \
  echo "export PATH=~/scala-$SCALA_VERSION/bin:$PATH" >> /root/.bashrc

# Sbt
RUN \
  curl -L -o sbt-$SBT_VERSION.deb https://dl.bintray.com/sbt/debian/sbt-$SBT_VERSION.deb && \
  dpkg -i sbt-$SBT_VERSION.deb && \
  rm sbt-$SBT_VERSION.deb && \
  apt-get update && \
  apt-get install sbt && \
  # Coursier
  mkdir -p ~/.sbt/1.0/plugins && \
  echo "addSbtPlugin(\"io.get-coursier\" % \"sbt-coursier\" % \"$SBT_COURSIER_VERSION\")" >> ~/.sbt/1.0/plugins/plugins.sbt && \
  echo 'classpathTypes += "maven-plugin"' >> ~/.sbt/1.0/sbt-coursier.sbt

# Node
RUN \
  groupadd --gid 1000 node \
  && useradd --uid 1000 --gid node --shell /bin/bash --create-home node \
  && ARCH= && dpkgArch="$(dpkg --print-architecture)" \
  && case "${dpkgArch##*-}" in \
    amd64) ARCH='x64';; \
    ppc64el) ARCH='ppc64le';; \
    s390x) ARCH='s390x';; \
    arm64) ARCH='arm64';; \
    armhf) ARCH='armv7l';; \
    i386) ARCH='x86';; \
    *) echo "unsupported architecture"; exit 1 ;; \
  esac \
  # gpg keys listed at https://github.com/nodejs/node#release-keys
  && set -ex \
  && for key in \
    94AE36675C464D64BAFA68DD7434390BDBE9B9C5 \
    FD3A5288F042B6850C66B31F09FE44734EB7990E \
    71DCFD284A79C3B38668286BC97EC7A07EDE3FC1 \
    DD8F2338BAE7501E3DD5AC78C273792F7D83545D \
    C4F0DFFF4E8C1A8236409D08E73BC641CC11F4C8 \
    B9AE9905FFD7803F25714661B63B535A4C206CA9 \
    77984A986EBC2AA786BC0F66B01FBB92821C587A \
    8FCCA13FEF1D0C2E91008E09770F7A9A5AE15600 \
    4ED778F539E3634C779C87C6D7062848A1AB005C \
    A48C2BEE680E841632CD4E44F07496B3EB3C1762 \
    B9E2F5981AA6E0CD28160D9FF13993A75599653C \
  ; do \
    gpg --batch --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys "$key" || \
    gpg --batch --keyserver hkp://ipv4.pool.sks-keyservers.net --recv-keys "$key" || \
    gpg --batch --keyserver hkp://pgp.mit.edu:80 --recv-keys "$key" ; \
  done \
  && curl -fsSLO --compressed "https://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-linux-$ARCH.tar.xz" \
  && curl -fsSLO --compressed "https://nodejs.org/dist/v$NODE_VERSION/SHASUMS256.txt.asc" \
  && gpg --batch --decrypt --output SHASUMS256.txt SHASUMS256.txt.asc \
  && grep " node-v$NODE_VERSION-linux-$ARCH.tar.xz\$" SHASUMS256.txt | sha256sum -c - \
  && tar -xJf "node-v$NODE_VERSION-linux-$ARCH.tar.xz" -C /usr/local --strip-components=1 --no-same-owner \
  && rm "node-v$NODE_VERSION-linux-$ARCH.tar.xz" SHASUMS256.txt.asc SHASUMS256.txt \
  && ln -s /usr/local/bin/node /usr/local/bin/nodejs

# Yarn
RUN \
  set -ex \
  && for key in \
    6A010C5166006599AA17F08146C2130DFD2497F5 \
  ; do \
    gpg --batch --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys "$key" || \
    gpg --batch --keyserver hkp://ipv4.pool.sks-keyservers.net --recv-keys "$key" || \
    gpg --batch --keyserver hkp://pgp.mit.edu:80 --recv-keys "$key" ; \
  done \
  && curl -fsSLO --compressed "https://yarnpkg.com/downloads/$YARN_VERSION/yarn-v$YARN_VERSION.tar.gz" \
  && curl -fsSLO --compressed "https://yarnpkg.com/downloads/$YARN_VERSION/yarn-v$YARN_VERSION.tar.gz.asc" \
  && gpg --batch --verify yarn-v$YARN_VERSION.tar.gz.asc yarn-v$YARN_VERSION.tar.gz \
  && mkdir -p /opt \
  && tar -xzf yarn-v$YARN_VERSION.tar.gz -C /opt/ \
  && ln -s /opt/yarn-v$YARN_VERSION/bin/yarn /usr/local/bin/yarn \
  && ln -s /opt/yarn-v$YARN_VERSION/bin/yarnpkg /usr/local/bin/yarnpkg \
  && rm yarn-v$YARN_VERSION.tar.gz.asc yarn-v$YARN_VERSION.tar.gz

# More Tools
RUN	\
  apt-get install vim dnsutils --yes && \
  npm i -g lerna && \
  npm i -g --unsafe-perm=true --allow-root expo-cli

# Init
RUN if [ "$INIT_SCRIPT" != "" ]; then \
  sh -c "$(curl -fsSL $INIT_SCRIPT)"; \
  fi

# WarmUp
RUN \
  mkdir warmup && cd warmup && \
  mkdir project && \
  echo "sbt.version=${SBT_VERSION}" >> project/build.properties && \
  echo 'addSbtPlugin("com.typesafe.play" % "sbt-plugin" % "2.7.1")' >> project/plugins.sbt && \
  echo 'addSbtPlugin("com.typesafe.sbt" % "sbt-play-ebean" % "5.0.1")' >> project/plugins.sbt && \
  echo 'addSbtPlugin("com.typesafe.sbt" % "sbt-native-packager" % "1.3.19")' >> project/plugins.sbt && \
  echo 'addSbtPlugin("com.lightbend.akka.grpc" % "sbt-akka-grpc" % "0.6.1")' >> project/plugins.sbt && \
  echo 'addSbtPlugin("org.foundweekends.giter8" % "sbt-giter8-scaffold" % "0.11.0")' >> project/scaffold.sbt && \
  echo "scalaVersion := \"${SCALA_VERSION}\"" >> build.sbt && \
  echo "lazy val root = (project in file(\".\")).enablePlugins(PlayJava, PlayEbean).settings(libraryDependencies ++= Seq(guice, caffeine))" >> build.sbt && \
  mkdir app && \
  echo "case object Temp" > app/Temp.scala && \
  sbt dist && \
  cd .. && rm -rf warmup

WORKDIR /root
