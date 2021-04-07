#Create script that will gather system information about host (CPU, RAM, Disks sizes, MAC Addresses, Name, Serial Number)
Param(
[parameter(Mandatory=$false)]
[ValidateRange(0, 5)]
[int] $numer_komponentu)

$komponenty = @($CPU,$RAM,$HDD,$MAC,$Name,$NumerSeryjny)
$etykiety = @('Procesor: ','Ilosc RAMu: ','Dysk: ','MAC: ','Nazwa: ','Numer seryjny: ')

$CPU = Get-WmiObject Win32_Processor | Select -ExpandProperty Name | Out-String
$HDD = Get-Disk | Select -ExpandProperty FriendlyName | Out-String
$RAM = (systeminfo | Select-String 'Total Physical Memory:').ToString().Split(':')[1].Trim()
$MAC = get-netadapter | Select -ExcludeProperty MacAddres, Name | Select Name, MacAddress, Status | Out-String
$Name = hostname
$NumerSeryjny = (Get-WmiObject win32_bios | select Serialnumber).Serialnumber


 if ($PSBoundParameters.ContainsKey('numer_komponentu'))

            { Write-host $etykiety[$numer_komponentu] $komponenty[$numer_komponentu]}
        
    else
        {
             write-host 'Procesor: ' $CPU
             write-host 'Ilosc RAMu: ' $RAM
             write-host 'Dysk: ' $HDD 
             write-host 'MAC: ' $MAC
             write-host 'Nazwa: ' $Name
             write-host 'Numer seryjny: ' $NumerSeryjny
        }
  