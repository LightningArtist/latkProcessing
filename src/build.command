#!/bin/bash

SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

cd $DIR

CORE_PATH="/Applications/Processing/Processing3.app/Contents/Java/core.jar"

javac -cp $CORE_PATH latkProcessing/*.java
mv latkProcessing/*.class build/latkProcessing/
cd build
jar cvfm ../latkProcessing.jar manifest.txt latkProcessing/*.class
