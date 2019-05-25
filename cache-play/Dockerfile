# Dockerfile Template #

FROM zhengcan/scala-sbt-node:11_base

# Play
RUN \
  mkdir -p ./play/project ./play/app ./play/conf && cd ./play && \
  echo 'sbt.version=1.2.8' >> project/build.properties && \
  echo 'scalaVersion := "2.12.8"' >> build.sbt && \
  echo 'crossScalaVersions := Seq("2.12.8", "2.12.7")' >> build.sbt && \
  echo 'lazy val root = (project in file("."))' >> build.sbt && \
  echo '.enablePlugins(PlayJava, PlayEbean)' >> build.sbt && \
  echo '.settings(' >> build.sbt && \
  echo '  libraryDependencies ++= Seq(guice, caffeine)' >> build.sbt && \
  echo ')' >> build.sbt && \
  echo 'case object Temp;' >> app/Temp.scala && \
# 2.7.1
  echo 'addSbtPlugin("com.typesafe.play" % "sbt-plugin" % "2.7.1")' >> project/plugins.sbt && \
  echo 'addSbtPlugin("com.typesafe.sbt" % "sbt-play-ebean" % "5.0.1")' >> project/plugins.sbt && \
  echo 'addSbtPlugin("com.typesafe.sbt" % "sbt-native-packager" % "1.3.19")' >> project/plugins.sbt && \
  echo 'addSbtPlugin("com.lightbend.akka.grpc" % "sbt-akka-grpc" % "0.6.1")' >> project/plugins.sbt && \
  echo 'addSbtPlugin("org.foundweekends.giter8" % "sbt-giter8-scaffold" % "0.11.0")' >> project/plugins.sbt && \
  sbt clean update && \
  sbt +compile && \
# 2.7.2
  echo 'addSbtPlugin("com.typesafe.play" % "sbt-plugin" % "2.7.2")' >> project/plugins.sbt && \
  echo 'addSbtPlugin("com.typesafe.sbt" % "sbt-play-ebean" % "5.0.1")' >> project/plugins.sbt && \
  echo 'addSbtPlugin("com.typesafe.sbt" % "sbt-native-packager" % "1.3.19")' >> project/plugins.sbt && \
  echo 'addSbtPlugin("com.lightbend.akka.grpc" % "sbt-akka-grpc" % "0.6.1")' >> project/plugins.sbt && \
  echo 'addSbtPlugin("org.foundweekends.giter8" % "sbt-giter8-scaffold" % "0.11.0")' >> project/plugins.sbt && \
  sbt clean update && \
  sbt +compile && \
# Cleanup
  cd .. && rm -rf ./play


