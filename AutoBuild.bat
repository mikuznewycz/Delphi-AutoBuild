@::!/dos/rocks
@echo off
cd "%~dp0"
goto :init

:header
    echo %__NAME% v%__VERSION%
    echo Automatisation de le compilation des executables avec Delphi
    echo.
    goto :eof

:usage
    echo USAGE:
    echo   %__BAT_NAME% [flags] "Module"
    echo.
    echo.  /?, --help              shows this help
    echo.  /v, --version           shows the version
    echo.  /a, --aspack            Compress Module with Aspack
    echo.  --config=Config         Choose configuration (Release, Debug, ...)
    echo.  --platform=Platform     Choose platform (Win32, Win64, ...)
    echo.
    echo. Example : %__BAT_NAME% --config=Debug --platform=Win64 Project12
    echo.
    goto :eof

:version
    if "%~1"=="full" call :header & goto :eof
    echo %__BAT_NAME% %__VERSION%
    goto :eof

:missing_argument
    call :header
    call :usage
    echo.
    echo ****                                   ****
    echo ****    MISSING "REQUIRED ARGUMENT"    ****
    echo ****                                   ****
    echo.
    goto :eof

:invalid_argument
    call :header
    call :usage
    echo.
    echo ****                                   ****
    echo ****    ERROR "INVALID ARGUMENT"       ****
    echo ****                                   ****
    echo.
    goto :eof

:init
    set "__NAME=%~n0"
    set "__VERSION=1.2"
    set "__YEAR=2022"

    set "__BAT_FILE=%~0"
    set "__BAT_PATH=%~dp0"
    set "__BAT_NAME=%~nx0"


    set "Module="
    set "OptConfig=Release"
    set "OptPlatform=Win32"
	
	set rsvars="C:\Program Files (x86)\Embarcadero\Studio\21.0\bin\rsvars.bat"
	set Eurekalog="C:\Program Files (x86)\Neos Eureka S.r.l\EurekaLog 7\Packages\Studio23\ecc32.exe"

	set "OptAspack=no"
	set Aspack="C:\Program Files (x86)\Aspack\Aspack.exe"
	

:parse	
    if "%~1"=="" goto :validate

    if /i "%~1"=="/?"         call :header & call :usage "%~2" & goto :end
    if /i "%~1"=="-?"         call :header & call :usage "%~2" & goto :end
    if /i "%~1"=="--help"     call :header & call :usage "%~2" & goto :end

    if /i "%~1"=="/v"         call :version      & goto :end
    if /i "%~1"=="-v"         call :version      & goto :end
    if /i "%~1"=="--version"  call :version full & goto :end
	
    if /i "%~1"=="/a"         set "OptAspack=yes" & shift & goto :parse
    if /i "%~1"=="--aspack"   set "OptAspack=yes" & shift & goto :parse

    if /i "%~1"=="/config"  set "OptConfig=%~2"   & shift & shift & goto :parse
    if /i "%~1"=="--config" set "OptConfig=%~2"   & shift & shift & goto :parse
	
    if /i "%~1"=="/platform"  set "OptPlatform=%~2" & shift & shift & goto :parse
    if /i "%~1"=="--platform" set "OptPlatform=%~2" & shift & shift & goto :parse
	
    if not defined Module (
		set "Module=%~1" & shift & goto :parse
	) else (
		call :invalid_argument & goto :end	
	)

    shift
    goto :parse

:validate
    if not defined Module call :missing_argument & goto :end

:main
	cd "%~dp0"
	echo #### %__NAME% v%__VERSION% "%Module%" (Config=%OptConfig%, Platform=%OptPlatform%, Aspack=%OptAspack%)
		
	IF not defined BDS (call %rsvars%)
	
	rem compilation des fichiers de ressources .res avec les fichiers .rc
	IF EXIST .\%Module%\Ressources.rc (
		echo #### BRCC32
		brcc32.exe ".\%Module%\Ressources.rc" || GOTO error
	)
	rem compilation de l'executable avec msbuild 
	echo #### MsBuild
	msbuild ".\%Module%\%Module%.dproj" /t:Clean,Build /p:Config=%OptConfig%;Platform=%OptPlatform% || GOTO error
	rem post compilation avec Eurekalog, on vérifie que Eurekalog est installé, puis qu'un fichier .eof existe 
	IF EXIST %Eurekalog% IF EXIST .\%Module%\%Module%.eof (
		echo #### Eurekalog
		IF /i "%OptConfig%"=="Debug" (
			%Eurekalog% --el_nostats --el_alter_exe=.\%Module%\%Module%.dproj;.\%Module%\%OptConfig%\%OptPlatform%\%Module%.exe --el_config=.\PARTAGE\_EurekaLog\7_5_MemLeaks.eof || GOTO error
		) ELSE (
			%Eurekalog% --el_nostats --el_alter_exe=.\%Module%\%Module%.dproj;.\%Module%\%OptConfig%\%OptPlatform%\%Module%.exe --el_config=.\%Module%\%Module%.eof || GOTO error
		)
	)
	rem post compilation avec AsPack (compression des executables)
	IF /i "%OptAspack%"=="yes" IF EXIST %Aspack% (
		REM ASPack supports the following options:
		REM Command Line Options
		REM /H  Show the help message
		REM /O  Original file is not modified. Output file is saved to output.exe (use /Ooutput.EXE). Wildcards should not be used for this option to work correctly.
		REM /R- The resource section is not compressed
		REM /R+ The resource section is compressed                 
		REM /B+ Make a backup copy (.BAK file)
		REM /B- Do not make a backup copy (.BAK file)
		REM /E+ Preserve extra data at the end of file
		REM /E- Do not preserve extra data at the end of file                
		REM /D+ Use Windows imports DLL loader
		REM /D- Do not use Windows imports DLL loader
		REM /S  Display neither ASPack window nor any messages; exit when done (Stealth mode) 
		REM /M  Use maximum compression
		REM /U  Compress files in sub-directories
		REM /X  Export compression
		echo #### Aspack
		%Aspack% .\%Module%\%OptConfig%\%OptPlatform%\%Module%.exe /R+ /D+ /B+ /S || GOTO error
	)
	
	call :cleanup
	exit /b 0

:error
	echo #### Exit with ERRORLEVEL %ERRORLEVEL%
	Exit /b %ERRORLEVEL% 

:end
	exit /b 0

:cleanup
	REM The cleanup function is only really necessary if you
	REM are _not_ using SETLOCAL.
	set "__NAME="
	set "__VERSION="
	set "__YEAR="

	set "__BAT_FILE="
	set "__BAT_PATH="
	set "__BAT_NAME="

	set "Module="
	set "OptConfig="
	set "OptPlatform="

	set "Eurekalog="

	set "OptAspack="
	set "Aspack="