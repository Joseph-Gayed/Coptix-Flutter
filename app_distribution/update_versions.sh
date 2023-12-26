#!/bin/bash

infoPlistPath="../ios/Runner/Info.plist"
buildGradlePath="../android/app/build.gradle"

# 1.Extract versionName and versionCode from dart file using sed
#versionName=$(sed -n "s/^.*versionName = '\([^']*\)'.*$/\1/p" app_version.dart)
#versionCode=$(sed -n "s/^.*versionCode = \([0-9]*\).*$/\1/p" app_version.dart)

# 1.Define versionName and versionCode
versionName="0.4.0"
versionCode=4

# 2.Update iOS version name and number in Info.plist
/usr/libexec/PlistBuddy -c "Set :CFBundleShortVersionString $versionName" $infoPlistPath &&
/usr/libexec/PlistBuddy -c "Set :CFBundleVersion $versionCode" $infoPlistPath &&
echo "---> iOS Version is updated to $versionName ($versionCode)."

# 3.Update Android version name and number in app/build.gradle using awk
sed -i "" -e "/^ *versionCode/c\\
        versionCode $versionCode
" -e "/^ *versionName/c\\
        versionName \"$versionName\"
" "$buildGradlePath" &&
echo "---> Android Version is updated to $versionName ($versionCode)."
