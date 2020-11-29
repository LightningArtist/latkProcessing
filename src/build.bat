@echo off

set CORE_PATH="C:\Program Files\processing\core\library\core.jar"

cd %cd%
javac -cp %CORE_PATH% latkProcessing\*.java
move /y latkProcessing\*.class build\latkProcessing\
cd build
jar cvfm ..\latkProcessing.jar manifest.txt latkProcessing\*.class

@pause