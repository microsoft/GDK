[CmdletBinding()]
param
(
    [Parameter(Mandatory = $false)]
    [string]
    $AppxPath,

    [Parameter(Mandatory = $false)]
    [string]
    $AppxDepDirPath
)

$Error.Clear();

if (-not $AppxPath) {
    $AppxPath = Join-Path $PSScriptRoot "GamingServices.appxbundle";
}

if (-not (test-path $AppxPath)) {
    Write-Output "ERROR: Appx not found: $AppxPath";
    exit 1;
}
   
if (-not $AppxDepDirPath) {
    $AppxDepDirPath = (get-item $AppxPath).Directory.FullName;
}

$systemVolume = Get-AppxVolume | Where-Object -Property IsSystemVolume -eq $True | Select-Object -First 1;

if (-not $systemVolume) {
    Write-Output "ERROR: System volume not found.";
    exit 1;
}

Write-Output ("System volume found.`n{0}" -f ($systemVolume | Format-List | Out-String).trim());

$systemRoot = [System.IO.path]::GetPathRoot($systemVolume.PackageStorePath);

if (-not $systemRoot) {
    Write-Output "ERROR: System root not found.";
    exit 1;
}

Write-Output "System root found: $systemRoot";

$package = Get-AppxPackage -Name Microsoft.GamingServices* | Sort-Object -Property Version -Descending | Select-Object -First 1;
$isOldPackagePresent = $false;

if ($package) {
    Write-Output ("Version {0} of {1} was found already installed on the PC.`n{2}" -f $package.Version, $package.Name, ($package | Format-List | Out-String).trim());

    $isOldPackagePresent = (([Version]$package.Version -lt [Version]'10.75.2001.0') -or ([Version]$package.Version -eq [Version]'1.43.2002.0'));

    if ($isOldPackagePresent) {
        Write-Output "Uninstalling $($package.PackageFullName) version $($package.Version)";
        remove-appxpackage -allusers $package.PackageFullName -ErrorAction Continue;

        if ($Error) {
            Write-Output "Remove-AppxPackage failed for $($package.PackageFullName)";
        }
        else {
            Write-Output "Remove-AppxPackage completed for $AppxPath";
        }
    }
}
else {
    Write-Output 'No versions of Microsoft.GamingServices were found installed on the PC.';
}

if (($package -eq $null) -or $isOldPackagePresent) {
    Write-Output "Installing $AppxPath Version 10.75.2001.0 Volume $systemRoot";

    $allDepsFound = $TRUE;
    [string[]]$depPackageNames = 'Microsoft.NET.Native.Runtime.2.2', 'Microsoft.NET.Native.Framework.2.2', 'Microsoft.VCLibs.x64.14.00';
    $dependencyPaths = $depPackageNames | ForEach-Object { Join-Path -Path $AppxDepDirPath -ChildPath "$_.appx" };
    ForEach ($dep in $dependencyPaths) { if (-not (test-path $dep)) { $allDepsFound = $FALSE; } };

    if ($allDepsFound) {
        Write-Output "Installing $AppxPath Version 10.75.2001.0 Volume $systemRoot -DependencyPath $dependencyPaths";
        add-appxpackage -forceApplicationShutdown -path $AppxPath -Volume $systemRoot -DependencyPath $dependencyPaths -ErrorAction Continue;
    }
    else {
        Write-Output "Installing $AppxPath Version 10.75.2001.0 Volume $systemRoot";
        add-appxpackage -forceApplicationShutdown -path $AppxPath -Volume $systemRoot -ErrorAction Continue;
    }

    if ($Error) {
        Write-Output "ERROR: Add-AppxPackage failed for $AppxPath";
        $guid = ($error -split ' ' | select -Last 1) -as [Guid];
        if ($guid) {
            Write-Output "Get-AppPackageLog -ActivityID $guid";
            Get-AppPackageLog -ActivityID $guid;
        }
    }
    else {
        Write-Output "Add-AppxPackage completed for $AppxPath";
    }
}
else {
    Write-Output "No installation needed as version $($package.Version) of $($package.Name) was found already installed on the PC.";
}

exit ($Error.Count);

