Install-PackageProvider -Chocolatey
Install-PackageProvider -name ChocolateyGet -force -verbose

Install-Package -provider ChocolateyGet -name GoogleChrome -force -forcebootstrap -verbose
Install-Package -provider ChocolateyGet -name javaruntime -force -forcebootstrap -verbose 
Install-Package -provider ChocolateyGet -name 7zip -force -forcebootstrap -verbose
Install-Package -provider ChocolateyGet -name dotnet-5.0-sdk -force -forcebootstrap -verbose 
Install-Package -provider ChocolateyGet -name python -force -forcebootstrap -verbose 



