# Delphi-AutoBuild
Fichier bat simple pour construire un projet delphi avec les systèmes CI/CD ou construire sans ouvrir l'IDE.

# Init 

1 - Définissez la variable rsvars avec le chemin de votre version de Delphi.
   
   Pour Delphi 10.4 
> set rsvars="C:\Program Files (x86)\Embarcadero\Studio\21.0\bin\rsvars.bat"
   
2 - si vous utilisez Eurekalog, vous pouvez définir le chemin "eurekalog" dans le fichier batch.

> set Eurekalog="C:\Program Files (x86)\Neos Eureka S.r.l\EurekaLog 7\Packages\Studio23\ecc32.exe" 	


3 - Si vous utilisez Aspack pour compresser les exécutables, vous pouvez définir le chemin "aspack" dans le fichier batch.

> set Aspack="C:\Program Files (x86)\Aspack\Aspack.exe"
   
# Comment l'utiliser

.\AutoBuild.bat [flags] "AppName" (nom de l'application)

- /?, --help                    Afficher l'aide
- /v, --version                 Afficher la version
- /a, --aspack                  Utilser Aspack pour compresser l'executable
--config=Config                 Choisir la configuration (Release, Debug, ...)
--platform=Platform             Choisir la plate-forme (Win32, Win64, ...)


# Exemples 

.\AutoBuild.bat --config=Debug --platform=Win32 TestApp1

![cette image ne sera pas affichée](img/BuildWin32.png)

.\AutoBuild.bat --config=Debug --platform=Win64 TestApp1

![cette image ne sera pas affichée](img/BuildWin64.png)


# Liens  

[Delphi](https://www.embarcadero.com/fr/products/delphi/ "Page d'accueil d'Eurekalog")

[Eurekalog](https://www.eurekalog.com/ "Page d'accueil d'Eurekalog")

[Aspack Win32 EXE file packing](http://www.aspack.com/aspack.html/ "Aspack Home Page")

[Jenkins](https://www.jenkins.io/ "Page d'accueil de Jenkins")