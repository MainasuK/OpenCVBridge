#!/bin/bash

set -exu

cd ..
work_dir=$(PWD)

scheme="OpenCVFramework"
FRAMEWORK_ARCHIVE_PATH_POSTFIX=".xcarchive/Products/Library/Frameworks"

# builds framework
xcodebuild archive \
    -scheme ${scheme} \
    -destination "generic/platform=macOS" \
    -archivePath "archives/${scheme}-macOS" \
    SKIP_INSTALL=NO \
    BUILD_LIBRARY_FOR_DISTRIBUTION=YES

# combine to xcframework
xcodebuild -create-xcframework \
    -framework ${work_dir}/archives/${scheme}-macOS${FRAMEWORK_ARCHIVE_PATH_POSTFIX}/${scheme}.framework \
    -output OpenCV.xcframework