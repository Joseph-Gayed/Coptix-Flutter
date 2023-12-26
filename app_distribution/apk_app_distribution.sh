#!/bin/bash

# Define the firebase config variables
apkPath="../build/app/outputs/flutter-apk/app-release.apk"
androidAppId="1:974856763223:android:aff93845402a46edc37012"
groupsNames="Dev,QC,Business"
releaseNotes=$(<release_notes.txt)

#update versions
./update_versions.sh &&

# Your Flutter build command (e.g., Android APK)
flutter build apk --release &&

# Upload APK to App distribution
firebase appdistribution:distribute "$apkPath" --app  "$androidAppId" --release-notes "$releaseNotes" --groups "$groupsNames" &&
echo "---> App Distribution is Done."
