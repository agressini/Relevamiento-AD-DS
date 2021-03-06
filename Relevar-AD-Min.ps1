﻿#Listar DCs
get-ADDomainController -filter * |out-file DCs.txt

#Obtener info del forest
get-ADForest |out-file Forest.txt

#Obtener info del dominio
get-ADDomain |out-file Domain.txt

#Contar usuarios
Get-ADUser -Filter * | Measure-Object | out-file Cantidad_user.txt

#Version schema
Get-ADObject (Get-ADRootDSE).schemaNamingContext -Property objectVersion |out-file Schema_version.txt

#Version de Exchange
get-exchangeserver | select name,admindisplayversion |out-file Ex_version.txt

#Obtener version del sistema operativo
[environment]::OSVersion.version | out-file OS_version.txt
[environment]::OSVersion.Platform | out-file OS_version.txt -Append
[environment]::OSVersion.VersionString out-file OS_version.txt -Append
Get-WmiObject Win32_OperatingSystem | Format-Table caption,OSArchitecture,ServicePackMajorVersion |out-file OS_version.txt -Append

#obtener modulos instalados
Get-Module | out-file Modules.txt

#obtener los FSMO
Get-FSMORoleOwner  | out-file FSMO_Owner.txt

#obtener Fsmo 
netdom query fsmo > FSMO_Owner_old.txt
