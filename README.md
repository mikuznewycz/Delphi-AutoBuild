# DelphiAutoBuild
Simple file to build delphi project with CI/CD systems or build without open the IDE.


# Init 

1 - Set the rsvars variable with the path of your version of Delphi
   
   For Delphi 10.4 
> set rsvars="C:\Program Files (x86)\Embarcadero\Studio\21.0\bin\rsvars.bat"
   
2 - if you are using Eurekalog, you can set "eurekalog" path 

> set Eurekalog="C:\Program Files (x86)\Neos Eureka S.r.l\EurekaLog 7\Packages\Studio23\ecc32.exe" 	


3 - if you are using Aspack to compress executables, you can set "aspack" path

> set Aspack="C:\Program Files (x86)\Aspack\Aspack.exe"
   
# Usage 

.\AutoBuild.bat [flags] "AppName"

- /?, --help              shows this help
- /v, --version           shows the version
- /a, --aspack            Compress Module with Aspack
- --config=Config         Choose configuration (Release, Debug, ...)
- --platform=Platform     Choose platform (Win32, Win64, ...)


# Examples 

.\AutoBuild.bat --config=Debug --platform=Win32 TestApp1

![this image will not be displayed](img/BuildWin32.png)

.\AutoBuild.bat --config=Debug --platform=Win64 TestApp1

![this image will not be displayed](img/BuildWin64.png)


# Links  

[Delphi](https://www.embarcadero.com/fr/products/delphi/ "Eurekalog Home Page")

[Eurekalog](https://www.eurekalog.com/ "Eurekalog Home Page")

[Aspack Win32 EXE file packing](http://www.aspack.com/aspack.html/ "Aspack Home Page")

[Jenkins](https://www.jenkins.io/ "Jenkins Home Page")

[![IMAGE ALT TEXT HERE](https://img.youtube.com/vi/_MXtbjwsz3A/0.jpg)](https://www.youtube.com/watch?v=_MXtbjwsz3A&t=6s)
