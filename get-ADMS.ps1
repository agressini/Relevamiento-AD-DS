$Exportpath = "$env:USERPROFILE\desktop\Localadmins.csv"
$OU="OU=Member Server,DC=labvmw,DC=local"
$Computers = Get-ADComputer -SearchBase $OU -Filter *

$Computers | ForEach-Object {

    Invoke-Command {
        
        Get-LocalGroupMember -Group "Administrators"
                
    } -computer $Computers.Name |  Select-Object * -ExcludeProperty RunspaceID | Export-CSV $Exportpath -NoTypeInformation -Append
    
}