#!/usr/bin/env bash
set -e

cd source
./gradlew clean assemble

cp -R build/* ../build
