Set-PSReadlineOption -EditMode vi
Set-PSReadLineKeyHandler -Key Ctrl+n -Function NextHistory
Set-PSReadLineKeyHandler -Key Ctrl+p -Function PreviousHistory
Set-PSReadLineKeyHandler -Key Ctrl+n -Function NextHistory -ViMode Command
Set-PSReadLineKeyHandler -Key Ctrl+p -Function PreviousHistory -ViMode Command
