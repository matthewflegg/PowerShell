[CmdletBinding()]
param (
    [Parameter(Mandatory = $false)]
    [ValidatePattern("[C-Z]+")]
    [char] $DriveLetter = "C",

    [Parameter(Mandatory = $false)]
    [ValidateSet("APPLICATION_INSTALL",
                 "APPLICATION_UNINSTALL",
                 "DEVICE_DRIVER_INSTALL",
                 "MODIFY_SETTINGS",
                 "CANCELLED_OPERATION")]
    [string] $RestorePointType = "APPLICATION_INSTALL",

    [Parameter(Mandatory = $false)]
    [string] $Description = "No Description Given"
)

Enable-ComputerRestore -Drive "$($DriveLetter):\"

Checkpoint-Computer -Description $Description `
                    -RestorePointType $RestorePointType