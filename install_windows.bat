@ECHO OFF
SET mypath=%~dp0
echo "my path is %mypath%"


mklink /D "%LocalAppData%\nvim" "%mypath%\nvim"
mklink "%HOMEPATH%\.gitconfig" "%mypath%\git\.gitconfig"
CALL :CreateShortcut "%userprofile%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\hhkb.ahk" "%mypath%\autohotkey\hhkb.ahk"
pause
EXIT /B


:CreateShortcut
	echo The value of parameter 1 is %~1
	echo The value of parameter 2 is %~2
	echo Set oWS = WScript.CreateObject("WScript.Shell") > CreateShortcut.vbs
	echo sLinkFile = "%~1.lnk" >> CreateShortcut.vbs
	echo Set oLink = oWS.CreateShortcut(sLinkFile) >> CreateShortcut.vbs
	echo oLink.TargetPath = "%~2" >> CreateShortcut.vbs
	echo oLink.WorkingDirectory = "%~2\.." >> CreateShortcut.vbs
	echo oLink.Save >> CreateShortcut.vbs
	cscript CreateShortcut.vbs
	del CreateShortcut.vbs
	EXIT /B


 