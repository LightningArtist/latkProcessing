@echo off

cd %cd%

mkdir build\latkProcessing
javac -cp "C:\Program Files\processing\core\library\core.jar" latkProcessing\*.java
move /y latkProcessing\*.class build\latkProcessing\
cd build
jar cvfm ..\latkProcessing.jar manifest.txt latkProcessing\*.class
cd ..
move latkProcessing.jar ..\library\

@pause