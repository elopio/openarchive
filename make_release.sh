#!/bin/sh

# from:  http://developer.android.com/tools/publishing/app-signing.html

./gradlew assembleRelease

jarsigner -verbose -sigalg SHA1withRSA -digestalg SHA1 -keystore openarchive-release.keystore app/build/outputs/apk/app-release-unsigned.apk release

jarsigner -verify -verbose -certs app/build/outputs/apk/app-release-unsigned.apk

/home/josh/Android/Sdk/build-tools/21.1.2/zipalign -v 4 app/build/outputs/apk/app-release-unsigned.apk openarchive-release.apk

