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
# MIImCgYJKoZIhvcNAQcCoIIl+zCCJfcCAQExDzANBglghkgBZQMEAgEFADB5Bgor
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
# B3slcUSrBmrm1MbfI5qWdcUxghn5MIIZ9QIBATCBlTB+MQswCQYDVQQGEwJVUzET
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
# +HxzRXvuQRS5V7A7SgihghcsMIIXKAYKKwYBBAGCNwMDATGCFxgwghcUBgkqhkiG
# 9w0BBwKgghcFMIIXAQIBAzEPMA0GCWCGSAFlAwQCAQUAMIIBWQYLKoZIhvcNAQkQ
# AQSgggFIBIIBRDCCAUACAQEGCisGAQQBhFkKAwEwMTANBglghkgBZQMEAgEFAAQg
# P8E6LzL6hdDf7CCYkLHFtZHgx6mh/b3zn3yW38Kuv7gCBmQa/3HbuhgTMjAyMzAz
# MjUwNzU4MjkuNTkxWjAEgAIB9KCB2KSB1TCB0jELMAkGA1UEBhMCVVMxEzARBgNV
# BAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jv
# c29mdCBDb3Jwb3JhdGlvbjEtMCsGA1UECxMkTWljcm9zb2Z0IElyZWxhbmQgT3Bl
# cmF0aW9ucyBMaW1pdGVkMSYwJAYDVQQLEx1UaGFsZXMgVFNTIEVTTjo4RDQxLTRC
# RjctQjNCNzElMCMGA1UEAxMcTWljcm9zb2Z0IFRpbWUtU3RhbXAgU2VydmljZaCC
# EXswggcnMIIFD6ADAgECAhMzAAABs/4lzikbG4ocAAEAAAGzMA0GCSqGSIb3DQEB
# CwUAMHwxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQH
# EwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xJjAkBgNV
# BAMTHU1pY3Jvc29mdCBUaW1lLVN0YW1wIFBDQSAyMDEwMB4XDTIyMDkyMDIwMjIw
# M1oXDTIzMTIxNDIwMjIwM1owgdIxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNo
# aW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29y
# cG9yYXRpb24xLTArBgNVBAsTJE1pY3Jvc29mdCBJcmVsYW5kIE9wZXJhdGlvbnMg
# TGltaXRlZDEmMCQGA1UECxMdVGhhbGVzIFRTUyBFU046OEQ0MS00QkY3LUIzQjcx
# JTAjBgNVBAMTHE1pY3Jvc29mdCBUaW1lLVN0YW1wIFNlcnZpY2UwggIiMA0GCSqG
# SIb3DQEBAQUAA4ICDwAwggIKAoICAQC0fA+65hiAriywYIKyvY3t4SUqXPQk8G62
# v+Cm9nruQ2UeqAoBbQm4oDLjHGN9UJR6/95LloRydOZ+Prd++zx6J3Qw28/3VPqv
# zX10iq9acFNji8pWNLMOd9VWdbFgHcg9hEAhM03Sw+CiWwusJgAqJ4iQQKr4Q8l8
# SdDbr5ZO+K3VRL64m7A2ccwpVhGuL+thDY/x8oglF9zGRp2PwIQ8ms36XIQ1qD+n
# CYDQkl5h1fV7CYFyeJfgGAIGqgLzfDfhKTftExKwoBTn8GVdtXIO74HpzlePIJhv
# xDH9C70QHoq8T1LvozQdyUhW1tVlPGecbCxKDZXt+YnHRE/ht8AzZnEl5UGLOLfe
# CFkeeNfj7FE5KtJJnT+P9TuBg+eGbCeXlJy2msFzscU9X4G1m/VUYNWeGrKVqbi+
# YBcB2vFDTEcbCn36K+qq11VUNTnSTktSZXr4aWZbLEglQ6HTHN9CN31ns58urTTq
# H6X2j67cCdLpF3Cw9ck/vPbuLkAf66lCuiex6ZDbtH0eTOcRrTnIfZ8p3DvWpaK8
# Q34hHW+s3qrQn3G6OOrvv637LJXBkriRc5cBDZ1Pr0PiSeoyUVKwfpq+dc1lDIlk
# yw1ZoS3euv/w2v2AYwNAYtIXGLjv1nLX1pP98fOwC27ahwG5OotXCfGtnKInro/v
# QQEko7l5AQIDAQABo4IBSTCCAUUwHQYDVR0OBBYEFNAaXcJRZ1IMGIs4SCH/XgXc
# n8ONMB8GA1UdIwQYMBaAFJ+nFV0AXmJdg/Tl0mWnG1M1GelyMF8GA1UdHwRYMFYw
# VKBSoFCGTmh0dHA6Ly93d3cubWljcm9zb2Z0LmNvbS9wa2lvcHMvY3JsL01pY3Jv
# c29mdCUyMFRpbWUtU3RhbXAlMjBQQ0ElMjAyMDEwKDEpLmNybDBsBggrBgEFBQcB
# AQRgMF4wXAYIKwYBBQUHMAKGUGh0dHA6Ly93d3cubWljcm9zb2Z0LmNvbS9wa2lv
# cHMvY2VydHMvTWljcm9zb2Z0JTIwVGltZS1TdGFtcCUyMFBDQSUyMDIwMTAoMSku
# Y3J0MAwGA1UdEwEB/wQCMAAwFgYDVR0lAQH/BAwwCgYIKwYBBQUHAwgwDgYDVR0P
# AQH/BAQDAgeAMA0GCSqGSIb3DQEBCwUAA4ICAQBahrs3zrAJuMACXxEZiYFltLTS
# yz5OlWI+d/oQZlCArKhoI/aFzTWrYAqvox7dNxIk81YcbXilji6EzMd/XAnFCYAz
# kCB/ho7so2FVXTgmvRcepSOvdPzgWRZc9gw7i6VAbqP/793uCp7ONdpjtwOpg0JJ
# 3cXiUrHQUm5CqnHAe0wv5rhToc4N/Zn4oxiAnNZGc4iRP+h3SghfKffr7NchlEeb
# s5CKPuvKv5+ZDbd94XWkNt+FRIdMD0hPnQoKSkan8YGLAU/+bV2t3vE18iZVaBvY
# 8Fwayp0kG+PpNfYx1Qd8FVH5Z7gDSUSPWs1sKmBSg22VpH0PLaTaBXyihUR21qJn
# KHT9W1Z+5CllAkwPGBtkZUwbb67NwqmN5gA0yVIoOHJDfzBugCK/EPgApigRJuDh
# aTnGTF9HMWrKKXYMTPWknQbrGiX2dyLZd7wuQt0RPe7lEbFQdqbwvgp4xbbfz5GO
# 9ZfVEx81AjvvjOIUhks5H7vsgYVzBngWai15fXH34GD3J0RY0E/exm/24OLLCyBb
# jSTTQCbm/iL8YaJka7VrgeEjfd+aDH7xuXBHme3smKQWeA25LzeOGbxEdBB0WpC9
# sW9a67I+3PCPmrhKmM7VKQ57qugcaQSFAJRd1AydEjBucalv/YSzFp2iQryHqxFk
# xZuuI7YQItAQzMJwsDCCB3EwggVZoAMCAQICEzMAAAAVxedrngKbSZkAAAAAABUw
# DQYJKoZIhvcNAQELBQAwgYgxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5n
# dG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9y
# YXRpb24xMjAwBgNVBAMTKU1pY3Jvc29mdCBSb290IENlcnRpZmljYXRlIEF1dGhv
# cml0eSAyMDEwMB4XDTIxMDkzMDE4MjIyNVoXDTMwMDkzMDE4MzIyNVowfDELMAkG
# A1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1vbmQx
# HjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEmMCQGA1UEAxMdTWljcm9z
# b2Z0IFRpbWUtU3RhbXAgUENBIDIwMTAwggIiMA0GCSqGSIb3DQEBAQUAA4ICDwAw
# ggIKAoICAQDk4aZM57RyIQt5osvXJHm9DtWC0/3unAcH0qlsTnXIyjVX9gF/bErg
# 4r25PhdgM/9cT8dm95VTcVrifkpa/rg2Z4VGIwy1jRPPdzLAEBjoYH1qUoNEt6aO
# RmsHFPPFdvWGUNzBRMhxXFExN6AKOG6N7dcP2CZTfDlhAnrEqv1yaa8dq6z2Nr41
# JmTamDu6GnszrYBbfowQHJ1S/rboYiXcag/PXfT+jlPP1uyFVk3v3byNpOORj7I5
# LFGc6XBpDco2LXCOMcg1KL3jtIckw+DJj361VI/c+gVVmG1oO5pGve2krnopN6zL
# 64NF50ZuyjLVwIYwXE8s4mKyzbnijYjklqwBSru+cakXW2dg3viSkR4dPf0gz3N9
# QZpGdc3EXzTdEonW/aUgfX782Z5F37ZyL9t9X4C626p+Nuw2TPYrbqgSUei/BQOj
# 0XOmTTd0lBw0gg/wEPK3Rxjtp+iZfD9M269ewvPV2HM9Q07BMzlMjgK8QmguEOqE
# UUbi0b1qGFphAXPKZ6Je1yh2AuIzGHLXpyDwwvoSCtdjbwzJNmSLW6CmgyFdXzB0
# kZSU2LlQ+QuJYfM2BjUYhEfb3BvR/bLUHMVr9lxSUV0S2yW6r1AFemzFER1y7435
# UsSFF5PAPBXbGjfHCBUYP3irRbb1Hode2o+eFnJpxq57t7c+auIurQIDAQABo4IB
# 3TCCAdkwEgYJKwYBBAGCNxUBBAUCAwEAATAjBgkrBgEEAYI3FQIEFgQUKqdS/mTE
# mr6CkTxGNSnPEP8vBO4wHQYDVR0OBBYEFJ+nFV0AXmJdg/Tl0mWnG1M1GelyMFwG
# A1UdIARVMFMwUQYMKwYBBAGCN0yDfQEBMEEwPwYIKwYBBQUHAgEWM2h0dHA6Ly93
# d3cubWljcm9zb2Z0LmNvbS9wa2lvcHMvRG9jcy9SZXBvc2l0b3J5Lmh0bTATBgNV
# HSUEDDAKBggrBgEFBQcDCDAZBgkrBgEEAYI3FAIEDB4KAFMAdQBiAEMAQTALBgNV
# HQ8EBAMCAYYwDwYDVR0TAQH/BAUwAwEB/zAfBgNVHSMEGDAWgBTV9lbLj+iiXGJo
# 0T2UkFvXzpoYxDBWBgNVHR8ETzBNMEugSaBHhkVodHRwOi8vY3JsLm1pY3Jvc29m
# dC5jb20vcGtpL2NybC9wcm9kdWN0cy9NaWNSb29DZXJBdXRfMjAxMC0wNi0yMy5j
# cmwwWgYIKwYBBQUHAQEETjBMMEoGCCsGAQUFBzAChj5odHRwOi8vd3d3Lm1pY3Jv
# c29mdC5jb20vcGtpL2NlcnRzL01pY1Jvb0NlckF1dF8yMDEwLTA2LTIzLmNydDAN
# BgkqhkiG9w0BAQsFAAOCAgEAnVV9/Cqt4SwfZwExJFvhnnJL/Klv6lwUtj5OR2R4
# sQaTlz0xM7U518JxNj/aZGx80HU5bbsPMeTCj/ts0aGUGCLu6WZnOlNN3Zi6th54
# 2DYunKmCVgADsAW+iehp4LoJ7nvfam++Kctu2D9IdQHZGN5tggz1bSNU5HhTdSRX
# ud2f8449xvNo32X2pFaq95W2KFUn0CS9QKC/GbYSEhFdPSfgQJY4rPf5KYnDvBew
# VIVCs/wMnosZiefwC2qBwoEZQhlSdYo2wh3DYXMuLGt7bj8sCXgU6ZGyqVvfSaN0
# DLzskYDSPeZKPmY7T7uG+jIa2Zb0j/aRAfbOxnT99kxybxCrdTDFNLB62FD+Cljd
# QDzHVG2dY3RILLFORy3BFARxv2T5JL5zbcqOCb2zAVdJVGTZc9d/HltEAY5aGZFr
# DZ+kKNxnGSgkujhLmm77IVRrakURR6nxt67I6IleT53S0Ex2tVdUCbFpAUR+fKFh
# bHP+CrvsQWY9af3LwUFJfn6Tvsv4O+S3Fb+0zj6lMVGEvL8CwYKiexcdFYmNcP7n
# tdAoGokLjzbaukz5m/8K6TT4JDVnK+ANuOaMmdbhIurwJ0I9JZTmdHRbatGePu1+
# oDEzfbzL6Xu/OHBE0ZDxyKs6ijoIYn/ZcGNTTY3ugm2lBRDBcQZqELQdVTNYs6Fw
# ZvKhggLXMIICQAIBATCCAQChgdikgdUwgdIxCzAJBgNVBAYTAlVTMRMwEQYDVQQI
# EwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3Nv
# ZnQgQ29ycG9yYXRpb24xLTArBgNVBAsTJE1pY3Jvc29mdCBJcmVsYW5kIE9wZXJh
# dGlvbnMgTGltaXRlZDEmMCQGA1UECxMdVGhhbGVzIFRTUyBFU046OEQ0MS00QkY3
# LUIzQjcxJTAjBgNVBAMTHE1pY3Jvc29mdCBUaW1lLVN0YW1wIFNlcnZpY2WiIwoB
# ATAHBgUrDgMCGgMVAHGLROiW3R4SpcJCXiqAldSSJA5hoIGDMIGApH4wfDELMAkG
# A1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1vbmQx
# HjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEmMCQGA1UEAxMdTWljcm9z
# b2Z0IFRpbWUtU3RhbXAgUENBIDIwMTAwDQYJKoZIhvcNAQEFBQACBQDnyMkaMCIY
# DzIwMjMwMzI1MDkxMjU4WhgPMjAyMzAzMjYwOTEyNThaMHcwPQYKKwYBBAGEWQoE
# ATEvMC0wCgIFAOfIyRoCAQAwCgIBAAICDXYCAf8wBwIBAAICEv0wCgIFAOfKGpoC
# AQAwNgYKKwYBBAGEWQoEAjEoMCYwDAYKKwYBBAGEWQoDAqAKMAgCAQACAwehIKEK
# MAgCAQACAwGGoDANBgkqhkiG9w0BAQUFAAOBgQCsW5687RR7G3vedQukYhoaHaiJ
# BbFNLc0WBgsDDYfG3iRS2sVU7W5OGDmnn7tHfGZxNjkBCwjQchPn0IEww74AQknA
# G9wDvAfovmXx/ZJxJ72+FMx8TwzIC2I2SosS0n1g25j2P1ddvquz+lZLXXmi84iM
# x9/hQ5kxmbsMHjKkuzGCBA0wggQJAgEBMIGTMHwxCzAJBgNVBAYTAlVTMRMwEQYD
# VQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNy
# b3NvZnQgQ29ycG9yYXRpb24xJjAkBgNVBAMTHU1pY3Jvc29mdCBUaW1lLVN0YW1w
# IFBDQSAyMDEwAhMzAAABs/4lzikbG4ocAAEAAAGzMA0GCWCGSAFlAwQCAQUAoIIB
# SjAaBgkqhkiG9w0BCQMxDQYLKoZIhvcNAQkQAQQwLwYJKoZIhvcNAQkEMSIEIKZ0
# I5nc/udI1NGZ4f545nunqjQV8i58MbqB8mBDBRYdMIH6BgsqhkiG9w0BCRACLzGB
# 6jCB5zCB5DCBvQQghqEz1SoQ0ge2RtMyUGVDNo5P5ZdcyRoeijoZ++pPv0IwgZgw
# gYCkfjB8MQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UE
# BxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMSYwJAYD
# VQQDEx1NaWNyb3NvZnQgVGltZS1TdGFtcCBQQ0EgMjAxMAITMwAAAbP+Jc4pGxuK
# HAABAAABszAiBCAdc0cyikET0q5T+TxsTBvoqU4ECb5j4vgfp9Dz2Gao7zANBgkq
# hkiG9w0BAQsFAASCAgCaxWZLl3YMNtTPyLRlJ1fcvD6pgSJXfXNbSdG8YEZS730+
# m3PFoh4CjrDQ52RycfnnO3hVTy0+JvhRJxxcB6LQ/+KE/M6m9tH/+hmR7UCGE362
# NkRVrH4/DZ7hCoA7R9/kujUyxeGNDKdoE6Km/HTnaD/LreQZ3OxNfTI87y8QFzT4
# 0+ODWhJwSksByrjh7TarKrEYR0+FxsQazVlmqoGXy/FhwiqNACi1y4Y5plHndEAV
# Ut9OEGQ99r4tueWExr3VwnMvAKvsagmkdQ2q4zVjxg/3oZnF/QIXX+O2JXPAMBdU
# U2MlHoL23AU6ewaW6JJA5FNdpSrGtfWynDHwscAGKSi0s4ug+s6bpF+SsXcAYpiu
# hQhxP+iNOJYXq/Brpp8YLy54J1daG7SvAYEvToZlIVRJHSOBq0IdEzqtBb0nrgMz
# 8M0u2/C65jJRljVjCJC+gXLybFBUT8G4YI3FYwrt8q0xo3vF6xIBJSDyeTGqVUkS
# oUEuehB7TSWHF0whdg7e3gICRfkKtdAHoe3ySOO56COGgfAni1sWeuoeI/MRE2Y1
# m+P6seB/7jfSHWQqbM6yU9cOcbWVYJE6uapOAcZeDnNqPODrAlW717xdG18PDuLW
# rUHiQ7ElR4PvB9cSEfq8vDV9lyClgRa/YfE8BUa/C5RGTXBvYHhhtGzIPDSX7w==
# SIG # End signature block
