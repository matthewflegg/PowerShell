[CmdletBinding()]
param (
    # The drive to enable system restore on if not already enabled
    # Defaults to C:\
    [Parameter(Mandatory = $false)]
    [ValidatePattern("[C-Z]+")]
    [char] $DriveLetter = "C",

    # The system restore point type
    # Defaults to APPLICATION_INSTALL
    [Parameter(Mandatory = $false)]
    [ValidateSet("APPLICATION_INSTALL",
                 "APPLICATION_UNINSTALL",
                 "DEVICE_DRIVER_INSTALL",
                 "MODIFY_SETTINGS",
                 "CANCELLED_OPERATION")]
    [string] $RestorePointType = "APPLICATION_INSTALL",

    # The restore point's description
    [Parameter(Mandatory = $false)]
    [string] $Description = "No Description Given"
)

Enable-ComputerRestore -Drive "$($DriveLetter):\"

Checkpoint-Computer -Description $Description `
                    -RestorePointType $RestorePointType