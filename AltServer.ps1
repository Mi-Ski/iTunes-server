
Start-Process -FilePath "C:\Program Files (x86)\AltServer\AltServer.exe"
Start-Process -FilePath "iTunes.exe"

$Response = Read-Host -Prompt 'Kill AltServer & iTunes? y/n'
if ($Response -eq 'y') {
	$AsProcessId = Get-Process -Name AltServer | Select-Object -ExpandProperty Id
	taskkill /pid $AsProcessId /f
	Write-Host "Exiting AltServer"

	$ITunesProcessId = Get-Process -Name iTunes | Select-Object -ExpandProperty Id
	taskkill /pid $ITunesProcessId /f
	Write-Host "Exiting iTunes"
}
else {
	exit
}
