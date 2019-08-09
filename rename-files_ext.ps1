# 08 2019 GENZO
#script pour renommer les extensions des  fichiers dans un repertoire et les deposer dans le dossier
# adapter les valeur des variables à votre environnement et vos besoins

#déclaration des variables
$pathsource = "c:\temp\rename_source"
$pathdestination = "C:\Temp\rename_dest"
$extin = ".tmp"
$extout = ".txt"
$datelog= Get-Date -format "dd MM yyyy HH:mm:ss"
$datej= Get-Date -format "yyyyMMdd"

#info
write-warning "recherche des fichiers dans $pathsource avec extension $extin"

#on ne recherche que les fichiers du jours
$files = Get-ChildItem $pathsource | where {($_.LastWriteTime -gt $datej)}
write-warning "total de " $files.Count "fichiers trouvés"

#copie des fichiers
foreach($occ in $files)
{
move-item -path "$pathsource\$occ" -Destination "$pathdestination\$occ"
}

#fichier déplacé maintenant on change extension
<#gci -path $pathdestination  -recurse | ForEach-Object { 
    Replace-TextInFile -FilePath $pathdestination -Pattern $extin -Replacement $extout 
}#>
Get-ChildItem $pathdestination -filter $extin | %{

    $file = $_.FullName.Replace($extin,$extout)
    out-file $file
    }

Get-ChildItem $pathETQ -filter '*.failed' | remove-item

write-warning "deplacement et renommage OK pour"
#fin