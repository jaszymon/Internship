Param ([string]$Nazwa_aplikacji1, [string]$Nazwa_aplikacji2, [string]$Nazwa_aplikacji3,[string]$Nazwa_aplikacji4,[string]$Nazwa_aplikacji5)

Install-PackageProvider -Chocolatey
Install-PackageProvider -name ChocolateyGet -force -verbose

Install-Package -provider ChocolateyGet -name $Nazwa_aplikacji1 -force -forcebootstrap -verbose
Install-Package -provider ChocolateyGet -name $Nazwa_aplikacji2 -force -forcebootstrap -verbose 
Install-Package -provider ChocolateyGet -name $Nazwa_aplikacji3 -force -forcebootstrap -verbose
Install-Package -provider ChocolateyGet -name $Nazwa_aplikacji4 -force -forcebootstrap -verbose 
Install-Package -provider ChocolateyGet -name $Nazwa_aplikacji5 -force -forcebootstrap -verbose 



