@echo off

cd %cd%
javac -cp "C:\Program Files\processing\core\library\core.jar" latkProcessing\*.java
move /y latkProcessing\*.class build\latkProcessing\
cd build
jar cvfm ..\latkProcessing.jar manifest.txt latkProcessing\*.class

@pause