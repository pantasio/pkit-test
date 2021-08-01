
# checkfile exists
Write-Host 'INFO: Checking 002-Obsidian\bin\file-tree.txt' -ForegroundColor Cyan
if (-not(Test-Path -Path "./002-Obsidian/bin/file-tree.txt"))
{
	if (-not(Test-Path -Path "./002-Obsidian/bin"))
	{
		[void](New-Item -Path "./" -Name 002-Obsidian/bin -ItemType Directory -Force)
        Write-Host 'INFO: Created 002-Obsidian\bin directory' -ForegroundColor Cyan
	}
	New-Item -Path "./" -Name 002-Obsidian/bin/file-tree.txt -ItemType "file" -Force
    Write-Host 'INFO: Generated  <yourprofile>/.ssh/id_rsa file' -ForegroundColor Cyan
} 
else 
{
    Write-Host 'INFO: 002-Obsidian/bin/file-tree.txt already exist, skipping...' -ForegroundColor Cyan
}

$PathFileTree = Get-Location
$PathFileTree = "$PathFileTree\002-Obsidian\bin\file-tree.txt"

echo $PathFileTree
git ls-tree -r main --name-only | Out-File -FilePath $PathFileTree