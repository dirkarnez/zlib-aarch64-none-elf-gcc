@REM run as Administrator
@echo off
cd /d %~dp0
set DOWNLOADS_DIR=%USERPROFILE%\Downloads
set DOWNLOADS_DIR_LINUX=%DOWNLOADS_DIR:\=/%

@REM SET PATH=^
@REM %DOWNLOADS_DIR%\avr8\avr8;^
@REM %DOWNLOADS_DIR%\avr8\avr8\avr8-gnu-toolchain\bin;^
@REM %DOWNLOADS_DIR%\PortableGit\usr\bin;^
@REM %DOWNLOADS_DIR%\cmake-3.26.1-windows-x86_64\bin;

@REM SET PATH=^
@REM %DOWNLOADS_DIR%\arduino-1.8.19-windows\arduino-1.8.19\hardware\tools\avr\bin;^
@REM %DOWNLOADS_DIR%\PortableGit\usr\bin;^
@REM %DOWNLOADS_DIR%\cmake-3.26.1-windows-x86_64\bin;


SET PATH=^
%DOWNLOADS_DIR%\xpack-aarch64-none-elf-gcc-13.2.1-1.1-win32-x64\xpack-aarch64-none-elf-gcc-13.2.1-1.1\bin;^
%DOWNLOADS_DIR%\PortableGit\usr\bin;^
%DOWNLOADS_DIR%\cmake-3.26.1-windows-x86_64\bin;


@REM -DCMAKE_CXX_COMPILER=avr-g++ ^
@REM -DCMAKE_CXX_COMPILER=aarch64-none-elf-g++ ^

cd /d "%DOWNLOADS_DIR%\zlib" &&^
aarch64-none-elf-gcc --version &&^
cmake.exe -G"MinGW Makefiles" ^
-DCMAKE_BUILD_TYPE=Release ^
-DCMAKE_TRY_COMPILE_TARGET_TYPE="STATIC_LIBRARY" ^
-DBUILD_SHARED_LIBS=OFF ^
-DZLIB_BUILD_EXAMPLES=OFF ^
-DCMAKE_C_COMPILER=aarch64-none-elf-gcc ^
-DCMAKE_MAKE_PROGRAM="%DOWNLOADS_DIR_LINUX%/x86_64-8.1.0-release-posix-seh-rt_v6-rev0/mingw64/bin/mingw32-make.exe" ^
-DCMAKE_INSTALL_PREFIX="cmake-build/cmakeInstallationPath" -B./cmake-build &&^
cd cmake-build && ( cmake --build . --config Release && cmake --install .  || type .\CMakeFiles\CMakeError.log )  


@REM find_program(AVR_CC avr-gcc REQUIRED)
@REM find_program(AVR_CXX avr-g++ REQUIRED)
@REM find_program(AVR_OBJCOPY avr-objcopy REQUIRED)
@REM find_program(AVR_SIZE_TOOL avr-size REQUIRED)
@REM find_program(AVR_OBJDUMP avr-objdump REQUIRED)

@REM ##########################################################################
@REM # toolchain starts with defining mandatory variables
@REM ##########################################################################
@REM set(CMAKE_SYSTEM_NAME Generic)
@REM set(CMAKE_SYSTEM_PROCESSOR avr)
@REM set(CMAKE_C_COMPILER ${AVR_CC})
@REM set(CMAKE_CXX_COMPILER ${AVR_CXX})

@REM %DOWNLOADS_DIR%\x86_64-8.1.0-release-posix-seh-rt_v6-rev0\mingw64\bin\mingw32-make.exe clean
@REM %DOWNLOADS_DIR%\x86_64-8.1.0-release-posix-seh-rt_v6-rev0\mingw64\bin\mingw32-make.exe all
pause