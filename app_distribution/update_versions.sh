#!/bin/bash

infoPlistPath="../ios/Runner/Info.plist"
buildGradlePath="../android/app/build.gradle"

# 1.Define versionName and versionCode
versionName="0.8.0"
versionCode=8

# 2.Update iOS version name and number in Info.plist
/usr/libexec/PlistBuddy -c "Set :CFBundleShortVersionString $versionName" $infoPlistPath &&
/usr/libexec/PlistBuddy -c "Set :CFBundleVersion $versionCode" $infoPlistPath &&
echo "---> iOS Version is updated to $versionName ($versionCode)."

# 3.Update Android version name and number in app/build.gradle
sed -i "" -e "/^ *versionCode/c\\
        versionCode $versionCode
" -e "/^ *versionName/c\\
        versionName \"$versionName\"
" "$buildGradlePath" &&
echo "---> Android Version is updated to $versionName ($versionCode)."
