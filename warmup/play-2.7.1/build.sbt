scalaVersion := "${SCALA_VERSION}"
crossScalaVersions := Seq("${SCALA_VERSION}", "${SCALA_VERSION_CROSS}")

lazy val root = (project in file("."))
  .enablePlugins(PlayJava, PlayEbean)
  .settings(
    libraryDependencies ++= Seq(
      guice,
      caffeine
    )
  )


