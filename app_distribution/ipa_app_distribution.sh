#!/bin/bash


# Define the firebase config variables
buildDirPath="../build/ios/"
ipaFilePath="../build/ios/ipa/coptix.ipa"
infoPlistPath="../ios/Runner/Info.plist"
iosAppId="1:974856763223:ios:f362e62c1aac4174c37012"
groupsNames="Dev,QC,Business"
releaseNotes=$(<release_notes.txt)

#Todo: change the version
version_name='0.3.0'
version_number=3

# Path to your provisioning profile
provisioningProfile="../ios/Coptix_Firebase_Ad_Hoc.mobileprovision"

# Path to your code signing identity
codeSigningIdentity="Apple Development"

# Path to your Xcode project/workspace
xcodeProjectPath="../ios/Runner.xcworkspace"
archiveFilePath="../build/ios/archive/Runner.xcarchive"

# Path to your Xcode project/workspace
schemeName="Runner"
exportOptionsPlistPath="exportOptions.plist"
#====================================================

# 1. clear old ipa if any
rm -r $buildDirPath
echo "---> Cleared old IPA."


# 2. Update version name and number in Info.plist
/usr/libexec/PlistBuddy -c "Set :CFBundleShortVersionString $version_name" $infoPlistPath &&
/usr/libexec/PlistBuddy -c "Set :CFBundleVersion $version_number" $infoPlistPath &&
echo "---> Version is updated to $version_name($version_number)." &&


# 3. Create new iPA
flutter build ipa &&
echo "---> Created new IPA."

#tried this to use provisioning file
#xcodebuild archive -workspace "$xcodeProjectPath" -scheme $schemeName -archivePath $archiveFilePath  -configuration Release PROVISIONING_PROFILE="$provisioningProfile" CODE_SIGN_IDENTITY="$codeSigningIdentity" &&
#xcodebuild -exportArchive -archivePath $archiveFilePath  -exportPath "$ipaFilePath" -exportOptionsPlist $exportOptionsPlistPath &&



# 4. Upload iPA to firebase
firebase appdistribution:distribute "$ipaFilePath" --app  "$iosAppId" --release-notes "$releaseNotes" --groups "$groupsNames" &&
echo "---> Uploaded IPA to firebase." || { echo "---> !Error!: Failed to upload IPA to firebase."; exit 1; }

# Check if any command failed and print final message accordingly
if $success; then
    echo "---> Distribution process completed."
else
    echo "---> Distribution process failed."
    exit 1
fi
