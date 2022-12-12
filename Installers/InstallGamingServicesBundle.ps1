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

    $isOldPackagePresent = (([Version]$package.Version -lt [Version]'7.70.13002.0') -or ([Version]$package.Version -eq [Version]'1.43.2002.0'));

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
    Write-Output "Installing $AppxPath Version 7.70.13002.0 Volume $systemRoot";

    $allDepsFound = $TRUE;
    [string[]]$depPackageNames = 'Microsoft.NET.Native.Runtime.2.2', 'Microsoft.NET.Native.Framework.2.2', 'Microsoft.VCLibs.x64.14.00';
    $dependencyPaths = $depPackageNames | ForEach-Object { Join-Path -Path $AppxDepDirPath -ChildPath "$_.appx" };
    ForEach ($dep in $dependencyPaths) { if (-not (test-path $dep)) { $allDepsFound = $FALSE; } };

    if ($allDepsFound) {
        Write-Output "Installing $AppxPath Version 7.70.13002.0 Volume $systemRoot -DependencyPath $dependencyPaths";
        add-appxpackage -forceApplicationShutdown -path $AppxPath -Volume $systemRoot -DependencyPath $dependencyPaths -ErrorAction Continue;
    }
    else {
        Write-Output "Installing $AppxPath Version 7.70.13002.0 Volume $systemRoot";
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
# MIIl2wYJKoZIhvcNAQcCoIIlzDCCJcgCAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCAk2aARinSYaR9F
# 0+P4vX1h72F41UH/6MHR4xwacB7GO6CCC2cwggTvMIID16ADAgECAhMzAAAEjwu5
# fN96/0pXAAAAAASPMA0GCSqGSIb3DQEBCwUAMH4xCzAJBgNVBAYTAlVTMRMwEQYD
# VQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNy
# b3NvZnQgQ29ycG9yYXRpb24xKDAmBgNVBAMTH01pY3Jvc29mdCBDb2RlIFNpZ25p
# bmcgUENBIDIwMTAwHhcNMjIwNTEyMjA0NzA0WhcNMjMwNTExMjA0NzA0WjB0MQsw
# CQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9u
# ZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMR4wHAYDVQQDExVNaWNy
# b3NvZnQgQ29ycG9yYXRpb24wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIB
# AQCsWDojiwUxmSwFEoscaQ92miUNUYO9keXg7774ZlOsLcsRqdHRgtAgs7dY88jC
# 8m0oh1iMIih2PxZbXOiX0IYi4IFT36I3JgL9XBHg1wFKhFfvclCjGGQr1SaVXpqV
# pEjsEtclTrJdeD5z7PVMVsyyYENkzRzvpwiMDT8H5QSXhQ0/LVbudH3ktar7pVsw
# StesaEvmru5bwc8IeK7U/H9RFsBMItRcWEn/vNeARbdEbCrCJuXCn2uc8JyyYqJe
# LpIl2kRsyFyn4VkcatIRQq+ZMbHR54SWRHILC0gmHP4jMiZwf4Y5xJy4rweaJd0X
# tXxaza1vXuH/XhgZ+TiS9OW7AgMBAAGjggFuMIIBajAfBgNVHSUEGDAWBgorBgEE
# AYI3PQYBBggrBgEFBQcDAzAdBgNVHQ4EFgQU2Owd9uICeqYNy7oGqCHvtD2d7s0w
# RQYDVR0RBD4wPKQ6MDgxHjAcBgNVBAsTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEW
# MBQGA1UEBRMNMjMwODY1KzQ3MDU2MTAfBgNVHSMEGDAWgBTm/F97uyIAWORyTrX0
# IXQjMubvrDBWBgNVHR8ETzBNMEugSaBHhkVodHRwOi8vY3JsLm1pY3Jvc29mdC5j
# b20vcGtpL2NybC9wcm9kdWN0cy9NaWNDb2RTaWdQQ0FfMjAxMC0wNy0wNi5jcmww
# WgYIKwYBBQUHAQEETjBMMEoGCCsGAQUFBzAChj5odHRwOi8vd3d3Lm1pY3Jvc29m
# dC5jb20vcGtpL2NlcnRzL01pY0NvZFNpZ1BDQV8yMDEwLTA3LTA2LmNydDAMBgNV
# HRMBAf8EAjAAMA0GCSqGSIb3DQEBCwUAA4IBAQCmXL0nHCVpXdMLll0PU9Ktr15N
# CNiyu7m0tU84RxclAxI/lR9l7Z0DNX+3IdPxqz9cPZwrhgpmYdbdbkt1DORo9L6s
# XhbsvmrKUZaAqVk3UYQzP3Ti+jVjmkD3Q9+RJO2HxShF/TfrzYRktTEUwy/Mh0De
# I20+dinhvSf9zBlJ/xinETXAWiqLTEou1E3ef+7ss2aGUw6/d4n3JTRQ9ScQcYSk
# UiC2VqCYVpGWUe7U+iM9IFgDQF5oYrz1TxCarEvklGBfGb6hRMs0FkxlX3Vbo9zN
# vvvysPA0XlOuMfIZfHVpGrM1wcRT5rraA7lTebP9wjUuv1WpTxbc2f0whnSoMIIG
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
# B3slcUSrBmrm1MbfI5qWdcUxghnKMIIZxgIBATCBlTB+MQswCQYDVQQGEwJVUzET
# MBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMV
# TWljcm9zb2Z0IENvcnBvcmF0aW9uMSgwJgYDVQQDEx9NaWNyb3NvZnQgQ29kZSBT
# aWduaW5nIFBDQSAyMDEwAhMzAAAEjwu5fN96/0pXAAAAAASPMA0GCWCGSAFlAwQC
# AQUAoIIBBDAZBgkqhkiG9w0BCQMxDAYKKwYBBAGCNwIBBDAcBgorBgEEAYI3AgEL
# MQ4wDAYKKwYBBAGCNwIBFTAvBgkqhkiG9w0BCQQxIgQgGCx+TAa9Xw/0QhY0UWkG
# 2yKtwohVKBrps0091PoFYk0wPAYKKwYBBAGCNwoDHDEuDCxzUFk3eFBCN2hUNWc1
# SEhyWXQ4ckRMU005VnVaUnVXWmFlZjJlMjJSczU0PTBaBgorBgEEAYI3AgEMMUww
# SqAkgCIATQBpAGMAcgBvAHMAbwBmAHQAIABXAGkAbgBkAG8AdwBzoSKAIGh0dHA6
# Ly93d3cubWljcm9zb2Z0LmNvbS93aW5kb3dzMA0GCSqGSIb3DQEBAQUABIIBAGJn
# yPwvYzFk3C2dl13fqzoabO2NLjfPlMjCQJuyHq9CLKA96v3cBtQYtj8lk/V9RMpb
# uQrb3AYZGfcTOT0z5KVwqjjPY9mASQRajZ82VxYmX/j4HgMIO06WAopTtIehtEXQ
# jo//NHchyQx2EUeeeXsp5qX5eWor4tiXHY1iF1NF1ybMybWf3GHVGjaZxwSbDL8l
# VkjCFkeqE1XQRKaPsrCA7eiyoGIDQ+s6cxi5l49j5blhd6r9e5x+7sBIvbiahFLL
# 5HoW5d9yXMQCh4sM7GiHUSJefcmbZ3EhQeN0wNmsnvPWypEW05jXh9W8/QgvJMz3
# A03zgq+rraLf47JSQg2hghb9MIIW+QYKKwYBBAGCNwMDATGCFukwghblBgkqhkiG
# 9w0BBwKgghbWMIIW0gIBAzEPMA0GCWCGSAFlAwQCAQUAMIIBUQYLKoZIhvcNAQkQ
# AQSgggFABIIBPDCCATgCAQEGCisGAQQBhFkKAwEwMTANBglghkgBZQMEAgEFAAQg
# xfAdz0g3MBmLc9O3LaVfZNPGDKzcbj+Q8cz9GTZEuAcCBmNs9wkH5BgTMjAyMjEy
# MDgwMzMxNDAuNzQ3WjAEgAIB9KCB0KSBzTCByjELMAkGA1UEBhMCVVMxEzARBgNV
# BAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jv
# c29mdCBDb3Jwb3JhdGlvbjElMCMGA1UECxMcTWljcm9zb2Z0IEFtZXJpY2EgT3Bl
# cmF0aW9uczEmMCQGA1UECxMdVGhhbGVzIFRTUyBFU046RDZCRC1FM0U3LTE2ODUx
# JTAjBgNVBAMTHE1pY3Jvc29mdCBUaW1lLVN0YW1wIFNlcnZpY2WgghFUMIIHDDCC
# BPSgAwIBAgITMwAAAcf7AKBKW/In3AABAAABxzANBgkqhkiG9w0BAQsFADB8MQsw
# CQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9u
# ZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMSYwJAYDVQQDEx1NaWNy
# b3NvZnQgVGltZS1TdGFtcCBQQ0EgMjAxMDAeFw0yMjExMDQxOTAxMzVaFw0yNDAy
# MDIxOTAxMzVaMIHKMQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQ
# MA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9u
# MSUwIwYDVQQLExxNaWNyb3NvZnQgQW1lcmljYSBPcGVyYXRpb25zMSYwJAYDVQQL
# Ex1UaGFsZXMgVFNTIEVTTjpENkJELUUzRTctMTY4NTElMCMGA1UEAxMcTWljcm9z
# b2Z0IFRpbWUtU3RhbXAgU2VydmljZTCCAiIwDQYJKoZIhvcNAQEBBQADggIPADCC
# AgoCggIBAK9C3FbZ2rTRTAa0E7RvT/CEgD8shpsTX4RM2jlZbdPPKQVBQCGrJjf3
# jooxOlHGn93Nm1Zzf9NoodLJkqmJJuT92cFO2VttNm+nDwyY13K4yY9Kn57nHAbR
# N1lNL2fAokA+6qysXhfGATXEvj1bb7KoXeWFugMIVqoY8NZmLi3rReW+mj4n/90c
# 5cqht0le0D4kiXp3bO4BuN+UbMtRyeF56s7TiUeNSNI9xENOSTBeUDUYu5E+r100
# /jB1Y9uxVUO23n/1PthAGxY9l9gDlm74JWGmJzN5vyPzlgx1IBsPCiHbA4d1tXrr
# Jxdg+6HpxoLWobPktRuVKJX+REoP/Wft/K4UMC4KJGOZOqfJOWq2FrbM3SSuiYiE
# ZfONx++JO/kKpU9i2wED6vIr0L9IHXJVtmibp9Sq1vr+dkd7wBwjrW1Jsbw9XjRh
# 6hqi2oLZavVBVyl7l56lyaq7gmJn8HRTA9FD+ootZRXXii/Oz3Y3QMMgolXAhKC5
# 7w88r4zY8bZE3c+keMhdTf1+D0kB+BZYLJcgSF4IGkpT7bz7sQLbmnPyE4+JNCEU
# oRomCwTNg8OqHrCzqMXtOzlDzvql1znCTFR4RNDJYYZ8XzdgdSVhT1sEOqKFoqgD
# kA6s3A8fu/bIcQNQsdCu9HjgaZTKINu4GKC6Qb+50c+LR6qE8rwNAgMBAAGjggE2
# MIIBMjAdBgNVHQ4EFgQUBVDS3Rw+wQBf1VP1/3hBy4lEkiAwHwYDVR0jBBgwFoAU
# n6cVXQBeYl2D9OXSZacbUzUZ6XIwXwYDVR0fBFgwVjBUoFKgUIZOaHR0cDovL3d3
# dy5taWNyb3NvZnQuY29tL3BraW9wcy9jcmwvTWljcm9zb2Z0JTIwVGltZS1TdGFt
# cCUyMFBDQSUyMDIwMTAoMSkuY3JsMGwGCCsGAQUFBwEBBGAwXjBcBggrBgEFBQcw
# AoZQaHR0cDovL3d3dy5taWNyb3NvZnQuY29tL3BraW9wcy9jZXJ0cy9NaWNyb3Nv
# ZnQlMjBUaW1lLVN0YW1wJTIwUENBJTIwMjAxMCgxKS5jcnQwDAYDVR0TAQH/BAIw
# ADATBgNVHSUEDDAKBggrBgEFBQcDCDANBgkqhkiG9w0BAQsFAAOCAgEA0MuXPKID
# 9MvMQLC1XGtO8FstZk/p6mIABZ89ve9pDTviiewBOH/klW7zp5Hnrjj6t8XPuk0v
# INxbiimBMGKr50R8V+fLY5bHGbGXip7u3xjVJaTU/WzkBR1gC1EbqF6fEyx4cY9z
# xKvY8xWAT9mDTC6Je9KI2Naqc3t5zDCX6Xbq3QQaWji5SZkTUy4cXfkSRiUG2NVw
# HMeqfxYoMKgWrEg1MaftMhTxAQfbgRNyiCwLaun3MxqeBDHqJ+mJpMghgLVzCgxU
# EIHT/yE3u1YIQFWz01ZT94WNXRYHPrfGCtqGxUhVSrJZAEgEwx7pQjIbflqyLLpH
# JRFD/Q2jJqau0tESzgzInCOj7aqhjoXZ2kZbQNHfln/tLT7fUlFbazycju1jDym8
# pAkV85hytOs69JJ9WIlGDVwrDoGhxeSJjtmcEOeFBNSOeY41HZXco8v1DyYMUZvT
# cl3ju2nWK/CvH+kNpzxdL1qhRu3sMGgJeQpSnq87IX4QfM7o1UdHdUWu2dNZZ12I
# Vrj6lWWshZeyR6+ouoboaVOgUOv1YGNHAYpLF+JjTPiEmPNU9UWLe31gEzbv85Iy
# DXM4qc234OUvt3wgKPIFQevugOS9LwYN/XbBSE7+jFibkPGWcu38JRQWROHeSBW0
# bnWpDcChncixjNqLWjau8Jt5Lu8eNVBgJpAwggdxMIIFWaADAgECAhMzAAAAFcXn
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
# wXEGahC0HVUzWLOhcGbyoYICyzCCAjQCAQEwgfihgdCkgc0wgcoxCzAJBgNVBAYT
# AlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYD
# VQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xJTAjBgNVBAsTHE1pY3Jvc29mdCBB
# bWVyaWNhIE9wZXJhdGlvbnMxJjAkBgNVBAsTHVRoYWxlcyBUU1MgRVNOOkQ2QkQt
# RTNFNy0xNjg1MSUwIwYDVQQDExxNaWNyb3NvZnQgVGltZS1TdGFtcCBTZXJ2aWNl
# oiMKAQEwBwYFKw4DAhoDFQDiAEj9CUm7+Udt8MXIkIrx8nJGKKCBgzCBgKR+MHwx
# CzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRt
# b25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xJjAkBgNVBAMTHU1p
# Y3Jvc29mdCBUaW1lLVN0YW1wIFBDQSAyMDEwMA0GCSqGSIb3DQEBBQUAAgUA5zu1
# CzAiGA8yMDIyMTIwODA4NTc0N1oYDzIwMjIxMjA5MDg1NzQ3WjB0MDoGCisGAQQB
# hFkKBAExLDAqMAoCBQDnO7ULAgEAMAcCAQACAgIFMAcCAQACAhIfMAoCBQDnPQaL
# AgEAMDYGCisGAQQBhFkKBAIxKDAmMAwGCisGAQQBhFkKAwKgCjAIAgEAAgMHoSCh
# CjAIAgEAAgMBhqAwDQYJKoZIhvcNAQEFBQADgYEAFcPpHccS+U5olC4QsShtIe7A
# 5IlwW8Cah0sDl0SMVU1pEwwFIDvy/jCZwDyiIAAfxCbQBxLn1CXn3L25EI5NQH+V
# OfA6cUC5lIEk/BmliIvP4/lM6ZbEZssS8P9kIk/l2lA7iqezjBDeBJQ06ELj2pY0
# kvsUrAqted+UDGqBZSYxggQNMIIECQIBATCBkzB8MQswCQYDVQQGEwJVUzETMBEG
# A1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWlj
# cm9zb2Z0IENvcnBvcmF0aW9uMSYwJAYDVQQDEx1NaWNyb3NvZnQgVGltZS1TdGFt
# cCBQQ0EgMjAxMAITMwAAAcf7AKBKW/In3AABAAABxzANBglghkgBZQMEAgEFAKCC
# AUowGgYJKoZIhvcNAQkDMQ0GCyqGSIb3DQEJEAEEMC8GCSqGSIb3DQEJBDEiBCAb
# FiHHAOeWJnBlp9hxOGc6xb7j4Ka5+gx/le25ubUzSTCB+gYLKoZIhvcNAQkQAi8x
# geowgecwgeQwgb0EIEfn5dviUrJFCznlWC23jIJOx3SG0RJgLI8LXMujCZLJMIGY
# MIGApH4wfDELMAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNV
# BAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEmMCQG
# A1UEAxMdTWljcm9zb2Z0IFRpbWUtU3RhbXAgUENBIDIwMTACEzMAAAHH+wCgSlvy
# J9wAAQAAAccwIgQg0aNTZzVa52d3ZmCtQE2OwisbpI5q3kym3qpmBqpQENcwDQYJ
# KoZIhvcNAQELBQAEggIAYVcA0dFwU1cXXVOhTKopI/hriAV7suntFn267yZKjTi7
# hvHbICl7/vDCO5EHLleCFl7nYx9ap/nPOtZBDIFSzwJfqgHTkJiTN24mcImFeXwm
# kyDvpPlZSFhxpcpew/hofuOxjS4U35KGmEMB8Q2l6BESYBw4odUEsWXI/VKU76cG
# Y+GVICIS1qQKtNFSm/pAdVlw2LNmsy2BQGUNbAjZKvD4HJYnRSF2+ytA2ZuU7+mS
# Z+TYoGOto4nX4o9/BYDEcxqoV5EqA+opD46jS2+xUCsLu4NkpLFFpRaK44Ml1A3e
# POLR1KvlnX1Ppw0PditsuQpvQ3XYIj0PDTXZsVNv6ae4G0WV2vFAdWVu5FqLUcPG
# qiCMos0UfikiDOIXNo4xOJA4UANzR4sMLjMOu/FY4uivI4mQ7+YNAL4NumXcwf04
# OHFA2r5j0g9+a17NjUX7Xa/FobwSiHEs4Ow9PG1JR+SbbyGnk44jo5I7iXeHNzra
# P+kIgzqWFvnP5dA+EI3a+68f9yJn6VhyGDnh3vG5tlZkSuC83pmU7+eIiVnoz6e/
# s1P7VDqvkE6ZiKcTomeZIKRaRfUUcViBc1LJZ3nFMOIPW1GbFQSPckmvkAyAo4h1
# IfS/FKEnkp2VNJZm6ScNUwJDlMH6hqK7UWwDqa0n+Ft39sFIJ9JzqbEKArYZzGk=
# SIG # End signature block
