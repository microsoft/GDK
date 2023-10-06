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

    $isOldPackagePresent = (([Version]$package.Version -lt [Version]'13.80.9001.0') -or ([Version]$package.Version -eq [Version]'1.43.2002.0'));

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
    Write-Output "Installing $AppxPath Version 13.80.9001.0 Volume $systemRoot";

    $allDepsFound = $TRUE;
    [string[]]$depPackageNames = 'Microsoft.NET.Native.Runtime.2.2', 'Microsoft.NET.Native.Framework.2.2', 'Microsoft.VCLibs.x64.14.00';
    $dependencyPaths = $depPackageNames | ForEach-Object { Join-Path -Path $AppxDepDirPath -ChildPath "$_.appx" };
    ForEach ($dep in $dependencyPaths) { if (-not (test-path $dep)) { $allDepsFound = $FALSE; } };

    if ($allDepsFound) {
        Write-Output "Installing $AppxPath Version 13.80.9001.0 Volume $systemRoot -DependencyPath $dependencyPaths";
        add-appxpackage -forceApplicationShutdown -path $AppxPath -Volume $systemRoot -DependencyPath $dependencyPaths -ErrorAction Continue;
    }
    else {
        Write-Output "Installing $AppxPath Version 13.80.9001.0 Volume $systemRoot";
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
# MIImFgYJKoZIhvcNAQcCoIImBzCCJgMCAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCCbjbc0AepQGyIA
# zP9nLp4Ib9m14CouAWFtUZ3E08bOaaCCC3YwggT+MIID5qADAgECAhMzAAAE/lnK
# t+YqpSLBAAAAAAT+MA0GCSqGSIb3DQEBCwUAMH4xCzAJBgNVBAYTAlVTMRMwEQYD
# VQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNy
# b3NvZnQgQ29ycG9yYXRpb24xKDAmBgNVBAMTH01pY3Jvc29mdCBDb2RlIFNpZ25p
# bmcgUENBIDIwMTAwHhcNMjMwMjE2MjAxMTA5WhcNMjQwMTMxMjAxMTA5WjB0MQsw
# CQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9u
# ZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMR4wHAYDVQQDExVNaWNy
# b3NvZnQgQ29ycG9yYXRpb24wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIB
# AQDPd/vELKzTiB3Rg4I1XSd7lwXSUG//YkcFj22rdNxMUPS+Eptq80TlhH03xtIE
# yrbYV+6S5s7CCY6Cjhda2foJOcyVayPKOrQyYZow8KbIKDL/QEafZr+sbXy34c8n
# GweKgqXjVfCyJFuR7wtRkaTV+miiLzsTcByTHU+Lzdb4Y+5BEYtdMJwCIkIY9kXT
# yCAHm3/1x9GALWpuUPRHyOBsDQcChOGnvetKBVYhORn8Y3Lb/2BnwQT+WIVdQlqs
# F8yhVwPgex7qEfHoianrXhC+WH+1AbaD0bqicteeRJYRGxGdB5YB1Bmw21W31iXp
# /hrzCnK8mlHVCUDC74lSNNIvAgMBAAGjggF9MIIBeTAfBgNVHSUEGDAWBgorBgEE
# AYI3PQYBBggrBgEFBQcDAzAdBgNVHQ4EFgQUvQbFseL64nzW8ZzXqQfwhLHuoDgw
# VAYDVR0RBE0wS6RJMEcxLTArBgNVBAsTJE1pY3Jvc29mdCBJcmVsYW5kIE9wZXJh
# dGlvbnMgTGltaXRlZDEWMBQGA1UEBRMNMjMwODY1KzUwMDIzMzAfBgNVHSMEGDAW
# gBTm/F97uyIAWORyTrX0IXQjMubvrDBWBgNVHR8ETzBNMEugSaBHhkVodHRwOi8v
# Y3JsLm1pY3Jvc29mdC5jb20vcGtpL2NybC9wcm9kdWN0cy9NaWNDb2RTaWdQQ0Ff
# MjAxMC0wNy0wNi5jcmwwWgYIKwYBBQUHAQEETjBMMEoGCCsGAQUFBzAChj5odHRw
# Oi8vd3d3Lm1pY3Jvc29mdC5jb20vcGtpL2NlcnRzL01pY0NvZFNpZ1BDQV8yMDEw
# LTA3LTA2LmNydDAMBgNVHRMBAf8EAjAAMA0GCSqGSIb3DQEBCwUAA4IBAQACKoJ8
# TKfm2TtDfauJ7Z3/D8VUjcpK4J23zTKglb9L6QaDeKr+He9pD7Yg74PDmWhZKcNc
# eQSe5BFcDKjKWqmFu85qjIkDb5znqAtVyq2yxBS4yGyMh3eY8TpbqBRaXEcI9zBK
# Mm/js+TvOSev24Ek5y7rrlZOIPXqZjPScx6PzqW9tC3GFnzJeE6TaTInDKxlMzRC
# MRxFgSSU1rIXj9Neu3AeyQKemdhQ/7w5bW+etkaBjTdr7vyInmPlYmzfsT5oOzAP
# R3UWTfuLk5WIM/vAjeWtyUTsNq4x5sX/mzhfu2/qWLrZPSIc9zKfHBtTPjw4gt8a
# aU6AzhdcXafzWFqeMIIGcDCCBFigAwIBAgIKYQxSTAAAAAAAAzANBgkqhkiG9w0B
# AQsFADCBiDELMAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNV
# BAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEyMDAG
# A1UEAxMpTWljcm9zb2Z0IFJvb3QgQ2VydGlmaWNhdGUgQXV0aG9yaXR5IDIwMTAw
# HhcNMTAwNzA2MjA0MDE3WhcNMjUwNzA2MjA1MDE3WjB+MQswCQYDVQQGEwJVUzET
# MBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMV
# TWljcm9zb2Z0IENvcnBvcmF0aW9uMSgwJgYDVQQDEx9NaWNyb3NvZnQgQ29kZSBT
# aWduaW5nIFBDQSAyMDEwMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA
# 6Q5kUHlntcTj/QkATJ6UrPdWaOpE2M/FWE+ppXZ8bUW60zmStKQe+fllguQX0o/9
# RJwI6GWTzixVhL99COMuK6hBKxi3oktuSUxrFQfe0dLCiR5xlM21f0u0rwjYzIjW
# axeUOpPOJj/s5v40mFfVHV1J9rIqLtWFu1k/+JC0K4N0yiuzO0bj8EZJwRdmVMkc
# vR3EVWJXcvhnuSUgNN5dpqWVXqsogM3Vsp7lA7Vj07IUyMHIiiYKWX8H7P8O7YAS
# NUwSpr5SW/Wm2uCLC0h31oVH1RC5xuiq7otqLQVcYMa0KlucIxxfReMaFB5vN8sZ
# M4BqiU2jamZjeJPVMM+VHwIDAQABo4IB4zCCAd8wEAYJKwYBBAGCNxUBBAMCAQAw
# HQYDVR0OBBYEFOb8X3u7IgBY5HJOtfQhdCMy5u+sMBkGCSsGAQQBgjcUAgQMHgoA
# UwB1AGIAQwBBMAsGA1UdDwQEAwIBhjAPBgNVHRMBAf8EBTADAQH/MB8GA1UdIwQY
# MBaAFNX2VsuP6KJcYmjRPZSQW9fOmhjEMFYGA1UdHwRPME0wS6BJoEeGRWh0dHA6
# Ly9jcmwubWljcm9zb2Z0LmNvbS9wa2kvY3JsL3Byb2R1Y3RzL01pY1Jvb0NlckF1
# dF8yMDEwLTA2LTIzLmNybDBaBggrBgEFBQcBAQROMEwwSgYIKwYBBQUHMAKGPmh0
# dHA6Ly93d3cubWljcm9zb2Z0LmNvbS9wa2kvY2VydHMvTWljUm9vQ2VyQXV0XzIw
# MTAtMDYtMjMuY3J0MIGdBgNVHSAEgZUwgZIwgY8GCSsGAQQBgjcuAzCBgTA9Bggr
# BgEFBQcCARYxaHR0cDovL3d3dy5taWNyb3NvZnQuY29tL1BLSS9kb2NzL0NQUy9k
# ZWZhdWx0Lmh0bTBABggrBgEFBQcCAjA0HjIgHQBMAGUAZwBhAGwAXwBQAG8AbABp
# AGMAeQBfAFMAdABhAHQAZQBtAGUAbgB0AC4gHTANBgkqhkiG9w0BAQsFAAOCAgEA
# GnTvV08pe8QWhXi4UNMi/AmdrIKX+DT/KiyXlRLl5L/Pv5PI4zSp24G43B4AvtI1
# b6/lf3mVd+UC1PHr2M1OHhthosJaIxrwjKhiUUVnCOM/PB6T+DCFF8g5QKbXDrMh
# KeWloWmMIpPMdJjnoUdD8lOswA8waX/+0iUgbW9h098H1dlyACxphnY9UdumOUjJ
# N2FtB91TGcun1mHCv+KDqw/ga5uV1n0oUbCJSlGkmmzItx9KGg5pqdfcwX7RSXCq
# tq27ckdjF/qm1qKmhuyoEESbY7ayaYkGx0aGehg/6MUdIdV7+QIjLcVBy78dTMgW
# 77Gcf/wiS0mKbhXjpn92W9FTeZGFndXS2z1zNfM8rlSyUkdqwKoTldKOEdqZZ14y
# jPs3hdHcdYWch8ZaV4XCv90Nj4ybLeu07s8n07VeafqkFgQBpyRnc89NT7beBVaX
# evfpUk30dwVPhcbYC/GO7UIJ0Q124yNWeCImNr7KsYxuqh3khdpHM2KPpMmRM19x
# HkCvmGXJIuhCISWKHC1g2TeJQYkqFg/XYTyUaGBS79ZHmaCAQO4VgXc+nOBTGBpQ
# HTiVmx5mMxMnORd4hzbOTsNfsvU9R1O24OXbC2E9KteSLM43Wj5AQjGkHxAIwlac
# vyRdUQKdannSF9PawZSOB3slcUSrBmrm1MbfI5qWdcUxghn2MIIZ8gIBATCBlTB+
# MQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVk
# bW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMSgwJgYDVQQDEx9N
# aWNyb3NvZnQgQ29kZSBTaWduaW5nIFBDQSAyMDEwAhMzAAAE/lnKt+YqpSLBAAAA
# AAT+MA0GCWCGSAFlAwQCAQUAoIIBBDAZBgkqhkiG9w0BCQMxDAYKKwYBBAGCNwIB
# BDAcBgorBgEEAYI3AgELMQ4wDAYKKwYBBAGCNwIBFTAvBgkqhkiG9w0BCQQxIgQg
# DuAzbygUXW212Kbizl+YV9ZZ1utQJCA2tQ7I7gA0TqYwPAYKKwYBBAGCNwoDHDEu
# DCxzUFk3eFBCN2hUNWc1SEhyWXQ4ckRMU005VnVaUnVXWmFlZjJlMjJSczU0PTBa
# BgorBgEEAYI3AgEMMUwwSqAkgCIATQBpAGMAcgBvAHMAbwBmAHQAIABXAGkAbgBk
# AG8AdwBzoSKAIGh0dHA6Ly93d3cubWljcm9zb2Z0LmNvbS93aW5kb3dzMA0GCSqG
# SIb3DQEBAQUABIIBABwHGffNoKTFszE9XUdWhB4A8sgzrGdtkBTY4CaNtYXo0Pt2
# RaaaAHUsaeeLHvd38BTrFU6y1irIMIBDF5ZJhPgDa5u4UjkprAog/ExgzE6xzd6Z
# wIMTKCuT4TDoVz30hJlynNDS+bN2QBc9gloMoSGSjT0ZyLIaT4FGOz6KramBVoz4
# cfqPs4NUJEW9bIQpBsX+OTQj0S5U00BuJUnZbtFYnUY3v48lgHH15Qbyv0Tnr5bx
# 1M3eXeZdUjw26nwGiy37tPoSdZQ59qB7LU56/fasay6jZRfOcuNLKBTnu2vojXgB
# iRfJ+0KNkzOaI28b13whr9Fxfp4HZiZxaP/U3AyhghcpMIIXJQYKKwYBBAGCNwMD
# ATGCFxUwghcRBgkqhkiG9w0BBwKgghcCMIIW/gIBAzEPMA0GCWCGSAFlAwQCAQUA
# MIIBWQYLKoZIhvcNAQkQAQSgggFIBIIBRDCCAUACAQEGCisGAQQBhFkKAwEwMTAN
# BglghkgBZQMEAgEFAAQgQ0KdN1+nvojy5lPEGTGMOK6FMN5AjAIftOV+N1s0xWMC
# BmUK9r3wahgTMjAyMzA5MjkxMTM0MTAuNjc4WjAEgAIB9KCB2KSB1TCB0jELMAkG
# A1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1vbmQx
# HjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEtMCsGA1UECxMkTWljcm9z
# b2Z0IElyZWxhbmQgT3BlcmF0aW9ucyBMaW1pdGVkMSYwJAYDVQQLEx1UaGFsZXMg
# VFNTIEVTTjowODQyLTRCRTYtQzI5QTElMCMGA1UEAxMcTWljcm9zb2Z0IFRpbWUt
# U3RhbXAgU2VydmljZaCCEXgwggcnMIIFD6ADAgECAhMzAAABsm5AA39uqZSSAAEA
# AAGyMA0GCSqGSIb3DQEBCwUAMHwxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNo
# aW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29y
# cG9yYXRpb24xJjAkBgNVBAMTHU1pY3Jvc29mdCBUaW1lLVN0YW1wIFBDQSAyMDEw
# MB4XDTIyMDkyMDIwMjIwMVoXDTIzMTIxNDIwMjIwMVowgdIxCzAJBgNVBAYTAlVT
# MRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQK
# ExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xLTArBgNVBAsTJE1pY3Jvc29mdCBJcmVs
# YW5kIE9wZXJhdGlvbnMgTGltaXRlZDEmMCQGA1UECxMdVGhhbGVzIFRTUyBFU046
# MDg0Mi00QkU2LUMyOUExJTAjBgNVBAMTHE1pY3Jvc29mdCBUaW1lLVN0YW1wIFNl
# cnZpY2UwggIiMA0GCSqGSIb3DQEBAQUAA4ICDwAwggIKAoICAQDKomUyHXv5UOKw
# vgZpeX/1rqv8Sk8a32xttx6H5kPqmQDeBsju9zxd8vTgH6be0H9o3JXVjhlAfh8w
# bsJZWMj938eDGPM77gLgd+xb6MrZzQtgyp1a1ZRzlXBlC/Qp5oQzTANv57JIyH9i
# KIhvSdKi2K/Hbrx3UCfS4tj6vYLskm/Zr1C+tKILJQjvYJIehYhA8DK8FK/Fo2uo
# xaVE58vLYNDdHJwjdsOHypKeamXG1GBWInC0m/+gO6RwrV+sZ46sIZiaIm975Cic
# lcW7hS0YVV8R/eW9Cx3jYYn59476No/v+EFddIxKV1VvogvQbE7Uevcb041OdWYD
# +wUeGAxFquybMpUjr+QeUx0w10X9fOFEcxYU8m/DmUCmO5qjIe3PCfMNbBDOFw1B
# dlGTcvNvTVQsxtrX3RF2Wh8RfEZsaUGAccoWcGNa6LbiEvoHzdnqvoZAE94qRp/P
# ypg8A7cwG537l4wKYHmasIHGCfKQyfsv8VOqLsyc9Qb3uU04oZIgO8ELEHuketGZ
# PXT3Tc8NDCuZ4kc7kGQLeBiPehYY4ZVFnFGTgpL/yVzPzhrv64EqZWMHZjy883w7
# V8rsvxglOSOJdPIOoon18qTIKGJJHHjgAM+L8dcdATp2VnyN30sKjVL6De53E0/j
# AeFab39UAaaYwQEFLr7ounghtDAlTQIDAQABo4IBSTCCAUUwHQYDVR0OBBYEFJny
# J4Bc2RGZT5IwzlZbgUgw2mpxMB8GA1UdIwQYMBaAFJ+nFV0AXmJdg/Tl0mWnG1M1
# GelyMF8GA1UdHwRYMFYwVKBSoFCGTmh0dHA6Ly93d3cubWljcm9zb2Z0LmNvbS9w
# a2lvcHMvY3JsL01pY3Jvc29mdCUyMFRpbWUtU3RhbXAlMjBQQ0ElMjAyMDEwKDEp
# LmNybDBsBggrBgEFBQcBAQRgMF4wXAYIKwYBBQUHMAKGUGh0dHA6Ly93d3cubWlj
# cm9zb2Z0LmNvbS9wa2lvcHMvY2VydHMvTWljcm9zb2Z0JTIwVGltZS1TdGFtcCUy
# MFBDQSUyMDIwMTAoMSkuY3J0MAwGA1UdEwEB/wQCMAAwFgYDVR0lAQH/BAwwCgYI
# KwYBBQUHAwgwDgYDVR0PAQH/BAQDAgeAMA0GCSqGSIb3DQEBCwUAA4ICAQDcR7bt
# xcyGm2g21qrMHSgZQISl0QjfuQkjIr9k2GuItkLliJvvfaYsAIQ4QA326qK9c8i4
# veWOhkJ7yFlIHXgu6C9WbWcnvds2CvhCH8GGZoUvgh+Ip3wM1L7HB2Rd8JayVHz1
# CAxlT9JQmFbHvZoLrxtHapGOGskDxBzrybm4GWWjnYPzfHSJ3enxnjnPtA6Bswfi
# 4njmydkNALRLd1zd4l/AqevnWU1/McBPy74UcD6W//pyrITu01br3p8HU8Kgfy0+
# gjT2hJcBXisSq6kUzzGx3oPovipwS38JoRF7DINrNUF+ySMX70/epndHojI4jBDt
# ti2zs5izDXdyyDaMAJ0QQCbV/t/3t/dAfbDBjB6fmtVfoYLOtgKKQZdKf9NJYt9A
# zecBEOSH9+WZO2/0+qRMeqyVA2ArYu8wm4pIyk2pwZznPfcxjJXo+V/nwv5ORMVA
# qzrN/1cxkQmbeS71UEnVqqv0DM0xJopuLG8wEivYphJIzbWWcrwtQrFHA9b6BZLZ
# XeJijIxPrgxFdyHXQ/g60ZPeJ1czT0rmV3sH1Tp1x0nqhu8TN1e35dmi+L9ToS9v
# icDtU8dwdIqztTvamzXSZN+eW57XdUUlSoDNtihQR56C+ybO6UYQYmiplU0BqDm/
# o9UGu6vnIsRqOPFYfZN+QQ7CUvwy6FxUjw5eJjCCB3EwggVZoAMCAQICEzMAAAAV
# xedrngKbSZkAAAAAABUwDQYJKoZIhvcNAQELBQAwgYgxCzAJBgNVBAYTAlVTMRMw
# EQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVN
# aWNyb3NvZnQgQ29ycG9yYXRpb24xMjAwBgNVBAMTKU1pY3Jvc29mdCBSb290IENl
# cnRpZmljYXRlIEF1dGhvcml0eSAyMDEwMB4XDTIxMDkzMDE4MjIyNVoXDTMwMDkz
# MDE4MzIyNVowfDELMAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAO
# BgNVBAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEm
# MCQGA1UEAxMdTWljcm9zb2Z0IFRpbWUtU3RhbXAgUENBIDIwMTAwggIiMA0GCSqG
# SIb3DQEBAQUAA4ICDwAwggIKAoICAQDk4aZM57RyIQt5osvXJHm9DtWC0/3unAcH
# 0qlsTnXIyjVX9gF/bErg4r25PhdgM/9cT8dm95VTcVrifkpa/rg2Z4VGIwy1jRPP
# dzLAEBjoYH1qUoNEt6aORmsHFPPFdvWGUNzBRMhxXFExN6AKOG6N7dcP2CZTfDlh
# AnrEqv1yaa8dq6z2Nr41JmTamDu6GnszrYBbfowQHJ1S/rboYiXcag/PXfT+jlPP
# 1uyFVk3v3byNpOORj7I5LFGc6XBpDco2LXCOMcg1KL3jtIckw+DJj361VI/c+gVV
# mG1oO5pGve2krnopN6zL64NF50ZuyjLVwIYwXE8s4mKyzbnijYjklqwBSru+cakX
# W2dg3viSkR4dPf0gz3N9QZpGdc3EXzTdEonW/aUgfX782Z5F37ZyL9t9X4C626p+
# Nuw2TPYrbqgSUei/BQOj0XOmTTd0lBw0gg/wEPK3Rxjtp+iZfD9M269ewvPV2HM9
# Q07BMzlMjgK8QmguEOqEUUbi0b1qGFphAXPKZ6Je1yh2AuIzGHLXpyDwwvoSCtdj
# bwzJNmSLW6CmgyFdXzB0kZSU2LlQ+QuJYfM2BjUYhEfb3BvR/bLUHMVr9lxSUV0S
# 2yW6r1AFemzFER1y7435UsSFF5PAPBXbGjfHCBUYP3irRbb1Hode2o+eFnJpxq57
# t7c+auIurQIDAQABo4IB3TCCAdkwEgYJKwYBBAGCNxUBBAUCAwEAATAjBgkrBgEE
# AYI3FQIEFgQUKqdS/mTEmr6CkTxGNSnPEP8vBO4wHQYDVR0OBBYEFJ+nFV0AXmJd
# g/Tl0mWnG1M1GelyMFwGA1UdIARVMFMwUQYMKwYBBAGCN0yDfQEBMEEwPwYIKwYB
# BQUHAgEWM2h0dHA6Ly93d3cubWljcm9zb2Z0LmNvbS9wa2lvcHMvRG9jcy9SZXBv
# c2l0b3J5Lmh0bTATBgNVHSUEDDAKBggrBgEFBQcDCDAZBgkrBgEEAYI3FAIEDB4K
# AFMAdQBiAEMAQTALBgNVHQ8EBAMCAYYwDwYDVR0TAQH/BAUwAwEB/zAfBgNVHSME
# GDAWgBTV9lbLj+iiXGJo0T2UkFvXzpoYxDBWBgNVHR8ETzBNMEugSaBHhkVodHRw
# Oi8vY3JsLm1pY3Jvc29mdC5jb20vcGtpL2NybC9wcm9kdWN0cy9NaWNSb29DZXJB
# dXRfMjAxMC0wNi0yMy5jcmwwWgYIKwYBBQUHAQEETjBMMEoGCCsGAQUFBzAChj5o
# dHRwOi8vd3d3Lm1pY3Jvc29mdC5jb20vcGtpL2NlcnRzL01pY1Jvb0NlckF1dF8y
# MDEwLTA2LTIzLmNydDANBgkqhkiG9w0BAQsFAAOCAgEAnVV9/Cqt4SwfZwExJFvh
# nnJL/Klv6lwUtj5OR2R4sQaTlz0xM7U518JxNj/aZGx80HU5bbsPMeTCj/ts0aGU
# GCLu6WZnOlNN3Zi6th542DYunKmCVgADsAW+iehp4LoJ7nvfam++Kctu2D9IdQHZ
# GN5tggz1bSNU5HhTdSRXud2f8449xvNo32X2pFaq95W2KFUn0CS9QKC/GbYSEhFd
# PSfgQJY4rPf5KYnDvBewVIVCs/wMnosZiefwC2qBwoEZQhlSdYo2wh3DYXMuLGt7
# bj8sCXgU6ZGyqVvfSaN0DLzskYDSPeZKPmY7T7uG+jIa2Zb0j/aRAfbOxnT99kxy
# bxCrdTDFNLB62FD+CljdQDzHVG2dY3RILLFORy3BFARxv2T5JL5zbcqOCb2zAVdJ
# VGTZc9d/HltEAY5aGZFrDZ+kKNxnGSgkujhLmm77IVRrakURR6nxt67I6IleT53S
# 0Ex2tVdUCbFpAUR+fKFhbHP+CrvsQWY9af3LwUFJfn6Tvsv4O+S3Fb+0zj6lMVGE
# vL8CwYKiexcdFYmNcP7ntdAoGokLjzbaukz5m/8K6TT4JDVnK+ANuOaMmdbhIurw
# J0I9JZTmdHRbatGePu1+oDEzfbzL6Xu/OHBE0ZDxyKs6ijoIYn/ZcGNTTY3ugm2l
# BRDBcQZqELQdVTNYs6FwZvKhggLUMIICPQIBATCCAQChgdikgdUwgdIxCzAJBgNV
# BAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4w
# HAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xLTArBgNVBAsTJE1pY3Jvc29m
# dCBJcmVsYW5kIE9wZXJhdGlvbnMgTGltaXRlZDEmMCQGA1UECxMdVGhhbGVzIFRT
# UyBFU046MDg0Mi00QkU2LUMyOUExJTAjBgNVBAMTHE1pY3Jvc29mdCBUaW1lLVN0
# YW1wIFNlcnZpY2WiIwoBATAHBgUrDgMCGgMVAI4SfhHskkX59igjbI5/XBfQFEk6
# oIGDMIGApH4wfDELMAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAO
# BgNVBAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEm
# MCQGA1UEAxMdTWljcm9zb2Z0IFRpbWUtU3RhbXAgUENBIDIwMTAwDQYJKoZIhvcN
# AQEFBQACBQDowKjrMCIYDzIwMjMwOTI5MDkzNzQ3WhgPMjAyMzA5MzAwOTM3NDda
# MHQwOgYKKwYBBAGEWQoEATEsMCowCgIFAOjAqOsCAQAwBwIBAAICAfMwBwIBAAIC
# EhwwCgIFAOjB+msCAQAwNgYKKwYBBAGEWQoEAjEoMCYwDAYKKwYBBAGEWQoDAqAK
# MAgCAQACAwehIKEKMAgCAQACAwGGoDANBgkqhkiG9w0BAQUFAAOBgQCBROIFdF0v
# 1wfEdoJZT5qYybijuq+rs4Q2sTBHf4hufIdBhgeY0Sdb/mTl4WYs3pUOfeZg9NSV
# AiO2Eu2FpZIzlXwHGrMTfRS4aSx2cSwPEM70qIeObeke4X5toGGYhmwbvGEImwiW
# uc6KAhnUgwZ4d9OyTkHCJ3rG0Q3tsi9rXDGCBA0wggQJAgEBMIGTMHwxCzAJBgNV
# BAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4w
# HAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xJjAkBgNVBAMTHU1pY3Jvc29m
# dCBUaW1lLVN0YW1wIFBDQSAyMDEwAhMzAAABsm5AA39uqZSSAAEAAAGyMA0GCWCG
# SAFlAwQCAQUAoIIBSjAaBgkqhkiG9w0BCQMxDQYLKoZIhvcNAQkQAQQwLwYJKoZI
# hvcNAQkEMSIEIDsWyTvEAg71lNzXNzIxD/BDyJMKrihe4LuGyN/lsuf6MIH6Bgsq
# hkiG9w0BCRACLzGB6jCB5zCB5DCBvQQgU3jOPOfhPreDxFYnlKBSl+z1ci6P587v
# obSTwhtOPjUwgZgwgYCkfjB8MQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGlu
# Z3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBv
# cmF0aW9uMSYwJAYDVQQDEx1NaWNyb3NvZnQgVGltZS1TdGFtcCBQQ0EgMjAxMAIT
# MwAAAbJuQAN/bqmUkgABAAABsjAiBCByJJa0zNVR+zdOAJEb1W9fXdY92h7aJtOL
# 0OJVv5/quDANBgkqhkiG9w0BAQsFAASCAgCbKmfoyWQ8hbFSZiNbvwuOvkXEaDQr
# sJ06kY2df6ao5Y+xukQzqfTmDijyc3V0VDKMvNgHOJV8XQw8K4cTrFrbPGbfoQtK
# OmSZUL1ax8keQUjtu0P0PJRfsidV16ydt8JFClsps5GyG7+vfTIvME7v2iNq0B7P
# bQuJusBGrw2sqpY1WUjICgUe/KFuEcGAtRvOetxMudjq7+5gATnZwmj7dSQRZlY1
# pviai0SoHPwnfuI9mKMHeSnM03GKnYyeJCwRcRSLMZ6N4RXyp0DW3Fweq8M/DZyE
# oSs0bmQUwTgk36UyiLM+sOU4ouPjz2cswna/laizRez7icPZEBRm66N4UeZ9tgkR
# Yj83dTb6gadUx7nSqzm8IrGITNCRNZEuYUveuDaJN6cXajTyL0Go9bElGGaOee/2
# J7cYN6a/QZuKNcX/Kdh72cFgy8FuE2d4RZ2H698DDM7c/9Bw6N/Qw0iOGlncoayG
# 4jgY9PX78bE1WGtWP9Kr5gkdffhyCBHtODhEJzy9cyV4FSiJ+vXg9SUlDwiG6AUL
# n7wGV3e3HhPv9dGPrvhIpy60UE4WDB8nkrwkKEZ9aPS8kJm1iD/v7znVTF/zUAak
# mHTHunJyOaI8BbUebPGhG3BlEN1XBH87HlehSwJWRL/sU8yLR+xBPNy/PhCHSYJr
# WsNwRqpI8pxvZw==
# SIG # End signature block
