Esc::`
`::Esc

~LControl Up:: {
	If (A_PriorKey = "LControl")
		Send "{esc}"
}

LWin & Tab::AltTab

#HotIf WinActive("ahk_exe chrome.exe")
^w:: {
    Send "^{BS}"
}
#HotIf
