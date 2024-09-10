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

    $isOldPackagePresent = (([Version]$package.Version -lt [Version]'19.87.13001.0') -or ([Version]$package.Version -eq [Version]'1.43.2002.0'));

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
    Write-Output "Installing $AppxPath Version 19.87.13001.0 Volume $systemRoot";

    $allDepsFound = $TRUE;
    [string[]]$depPackageNames = 'Microsoft.NET.Native.Runtime.2.2', 'Microsoft.NET.Native.Framework.2.2', 'Microsoft.VCLibs.x64.14.00';
    $dependencyPaths = $depPackageNames | ForEach-Object { Join-Path -Path $AppxDepDirPath -ChildPath "$_.appx" };
    ForEach ($dep in $dependencyPaths) { if (-not (test-path $dep)) { $allDepsFound = $FALSE; } };

    if ($allDepsFound) {
        Write-Output "Installing $AppxPath Version 19.87.13001.0 Volume $systemRoot -DependencyPath $dependencyPaths";
        add-appxpackage -forceApplicationShutdown -path $AppxPath -Volume $systemRoot -DependencyPath $dependencyPaths -ErrorAction Continue;
    }
    else {
        Write-Output "Installing $AppxPath Version 19.87.13001.0 Volume $systemRoot";
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
# MIImiwYJKoZIhvcNAQcCoIImfDCCJngCAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCAI351rPPV4btGZ
# Gfuis7ZV3AIiimevkjZiTJOqkQPaeKCCC2cwggTvMIID16ADAgECAhMzAAAFV8+Q
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
# B3slcUSrBmrm1MbfI5qWdcUxghp6MIIadgIBATCBlTB+MQswCQYDVQQGEwJVUzET
# MBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMV
# TWljcm9zb2Z0IENvcnBvcmF0aW9uMSgwJgYDVQQDEx9NaWNyb3NvZnQgQ29kZSBT
# aWduaW5nIFBDQSAyMDEwAhMzAAAFV8+Q3cfRwIiMAAAAAAVXMA0GCWCGSAFlAwQC
# AQUAoIIBBDAZBgkqhkiG9w0BCQMxDAYKKwYBBAGCNwIBBDAcBgorBgEEAYI3AgEL
# MQ4wDAYKKwYBBAGCNwIBFTAvBgkqhkiG9w0BCQQxIgQg+r33narhg6fKq+hs3dDu
# rZejDnJ1V12rawo20SV2X7UwPAYKKwYBBAGCNwoDHDEuDCxzUFk3eFBCN2hUNWc1
# SEhyWXQ4ckRMU005VnVaUnVXWmFlZjJlMjJSczU0PTBaBgorBgEEAYI3AgEMMUww
# SqAkgCIATQBpAGMAcgBvAHMAbwBmAHQAIABXAGkAbgBkAG8AdwBzoSKAIGh0dHA6
# Ly93d3cubWljcm9zb2Z0LmNvbS93aW5kb3dzMA0GCSqGSIb3DQEBAQUABIIBACjs
# o+miX65XKH4jD/Rn+hTL+sR0Baw4rwLo6cB+L1rSlY05JnbGsTLwW3WwfHlftGhM
# zAba5chly+bzEhjrJ9v+xdZ8zXplXNX1fVqeZz+B41hwOnq5F2y8FF201UdcsYIf
# 3mMhDf+lblaWYFttbiTHmAYxHwmTBmxkGeLJnKpEEfgpdfyy36zsdrbWa3QxUhxg
# Wg4Mvh4+EQF/VmHRyDU7iavQlSene3b2ns4VM9LBe6ieRZhzwHoDEtV4nXpLLF7J
# ZpucCZhzXfaTEDXsm1Y7KHpKFs1R+GqVjd1xWesm004jBO4FHM5OdEob+btGcVD8
# ZTEGEnf1cJ4wVGBpSs+hghetMIIXqQYKKwYBBAGCNwMDATGCF5kwgheVBgkqhkiG
# 9w0BBwKggheGMIIXggIBAzEPMA0GCWCGSAFlAwQCAQUAMIIBWgYLKoZIhvcNAQkQ
# AQSgggFJBIIBRTCCAUECAQEGCisGAQQBhFkKAwEwMTANBglghkgBZQMEAgEFAAQg
# oKkxPCEUUFzBSPpO2AbJ0g4lz3avQ4AaxGTA9bqPtn4CBmbGlhV1sxgTMjAyNDA5
# MDcxMjQyMDguNTY1WjAEgAIB9KCB2aSB1jCB0zELMAkGA1UEBhMCVVMxEzARBgNV
# BAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jv
# c29mdCBDb3Jwb3JhdGlvbjEtMCsGA1UECxMkTWljcm9zb2Z0IElyZWxhbmQgT3Bl
# cmF0aW9ucyBMaW1pdGVkMScwJQYDVQQLEx5uU2hpZWxkIFRTUyBFU046NkYxQS0w
# NUUwLUQ5NDcxJTAjBgNVBAMTHE1pY3Jvc29mdCBUaW1lLVN0YW1wIFNlcnZpY2Wg
# ghH7MIIHKDCCBRCgAwIBAgITMwAAAfwYoK/MaVqHOgABAAAB/DANBgkqhkiG9w0B
# AQsFADB8MQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UE
# BxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMSYwJAYD
# VQQDEx1NaWNyb3NvZnQgVGltZS1TdGFtcCBQQ0EgMjAxMDAeFw0yNDA3MjUxODMx
# MTRaFw0yNTEwMjIxODMxMTRaMIHTMQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2Fz
# aGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENv
# cnBvcmF0aW9uMS0wKwYDVQQLEyRNaWNyb3NvZnQgSXJlbGFuZCBPcGVyYXRpb25z
# IExpbWl0ZWQxJzAlBgNVBAsTHm5TaGllbGQgVFNTIEVTTjo2RjFBLTA1RTAtRDk0
# NzElMCMGA1UEAxMcTWljcm9zb2Z0IFRpbWUtU3RhbXAgU2VydmljZTCCAiIwDQYJ
# KoZIhvcNAQEBBQADggIPADCCAgoCggIBAKdQwCi8aW0HD1WDx5SR8lu1uZQWYyVl
# g4zH5eVsobgMpT/yw5toW+MplJkspldBBUUHJjPAcqcI4Vj/Be8eIjvPHfvRmfTE
# JjYd40g6IYV14H/KzjRAMnwj1ZiczO8rbLq2fcaHG7hC+/j+xJCMKDrjBZUxdhv8
# 7qsdRPsADbJaT6j6W/DwuegUMYCQiNSzheZZNwHjye/Di92sPzXZZL3VZd1YAUj1
# +DWsLd1IFKH7j5/3Kfb8CigcLiFkBBWfN+xl1yE7IXdjH7OqGH8VxLZo9kgRhIcV
# bO8REblhm9HCumn8u52ipG2SNr9VKrMbmbfeK5/3stsp77p5cdEev2+pzZAtazkw
# H1pabAI/0Jc8jOrmE0sWGQtmFsy220ZdJUbUs/uE3aVFP6AGUgfmPrNdkapoM4u0
# VcTXCNpZv/7AhJugOt5wiQoGLTPiy3vaU7IZf1n/Djrj0EYgPrLU7IPPQThvbW5W
# s9pH3jpGH+YXR/KYQG7jrg0H6+rOWGulvr2c+hNGbHp84tDrTH+UQmtoQA2FYFMQ
# /oKwvBKbX1nlQFoGAmkBYXjTf2RjUDJJO/Fet8qDwX3yRALvgecZUz2KIo1HaPTV
# 6LyZqBl4+kfE4LKPkD2gBhysQmx2tUC/QEjBdzrNY66IAhxospH6dXShp5gOcCU+
# jcewXnZUg7AJAgMBAAGjggFJMIIBRTAdBgNVHQ4EFgQUmPGlK7FGs4cQch+/XYYk
# Ai/+0HYwHwYDVR0jBBgwFoAUn6cVXQBeYl2D9OXSZacbUzUZ6XIwXwYDVR0fBFgw
# VjBUoFKgUIZOaHR0cDovL3d3dy5taWNyb3NvZnQuY29tL3BraW9wcy9jcmwvTWlj
# cm9zb2Z0JTIwVGltZS1TdGFtcCUyMFBDQSUyMDIwMTAoMSkuY3JsMGwGCCsGAQUF
# BwEBBGAwXjBcBggrBgEFBQcwAoZQaHR0cDovL3d3dy5taWNyb3NvZnQuY29tL3Br
# aW9wcy9jZXJ0cy9NaWNyb3NvZnQlMjBUaW1lLVN0YW1wJTIwUENBJTIwMjAxMCgx
# KS5jcnQwDAYDVR0TAQH/BAIwADAWBgNVHSUBAf8EDDAKBggrBgEFBQcDCDAOBgNV
# HQ8BAf8EBAMCB4AwDQYJKoZIhvcNAQELBQADggIBAE+7LP2QGdG02hbK7IiWHf/y
# 0OiJim/SWUiokcPcbPIcJOWP+84oJ/YBrcHkQoQtpSfBlUR4KxZAcQAo7rj6a0s/
# 1GF+5+dtiSnLnZ1riHhNad9AWa6j0zp7HA/fA2YuljUwMpp2ku4reagIDSJ63gCW
# 01NnAKLCaHlwB6+dGIEhpZiTPnDepmCwC+k0xTLRWCa6SvUzOUcoeXmZpulEyZxo
# NI7daRf9rvD0nc93Q8uwxeygyWndqh8WTkbzN5PVfGJ9ySOWCz7i7KNiebN36V8g
# lYEf4avOoOc43fW0UcsogvIiyJvzfeauh1lbAnsknra6n7A8mFkrcC/eocuwyMiy
# +YofGBTHdAHZr00aMpZgA7isBNk0Ak7z545y5O8qSVtvbde2MmuFfiZc+eLAZz1O
# 5CHmGbL1E/mCoMpD9UAfqfrlHUR+nu/VWos/onsFqyCWeLV5AzJi9tZ4dI/ufBNX
# nAGA70+geMhSHqJ8QP+hpfV7OyS3IjwiAuoRnZYohAacmHlBdKIWRZ+zSkLvNCGd
# I3eddVgNm6usfWlKv8xcn/BIMPnbp1I9SrTaFqau1biamqXJGLJr5pmB2VwoytRL
# rO1dSPml46wWLqsjPUKXhWVOFNNWBteblsFAmo9LmZWof0RkmDHfOMvQwqjqX3ih
# OjyzJO4S54b3DkK58T+pMIIHcTCCBVmgAwIBAgITMwAAABXF52ueAptJmQAAAAAA
# FTANBgkqhkiG9w0BAQsFADCBiDELMAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hp
# bmd0b24xEDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jw
# b3JhdGlvbjEyMDAGA1UEAxMpTWljcm9zb2Z0IFJvb3QgQ2VydGlmaWNhdGUgQXV0
# aG9yaXR5IDIwMTAwHhcNMjEwOTMwMTgyMjI1WhcNMzAwOTMwMTgzMjI1WjB8MQsw
# CQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9u
# ZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMSYwJAYDVQQDEx1NaWNy
# b3NvZnQgVGltZS1TdGFtcCBQQ0EgMjAxMDCCAiIwDQYJKoZIhvcNAQEBBQADggIP
# ADCCAgoCggIBAOThpkzntHIhC3miy9ckeb0O1YLT/e6cBwfSqWxOdcjKNVf2AX9s
# SuDivbk+F2Az/1xPx2b3lVNxWuJ+Slr+uDZnhUYjDLWNE893MsAQGOhgfWpSg0S3
# po5GawcU88V29YZQ3MFEyHFcUTE3oAo4bo3t1w/YJlN8OWECesSq/XJprx2rrPY2
# vjUmZNqYO7oaezOtgFt+jBAcnVL+tuhiJdxqD89d9P6OU8/W7IVWTe/dvI2k45GP
# sjksUZzpcGkNyjYtcI4xyDUoveO0hyTD4MmPfrVUj9z6BVWYbWg7mka97aSueik3
# rMvrg0XnRm7KMtXAhjBcTyziYrLNueKNiOSWrAFKu75xqRdbZ2De+JKRHh09/SDP
# c31BmkZ1zcRfNN0Sidb9pSB9fvzZnkXftnIv231fgLrbqn427DZM9ituqBJR6L8F
# A6PRc6ZNN3SUHDSCD/AQ8rdHGO2n6Jl8P0zbr17C89XYcz1DTsEzOUyOArxCaC4Q
# 6oRRRuLRvWoYWmEBc8pnol7XKHYC4jMYctenIPDC+hIK12NvDMk2ZItboKaDIV1f
# MHSRlJTYuVD5C4lh8zYGNRiER9vcG9H9stQcxWv2XFJRXRLbJbqvUAV6bMURHXLv
# jflSxIUXk8A8FdsaN8cIFRg/eKtFtvUeh17aj54WcmnGrnu3tz5q4i6tAgMBAAGj
# ggHdMIIB2TASBgkrBgEEAYI3FQEEBQIDAQABMCMGCSsGAQQBgjcVAgQWBBQqp1L+
# ZMSavoKRPEY1Kc8Q/y8E7jAdBgNVHQ4EFgQUn6cVXQBeYl2D9OXSZacbUzUZ6XIw
# XAYDVR0gBFUwUzBRBgwrBgEEAYI3TIN9AQEwQTA/BggrBgEFBQcCARYzaHR0cDov
# L3d3dy5taWNyb3NvZnQuY29tL3BraW9wcy9Eb2NzL1JlcG9zaXRvcnkuaHRtMBMG
# A1UdJQQMMAoGCCsGAQUFBwMIMBkGCSsGAQQBgjcUAgQMHgoAUwB1AGIAQwBBMAsG
# A1UdDwQEAwIBhjAPBgNVHRMBAf8EBTADAQH/MB8GA1UdIwQYMBaAFNX2VsuP6KJc
# YmjRPZSQW9fOmhjEMFYGA1UdHwRPME0wS6BJoEeGRWh0dHA6Ly9jcmwubWljcm9z
# b2Z0LmNvbS9wa2kvY3JsL3Byb2R1Y3RzL01pY1Jvb0NlckF1dF8yMDEwLTA2LTIz
# LmNybDBaBggrBgEFBQcBAQROMEwwSgYIKwYBBQUHMAKGPmh0dHA6Ly93d3cubWlj
# cm9zb2Z0LmNvbS9wa2kvY2VydHMvTWljUm9vQ2VyQXV0XzIwMTAtMDYtMjMuY3J0
# MA0GCSqGSIb3DQEBCwUAA4ICAQCdVX38Kq3hLB9nATEkW+Geckv8qW/qXBS2Pk5H
# ZHixBpOXPTEztTnXwnE2P9pkbHzQdTltuw8x5MKP+2zRoZQYIu7pZmc6U03dmLq2
# HnjYNi6cqYJWAAOwBb6J6Gngugnue99qb74py27YP0h1AdkY3m2CDPVtI1TkeFN1
# JFe53Z/zjj3G82jfZfakVqr3lbYoVSfQJL1AoL8ZthISEV09J+BAljis9/kpicO8
# F7BUhUKz/AyeixmJ5/ALaoHCgRlCGVJ1ijbCHcNhcy4sa3tuPywJeBTpkbKpW99J
# o3QMvOyRgNI95ko+ZjtPu4b6MhrZlvSP9pEB9s7GdP32THJvEKt1MMU0sHrYUP4K
# WN1APMdUbZ1jdEgssU5HLcEUBHG/ZPkkvnNtyo4JvbMBV0lUZNlz138eW0QBjloZ
# kWsNn6Qo3GcZKCS6OEuabvshVGtqRRFHqfG3rsjoiV5PndLQTHa1V1QJsWkBRH58
# oWFsc/4Ku+xBZj1p/cvBQUl+fpO+y/g75LcVv7TOPqUxUYS8vwLBgqJ7Fx0ViY1w
# /ue10CgaiQuPNtq6TPmb/wrpNPgkNWcr4A245oyZ1uEi6vAnQj0llOZ0dFtq0Z4+
# 7X6gMTN9vMvpe784cETRkPHIqzqKOghif9lwY1NNje6CbaUFEMFxBmoQtB1VM1iz
# oXBm8qGCA1YwggI+AgEBMIIBAaGB2aSB1jCB0zELMAkGA1UEBhMCVVMxEzARBgNV
# BAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jv
# c29mdCBDb3Jwb3JhdGlvbjEtMCsGA1UECxMkTWljcm9zb2Z0IElyZWxhbmQgT3Bl
# cmF0aW9ucyBMaW1pdGVkMScwJQYDVQQLEx5uU2hpZWxkIFRTUyBFU046NkYxQS0w
# NUUwLUQ5NDcxJTAjBgNVBAMTHE1pY3Jvc29mdCBUaW1lLVN0YW1wIFNlcnZpY2Wi
# IwoBATAHBgUrDgMCGgMVAE5BKSVzmqiNsH6gbMODS1cKmKqqoIGDMIGApH4wfDEL
# MAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1v
# bmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEmMCQGA1UEAxMdTWlj
# cm9zb2Z0IFRpbWUtU3RhbXAgUENBIDIwMTAwDQYJKoZIhvcNAQELBQACBQDqhivY
# MCIYDzIwMjQwOTA3MDEzMzEyWhgPMjAyNDA5MDgwMTMzMTJaMHQwOgYKKwYBBAGE
# WQoEATEsMCowCgIFAOqGK9gCAQAwBwIBAAICHzYwBwIBAAICE3MwCgIFAOqHfVgC
# AQAwNgYKKwYBBAGEWQoEAjEoMCYwDAYKKwYBBAGEWQoDAqAKMAgCAQACAwehIKEK
# MAgCAQACAwGGoDANBgkqhkiG9w0BAQsFAAOCAQEAe+/6FOFqHfHLHMKAaXl9bbdp
# +WIxRNKzKHbybxUo9jyByC5Xe02RsbGodrQNddlgxP/1jmn7xvVsdCqkClK0IwZY
# DMi+sXID6UtnjxiHQOwak8SPEA0ekyrmW/D7PStSbFjeI8MP4UUs5Y5fZgtDXSOE
# WivwBEKKORDmqIb2o3obWE6udlef/Ls9uX/y+R0q6NHYVr2uGmW156m5RNpc9Ib7
# uUlKuAUrE9UUNyOr2siYeDnUyP3b+9uC5o3LlgE/EyUGX63xEXSxBBD7q/KfX20s
# z8A/e3Grwbi7+33ENGUwEE2c/EQ5EcpoN77bcirOBQ5iEdYp2M3vqwXmxwxbjDGC
# BA0wggQJAgEBMIGTMHwxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9u
# MRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRp
# b24xJjAkBgNVBAMTHU1pY3Jvc29mdCBUaW1lLVN0YW1wIFBDQSAyMDEwAhMzAAAB
# /Bigr8xpWoc6AAEAAAH8MA0GCWCGSAFlAwQCAQUAoIIBSjAaBgkqhkiG9w0BCQMx
# DQYLKoZIhvcNAQkQAQQwLwYJKoZIhvcNAQkEMSIEINdvXBGiDPhWCrFdf7clzPDY
# PEI6MZZx3KXByGTZAEhTMIH6BgsqhkiG9w0BCRACLzGB6jCB5zCB5DCBvQQglUKv
# kLvv4fwTlT+MMHlMGx7glIYfk+4at3eTAmjRLWIwgZgwgYCkfjB8MQswCQYDVQQG
# EwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwG
# A1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMSYwJAYDVQQDEx1NaWNyb3NvZnQg
# VGltZS1TdGFtcCBQQ0EgMjAxMAITMwAAAfwYoK/MaVqHOgABAAAB/DAiBCBS3MNH
# NbwFNyL4Pch1/f5sKKWGgftj8vEN1lEsWmz+pTANBgkqhkiG9w0BAQsFAASCAgCe
# cWDEA498YecdNaRoZPueDFdUWrlm3U7JyHKSK5c5hIj47r36kJyrTqWdTT2Vk50e
# CcRA9X+ysH5wPNAZOU4IZG2nMXen3V1CMYkCgflAtlL5mWPIjJm8q4UR8byMLApZ
# sZUXbI+7ens8pGGnb2PxOwF5F51rqBChs97T+sQbqHeaRINEkwgaL6R+uXd7o5u+
# Lrlop3tTnQ7yi9mAJByZTlo3JQAiPm4UUZ7peoHltai8BuEK31VgwZGutYTNC6Nc
# foDftL2fuV+RM29r9MwQVSBsi+CB2wHM26pqBFbIiwW8SWWz7uEizkmC7phf2CAc
# C+k+pw2obwIYNbaqnuN/4S4NUP0X1sboUmJsM/FoN3Bz1/FxEqtLzBvV/pT+4daM
# jLxdV1Si4LEr3pTnYHeBYWNRc3S6u74w9kkk/2M+IeufOsnhsa2Kxmjczn1H0Xmm
# LVsij6UMOXAN7Nrgl4U49rs6lTha4FQsTZ09EJBOyl1tFbDZrfIPYNJxDo2QvUH7
# HgmUfhcKlnTxXtPcx2YGT4GSA5LgLdDLXul1rLI+g4VKpzoVWgkDKOjRXg4C1FCi
# TR5uWHVMMx65i7ZMtN++fVwbjrZn6BTXQKwsjcbVKwe98mWGrBqWhutGOt84QGV4
# 5NBf/nTS6VpbpdjGJQdqizDWIMeBgw2B5GjPjYyVZQ==
# SIG # End signature block
