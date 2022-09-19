<#
.SYNOPSIS
	Sets the working directory to the Documents folder.
.NOTES
	Author: Matthew Flegg | License: GPL V3
#>

try {
    if ($IsLinux) {
        Write-Host "❌ Unsupported Operating System"
        Exit -1
    }

    $Path = [Environment]::GetFolderPath('MyDocuments')
    Set-Location "$Path"
    Exit 0
}

catch {
	"⚠️ Error in line $($_.InvocationInfo.ScriptLineNumber): $($Error[0])"
	Exit -2
}