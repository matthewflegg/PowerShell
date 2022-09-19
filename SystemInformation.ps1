function Get-AsciiArt {
    return @(
        "                            .oodMMMM`n"
        "                  .oodMMMMMMMMMMMMM`n"
        "      ..oodMMM  MMMMMMMMMMMMMMMMMMM`n"
        "oodMMMMMMMMMMM  MMMMMMMMMMMMMMMMMMM`n"
        "MMMMMMMMMMMMMM  MMMMMMMMMMMMMMMMMMM`n"
        "MMMMMMMMMMMMMM  MMMMMMMMMMMMMMMMMMM`n"
        "MMMMMMMMMMMMMM  MMMMMMMMMMMMMMMMMMM`n"
        "MMMMMMMMMMMMMM  MMMMMMMMMMMMMMMMMMM`n"
        "MMMMMMMMMMMMMM  MMMMMMMMMMMMMMMMMMM`n"
        "`n"
        "MMMMMMMMMMMMMM  MMMMMMMMMMMMMMMMMMM`n"
        "MMMMMMMMMMMMMM  MMMMMMMMMMMMMMMMMMM`n"
        "MMMMMMMMMMMMMM  MMMMMMMMMMMMMMMMMMM`n"
        "MMMMMMMMMMMMMM  MMMMMMMMMMMMMMMMMMM`n"
        "MMMMMMMMMMMMMM  MMMMMMMMMMMMMMMMMMM`n"
        "``^^^^^^MMMMMMM  MMMMMMMMMMMMMMMMMMM`n"
        "      ````````^^^^  ^^MMMMMMMMMMMMMMMMM`n"
        "                     ````````^^^^^^MMMM`n"
    )
}

function Get-ProcessorInfo {
    $Cpu = Get-CimInstance Win32_Processor
    $CpuName = ($Cpu.Name).Trim()
    $CpuLogicalProcessorCount = $Cpu.NumberOfLogicalProcessors
    $CpuMaxClockSpeedGhz = "$($Cpu.MaxClockSpeed / 1000)0GHz"

    return "$CpuName ($CpuLogicalProcessorCount) @ $CpuMaxClockSpeedGhz"
}

function Get-GpuName {
    (Get-WmiObject Win32_VideoController).Description
}

function Get-PhysicalMemory {
    (Get-WmiObject -class "cim_physicalmemory" | Measure-Object -Property Capacity -Sum).Sum / 1024 / 1024
}

function Get-OsName {
    (Get-CimInstance Win32_OperatingSystem).Caption
}

function Write-SystemInfo {
    Write-Host "`n$(Get-AsciiArt)" -ForegroundColor Cyan
    Write-Host "SYSTEM INFORMATION"
    Write-Host "------------------`n"

    Write-Host @(
        "    CPU:       $(Get-ProcessorInfo)`n"
        "   GPU:       $(Get-GpuName)`n"
        "   Memory:    $(Get-PhysicalMemory)MB`n"
        "   OS:        $(Get-OsName)`n"      
    )
}

Write-SystemInfo