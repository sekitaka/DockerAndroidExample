#!/bin/bash

rm -f local.properties
mkdir -p $ANDROID_HOME/licenses
echo "8933bad161af4178b1185d1a37fbf41ea5269c55" > $ANDROID_HOME/licenses/android-sdk-license

./gradlew clean && \
./gradlew dependencies && \
./gradlew assembleDebug