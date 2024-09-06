#Copying ACL from folder
$Acl = Get-Acl -Path C:\folder\
#Paste ACL to folder
Get-ChildItem -Path C:\Folder\ -Recurse | Set-Acl $Acl