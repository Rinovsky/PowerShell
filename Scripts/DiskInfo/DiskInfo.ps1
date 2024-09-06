Get-PSDrive -PSProvider filesystem | where-object {$_.used -gt 0} |
Select-Object -property Root,
@{name="Size";expression={($_.used+$_.free)/1GB -as [int]}},
@{name="Used";expression={($_.used/1GB) -as [int]}},
@{name="Free";expression={($_.free/1GB) -as [int]}} 