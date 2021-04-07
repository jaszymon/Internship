#Create script that will gather system information about host (CPU, RAM, Disks sizes, MAC Addresses, Name, Serial Number)



$CPU = Get-WmiObject Win32_Processor | Select -ExpandProperty Name | Out-String
$HDD = Get-Disk | Select -ExpandProperty FriendlyName | Out-String
$RAM = (systeminfo | Select-String 'Total Physical Memory:').ToString().Split(':')[1].Trim()
$MAC = get-netadapter | Select -ExcludeProperty MacAddres, Name | Select Name, MacAddress, Status | Out-String
$Name = hostname
$NumerSeryjny = (Get-WmiObject win32_bios | select Serialnumber).Serialnumber
write-host 'Procesor: ' $CPU
write-host 'Ilosc RAMu: ' $RAM
write-host 'Dysk: ' $HDD 
write-host 'MAC: ' $MAC
write-host "Nazwa: " $Name
write-host "Numer seryjny: " $NumerSeryjny