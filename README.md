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
   
# USAGE:

> .\AutoBuild.bat [flags] "AppName"
>
>/?, --help              shows this help
>
>/v, --version           shows the version
>
>/a, --aspack            Compress Module with Aspack
>
>--config=Config         Choose configuration (Release, Debug, ...)
>
>--platform=Platform     Choose platform (Win32, Win64, ...)
>

> #### Examples : 
>.\AutoBuild.bat --config=Debug --platform=Win64 TestApp1
>
>.\AutoBuild.bat --config=Debug --platform=Win32 TestApp1