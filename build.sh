#!/usr/bin/env bash

# We have to set DART_SDK_PATH environment variable
# due to compatibility issues (TeamCity builds)
if [ -z "${DART_SDK_PATH}" ]; then
  echo "[ERROR]: DART_SDK_PATH is unset or set to the empty string"
  exit 127
fi

export BUILD_DATE=$(date +"%Y-%m-%d %H:%M:%S")
export DEVELOPMENT_MODE=release

${DART_SDK_PATH}/bin/pub upgrade --no-precompile --packages-dir || exit $?
${DART_SDK_PATH}/bin/pub run grinder build_release || exit $?
