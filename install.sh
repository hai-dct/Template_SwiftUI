#!/bin/bash

BASE_XCODE_DIR="${HOME}/Library/Developer/Xcode"
TEMPLATES_XCODE_DIR="${BASE_XCODE_DIR}/Templates"
FILE_TEMPLATES_XCODE_DIR="${TEMPLATES_XCODE_DIR}/MVVM Templates"
TEMPLATES_FOLDER_NAME="SwiftUI.xctemplate"

echo "Starting installation of SwiftUI templates."

# Check if templates dir exists
if [ ! -d "${TEMPLATES_XCODE_DIR}" ]; then
  echo "✅ Creating Templates directory, because it didn't exist."
  mkdir "${TEMPLATES_XCODE_DIR}"
fi

# Check if file templates dir exists
if [ ! -d "${FILE_TEMPLATES_XCODE_DIR}" ]; then
  echo "✅ Creating MVVM Templates directory, because it didn't exist."
  mkdir "${FILE_TEMPLATES_XCODE_DIR}"
fi

# Check if templates exist
if [ -d "${FILE_TEMPLATES_XCODE_DIR}/${TEMPLATES_FOLDER_NAME}" ]; then
    echo "🙂 That Template already exists. Do you want to replace it? (YES or NO)"
    select yn in "Yes" "No"; do
        case $yn in
            Yes ) rm -rf "${FILE_TEMPLATES_XCODE_DIR}/${TEMPLATES_FOLDER_NAME}"; break;;
            No ) exit;;
        esac
    done
fi

# Copy the files
echo "Copying template files."
cp -r "${TEMPLATES_FOLDER_NAME}" "${FILE_TEMPLATES_XCODE_DIR}/"
echo "🎉 SwiftUI templates installation done."
