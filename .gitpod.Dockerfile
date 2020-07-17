FROM gitpod/workspace-full:commit-c024b68b7f8c5c69b143c7e5429c18e7027915b4
USER gitpod
RUN brew install scala coursier/formulas/coursier sbt scalaenv ammonite-repl
RUN sudo env "PATH=$PATH" coursier bootstrap org.scalameta:scalafmt-cli_2.12:2.4.2 \
  -r sonatype:snapshots \
  -o /usr/local/bin/scalafmt --standalone --main org.scalafmt.cli.Cli
RUN bash -cl "set -eux \
    version=0.9.0 \
    coursier fetch \
        org.scalameta:metals_2.12:$version \
        org.scalameta:mtags_2.13.1:$version \
        org.scalameta:mtags_2.13.0:$version \
        org.scalameta:mtags_2.12.10:$version \
        org.scalameta:mtags_2.12.9:$version \
        org.scalameta:mtags_2.12.8:$version"
