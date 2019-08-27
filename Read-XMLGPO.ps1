param (
    [string]$File = ""  
)
write-host "`nParsing file $File`n"
$data = @()

[xml]$XmlDocument = Get-Content -Path $File

$aux = $XmlDocument.report.GPO

foreach ($xml in $aux)
{
    
    foreach ($i in $xml.LinksTo)
    {
        $data += [PSCustomObject] @{
        Name= $xml.Name
        OU= $i.SOMName
        Path= $i.SOMPath
        Enabled= $i.Enabled}  
    }
    

}
 
$data | Out-GridView
$data | export-csv -path .\GPO_links.csv -Delimiter ";" -NoTypeInformation

write-host "`nEnd parsing`n"