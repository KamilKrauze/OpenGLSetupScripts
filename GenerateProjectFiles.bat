@echo off

IF NOT "-d" "%CD%\thirdparty\include" (
  echo "Creating 'include' directory..."
  echo
  cd "%CD%\thirdparty"
  mkdir "include"
  mkdir "%CD%\include\glad"
  mkdir "%CD%\include\KHR"
  COPY  "%CD%\glm\glm" "%CD%\include\glm"
  COPY  "%CD%\glfw\include\GLFW" "./include/"
  COPY  "./stb/" "%CD%\include\stb"
  wget "-O" "%CD%\include\glad\glad.h" "https://glad.dav1d.de/generated/tmpnbaj81ksglad/include/glad/glad.h"
  wget "-O" "%CD%\..\src\glad.c" "https://glad.dav1d.de/generated/tmpnbaj81ksglad/src/glad.c"
  wget "-O" "%CD%\include\KHR\khrplatform.h" "https://glad.dav1d.de/generated/tmpnbaj81ksglad/include/KHR/khrplatform.h"
  cd ".."
)
IF NOT "-d" "%CD%\thirdparty\lib" (
  echo "Creating 'lib' directory..."
  cd "%CD%\thirdparty"
  mkdir "lib"
  cd ".."
)
./premake5 vs2022
echo "Done..."
