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

> .\AutoBuild.bat [flags] "AppName"

# Options

Afficher l'aide
> /?, --help                    

Afficher la version
> /v, --version                 

Utilser Aspack pour compresser l'executable
> /a, --aspack                  

Choisir la configuration (Release, Debug, ...)
> --config=Config                 

Choisir la plate-forme (Win32, Win64, ...)
> --platform=Platform             


# Exemples 

Pour compiler notre application test en Debug / Win32
> .\AutoBuild.bat --config=Debug --platform=Win32 TestApp1

![cette image ne sera pas affichée](img/BuildWin32.png)

Pour compiler notre application test en Release / Win64
> .\AutoBuild.bat --config=Release --platform=Win64 TestApp1

![cette image ne sera pas affichée](img/BuildWin64.png)


# Liens  

[link](url?target=_blank)

[Delphi](https://www.embarcadero.com/fr/products/delphi/ "Page d'accueil d'Eurekalog"){:target="_blank"}

[Eurekalog](https://www.eurekalog.com/ "Page d'accueil d'Eurekalog"){:target="_blank"}

[Aspack Win32 EXE file packing](http://www.aspack.com/aspack.html/ "Aspack Home Page"){:target="_blank"}

[Jenkins](https://www.jenkins.io/ "Page d'accueil de Jenkins"){:target="_blank"}