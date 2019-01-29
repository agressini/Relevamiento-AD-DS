## RELEVAMIENTO AD DS ##
#Relevamiento de sites
get-ADReplicationSite -filter * |export-csv ADsites.csv -NoTypeInformation
get-ADReplicationSite -filter * |out-file ADsites.txt

#Relevamiento de site-links
get-ADReplicationSiteLink -filter * |export-csv ADsitelinks.csv -NoTypeInformation
get-ADReplicationSiteLink -filter * |out-file ADsitelinks.txt

#Relevamiento de subnets
get-ADReplicationSubnet -filter * |export-csv ADSubnets.csv -NoTypeInformation
get-ADReplicationSubnet -filter * |out-file ADSubnets.txt

#Relevamiento de OUs
get-ADOrganizationalUnit -filter * |export-csv ADOUs.csv -NoTypeInformation
get-ADOrganizationalUnit -filter * |out-file ADOUs.txt

#Listar DCs
get-ADDomainController -filter * |out-file DCs.txt

#Obtener info del forest
get-ADForest |out-file Forest.txt

#Obtener info del dominio
get-ADDomain |out-file Domain.txt

#Listar DCs
get-ADDomainController |out-file DCs.txt

#Identificar cortes de herencia de GPOs
get-ADOrganizationalUnit -filter * |foreach-object {Get-GPInheritance -Target $PSItem} |out-file Herencias.txt

#Obtener reportes de GPOs
get-GpoReport -All -ReportType HTML -Path C:\Relevamiento\GPOs.html
get-GpoReport -All -ReportType XML -Path C:\Relevamiento\GPOs.xml



