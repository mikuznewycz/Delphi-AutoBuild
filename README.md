# DelphiAutoBuild
Simple bat file to build a delphi project with CI/CD systems or build without opening the IDE.

# Init 

1 - Set the variable rsvars with the path of your Delphi version.
   
   For Delphi 10.4 
> set rsvars="C:\Program Files (x86)\Embarcadero\Studio\21.0\bin\rsvars.bat"
   
2 - if you use Eurekalog, you can set the path "eurekalog" in the batch file.

> set Eurekalog="C:\Program Files (x86)\Neos Eureka S.r.l\EurekaLog 7\Packages\Studio23\ecc32.exe" 	


3 - If you use Aspack to compress the executables, you can set the path "aspack" in the batch file.

> set Aspack="C:\Program Files (x86)\Aspack\Aspack.exe"
   
# How to use it

.\AutoBuild.bat [flags] "AppName" (name of the application)

- / ?, --help displays this help
- /v, --version displays the version
- /a, --aspack Compress the module with Aspack.
--config=Config Choose the configuration (Release, Debug, ...)
--platform=Platform Choose the platform (Win32, Win64, ...)


# Examples 

.\AutoBuild.bat --config=Debug --platform=Win32 TestApp1

![this image will not be displayed](img/BuildWin32.png)

.\AutoBuild.bat --config=Debug --platform=Win64 TestApp1

![this image will not be displayed](img/BuildWin64.png)


# Links  

[Delphi](https://www.embarcadero.com/fr/products/delphi/ "Eurekalog home page")

[Eurekalog](https://www.eurekalog.com/ "Eurekalog home page")

[Aspack Win32 EXE file packing](http://www.aspack.com/aspack.html/ "Aspack Home Page")

[Jenkins](https://www.jenkins.io/ "Jenkins Home Page")