#!/bin/sh

CURPATH=$(pwd)
TARGET_CLASSES_PATH="target/classes/lib/linux-x86_64"
TARGET_PATH="target"
MAKE=$(which make)
CMAKE=$(which cmake)

exitWithError() {
  cd ${CURPATH}
  echo "*** An error occurred. Please check log messages. ***"
  exit $1
}

mkdir -p "$TARGET_CLASSES_PATH"

cd "$TARGET_PATH"
$CMAKE ../../../ || exitWithError $?
$MAKE || exitWithError $?
rm -f "$CURPATH/${TARGET_CLASSES_PATH}/libbrotli.so"
cp "./libbrotli.so" "$CURPATH/${TARGET_CLASSES_PATH}" || exitWithError $?

cd "${CURPATH}"