# SIG # Begin signature block
# MIIl3gYJKoZIhvcNAQcCoIIlzzCCJcsCAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCCbKwhhvv3UqGyS
# jVhM++9cIx3VwL8WUE8GNo5oSJsCRaCCC2cwggTvMIID16ADAgECAhMzAAAFACfW
# Mm9Dc3uHAAAAAAUAMA0GCSqGSIb3DQEBCwUAMH4xCzAJBgNVBAYTAlVTMRMwEQYD
# VQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNy
# b3NvZnQgQ29ycG9yYXRpb24xKDAmBgNVBAMTH01pY3Jvc29mdCBDb2RlIFNpZ25p
# bmcgUENBIDIwMTAwHhcNMjMwMjE2MjAxMTExWhcNMjQwMTMxMjAxMTExWjB0MQsw
# CQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9u
# ZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMR4wHAYDVQQDExVNaWNy
# b3NvZnQgQ29ycG9yYXRpb24wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIB
# AQDFkbktTPAJwujWqeAF9Ei9qjEcHHhgDOcCGXKPZFsect6P72/fGD6iv9vq96xQ
# LkSI0PhfXnBwBGLUltZwi5PJaA7IFyaQPjLb5TB9EG0R78McIuMgyRweI3jDce54
# WPOaJCFdfi3hBvH/AoW7tQH0Ua+2QycxbHZgg8/EplcBaLWM/PrXIT3N0ZmDbSCW
# x/mZu/zJEDTS7Z37Sc5avkBdObK4H1XVNLh74iop34yBziFNXhQ8fR2usy6B2uf3
# jckPogHwykdvh0PibY8Lgq55IltjvV9KlHd6QHxeRJ6M0EZKgIUfcAF0w5XWFJZz
# eOHWB6E5NmdyU5sE6nQuGpGhAgMBAAGjggFuMIIBajAfBgNVHSUEGDAWBgorBgEE
# AYI3PQYBBggrBgEFBQcDAzAdBgNVHQ4EFgQUnQrZdzAcYTWhzLarYgjDOio1KSMw
# RQYDVR0RBD4wPKQ6MDgxHjAcBgNVBAsTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEW
# MBQGA1UEBRMNMjMwODY1KzUwMDIzMTAfBgNVHSMEGDAWgBTm/F97uyIAWORyTrX0
# IXQjMubvrDBWBgNVHR8ETzBNMEugSaBHhkVodHRwOi8vY3JsLm1pY3Jvc29mdC5j
# b20vcGtpL2NybC9wcm9kdWN0cy9NaWNDb2RTaWdQQ0FfMjAxMC0wNy0wNi5jcmww
# WgYIKwYBBQUHAQEETjBMMEoGCCsGAQUFBzAChj5odHRwOi8vd3d3Lm1pY3Jvc29m
# dC5jb20vcGtpL2NlcnRzL01pY0NvZFNpZ1BDQV8yMDEwLTA3LTA2LmNydDAMBgNV
# HRMBAf8EAjAAMA0GCSqGSIb3DQEBCwUAA4IBAQDh0kPUjUYtzlPEvMoFNXHo4aX5
# RPpdZ4rbyrU3Ur4LK4hXLXoMinXxgSnSxusJylXdemovg38RlxiZlgYYc0Yc7Ygd
# BWRl9zmeA+rgQ0srfR6F1ztgobrYxtHOjoThiWvBeLmZOjUVtrmvJgGu2ehfFeD2
# rmDz9CgLOkw2eG492vJ0poAFRIRZ8BtpgCDwzZgmuhAp7hKowwRyMk/pEROCtA04
# RLMShlIkT4NJBDE2OVD5TP0/DzNr3I8jEGBVzqb/QAlJf1MMBStHzYxTQ/UeH9PL
# /gr2iyLUER3m48izBli14+xyviBVC7cCKXAAv17c8+QR3NKfL5x5Ajo18YdFMIIG
# cDCCBFigAwIBAgIKYQxSTAAAAAAAAzANBgkqhkiG9w0BAQsFADCBiDELMAkGA1UE
# BhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1vbmQxHjAc
# BgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEyMDAGA1UEAxMpTWljcm9zb2Z0
# IFJvb3QgQ2VydGlmaWNhdGUgQXV0aG9yaXR5IDIwMTAwHhcNMTAwNzA2MjA0MDE3
# WhcNMjUwNzA2MjA1MDE3WjB+MQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGlu
# Z3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBv
# cmF0aW9uMSgwJgYDVQQDEx9NaWNyb3NvZnQgQ29kZSBTaWduaW5nIFBDQSAyMDEw
# MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA6Q5kUHlntcTj/QkATJ6U
# rPdWaOpE2M/FWE+ppXZ8bUW60zmStKQe+fllguQX0o/9RJwI6GWTzixVhL99COMu
# K6hBKxi3oktuSUxrFQfe0dLCiR5xlM21f0u0rwjYzIjWaxeUOpPOJj/s5v40mFfV
# HV1J9rIqLtWFu1k/+JC0K4N0yiuzO0bj8EZJwRdmVMkcvR3EVWJXcvhnuSUgNN5d
# pqWVXqsogM3Vsp7lA7Vj07IUyMHIiiYKWX8H7P8O7YASNUwSpr5SW/Wm2uCLC0h3
# 1oVH1RC5xuiq7otqLQVcYMa0KlucIxxfReMaFB5vN8sZM4BqiU2jamZjeJPVMM+V
# HwIDAQABo4IB4zCCAd8wEAYJKwYBBAGCNxUBBAMCAQAwHQYDVR0OBBYEFOb8X3u7
# IgBY5HJOtfQhdCMy5u+sMBkGCSsGAQQBgjcUAgQMHgoAUwB1AGIAQwBBMAsGA1Ud
# DwQEAwIBhjAPBgNVHRMBAf8EBTADAQH/MB8GA1UdIwQYMBaAFNX2VsuP6KJcYmjR
# PZSQW9fOmhjEMFYGA1UdHwRPME0wS6BJoEeGRWh0dHA6Ly9jcmwubWljcm9zb2Z0
# LmNvbS9wa2kvY3JsL3Byb2R1Y3RzL01pY1Jvb0NlckF1dF8yMDEwLTA2LTIzLmNy
# bDBaBggrBgEFBQcBAQROMEwwSgYIKwYBBQUHMAKGPmh0dHA6Ly93d3cubWljcm9z
# b2Z0LmNvbS9wa2kvY2VydHMvTWljUm9vQ2VyQXV0XzIwMTAtMDYtMjMuY3J0MIGd
# BgNVHSAEgZUwgZIwgY8GCSsGAQQBgjcuAzCBgTA9BggrBgEFBQcCARYxaHR0cDov
# L3d3dy5taWNyb3NvZnQuY29tL1BLSS9kb2NzL0NQUy9kZWZhdWx0Lmh0bTBABggr
# BgEFBQcCAjA0HjIgHQBMAGUAZwBhAGwAXwBQAG8AbABpAGMAeQBfAFMAdABhAHQA
# ZQBtAGUAbgB0AC4gHTANBgkqhkiG9w0BAQsFAAOCAgEAGnTvV08pe8QWhXi4UNMi
# /AmdrIKX+DT/KiyXlRLl5L/Pv5PI4zSp24G43B4AvtI1b6/lf3mVd+UC1PHr2M1O
# HhthosJaIxrwjKhiUUVnCOM/PB6T+DCFF8g5QKbXDrMhKeWloWmMIpPMdJjnoUdD
# 8lOswA8waX/+0iUgbW9h098H1dlyACxphnY9UdumOUjJN2FtB91TGcun1mHCv+KD
# qw/ga5uV1n0oUbCJSlGkmmzItx9KGg5pqdfcwX7RSXCqtq27ckdjF/qm1qKmhuyo
# EESbY7ayaYkGx0aGehg/6MUdIdV7+QIjLcVBy78dTMgW77Gcf/wiS0mKbhXjpn92
# W9FTeZGFndXS2z1zNfM8rlSyUkdqwKoTldKOEdqZZ14yjPs3hdHcdYWch8ZaV4XC
# v90Nj4ybLeu07s8n07VeafqkFgQBpyRnc89NT7beBVaXevfpUk30dwVPhcbYC/GO
# 7UIJ0Q124yNWeCImNr7KsYxuqh3khdpHM2KPpMmRM19xHkCvmGXJIuhCISWKHC1g
# 2TeJQYkqFg/XYTyUaGBS79ZHmaCAQO4VgXc+nOBTGBpQHTiVmx5mMxMnORd4hzbO
# TsNfsvU9R1O24OXbC2E9KteSLM43Wj5AQjGkHxAIwlacvyRdUQKdannSF9PawZSO
# B3slcUSrBmrm1MbfI5qWdcUxghnNMIIZyQIBATCBlTB+MQswCQYDVQQGEwJVUzET
# MBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMV
# TWljcm9zb2Z0IENvcnBvcmF0aW9uMSgwJgYDVQQDEx9NaWNyb3NvZnQgQ29kZSBT
# aWduaW5nIFBDQSAyMDEwAhMzAAAFACfWMm9Dc3uHAAAAAAUAMA0GCWCGSAFlAwQC
# AQUAoIIBBDAZBgkqhkiG9w0BCQMxDAYKKwYBBAGCNwIBBDAcBgorBgEEAYI3AgEL
# MQ4wDAYKKwYBBAGCNwIBFTAvBgkqhkiG9w0BCQQxIgQgNdlDZhGqjID0o5LrAHt1
# xZN57+uXbrFtQOgbO1BIveUwPAYKKwYBBAGCNwoDHDEuDCxzUFk3eFBCN2hUNWc1
# SEhyWXQ4ckRMU005VnVaUnVXWmFlZjJlMjJSczU0PTBaBgorBgEEAYI3AgEMMUww
# SqAkgCIATQBpAGMAcgBvAHMAbwBmAHQAIABXAGkAbgBkAG8AdwBzoSKAIGh0dHA6
# Ly93d3cubWljcm9zb2Z0LmNvbS93aW5kb3dzMA0GCSqGSIb3DQEBAQUABIIBAGxo
# pZ6czpfozFWTY8mpMJyXR4/Ihzvxi6uGRaqgAheLB05uQPH4VPbKRSeMU0CbfAFb
# P2vc/iUmOeydAlGx6txjllqwFxfYFJfncLyAHhl8p67/pz0EZOH18ava9FsnlV58
# fxAeXqN48lKqNL3SkLpf9zCBPGSfYofDUP5+FpSXG9yHfMxAN2QNj7P7ygRFzoh+
# YI0TmtbUwVz6/5Rh0x7ZHwffPvFqhlhJoHRH1DUoBlihQQHG8obafi+dc4OBMNJD
# 1NYpb1/8diu6HZxwhSry0wmhZzZQn4kXfSBF+1KWQHZU+YnhUjFhAXn3jqkJTyjU
# +HxzRXvuQRS5V7A7SgihghcAMIIW/AYKKwYBBAGCNwMDATGCFuwwghboBgkqhkiG
# 9w0BBwKgghbZMIIW1QIBAzEPMA0GCWCGSAFlAwQCAQUAMIIBUQYLKoZIhvcNAQkQ
# AQSgggFABIIBPDCCATgCAQEGCisGAQQBhFkKAwEwMTANBglghkgBZQMEAgEFAAQg
# P8E6LzL6hdDf7CCYkLHFtZHgx6mh/b3zn3yW38Kuv7gCBmSLANpLcRgTMjAyMzA2
# MjAyMDI5NDkuMjg1WjAEgAIB9KCB0KSBzTCByjELMAkGA1UEBhMCVVMxEzARBgNV
# BAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jv
# c29mdCBDb3Jwb3JhdGlvbjElMCMGA1UECxMcTWljcm9zb2Z0IEFtZXJpY2EgT3Bl
# cmF0aW9uczEmMCQGA1UECxMdVGhhbGVzIFRTUyBFU046M0JCRC1FMzM4LUU5QTEx
# JTAjBgNVBAMTHE1pY3Jvc29mdCBUaW1lLVN0YW1wIFNlcnZpY2WgghFXMIIHDDCC
# BPSgAwIBAgITMwAAAcYwzS7W06HA9AABAAABxjANBgkqhkiG9w0BAQsFADB8MQsw
# CQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9u
# ZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMSYwJAYDVQQDEx1NaWNy
# b3NvZnQgVGltZS1TdGFtcCBQQ0EgMjAxMDAeFw0yMjExMDQxOTAxMzRaFw0yNDAy
# MDIxOTAxMzRaMIHKMQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQ
# MA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9u
# MSUwIwYDVQQLExxNaWNyb3NvZnQgQW1lcmljYSBPcGVyYXRpb25zMSYwJAYDVQQL
# Ex1UaGFsZXMgVFNTIEVTTjozQkJELUUzMzgtRTlBMTElMCMGA1UEAxMcTWljcm9z
# b2Z0IFRpbWUtU3RhbXAgU2VydmljZTCCAiIwDQYJKoZIhvcNAQEBBQADggIPADCC
# AgoCggIBAO+9Ijq+r+B5NZt0mY/tQUf4rqH7/n+nlW+x3NtWMcwM66OBupClxeO2
# ALBIK1lk9aIL6dCK6BZvAnUWU3/w5UNH2zTTvaQgNNSidN8x/NgpZpPc3va9Yzyd
# WSWjJ7GZgMu1aWPZjal/XYT751tf2cW24h7+6sMIMPVNkk+Zn3KT7rbCP0K/4Cwu
# mkyN1AmM4lT2f0H2oPDUISpKR2Ttyq+a/N3Mu48+Dlj8uTNlorVr+WySeawU1udf
# EDxMxcM6vHvD+9tglimSRYzfHrQYLCtOYB3h2jfZJpaWCSS/OL/SYml+zRSZDkYQ
# KRBWYlCGmaC8SbeKXAQ83/lg/VAI0SgqwLHif3JM0Lzp/eV+DreGrJzrjYXAnXEF
# nK2aMpBZhGqGJK7A+5/+JxRR8CQylGgWGWS8D4+7sePEtWHvnDHHDMXUUo7qBuK6
# iaqRHeoM389t/b9+i/i7TpUIXy+XJ3JYTUlnZisNUx8npB/ekTbTqSBO3PvU57L9
# WhPYaYXoyzicX7F05MsNBSHYpXNAj+881LKmghhdphV0cC+I319Ucle0BihHjqbx
# makCix1WWyw99s7VvC37/fcUNuHf0yMTvS0Xrh7J8KLZ/vAbAq87vv9uLznAPV3K
# Xe5CHluM5lMYRbL+Cgn4qjKbWYYTAANEqg7o9t3I9dLJl0Ti1J4VAgMBAAGjggE2
# MIIBMjAdBgNVHQ4EFgQUcV/5R4koRAqdZ9pTGuhtbi7zYJQwHwYDVR0jBBgwFoAU
# n6cVXQBeYl2D9OXSZacbUzUZ6XIwXwYDVR0fBFgwVjBUoFKgUIZOaHR0cDovL3d3
# dy5taWNyb3NvZnQuY29tL3BraW9wcy9jcmwvTWljcm9zb2Z0JTIwVGltZS1TdGFt
# cCUyMFBDQSUyMDIwMTAoMSkuY3JsMGwGCCsGAQUFBwEBBGAwXjBcBggrBgEFBQcw
# AoZQaHR0cDovL3d3dy5taWNyb3NvZnQuY29tL3BraW9wcy9jZXJ0cy9NaWNyb3Nv
# ZnQlMjBUaW1lLVN0YW1wJTIwUENBJTIwMjAxMCgxKS5jcnQwDAYDVR0TAQH/BAIw
# ADATBgNVHSUEDDAKBggrBgEFBQcDCDANBgkqhkiG9w0BAQsFAAOCAgEAC8xe9uI1
# 7oA1OPOjzAWEewnOmh69pyQ5xrJ5KsGWJo0YtvKr+ktS8u+9s8JuQyNfPc4AEPfc
# YRI1urmJK1+VK7VbuyVED+mwQQSffHNvBQCDyCt35EDQr9q8UY30DCUnXMLCXkyu
# y3dPTrgOYWOD1ggYCaX2O9S3Gl89xUfADTxV+s3CmG4GDma3oLaQ7m9+DdEIUe8H
# PxXJlfoOCNyHUwKDA9v1iOWbHyk8wVJ/1NwKVITcGzpeWEgvn/UtS0rW2S8D8zEv
# nyz1yVEnu0kr7KX0rK/1RHtKEIZmkfub3KvuzC8POtVgVYWKSe0weWAUuTkTvV3S
# G3KWwRcHBz5m/ImakiKlvSaYBu+vuTUFCz1c2e+c+VtkeWYskJLYh6TMI19jjtvW
# fPp08NrTrFQnMMx/S6BC3nb9z43KW8Dsi47ZtU+Fx2Hd6m3fQ16AYzWJEo3Yt+6T
# aefLvqyE5bSyjo40AicI9RaZ7gWPNuQeQtLgvzWBEhCrE4nBI4Uv+LowVy3DRg4V
# QZdrxxOqmP2FuJMtb3Mqb1K7BvNYKb9vvP4oTsIOMEyzu16opHiIlN2VgFAKDqU5
# deLXnUKsWx0w73iWEdzlNMigdscH/OxFggG9AiYpoQ5skGihL0ldHy1vYlciNMGH
# BuFdmlTek62eJq/n32qg0A/Rfh6T4T9KZQMwggdxMIIFWaADAgECAhMzAAAAFcXn
# a54Cm0mZAAAAAAAVMA0GCSqGSIb3DQEBCwUAMIGIMQswCQYDVQQGEwJVUzETMBEG
# A1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWlj
# cm9zb2Z0IENvcnBvcmF0aW9uMTIwMAYDVQQDEylNaWNyb3NvZnQgUm9vdCBDZXJ0
# aWZpY2F0ZSBBdXRob3JpdHkgMjAxMDAeFw0yMTA5MzAxODIyMjVaFw0zMDA5MzAx
# ODMyMjVaMHwxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYD
# VQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xJjAk
# BgNVBAMTHU1pY3Jvc29mdCBUaW1lLVN0YW1wIFBDQSAyMDEwMIICIjANBgkqhkiG
# 9w0BAQEFAAOCAg8AMIICCgKCAgEA5OGmTOe0ciELeaLL1yR5vQ7VgtP97pwHB9Kp
# bE51yMo1V/YBf2xK4OK9uT4XYDP/XE/HZveVU3Fa4n5KWv64NmeFRiMMtY0Tz3cy
# wBAY6GB9alKDRLemjkZrBxTzxXb1hlDcwUTIcVxRMTegCjhuje3XD9gmU3w5YQJ6
# xKr9cmmvHaus9ja+NSZk2pg7uhp7M62AW36MEBydUv626GIl3GoPz130/o5Tz9bs
# hVZN7928jaTjkY+yOSxRnOlwaQ3KNi1wjjHINSi947SHJMPgyY9+tVSP3PoFVZht
# aDuaRr3tpK56KTesy+uDRedGbsoy1cCGMFxPLOJiss254o2I5JasAUq7vnGpF1tn
# YN74kpEeHT39IM9zfUGaRnXNxF803RKJ1v2lIH1+/NmeRd+2ci/bfV+Autuqfjbs
# Nkz2K26oElHovwUDo9Fzpk03dJQcNIIP8BDyt0cY7afomXw/TNuvXsLz1dhzPUNO
# wTM5TI4CvEJoLhDqhFFG4tG9ahhaYQFzymeiXtcodgLiMxhy16cg8ML6EgrXY28M
# yTZki1ugpoMhXV8wdJGUlNi5UPkLiWHzNgY1GIRH29wb0f2y1BzFa/ZcUlFdEtsl
# uq9QBXpsxREdcu+N+VLEhReTwDwV2xo3xwgVGD94q0W29R6HXtqPnhZyacaue7e3
# PmriLq0CAwEAAaOCAd0wggHZMBIGCSsGAQQBgjcVAQQFAgMBAAEwIwYJKwYBBAGC
# NxUCBBYEFCqnUv5kxJq+gpE8RjUpzxD/LwTuMB0GA1UdDgQWBBSfpxVdAF5iXYP0
# 5dJlpxtTNRnpcjBcBgNVHSAEVTBTMFEGDCsGAQQBgjdMg30BATBBMD8GCCsGAQUF
# BwIBFjNodHRwOi8vd3d3Lm1pY3Jvc29mdC5jb20vcGtpb3BzL0RvY3MvUmVwb3Np
# dG9yeS5odG0wEwYDVR0lBAwwCgYIKwYBBQUHAwgwGQYJKwYBBAGCNxQCBAweCgBT
# AHUAYgBDAEEwCwYDVR0PBAQDAgGGMA8GA1UdEwEB/wQFMAMBAf8wHwYDVR0jBBgw
# FoAU1fZWy4/oolxiaNE9lJBb186aGMQwVgYDVR0fBE8wTTBLoEmgR4ZFaHR0cDov
# L2NybC5taWNyb3NvZnQuY29tL3BraS9jcmwvcHJvZHVjdHMvTWljUm9vQ2VyQXV0
# XzIwMTAtMDYtMjMuY3JsMFoGCCsGAQUFBwEBBE4wTDBKBggrBgEFBQcwAoY+aHR0
# cDovL3d3dy5taWNyb3NvZnQuY29tL3BraS9jZXJ0cy9NaWNSb29DZXJBdXRfMjAx
# MC0wNi0yMy5jcnQwDQYJKoZIhvcNAQELBQADggIBAJ1VffwqreEsH2cBMSRb4Z5y
# S/ypb+pcFLY+TkdkeLEGk5c9MTO1OdfCcTY/2mRsfNB1OW27DzHkwo/7bNGhlBgi
# 7ulmZzpTTd2YurYeeNg2LpypglYAA7AFvonoaeC6Ce5732pvvinLbtg/SHUB2Rje
# bYIM9W0jVOR4U3UkV7ndn/OOPcbzaN9l9qRWqveVtihVJ9AkvUCgvxm2EhIRXT0n
# 4ECWOKz3+SmJw7wXsFSFQrP8DJ6LGYnn8AtqgcKBGUIZUnWKNsIdw2FzLixre24/
# LAl4FOmRsqlb30mjdAy87JGA0j3mSj5mO0+7hvoyGtmW9I/2kQH2zsZ0/fZMcm8Q
# q3UwxTSwethQ/gpY3UA8x1RtnWN0SCyxTkctwRQEcb9k+SS+c23Kjgm9swFXSVRk
# 2XPXfx5bRAGOWhmRaw2fpCjcZxkoJLo4S5pu+yFUa2pFEUep8beuyOiJXk+d0tBM
# drVXVAmxaQFEfnyhYWxz/gq77EFmPWn9y8FBSX5+k77L+DvktxW/tM4+pTFRhLy/
# AsGConsXHRWJjXD+57XQKBqJC4822rpM+Zv/Cuk0+CQ1ZyvgDbjmjJnW4SLq8CdC
# PSWU5nR0W2rRnj7tfqAxM328y+l7vzhwRNGQ8cirOoo6CGJ/2XBjU02N7oJtpQUQ
# wXEGahC0HVUzWLOhcGbyoYICzjCCAjcCAQEwgfihgdCkgc0wgcoxCzAJBgNVBAYT
# AlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYD
# VQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xJTAjBgNVBAsTHE1pY3Jvc29mdCBB
# bWVyaWNhIE9wZXJhdGlvbnMxJjAkBgNVBAsTHVRoYWxlcyBUU1MgRVNOOjNCQkQt
# RTMzOC1FOUExMSUwIwYDVQQDExxNaWNyb3NvZnQgVGltZS1TdGFtcCBTZXJ2aWNl
# oiMKAQEwBwYFKw4DAhoDFQAtNcrmJiFb7KJEmnCZlnvDLtkBbaCBgzCBgKR+MHwx
# CzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRt
# b25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xJjAkBgNVBAMTHU1p
# Y3Jvc29mdCBUaW1lLVN0YW1wIFBDQSAyMDEwMA0GCSqGSIb3DQEBBQUAAgUA6DwW
# pzAiGA8yMDIzMDYyMDIwMTQzMVoYDzIwMjMwNjIxMjAxNDMxWjB3MD0GCisGAQQB
# hFkKBAExLzAtMAoCBQDoPBanAgEAMAoCAQACAgc5AgH/MAcCAQACAhG6MAoCBQDo
# PWgnAgEAMDYGCisGAQQBhFkKBAIxKDAmMAwGCisGAQQBhFkKAwKgCjAIAgEAAgMH
# oSChCjAIAgEAAgMBhqAwDQYJKoZIhvcNAQEFBQADgYEAMuA1lrwDMCCy7/r+N3AS
# 6SGaghx9aDPrKwucYjHUGf78mVE4FCCyfRQkJBTkqdbywrP7xmhJO3x83PJAoC1P
# ZGPxNZpCHTypLmPP5MvJQQKA5Ujv2X4mkhHsqJvpVzjMJuot13j7XFrRvaNluhwx
# be77/jW3AWw4jBfzCSaqiakxggQNMIIECQIBATCBkzB8MQswCQYDVQQGEwJVUzET
# MBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMV
# TWljcm9zb2Z0IENvcnBvcmF0aW9uMSYwJAYDVQQDEx1NaWNyb3NvZnQgVGltZS1T
# dGFtcCBQQ0EgMjAxMAITMwAAAcYwzS7W06HA9AABAAABxjANBglghkgBZQMEAgEF
# AKCCAUowGgYJKoZIhvcNAQkDMQ0GCyqGSIb3DQEJEAEEMC8GCSqGSIb3DQEJBDEi
# BCBxuN+EQRh1Slfxs8OTcXv+bTI1zpy73gAqgsX1IK1aXDCB+gYLKoZIhvcNAQkQ
# Ai8xgeowgecwgeQwgb0EIFYxE1xVyb2YKcYmapPwcA1gOT8cOoXoVC6ZBa/a468t
# MIGYMIGApH4wfDELMAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAO
# BgNVBAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEm
# MCQGA1UEAxMdTWljcm9zb2Z0IFRpbWUtU3RhbXAgUENBIDIwMTACEzMAAAHGMM0u
# 1tOhwPQAAQAAAcYwIgQg2T4a+s9xrgalxWOK9mgb1oZEP1GaJgI4XJGrAP3GvAsw
# DQYJKoZIhvcNAQELBQAEggIAVAtdNv2g+lUAvnQyfdf+wxbtxwluNWksrmw5flFi
# cn8Z7Qv4MCzsYq2x7IQzCYPq7c3CM0Q7n7Jv4xUyGlGyf16ebWJTsrdmkTdPw2Zd
# i4coMkz/EWikO//O7ZuJqfg/uRdsmAeq5Up/dSQhstrH781mDV5kWujS8G1CbSj2
# qgIQrd+Fakmh5AyNS0UK6iOcHh0W4pmUfLtx5qHh7J19kbN4aM+PbvKq7hmPC895
# 8rLNKT3b8xENrmV2jsxFEUd9OokxBJ4IU05Dvyl+zW3gy+hFkxioEwN0L3zKXf1p
# c0R70mh88kzyHP8PvRhy1UPhwjDl5pP9ZtgriI+AHDv7khg8rmmI3aM1Kl3YHZWO
# YgJ+EFQMflt1SSGOv6SXw0CoRKIc6PwyObWBd0YUK9FixiJL31WW0pD8pjl71kPw
# BIxHVdUsdUzUd7QUnAoZvOrAv/Q/MGqQWoTiSE/Qj44sjTjp9gMUB5ZTWY0lc1zx
# eu4nK/hK3aHLknT0lBVXKpGnZwbvy7wOi817kevVX3aMoYmAU7du88KfZsrBlSp9
# C1eLG3jkzxdtwr5QYn0UczZmVwD98RtB019AHIQXFhp6NQlGTBHfbI+tHH+lK0lR
# BuSAtgQp1Z2W3HDkO7pTPI+dYdia24ADpLulSKPZS5MWfmWw6qnvJsnhvRJT8Zlf
# DUY=
# SIG # End signature block
