#!/bin/bash

BUILD_LIBRARY_FOR_DISTRIBUTION=YES \
OTHER_SWIFT_FLAGS="-warnings-as-errors" \
SWIFT_STRICT_CONCURRENCY=complete

echo "🚀 Building MyAwesomeSDK XCFramework..."

# Exit immediately if a command exits with a non-zero status
set -e

# Clean previous builds
rm -rf build
mkdir -p build

# Set environment variables
export BUILD_LIBRARY_FOR_DISTRIBUTION=YES
export OTHER_SWIFT_FLAGS="-warnings-as-errors"
export SWIFT_STRICT_CONCURRENCY=complete

# Build for iOS Device
xcodebuild archive \
  -scheme MyAwesomeSDK \
  -configuration Release \
  -destination "generic/platform=iOS" \
  -archivePath "build/ios_devices" \
  SKIP_INSTALL=NO \
  BUILD_LIBRARY_FOR_DISTRIBUTION=YES \
  OTHER_SWIFT_FLAGS="$OTHER_SWIFT_FLAGS" \
  SWIFT_STRICT_CONCURRENCY="$SWIFT_STRICT_CONCURRENCY"

# Build for iOS Simulator
xcodebuild archive \
  -scheme MyAwesomeSDK \
  -configuration Release \
  -destination "generic/platform=iOS Simulator" \
  -archivePath "build/ios_simulators" \
  SKIP_INSTALL=NO \
  BUILD_LIBRARY_FOR_DISTRIBUTION=YES \
  OTHER_SWIFT_FLAGS="$OTHER_SWIFT_FLAGS" \
  SWIFT_STRICT_CONCURRENCY="$SWIFT_STRICT_CONCURRENCY"

# Create the XCFramework
xcodebuild -create-xcframework \
  -framework build/ios_devices.xcarchive/Products/Library/Frameworks/MyAwesomeSDK.framework \
  -framework build/ios_simulators.xcarchive/Products/Library/Frameworks/MyAwesomeSDK.framework \
  -output build/MyAwesomeSDK.xcframework

echo "✅ MyAwesomeSDK.xcframework generated successfully at build/"
