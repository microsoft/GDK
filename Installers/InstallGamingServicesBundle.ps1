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

    $isOldPackagePresent = (([Version]$package.Version -lt [Version]'16.82.27002.0') -or ([Version]$package.Version -eq [Version]'1.43.2002.0'));

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
    Write-Output "Installing $AppxPath Version 16.82.27002.0 Volume $systemRoot";

    $allDepsFound = $TRUE;
    [string[]]$depPackageNames = 'Microsoft.NET.Native.Runtime.2.2', 'Microsoft.NET.Native.Framework.2.2', 'Microsoft.VCLibs.x64.14.00';
    $dependencyPaths = $depPackageNames | ForEach-Object { Join-Path -Path $AppxDepDirPath -ChildPath "$_.appx" };
    ForEach ($dep in $dependencyPaths) { if (-not (test-path $dep)) { $allDepsFound = $FALSE; } };

    if ($allDepsFound) {
        Write-Output "Installing $AppxPath Version 16.82.27002.0 Volume $systemRoot -DependencyPath $dependencyPaths";
        add-appxpackage -forceApplicationShutdown -path $AppxPath -Volume $systemRoot -DependencyPath $dependencyPaths -ErrorAction Continue;
    }
    else {
        Write-Output "Installing $AppxPath Version 16.82.27002.0 Volume $systemRoot";
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
# MIImcgYJKoZIhvcNAQcCoIImYzCCJl8CAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCCmEhIC1/2LrZIG
# SQ2oDlUjon08Abjrqw+qitAZPtglGqCCC2cwggTvMIID16ADAgECAhMzAAAFV8+Q
# 3cfRwIiMAAAAAAVXMA0GCSqGSIb3DQEBCwUAMH4xCzAJBgNVBAYTAlVTMRMwEQYD
# VQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNy
# b3NvZnQgQ29ycG9yYXRpb24xKDAmBgNVBAMTH01pY3Jvc29mdCBDb2RlIFNpZ25p
# bmcgUENBIDIwMTAwHhcNMjMxMDE5MTk1MTEyWhcNMjQxMDE2MTk1MTEyWjB0MQsw
# CQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9u
# ZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMR4wHAYDVQQDExVNaWNy
# b3NvZnQgQ29ycG9yYXRpb24wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIB
# AQCs0/kFGrFBPJjNzuVjixsArYe7PjsMayjyn3AS8PHH7QmCeCIh2iH6OGSizwdy
# /HSU5bfZcxZn25YEyff6mBQplp064tc7cue5Win7lqQKjCq5eExLe7M9Ms42HJ48
# 2nviJZvVK1qNDe4Y7H58TDTSatOk0agN5GP9xQc6opv9NPHZMK3vPfbKP85w2nmm
# T7wDkaDVLoMxmEmNnf2zYtUauyrx+zzLVE/dkFvaKuwxqYg5QVJNqvxqx7FoCCg1
# q5WdAyp4B0S01JxTFPqb9w185mOsIi0dk7uJ6JoOT2WOsJL1BUuV2MgmFp1Z2OIB
# rwkdeB55wG8mF7az1dWGjk5NAgMBAAGjggFuMIIBajAfBgNVHSUEGDAWBgorBgEE
# AYI3PQYBBggrBgEFBQcDAzAdBgNVHQ4EFgQUZUiwqCE+1UNl9kCzINVmNMKtebcw
# RQYDVR0RBD4wPKQ6MDgxHjAcBgNVBAsTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEW
# MBQGA1UEBRMNMjMwODY1KzUwMTU5NzAfBgNVHSMEGDAWgBTm/F97uyIAWORyTrX0
# IXQjMubvrDBWBgNVHR8ETzBNMEugSaBHhkVodHRwOi8vY3JsLm1pY3Jvc29mdC5j
# b20vcGtpL2NybC9wcm9kdWN0cy9NaWNDb2RTaWdQQ0FfMjAxMC0wNy0wNi5jcmww
# WgYIKwYBBQUHAQEETjBMMEoGCCsGAQUFBzAChj5odHRwOi8vd3d3Lm1pY3Jvc29m
# dC5jb20vcGtpL2NlcnRzL01pY0NvZFNpZ1BDQV8yMDEwLTA3LTA2LmNydDAMBgNV
# HRMBAf8EAjAAMA0GCSqGSIb3DQEBCwUAA4IBAQDKLsNC5lAhZ0LL2vbh5pbhYDM1
# htEg3+di/58fDvtTcT+oLwq+eRPuIleUaK37eaEeynCJA7WvdJK9FjvZBC4Fbkqh
# Lu6lSqplUUeJzxn620qcful+phcUszQYDyAsh4fjdTzJtx2jGeiJcD193yIoIzjN
# rllXCtGVMSjryy2jiU4pczp1WOjWrCL9fz0ZvR811YZAnhyP6zu1V8pdYqeA668h
# KvdfZzVp60F8ZkqnucOpa1WKiQEYEwkG5vOQdxoOxZWc+MJ6cmcNgA+7SfJbb0XX
# +hsKIzK7Tb/E9dELF88573stY+AuuApvZLAsG76aU/jvqlyreUWX5M3uW2ShMIIG
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
# B3slcUSrBmrm1MbfI5qWdcUxghphMIIaXQIBATCBlTB+MQswCQYDVQQGEwJVUzET
# MBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMV
# TWljcm9zb2Z0IENvcnBvcmF0aW9uMSgwJgYDVQQDEx9NaWNyb3NvZnQgQ29kZSBT
# aWduaW5nIFBDQSAyMDEwAhMzAAAFV8+Q3cfRwIiMAAAAAAVXMA0GCWCGSAFlAwQC
# AQUAoIIBBDAZBgkqhkiG9w0BCQMxDAYKKwYBBAGCNwIBBDAcBgorBgEEAYI3AgEL
# MQ4wDAYKKwYBBAGCNwIBFTAvBgkqhkiG9w0BCQQxIgQgPaVw4Rv/1Gi4KctQDY2L
# Xwbs4Pg4kRo1bV1zYCAb2S4wPAYKKwYBBAGCNwoDHDEuDCxzUFk3eFBCN2hUNWc1
# SEhyWXQ4ckRMU005VnVaUnVXWmFlZjJlMjJSczU0PTBaBgorBgEEAYI3AgEMMUww
# SqAkgCIATQBpAGMAcgBvAHMAbwBmAHQAIABXAGkAbgBkAG8AdwBzoSKAIGh0dHA6
# Ly93d3cubWljcm9zb2Z0LmNvbS93aW5kb3dzMA0GCSqGSIb3DQEBAQUABIIBAIRx
# 2++uVOFYZLj0bt//UJWWxOolXK2daQwHtoBLemgPKCGkEz5f4s0DN4rti4dj5TvP
# s8E/2ubHZqvOpyNaLAqNCmMFde3SShbV6HesyOiI2foWZT/RuhLQQapjM6AdPO1x
# liOM9kdpD9HGY5eASm2lfOqxynB53+VGvEktpavY7qnp6g5V1b8dzTPylK7ZkqDQ
# aF7fQOOsb1WGgv9MxpCjCZT69reSx9OfXjwCUnvSZguROcevYU/DCpCyf9BcQ2Zo
# PpDm6sOYotEX+wRCyZpxiBwxboozU1F5EljmHSytR3CEgD1oWLd8E6KpU4Wa+rt1
# Y9yITANOCb2YmkcCo6OhgheUMIIXkAYKKwYBBAGCNwMDATGCF4Awghd8BgkqhkiG
# 9w0BBwKgghdtMIIXaQIBAzEPMA0GCWCGSAFlAwQCAQUAMIIBUgYLKoZIhvcNAQkQ
# AQSgggFBBIIBPTCCATkCAQEGCisGAQQBhFkKAwEwMTANBglghkgBZQMEAgEFAAQg
# OovSbAyN1r2Nni3Wooj27iJzymLzMkH3MSRKcU7jHT0CBmVWx3K3LRgTMjAyMzEx
# MjMxMTU1NDAuNjg2WjAEgAIB9KCB0aSBzjCByzELMAkGA1UEBhMCVVMxEzARBgNV
# BAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jv
# c29mdCBDb3Jwb3JhdGlvbjElMCMGA1UECxMcTWljcm9zb2Z0IEFtZXJpY2EgT3Bl
# cmF0aW9uczEnMCUGA1UECxMeblNoaWVsZCBUU1MgRVNOOjg2MDMtMDVFMC1EOTQ3
# MSUwIwYDVQQDExxNaWNyb3NvZnQgVGltZS1TdGFtcCBTZXJ2aWNloIIR6jCCByAw
# ggUIoAMCAQICEzMAAAHXmw0eVy6MUY4AAQAAAdcwDQYJKoZIhvcNAQELBQAwfDEL
# MAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1v
# bmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEmMCQGA1UEAxMdTWlj
# cm9zb2Z0IFRpbWUtU3RhbXAgUENBIDIwMTAwHhcNMjMwNTI1MTkxMjM3WhcNMjQw
# MjAxMTkxMjM3WjCByzELMAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24x
# EDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlv
# bjElMCMGA1UECxMcTWljcm9zb2Z0IEFtZXJpY2EgT3BlcmF0aW9uczEnMCUGA1UE
# CxMeblNoaWVsZCBUU1MgRVNOOjg2MDMtMDVFMC1EOTQ3MSUwIwYDVQQDExxNaWNy
# b3NvZnQgVGltZS1TdGFtcCBTZXJ2aWNlMIICIjANBgkqhkiG9w0BAQEFAAOCAg8A
# MIICCgKCAgEAxKxgpDdl/1L7jQnH5dMlQTaPiyCMsxuwNdF+ZFYBp6fbPJn+GmbL
# pGbua7y7OzamjRMXMJz7hyFnaepLMI2tWMPUsU1/hNJXqvlgbnCESlnXDLpiAwYC
# xNBG/9/wWPeWbU9V7J52rQRWYa9Li5A4k/R4K0W9dtrJu/2JMjIoBZE9CbqIkj16
# Cy+8GlBPbXiPUDpKI6o0ZXCAuGFTWPtlCATOUKKyjWjnc/7KPkyBeps8V+Z8tlP6
# P4jBVU378JuE/IP2KscMnvpTpmvSivfL+r8Hv4ou9kzE1VsClxXVzsrD/RoqHF7d
# /HLj/XPGhNXh96uBXRk4CjndKxvsYQoLERfBqi0+5OfFaUJyfLvso0Vui6JreUXK
# 6KYH/RB/HuH6A1KFMlOUO4j4MDicWIaCsUYxmZbYQ5qeXsfulOs7/ea3fe9+uvKR
# qQpLtCAeNy/wU8zHAwFeP8bukX3FRcGqzf8iauan2cjLKR+YHGkwlQKLl5EE3PC8
# LX8bYCM+d6jElUfXPYJEp8TOXNbR4IjF9w9hgZ0Gp/ebcvgnU2AAIY4AU3Mo/T+z
# hhDIa95cmmcY694KbOmZqOO1TkyPLbEmB4R7Q/AaQaIN/S+XuP5QyYPzquKxrBSk
# sTF7iEWdRNPHZl+u1zO6pr5tuzvNOAoRJm/gjkfFm+OjBRBM+to7vsUCAwEAAaOC
# AUkwggFFMB0GA1UdDgQWBBSup8C7/VkC9zSMRCcj7iTGejCNjTAfBgNVHSMEGDAW
# gBSfpxVdAF5iXYP05dJlpxtTNRnpcjBfBgNVHR8EWDBWMFSgUqBQhk5odHRwOi8v
# d3d3Lm1pY3Jvc29mdC5jb20vcGtpb3BzL2NybC9NaWNyb3NvZnQlMjBUaW1lLVN0
# YW1wJTIwUENBJTIwMjAxMCgxKS5jcmwwbAYIKwYBBQUHAQEEYDBeMFwGCCsGAQUF
# BzAChlBodHRwOi8vd3d3Lm1pY3Jvc29mdC5jb20vcGtpb3BzL2NlcnRzL01pY3Jv
# c29mdCUyMFRpbWUtU3RhbXAlMjBQQ0ElMjAyMDEwKDEpLmNydDAMBgNVHRMBAf8E
# AjAAMBYGA1UdJQEB/wQMMAoGCCsGAQUFBwMIMA4GA1UdDwEB/wQEAwIHgDANBgkq
# hkiG9w0BAQsFAAOCAgEAUgXd1CfiLL3TAl/iu8ah2uVAbVQtQml2bx0XfrLVtJVw
# P3UzZ3gltExawaCWOfW/X5206Lj0XmpLtpd1+W5obGqOgwkVbqnJoVTwGcklxnqF
# X4+dnCxosmSxMOk0M7ug/vr4zThpkomztChPRnb/IUBEceURtCoK05pPHJHgtVVK
# rnlEBylQhEqkw1Aw/HV0y1gppuh6pkF+v/oCg0l4IMKXO+YYtgGykqOLbpTME31y
# XRncK7Ih45M/J8yFv2dz5zIBhVO+irs2BVdF8h/Q00vwzzvOkS7UIwOWZVRspkz3
# 058O5MaIiyTf8pbjByJB0s6Wibwoql/g59UBkRBJzSGXkXpLy6Lq6j0RCDk5tWyU
# SdOuXPWF+2ydJ2j4sc5ucvGNgfmCCBAIuI1K2jod6BO2uCbyFtxIN6Daj+6oaXe8
# TC8atlpzPlPW6lk3k+FQqKQIV7trhkHsXS6u21nXGMMhBQ4UuGfTdLsN4em4we0u
# DF/eqX2EhFdDChRjim5nwlEu1nppLhamctKDRzz8fnH3TWHkhem4Tjx3bK6NRFXd
# 81iJHQ9RuZBAz5xELRWq7TPB/m7+c1IQFCbPKi87hQHQWUC7ng/V2Xsp40CsBHgM
# +t8QEyAofLTlDNszIEhIVS/B5uOUgen6HrOAUwtGPEmVqL9yGobb8MhxW1KrNWIw
# ggdxMIIFWaADAgECAhMzAAAAFcXna54Cm0mZAAAAAAAVMA0GCSqGSIb3DQEBCwUA
# MIGIMQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMH
# UmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMTIwMAYDVQQD
# EylNaWNyb3NvZnQgUm9vdCBDZXJ0aWZpY2F0ZSBBdXRob3JpdHkgMjAxMDAeFw0y
# MTA5MzAxODIyMjVaFw0zMDA5MzAxODMyMjVaMHwxCzAJBgNVBAYTAlVTMRMwEQYD
# VQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNy
# b3NvZnQgQ29ycG9yYXRpb24xJjAkBgNVBAMTHU1pY3Jvc29mdCBUaW1lLVN0YW1w
# IFBDQSAyMDEwMIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEA5OGmTOe0
# ciELeaLL1yR5vQ7VgtP97pwHB9KpbE51yMo1V/YBf2xK4OK9uT4XYDP/XE/HZveV
# U3Fa4n5KWv64NmeFRiMMtY0Tz3cywBAY6GB9alKDRLemjkZrBxTzxXb1hlDcwUTI
# cVxRMTegCjhuje3XD9gmU3w5YQJ6xKr9cmmvHaus9ja+NSZk2pg7uhp7M62AW36M
# EBydUv626GIl3GoPz130/o5Tz9bshVZN7928jaTjkY+yOSxRnOlwaQ3KNi1wjjHI
# NSi947SHJMPgyY9+tVSP3PoFVZhtaDuaRr3tpK56KTesy+uDRedGbsoy1cCGMFxP
# LOJiss254o2I5JasAUq7vnGpF1tnYN74kpEeHT39IM9zfUGaRnXNxF803RKJ1v2l
# IH1+/NmeRd+2ci/bfV+AutuqfjbsNkz2K26oElHovwUDo9Fzpk03dJQcNIIP8BDy
# t0cY7afomXw/TNuvXsLz1dhzPUNOwTM5TI4CvEJoLhDqhFFG4tG9ahhaYQFzymei
# XtcodgLiMxhy16cg8ML6EgrXY28MyTZki1ugpoMhXV8wdJGUlNi5UPkLiWHzNgY1
# GIRH29wb0f2y1BzFa/ZcUlFdEtsluq9QBXpsxREdcu+N+VLEhReTwDwV2xo3xwgV
# GD94q0W29R6HXtqPnhZyacaue7e3PmriLq0CAwEAAaOCAd0wggHZMBIGCSsGAQQB
# gjcVAQQFAgMBAAEwIwYJKwYBBAGCNxUCBBYEFCqnUv5kxJq+gpE8RjUpzxD/LwTu
# MB0GA1UdDgQWBBSfpxVdAF5iXYP05dJlpxtTNRnpcjBcBgNVHSAEVTBTMFEGDCsG
# AQQBgjdMg30BATBBMD8GCCsGAQUFBwIBFjNodHRwOi8vd3d3Lm1pY3Jvc29mdC5j
# b20vcGtpb3BzL0RvY3MvUmVwb3NpdG9yeS5odG0wEwYDVR0lBAwwCgYIKwYBBQUH
# AwgwGQYJKwYBBAGCNxQCBAweCgBTAHUAYgBDAEEwCwYDVR0PBAQDAgGGMA8GA1Ud
# EwEB/wQFMAMBAf8wHwYDVR0jBBgwFoAU1fZWy4/oolxiaNE9lJBb186aGMQwVgYD
# VR0fBE8wTTBLoEmgR4ZFaHR0cDovL2NybC5taWNyb3NvZnQuY29tL3BraS9jcmwv
# cHJvZHVjdHMvTWljUm9vQ2VyQXV0XzIwMTAtMDYtMjMuY3JsMFoGCCsGAQUFBwEB
# BE4wTDBKBggrBgEFBQcwAoY+aHR0cDovL3d3dy5taWNyb3NvZnQuY29tL3BraS9j
# ZXJ0cy9NaWNSb29DZXJBdXRfMjAxMC0wNi0yMy5jcnQwDQYJKoZIhvcNAQELBQAD
# ggIBAJ1VffwqreEsH2cBMSRb4Z5yS/ypb+pcFLY+TkdkeLEGk5c9MTO1OdfCcTY/
# 2mRsfNB1OW27DzHkwo/7bNGhlBgi7ulmZzpTTd2YurYeeNg2LpypglYAA7AFvono
# aeC6Ce5732pvvinLbtg/SHUB2RjebYIM9W0jVOR4U3UkV7ndn/OOPcbzaN9l9qRW
# qveVtihVJ9AkvUCgvxm2EhIRXT0n4ECWOKz3+SmJw7wXsFSFQrP8DJ6LGYnn8Atq
# gcKBGUIZUnWKNsIdw2FzLixre24/LAl4FOmRsqlb30mjdAy87JGA0j3mSj5mO0+7
# hvoyGtmW9I/2kQH2zsZ0/fZMcm8Qq3UwxTSwethQ/gpY3UA8x1RtnWN0SCyxTkct
# wRQEcb9k+SS+c23Kjgm9swFXSVRk2XPXfx5bRAGOWhmRaw2fpCjcZxkoJLo4S5pu
# +yFUa2pFEUep8beuyOiJXk+d0tBMdrVXVAmxaQFEfnyhYWxz/gq77EFmPWn9y8FB
# SX5+k77L+DvktxW/tM4+pTFRhLy/AsGConsXHRWJjXD+57XQKBqJC4822rpM+Zv/
# Cuk0+CQ1ZyvgDbjmjJnW4SLq8CdCPSWU5nR0W2rRnj7tfqAxM328y+l7vzhwRNGQ
# 8cirOoo6CGJ/2XBjU02N7oJtpQUQwXEGahC0HVUzWLOhcGbyoYIDTTCCAjUCAQEw
# gfmhgdGkgc4wgcsxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAw
# DgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24x
# JTAjBgNVBAsTHE1pY3Jvc29mdCBBbWVyaWNhIE9wZXJhdGlvbnMxJzAlBgNVBAsT
# Hm5TaGllbGQgVFNTIEVTTjo4NjAzLTA1RTAtRDk0NzElMCMGA1UEAxMcTWljcm9z
# b2Z0IFRpbWUtU3RhbXAgU2VydmljZaIjCgEBMAcGBSsOAwIaAxUAMVvbosxt4RGP
# Pbi9rrvl/phv63WggYMwgYCkfjB8MQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2Fz
# aGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENv
# cnBvcmF0aW9uMSYwJAYDVQQDEx1NaWNyb3NvZnQgVGltZS1TdGFtcCBQQ0EgMjAx
# MDANBgkqhkiG9w0BAQsFAAIFAOkJLsUwIhgPMjAyMzExMjMwMTUyMDVaGA8yMDIz
# MTEyNDAxNTIwNVowdDA6BgorBgEEAYRZCgQBMSwwKjAKAgUA6QkuxQIBADAHAgEA
# AgIeVDAHAgEAAgITsTAKAgUA6QqARQIBADA2BgorBgEEAYRZCgQCMSgwJjAMBgor
# BgEEAYRZCgMCoAowCAIBAAIDB6EgoQowCAIBAAIDAYagMA0GCSqGSIb3DQEBCwUA
# A4IBAQCo64BMPkIH+EQ8Blvyjy0VLvojczzcRSWjqGbzIK8Bh5t0OPHgbmfNbchH
# iCrHOMuZYVZRF00Q6mAhvuDm3iCdBDvD+JON6yZ50kss5s+ij8ZzOyvgW/6vNFq4
# VI8y17NAmuotfteZ8yRjPVuu63rS0V0yRl6Tdv4TdHjXNzMZodJI21PKvhQ7xLKo
# jACgY4B8UPKTr0xfJwGGMADvzSzkx7bPkzsDksCPzC/O74b44g6a7MYZJJsqy+rd
# DKn8U9Pg8cHyyzOAxM7JZzhaiyKDqVa1VpONfe1Yhe5J6wKc1L+Od96ARtzdUidj
# SYnBG7gS9zfT/hReoP0KWWTS3BtSMYIEDTCCBAkCAQEwgZMwfDELMAkGA1UEBhMC
# VVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNV
# BAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEmMCQGA1UEAxMdTWljcm9zb2Z0IFRp
# bWUtU3RhbXAgUENBIDIwMTACEzMAAAHXmw0eVy6MUY4AAQAAAdcwDQYJYIZIAWUD
# BAIBBQCgggFKMBoGCSqGSIb3DQEJAzENBgsqhkiG9w0BCRABBDAvBgkqhkiG9w0B
# CQQxIgQgNnroO9TtplawVvAB39MJDOKlUlbM6XMGnLaGLJo2PoAwgfoGCyqGSIb3
# DQEJEAIvMYHqMIHnMIHkMIG9BCCc3j5eS159T4qjY8fGDe0zdWSNHdWV/9s0XZyP
# e6yaOzCBmDCBgKR+MHwxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9u
# MRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRp
# b24xJjAkBgNVBAMTHU1pY3Jvc29mdCBUaW1lLVN0YW1wIFBDQSAyMDEwAhMzAAAB
# 15sNHlcujFGOAAEAAAHXMCIEIOmLNG8LfQlD93C0kVwq7VLXPWsFdSbKAji1AVWa
# JVoqMA0GCSqGSIb3DQEBCwUABIICAGOSEfbBIw0MuIB4eIYcqMmW3lj8QxByLK4C
# 4jFGdDMEt/yqgbfy+9wOMf1V8NIHgM2bzJl8QL26M0fW2PSsICW+dQH0S/Go0+Y7
# AXVdp8t2NbEq35R2YVxemUzZ9yVq6c5D4l/sy2/vrT0soTQ0KX9ECek7dRrT9Zcc
# GZpuqng62pWCwjGJ1FrXFXIy03ssA6aDPZATWp+nH0dLEf7ezkQakwGyCIMa+Lx3
# 24kcuWM88nbSzeZHWo+uOh6FkTi6xGSypND1uBxPyudO1202VtcGq1Mm1PImlCR/
# 8kpOz+aLjUaIqamT8TwOUG0GbAOQhRd1zez9KPpm+7vM4IjTYtm/CthN28Jv26NF
# U90gFSIxo1GOh9DH2/r6mZTe3FWWk1bd1jKMvK12V5Ywpu18bvu6Oai3KG1byiHx
# UKFahskYHpOh+PrhxciridhFulxFjwBshP0AmzeKLNpejvV3VmWBbWa0MsIfau3G
# nzxjrE8a0L2/BkCzxBWa5BX6iAmNqbmGanlmq8uCyZg8W8bILvXoMHBsZLVeV6Of
# YnXTmjjOVA6/bMPlaogAPnuQHtxKmlRRLfImRDKo6WYICDuyX534dzRsXeVRzIgJ
# nFwewwMe2W7VjRjaS7vXA59aXM1cDVF7FpwV4oOg5IjYmixmg30m5zzg0RV7WlJ+
# xR109S4v
# SIG # End signature block
