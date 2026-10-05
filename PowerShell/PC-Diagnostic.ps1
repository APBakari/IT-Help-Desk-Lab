$ReportFolder = "C:\IT-Lab\PowerShell\Reports"

New-Item -ItemType Directory -Path $ReportFolder -Force | Out-Null

$Timestamp = Get-Date -Format "yyyy-MM-dd_HHmmss"
$ReportPath = Join-Path $ReportFolder "$env:COMPUTERNAME-Diagnostic-$Timestamp.txt"

Start-Transcript -Path $ReportPath -Force

Write-Host "===== PC Diagnostic Report ====="

Write-Host "`nComputer Name:"
Write-Host $env:COMPUTERNAME

Write-Host "`nLogged In User:"
(Get-CimInstance Win32_ComputerSystem).UserName

Write-Host "`nWindows Information:"
Get-CimInstance Win32_OperatingSystem |
    Select-Object Caption, Version, BuildNumber, OSArchitecture |
    Format-Table -AutoSize |
    Out-Host

Write-Host "`nIPv4 Configuration:"
Get-NetIPAddress -AddressFamily IPv4 |
    Where-Object {
        $_.IPAddress -notlike "127.*" -and
        $_.IPAddress -notlike "169.254.*"
    } |
    Select-Object InterfaceAlias, IPAddress, PrefixLength |
    Format-Table -AutoSize |
    Out-Host

Write-Host "`nDNS Servers:"
Get-DnsClientServerAddress -AddressFamily IPv4 |
    Where-Object {$_.ServerAddresses.Count -gt 0} |
    Select-Object InterfaceAlias, ServerAddresses |
    Format-Table -AutoSize |
    Out-Host

Write-Host "`nNetwork Adapters:"
Get-NetAdapter |
    Select-Object Name, Status, LinkSpeed |
    Format-Table -AutoSize |
    Out-Host

Write-Host "`nDisk Space:"
Get-Volume |
    Where-Object {$_.DriveLetter} |
    Select-Object DriveLetter, FileSystemLabel,
        @{Name="FreeGB";Expression={[math]::Round($_.SizeRemaining / 1GB,2)}},
        @{Name="TotalGB";Expression={[math]::Round($_.Size / 1GB,2)}} |
    Format-Table -AutoSize |
    Out-Host

Write-Host "`nInstalled RAM:"
Get-CimInstance Win32_ComputerSystem |
    Select-Object @{Name="RAM_GB";Expression={[math]::Round($_.TotalPhysicalMemory / 1GB,2)}} |
    Format-Table -AutoSize |
    Out-Host

Write-Host "`nDomain Information:"
Get-CimInstance Win32_ComputerSystem |
    Select-Object Domain, PartOfDomain |
    Format-Table -AutoSize |
    Out-Host

Write-Host "`n===== Diagnostic Complete ====="

Stop-Transcript

Write-Host "`nReport saved to:"
Write-Host $ReportPath
