#!/usr/bin/env bash
#
# Simple build script that compiles all the docker files and pushes them.


for i in $( find . -name Dockerfile -print0 | xargs -0 -n1 dirname | sort --unique | cut -c 3- ); do
  echo Building $i
  docker build -t andrewmccall/hadoop-$i $i
  echo Pushing $i
  docker push andrewmccall/hadoop-$i
done
