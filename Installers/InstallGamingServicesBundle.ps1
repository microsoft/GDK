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
# MIImBwYJKoZIhvcNAQcCoIIl+DCCJfQCAQExDzANBglghkgBZQMEAgEFADB5Bgor
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
# B3slcUSrBmrm1MbfI5qWdcUxghn2MIIZ8gIBATCBlTB+MQswCQYDVQQGEwJVUzET
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
# Y9yITANOCb2YmkcCo6OhghcpMIIXJQYKKwYBBAGCNwMDATGCFxUwghcRBgkqhkiG
# 9w0BBwKgghcCMIIW/gIBAzEPMA0GCWCGSAFlAwQCAQUAMIIBWQYLKoZIhvcNAQkQ
# AQSgggFIBIIBRDCCAUACAQEGCisGAQQBhFkKAwEwMTANBglghkgBZQMEAgEFAAQg
# OovSbAyN1r2Nni3Wooj27iJzymLzMkH3MSRKcU7jHT0CBma+E7Tj3hgTMjAyNDA4
# MjAxMTAzMTUuNTM2WjAEgAIB9KCB2KSB1TCB0jELMAkGA1UEBhMCVVMxEzARBgNV
# BAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jv
# c29mdCBDb3Jwb3JhdGlvbjEtMCsGA1UECxMkTWljcm9zb2Z0IElyZWxhbmQgT3Bl
# cmF0aW9ucyBMaW1pdGVkMSYwJAYDVQQLEx1UaGFsZXMgVFNTIEVTTjo4RDQxLTRC
# RjctQjNCNzElMCMGA1UEAxMcTWljcm9zb2Z0IFRpbWUtU3RhbXAgU2VydmljZaCC
# EXgwggcnMIIFD6ADAgECAhMzAAAB49+9m5ocaIMiAAEAAAHjMA0GCSqGSIb3DQEB
# CwUAMHwxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQH
# EwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xJjAkBgNV
# BAMTHU1pY3Jvc29mdCBUaW1lLVN0YW1wIFBDQSAyMDEwMB4XDTIzMTAxMjE5MDcy
# OVoXDTI1MDExMDE5MDcyOVowgdIxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNo
# aW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29y
# cG9yYXRpb24xLTArBgNVBAsTJE1pY3Jvc29mdCBJcmVsYW5kIE9wZXJhdGlvbnMg
# TGltaXRlZDEmMCQGA1UECxMdVGhhbGVzIFRTUyBFU046OEQ0MS00QkY3LUIzQjcx
# JTAjBgNVBAMTHE1pY3Jvc29mdCBUaW1lLVN0YW1wIFNlcnZpY2UwggIiMA0GCSqG
# SIb3DQEBAQUAA4ICDwAwggIKAoICAQC+pA1oHkafn8UgVA+jf8rhCaV4IMwXjRuS
# gfDPQGyFnhKJCYDoIZTIPCZqpDbAeFpdTRF0e3C+r5TwrFhizIcqprHELt+v/Idm
# 8ek1ODPHVWRHeleFPpfYKbXvlRfdZDiN+XzqienkAzMEgUOXPRJTxVIo0wO81e2O
# T0WK0uBS/aePeE4nQqQRB+TegDubvMDQP4yjveGZH44Lu7CxfElHa3NRkTRJNhfd
# S96cUft9hbLkE2YvIaraxaRDkcW8koIkAT93B+3z5XjdTcp4TEX+k+1wtS9D0cis
# vTGekwVq7th3lor5MSLntZy0G/zv59I9kFXeNmX9AK1wf1aueIEPCSL1B9HG78lj
# PD6JoRYuqthe4XuN44a8cr59V4tacBzlbGx9umMQyk1sZdtIX0C3c8+EVU6PHBUT
# HUAsZSpEp6HD1qn1f+B+QD0j15NK/AnP3DJr2t4OBL7qReBK20jtFDZwkb+1A8ZU
# hosIhpJp8ud5qrQGezS3j4RbcH8aegEyKI5fCV469/m50FlAgwneTmqeeHxnhmFP
# CsTqIZs+tOAYE9eHt7EVgAaVvqF2EgshUN0mUN/yzU1W8vRDbLhIdlCECllO5b+3
# Iawaxwg8NIzPlsDo2FEu2MTAIWksjmoaW7nQC70VF6UIRCxaDurTsf+uoc6oI0kz
# hGN6buOgRQIDAQABo4IBSTCCAUUwHQYDVR0OBBYEFLGuDWa+NRW3oWfGPnqdptmI
# mKkDMB8GA1UdIwQYMBaAFJ+nFV0AXmJdg/Tl0mWnG1M1GelyMF8GA1UdHwRYMFYw
# VKBSoFCGTmh0dHA6Ly93d3cubWljcm9zb2Z0LmNvbS9wa2lvcHMvY3JsL01pY3Jv
# c29mdCUyMFRpbWUtU3RhbXAlMjBQQ0ElMjAyMDEwKDEpLmNybDBsBggrBgEFBQcB
# AQRgMF4wXAYIKwYBBQUHMAKGUGh0dHA6Ly93d3cubWljcm9zb2Z0LmNvbS9wa2lv
# cHMvY2VydHMvTWljcm9zb2Z0JTIwVGltZS1TdGFtcCUyMFBDQSUyMDIwMTAoMSku
# Y3J0MAwGA1UdEwEB/wQCMAAwFgYDVR0lAQH/BAwwCgYIKwYBBQUHAwgwDgYDVR0P
# AQH/BAQDAgeAMA0GCSqGSIb3DQEBCwUAA4ICAQC3vpsuqdTTzBFtbe9GvGNoRsY+
# rIg0rpRgLOFMZpH88TAInOI9Phkz2x8ZNfd5kNBUT2vXbW0W2ns1dBi5BLFFkxhd
# rT+lrA3Zef5Q+MFEO+gKxTnp3AqSubLxNLDtBcoayR2cTCwjnJb3erwCDzpGQGIo
# QR/0V3Mc24pYjgq//98O0RJ7C7jqf+75VyQLBs5iXrAT/9BEasYyrnT1rgRs/6nU
# ZSbTpeZ7/TWZMi4oOA+YcvadhHNc2qLYi4h5yfZpbCRHFA4WI/D52JyY47Asb/si
# c2qNmlB4iEMzGxavjNPHPLgRH/rN+2G2UO1wBccHthFSQFMKVo5rSd2980lkzJhV
# rpxa9mi5Or1XktLtTMhHxL/tGw5Pjd45rAsGy5DPRWg4u6th7VJ98+pOwJxE3NvH
# QLy3/4qKlK1WE8Aa20R+F1RRL2iEPou3rA0InFltXQgwPyd8TqAhAlevOtdY64mo
# 33VYPKNFqfhQoOQgFLbJYDhbomFC4HMZ6s5Jj9oufGRGtK5uC2cphwc7CDFNMjJr
# lZgJGMW3RA4uV6pWSLqT6apg+v3y4w+Lm9EhBLbTqYNJ6dK2vzDQn7/7VYSbc+cI
# IhCCl/rOGpGsC32PtesQweuDZtB6BrPxsvNt7pSJuBsq1HKTWcZ17xOjmTIyP1dQ
# IEgIPFP4XjFrmU1lVDCCB3EwggVZoAMCAQICEzMAAAAVxedrngKbSZkAAAAAABUw
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
# ZvKhggLUMIICPQIBATCCAQChgdikgdUwgdIxCzAJBgNVBAYTAlVTMRMwEQYDVQQI
# EwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3Nv
# ZnQgQ29ycG9yYXRpb24xLTArBgNVBAsTJE1pY3Jvc29mdCBJcmVsYW5kIE9wZXJh
# dGlvbnMgTGltaXRlZDEmMCQGA1UECxMdVGhhbGVzIFRTUyBFU046OEQ0MS00QkY3
# LUIzQjcxJTAjBgNVBAMTHE1pY3Jvc29mdCBUaW1lLVN0YW1wIFNlcnZpY2WiIwoB
# ATAHBgUrDgMCGgMVAD2Il7vDkUOIbynLhOxitAjoMVp6oIGDMIGApH4wfDELMAkG
# A1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1vbmQx
# HjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEmMCQGA1UEAxMdTWljcm9z
# b2Z0IFRpbWUtU3RhbXAgUENBIDIwMTAwDQYJKoZIhvcNAQEFBQACBQDqboCkMCIY
# DzIwMjQwODIwMTA0MDM2WhgPMjAyNDA4MjExMDQwMzZaMHQwOgYKKwYBBAGEWQoE
# ATEsMCowCgIFAOpugKQCAQAwBwIBAAICFXowBwIBAAICEgIwCgIFAOpv0iQCAQAw
# NgYKKwYBBAGEWQoEAjEoMCYwDAYKKwYBBAGEWQoDAqAKMAgCAQACAwehIKEKMAgC
# AQACAwGGoDANBgkqhkiG9w0BAQUFAAOBgQCDB5oVdcZagQYvBBXK6y0XKNtYCCcM
# 0veVXGriGap0ZQIomGYY++f7a3d1aKHCLfIo+EDCVzAajAt2E3qthvFZzw4yZR0b
# XrZXDJR1zvDs7NWQ8PMH4p1GPaFhtTSc3B/MmtLec+0eAXqrRMjHTxfTe18p+w37
# Y2BBEiGkhNCLOjGCBA0wggQJAgEBMIGTMHwxCzAJBgNVBAYTAlVTMRMwEQYDVQQI
# EwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3Nv
# ZnQgQ29ycG9yYXRpb24xJjAkBgNVBAMTHU1pY3Jvc29mdCBUaW1lLVN0YW1wIFBD
# QSAyMDEwAhMzAAAB49+9m5ocaIMiAAEAAAHjMA0GCWCGSAFlAwQCAQUAoIIBSjAa
# BgkqhkiG9w0BCQMxDQYLKoZIhvcNAQkQAQQwLwYJKoZIhvcNAQkEMSIEIMX7j0OV
# aYNERZG2b4ln62Ys3lODW2HVBRHzWAu5QZ8nMIH6BgsqhkiG9w0BCRACLzGB6jCB
# 5zCB5DCBvQQgM9Qjq+Ww/mT3RIEI1r3CFrgyXEG3YKvDXY9McjLmJiowgZgwgYCk
# fjB8MQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMH
# UmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMSYwJAYDVQQD
# Ex1NaWNyb3NvZnQgVGltZS1TdGFtcCBQQ0EgMjAxMAITMwAAAePfvZuaHGiDIgAB
# AAAB4zAiBCAFqAePxfrzUQzMXy56TmxxZ+Gjft0DDAUyXuIhWc5UTDANBgkqhkiG
# 9w0BAQsFAASCAgBkmLoyetUVDv/guVO9w/ngzNf0cfH7zaW8pUIHtVoL8xziIRQn
# 36dTyFeZMvZrbe8QH/tgiqOh9k8j9D0Mz0ppHeDE8y1yJM2mazH64KaeovTCFyG5
# c/UF6KKUOgiwqc3Te7RURysfFBlSH9H55i2QvwD+ZUKIxTIo2huTgJmP5yyNHUTI
# p/l4QEhCdItvuCgV7hO1NMqHNd59Bh1pS/LbObsqUelh/OIFR8kXgljcIKida6lk
# zfUfNa9Bw2rE1zo7tEC/HXRtETqrfWC7C53bMONkLOwDyETdXAa7R+vd1sr3cWYw
# 8h9dHX7M8Z9H1VfepF2fBMJ/POZXh2ooic0NUG9xHBOA+j4/cD/3T82y/3VvRaSe
# g9awlZjdznPf+hes3WiyBnW3CeNhp5fHqKLPL66CNLuO4/9IuNQkUQGvdwBI9fxo
# fCwHtWCgshqFeAOAXSqZ108Jx6uZ0ySdU9nTSgnDGU1+k+cooOZMmv0IhSXx1jiE
# J0Pw3szxP9UBXqU/INryKjiYuAmafzbZzSmHqISEcwy9zwz+5qkS76h6e8yQkQ+x
# AZoKI05J+gwC77JgF4TAqgVoI8CAmxZAcLpwOTxRtuV3pCjAzD6spUU2LzX8ktmf
# bKT1yMfCrO4adTd6iF0T6IPfaS7yZZziTPJvY35bOqukoUOHGdew/rI1Cg==
# SIG # End signature block
