[CmdletBinding()]
param
(
    [Parameter(Mandatory=$false)]
    [string]
    $AppxPath,

    [Parameter(Mandatory=$false)]
    [string]
    $LogPath,

    [Parameter(Mandatory=$false)]
    [string]
    $AppxDepDirPath
)

function Logic
{
   $Error.Clear();

   if(!$AppxPath)
   {
       $AppxPath = Join-Path $PSScriptRoot "GamingServices.appxbundle";
   }

    if(-not (test-path $AppxPath))
   {
       Write-Output "ERROR: Appx not found: $AppxPath";
       exit 1;
   }
   
   if(!$AppxDepDirPath)
   {
       $AppxDepDirPath = (get-item $AppxPath).Directory.FullName;
   }

   $systemVolume = Get-AppxVolume | Where-Object -Property IsSystemVolume -eq $True | Select-Object -First 1;

   if(!$systemVolume)
   {
       Write-Output "ERROR: System volume not found.";
       exit 1;
   }

   Write-Output ("System volume found.`n{0}" -f ($systemVolume | Format-List | Out-String).trim());

   $systemRoot = [System.IO.path]::GetPathRoot($systemVolume.PackageStorePath);

   if(!$systemRoot)
   {
       Write-Output "ERROR: System root not found.";
       exit 1;
   }

   Write-Output "System root found: $systemRoot";

   $package = Get-AppxPackage -Name Microsoft.GamingServices* | Sort-Object -Property Version -Descending | Select-Object -First 1;
   $isOldPackagePresent = $false;

   if($package)
   {
       Write-Output ("Version {0} of {1} was found already installed on the PC.`n{2}" -f $package.Version, $package.Name, ($package | Format-List | Out-String).trim());

       $isOldPackagePresent = (([Version]$package.Version -lt [Version]'2.53.24001.0') -or ([Version]$package.Version -eq [Version]'1.43.2002.0'));

       if($isOldPackagePresent)
       {
           Write-Output "Uninstalling $($package.PackageFullName) version $($package.Version)";
           remove-appxpackage -allusers $package.PackageFullName -ErrorAction Continue;

           if($Error)
           {
               Write-Output "Remove-AppxPackage failed for $($package.PackageFullName)";
           }
           else
           {
               Write-Output "Remove-AppxPackage completed for $AppxPath";
           }
       }
   }
   else
   {
       Write-Output 'No versions of Microsoft.GamingServices were found installed on the PC.';
   }

   if(($package -eq $null) -or $isOldPackagePresent)
   {
       Write-Output "Installing $AppxPath Version 2.53.24001.0 Volume $systemRoot";

       $allDepsFound = $TRUE;
       [string[]]$depPackageNames = 'Microsoft.NET.Native.Runtime.2.2','Microsoft.NET.Native.Framework.2.2','Microsoft.VCLibs.x64.14.00';
       $dependencyPaths = $depPackageNames | ForEach-Object {Join-Path -Path $AppxDepDirPath -ChildPath "$_.appx"};
       ForEach ($dep in $dependencyPaths) {if (-not (test-path $dep)) {$allDepsFound = $FALSE;}};

       if($allDepsFound)
       {
           Write-Output "Installing $AppxPath Version 2.53.24001.0 Volume $systemRoot -DependencyPath $dependencyPaths";
           add-appxpackage -forceApplicationShutdown -path $AppxPath -Volume $systemRoot -DependencyPath $dependencyPaths -ErrorAction Continue;
       }
       else
       {
           Write-Output "Installing $AppxPath Version 2.53.24001.0 Volume $systemRoot";
           add-appxpackage -forceApplicationShutdown -path $AppxPath -Volume $systemRoot -ErrorAction Continue;
       }

       if($Error)
       {
           Write-Output "ERROR: Add-AppxPackage failed for $AppxPath";
           $guid = ($error -split ' ' | select -Last 1) -as [Guid];
           if($guid)
           {
               Write-Output "Get-AppPackageLog -ActivityID $guid";
               Get-AppPackageLog -ActivityID $guid;
           }
       }
       else
       {
           Write-Output "Add-AppxPackage completed for $AppxPath";
       }
   }
   else
   {
       Write-Output "No installation needed as version $($package.Version) of $($package.Name) was found already installed on the PC.";
   }
}

$output = Logic;

if($LogPath)
{
    $output | Out-File -FilePath $LogPath -Append -Force;
}
else
{
    $output;
}

exit ($Error.Count);

# SIG # Begin signature block
# MIIh3AYJKoZIhvcNAQcCoIIhzTCCIckCAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCB9KivsG2Eh9+sZ
# RPx1FMLiNhi/UPOuYYDUbXcNMh2kSaCCC2cwggTvMIID16ADAgECAhMzAAAD3UPQ
# 4g2NkV9SAAAAAAPdMA0GCSqGSIb3DQEBCwUAMH4xCzAJBgNVBAYTAlVTMRMwEQYD
# VQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNy
# b3NvZnQgQ29ycG9yYXRpb24xKDAmBgNVBAMTH01pY3Jvc29mdCBDb2RlIFNpZ25p
# bmcgUENBIDIwMTAwHhcNMjAxMjE1MjEyNDE5WhcNMjExMjAyMjEyNDE5WjB0MQsw
# CQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9u
# ZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMR4wHAYDVQQDExVNaWNy
# b3NvZnQgQ29ycG9yYXRpb24wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIB
# AQCvaibAkuSFSEVpXIb1BKsC4+uZqBr2gIZYkUqdm3Z27BsRFcW4ldjBD65teLq/
# WZMXiuhkoLjxpJzKOQQi1nfWq/UBRI/6mdFXLVsljKxrp4PT61cApRzaJpWNesuK
# dxdscmxqfuGuP27iBLUEg9sL7l+VgLtNFd1nbygpoVOPvGGcQcMAl/UDdH2oqaHL
# igH4wChdGN6/f55Cm/CLhE7CS/5vcJJKQp+rwsHRMtUXHznF2ScOdpk2KbD2NvaF
# 963pz3Q1TWxatsK77/bxbtQ25mG+6ktySsDP8UifuK08hJo0ue+kCDgMzHfkmOVF
# rWuPsnVW/Cjy87yaTkW6IJ/DAgMBAAGjggFuMIIBajAfBgNVHSUEGDAWBgorBgEE
# AYI3PQYBBggrBgEFBQcDAzAdBgNVHQ4EFgQU1J5wl+I8PGEFbbw6XuSepgecWt0w
# RQYDVR0RBD4wPKQ6MDgxHjAcBgNVBAsTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEW
# MBQGA1UEBRMNMjMwODY1KzQ2MzEzMjAfBgNVHSMEGDAWgBTm/F97uyIAWORyTrX0
# IXQjMubvrDBWBgNVHR8ETzBNMEugSaBHhkVodHRwOi8vY3JsLm1pY3Jvc29mdC5j
# b20vcGtpL2NybC9wcm9kdWN0cy9NaWNDb2RTaWdQQ0FfMjAxMC0wNy0wNi5jcmww
# WgYIKwYBBQUHAQEETjBMMEoGCCsGAQUFBzAChj5odHRwOi8vd3d3Lm1pY3Jvc29m
# dC5jb20vcGtpL2NlcnRzL01pY0NvZFNpZ1BDQV8yMDEwLTA3LTA2LmNydDAMBgNV
# HRMBAf8EAjAAMA0GCSqGSIb3DQEBCwUAA4IBAQDohHI4zp7V+w9AAHozHsLa1jze
# +U41pvXhiOr8bg0q6RUn/SO+oRYRWDewhHF1r2qAEcInzMFupM6Zk+bY7g/GuSLr
# g0rCr3EBjNcScof/FyaF7NnYZPu+E7miz/gqDUfa5bPhT/95OMhAm3UTku5PSjIh
# toQH6p+iriTmiKpGcEjkG/ffw1pxIj2RjBzAl3nhHSUHPEGtJs1cXVf3fALdl0Q6
# 5NBsP5LGv6cC53kZMaZDDKsNkEOERLl4bVOU1FMIrm7Q9h23bDF5yAgfe1sOj5IN
# DwRm3oBlQCpXSUi5QoaUEfOw9B9a1Zzl0I2Yeky2V1zrLomMyXQ216DvP+C3MIIG
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
# B3slcUSrBmrm1MbfI5qWdcUxghXLMIIVxwIBATCBlTB+MQswCQYDVQQGEwJVUzET
# MBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMV
# TWljcm9zb2Z0IENvcnBvcmF0aW9uMSgwJgYDVQQDEx9NaWNyb3NvZnQgQ29kZSBT
# aWduaW5nIFBDQSAyMDEwAhMzAAAD3UPQ4g2NkV9SAAAAAAPdMA0GCWCGSAFlAwQC
# AQUAoIIBBDAZBgkqhkiG9w0BCQMxDAYKKwYBBAGCNwIBBDAcBgorBgEEAYI3AgEL
# MQ4wDAYKKwYBBAGCNwIBFTAvBgkqhkiG9w0BCQQxIgQgiKd+p1iNCfun0jNPbwQU
# H8gy7yWbWdUl4rKK77jcGBQwPAYKKwYBBAGCNwoDHDEuDCxzRzFaekRPZ0EraTNM
# Y0NOWU83Uy9xdWhadEtaVWpoNy9RV0FOYi9Gam84PTBaBgorBgEEAYI3AgEMMUww
# SqAkgCIATQBpAGMAcgBvAHMAbwBmAHQAIABXAGkAbgBkAG8AdwBzoSKAIGh0dHA6
# Ly93d3cubWljcm9zb2Z0LmNvbS93aW5kb3dzMA0GCSqGSIb3DQEBAQUABIIBAEGs
# WO/QVphoC8Bhy11/P74oxU8uKQNrZ14joocyLkHOpTja0s6noGOANkXffjrs9CF1
# awGGlJYjuLgtPX1NLXG3Qasgj2HPByZK+j7dCc2a8OjBEpYvtBCGupYq6HmuWiaq
# vQGibTeikmZWjj9Cp9RfwjHbcE7b2gp6mYl7wGOM4/CZtxuZsXJNed5RrrqmSPFM
# I4xqiAPYUhO6XQ0/3/aapI/GEq8gz1V7stKcPQ8IhP0YrQkw6pqo5O2bx4HPq9Sa
# RKS8oKBOxZGt3qwBab0Pfu5LR+A+yFeKUis29qHwXG1axayOY8lG8/f0+0oDOfEd
# uhPfnXYVfLUJGWQFUK2hghL+MIIS+gYKKwYBBAGCNwMDATGCEuowghLmBgkqhkiG
# 9w0BBwKgghLXMIIS0wIBAzEPMA0GCWCGSAFlAwQCAQUAMIIBWQYLKoZIhvcNAQkQ
# AQSgggFIBIIBRDCCAUACAQEGCisGAQQBhFkKAwEwMTANBglghkgBZQMEAgEFAAQg
# QpIzrX4GaKSfg2x7GDowcrB6dKg45paGgo7/KKGVybUCBmGDCvlxpBgTMjAyMTEx
# MDQxMDU1NDkuOTI2WjAEgAIB9KCB2KSB1TCB0jELMAkGA1UEBhMCVVMxEzARBgNV
# BAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jv
# c29mdCBDb3Jwb3JhdGlvbjEtMCsGA1UECxMkTWljcm9zb2Z0IElyZWxhbmQgT3Bl
# cmF0aW9ucyBMaW1pdGVkMSYwJAYDVQQLEx1UaGFsZXMgVFNTIEVTTjpEMDgyLTRC
# RkQtRUVCQTElMCMGA1UEAxMcTWljcm9zb2Z0IFRpbWUtU3RhbXAgU2VydmljZaCC
# Dk0wggT5MIID4aADAgECAhMzAAABQa9/Updc8txFAAAAAAFBMA0GCSqGSIb3DQEB
# CwUAMHwxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQH
# EwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xJjAkBgNV
# BAMTHU1pY3Jvc29mdCBUaW1lLVN0YW1wIFBDQSAyMDEwMB4XDTIwMTAxNTE3Mjgy
# N1oXDTIyMDExMjE3MjgyN1owgdIxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNo
# aW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29y
# cG9yYXRpb24xLTArBgNVBAsTJE1pY3Jvc29mdCBJcmVsYW5kIE9wZXJhdGlvbnMg
# TGltaXRlZDEmMCQGA1UECxMdVGhhbGVzIFRTUyBFU046RDA4Mi00QkZELUVFQkEx
# JTAjBgNVBAMTHE1pY3Jvc29mdCBUaW1lLVN0YW1wIFNlcnZpY2UwggEiMA0GCSqG
# SIb3DQEBAQUAA4IBDwAwggEKAoIBAQDyKsuovbx1qX48lSZQk7C9if+w4ITNDNnK
# P3hdsU+1GEOE+NqC+8o6/UaAyg65e+Skze4zkTru/I4I/GqFMDOrsCTfOQRdcG/s
# mgzxebTHlRycCSlSISjR7JxGXpudggHcqVlbe7Pglza/YVXQoIaQuu+p8o/xX+La
# FXI3zng56NanHzAZRrMzgJhRWjByAQNzvo5j5drhbbsMJkmbZ/2iXgGNIv5vYv9P
# yf8sQaSdpTHBJBM3UtAK364EMIBJ3pVBHkIsslW3owEvRbU2VpbEQAnCUh3IGdLW
# KEu9GDWNz8pRl7SxEV0Pd+EquM9pzeGjLTTsW+voajRYnimvasl1AgMBAAGjggEb
# MIIBFzAdBgNVHQ4EFgQULSg/LG4ukP1FcGv1zw07QQUSxsQwHwYDVR0jBBgwFoAU
# 1WM6XIoxkPNDe3xGG8UzaFqFbVUwVgYDVR0fBE8wTTBLoEmgR4ZFaHR0cDovL2Ny
# bC5taWNyb3NvZnQuY29tL3BraS9jcmwvcHJvZHVjdHMvTWljVGltU3RhUENBXzIw
# MTAtMDctMDEuY3JsMFoGCCsGAQUFBwEBBE4wTDBKBggrBgEFBQcwAoY+aHR0cDov
# L3d3dy5taWNyb3NvZnQuY29tL3BraS9jZXJ0cy9NaWNUaW1TdGFQQ0FfMjAxMC0w
# Ny0wMS5jcnQwDAYDVR0TAQH/BAIwADATBgNVHSUEDDAKBggrBgEFBQcDCDANBgkq
# hkiG9w0BAQsFAAOCAQEAUnrfIn3YKGoKCl7EPjyiS+Ia4LiKQ2y+bCUJJ63WwWm8
# kTMskHxxMXjPipBPPwCxC1x7DqYBWZAJgO71/l57XXFePUvAdixkadKz859G6XVU
# qZjnU5Cmq8rk78K3h+zQhuXOjx7I4snKBOT3tpdUDhTOrwZuUvstDleLABjjjow4
# Auc1cWj8qr22/OKnBjVhxGf+eUxD5v3Y6IsuYdUyLbABQ5GIoW9oB9haOFB37aoc
# syx2k2W7AFtZ7sUXkAGwOjQdE4xbIKDF0tDe+qvcMxIfdlYqKKsWy9YmZyF9k8ZE
# 5vCqzO9Jc8WY8Fn2j56v7hSgtX7nQZaedCTLsdWAuTCCBnEwggRZoAMCAQICCmEJ
# gSoAAAAAAAIwDQYJKoZIhvcNAQELBQAwgYgxCzAJBgNVBAYTAlVTMRMwEQYDVQQI
# EwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3Nv
# ZnQgQ29ycG9yYXRpb24xMjAwBgNVBAMTKU1pY3Jvc29mdCBSb290IENlcnRpZmlj
# YXRlIEF1dGhvcml0eSAyMDEwMB4XDTEwMDcwMTIxMzY1NVoXDTI1MDcwMTIxNDY1
# NVowfDELMAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcT
# B1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEmMCQGA1UE
# AxMdTWljcm9zb2Z0IFRpbWUtU3RhbXAgUENBIDIwMTAwggEiMA0GCSqGSIb3DQEB
# AQUAA4IBDwAwggEKAoIBAQCpHQ28dxGKOiDs/BOX9fp/aZRrdFQQ1aUKAIKF++18
# aEssX8XD5WHCdrc+Zitb8BVTJwQxH0EbGpUdzgkTjnxhMFmxMEQP8WCIhFRDDNdN
# uDgIs0Ldk6zWczBXJoKjRQ3Q6vVHgc2/JGAyWGBG8lhHhjKEHnRhZ5FfgVSxz5NM
# ksHEpl3RYRNuKMYa+YaAu99h/EbBJx0kZxJyGiGKr0tkiVBisV39dx898Fd1rL2K
# Qk1AUdEPnAY+Z3/1ZsADlkR+79BL/W7lmsqxqPJ6Kgox8NpOBpG2iAg16HgcsOmZ
# zTznL0S6p/TcZL2kAcEgCZN4zfy8wMlEXV4WnAEFTyJNAgMBAAGjggHmMIIB4jAQ
# BgkrBgEEAYI3FQEEAwIBADAdBgNVHQ4EFgQU1WM6XIoxkPNDe3xGG8UzaFqFbVUw
# GQYJKwYBBAGCNxQCBAweCgBTAHUAYgBDAEEwCwYDVR0PBAQDAgGGMA8GA1UdEwEB
# /wQFMAMBAf8wHwYDVR0jBBgwFoAU1fZWy4/oolxiaNE9lJBb186aGMQwVgYDVR0f
# BE8wTTBLoEmgR4ZFaHR0cDovL2NybC5taWNyb3NvZnQuY29tL3BraS9jcmwvcHJv
# ZHVjdHMvTWljUm9vQ2VyQXV0XzIwMTAtMDYtMjMuY3JsMFoGCCsGAQUFBwEBBE4w
# TDBKBggrBgEFBQcwAoY+aHR0cDovL3d3dy5taWNyb3NvZnQuY29tL3BraS9jZXJ0
# cy9NaWNSb29DZXJBdXRfMjAxMC0wNi0yMy5jcnQwgaAGA1UdIAEB/wSBlTCBkjCB
# jwYJKwYBBAGCNy4DMIGBMD0GCCsGAQUFBwIBFjFodHRwOi8vd3d3Lm1pY3Jvc29m
# dC5jb20vUEtJL2RvY3MvQ1BTL2RlZmF1bHQuaHRtMEAGCCsGAQUFBwICMDQeMiAd
# AEwAZQBnAGEAbABfAFAAbwBsAGkAYwB5AF8AUwB0AGEAdABlAG0AZQBuAHQALiAd
# MA0GCSqGSIb3DQEBCwUAA4ICAQAH5ohRDeLG4Jg/gXEDPZ2joSFvs+umzPUxvs8F
# 4qn++ldtGTCzwsVmyWrf9efweL3HqJ4l4/m87WtUVwgrUYJEEvu5U4zM9GASinbM
# QEBBm9xcF/9c+V4XNZgkVkt070IQyK+/f8Z/8jd9Wj8c8pl5SpFSAK84Dxf1L3mB
# ZdmptWvkx872ynoAb0swRCQiPM/tA6WWj1kpvLb9BOFwnzJKJ/1Vry/+tuWOM7ti
# X5rbV0Dp8c6ZZpCM/2pif93FSguRJuI57BlKcWOdeyFtw5yjojz6f32WapB4pm3S
# 4Zz5Hfw42JT0xqUKloakvZ4argRCg7i1gJsiOCC1JeVk7Pf0v35jWSUPei45V3ai
# caoGig+JFrphpxHLmtgOR5qAxdDNp9DvfYPw4TtxCd9ddJgiCGHasFAeb73x4QDf
# 5zEHpJM692VHeOj4qEir995yfmFrb3epgcunCaw5u+zGy9iCtHLNHfS4hQEegPsb
# iSpUObJb2sgNVZl6h3M7COaYLeqN4DMuEin1wC9UJyH3yKxO2ii4sanblrKnQqLJ
# zxlBTeCG+SqaoxFmMNO7dDJL32N79ZmKLxvHIa9Zta7cRDyXUHHXodLFVeNp3lfB
# 0d4wwP3M5k37Db9dT+mdHhk4L7zPWAUu7w2gUDXa7wknHNWzfjUeCLraNtvTX4/e
# dIhJEqGCAtcwggJAAgEBMIIBAKGB2KSB1TCB0jELMAkGA1UEBhMCVVMxEzARBgNV
# BAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jv
# c29mdCBDb3Jwb3JhdGlvbjEtMCsGA1UECxMkTWljcm9zb2Z0IElyZWxhbmQgT3Bl
# cmF0aW9ucyBMaW1pdGVkMSYwJAYDVQQLEx1UaGFsZXMgVFNTIEVTTjpEMDgyLTRC
# RkQtRUVCQTElMCMGA1UEAxMcTWljcm9zb2Z0IFRpbWUtU3RhbXAgU2VydmljZaIj
# CgEBMAcGBSsOAwIaAxUAquW/KbUKq4ihByvOdwu+QPValQOggYMwgYCkfjB8MQsw
# CQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9u
# ZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMSYwJAYDVQQDEx1NaWNy
# b3NvZnQgVGltZS1TdGFtcCBQQ0EgMjAxMDANBgkqhkiG9w0BAQUFAAIFAOUuMjYw
# IhgPMjAyMTExMDQxODE5MzRaGA8yMDIxMTEwNTE4MTkzNFowdzA9BgorBgEEAYRZ
# CgQBMS8wLTAKAgUA5S4yNgIBADAKAgEAAgINPAIB/zAHAgEAAgIQuTAKAgUA5S+D
# tgIBADA2BgorBgEEAYRZCgQCMSgwJjAMBgorBgEEAYRZCgMCoAowCAIBAAIDB6Eg
# oQowCAIBAAIDAYagMA0GCSqGSIb3DQEBBQUAA4GBAHN5gpgtdV+EutuCAogsFDkQ
# bBcErC2VJX68TPW1q+7q+Yi0wpUVSXpD7e43a2nXs0lD7Zx1dgE1gu5oeuuoDUk5
# rjgNzLlXVZVBWLuFRkD+aLn7wL+wFTikdIYI4QG4nF+5N83yp9FZV/n6isYsaF1F
# Tb4NiMAvMqAZGkeyGFZSMYIDDTCCAwkCAQEwgZMwfDELMAkGA1UEBhMCVVMxEzAR
# BgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1p
# Y3Jvc29mdCBDb3Jwb3JhdGlvbjEmMCQGA1UEAxMdTWljcm9zb2Z0IFRpbWUtU3Rh
# bXAgUENBIDIwMTACEzMAAAFBr39Sl1zy3EUAAAAAAUEwDQYJYIZIAWUDBAIBBQCg
# ggFKMBoGCSqGSIb3DQEJAzENBgsqhkiG9w0BCRABBDAvBgkqhkiG9w0BCQQxIgQg
# sCGEU90ngJtXm78YihVwQRK8LM6QcSCmx77QT6R9/3UwgfoGCyqGSIb3DQEJEAIv
# MYHqMIHnMIHkMIG9BCBRPwE8jOpzdJ5wdE8soG1bS846dP7vyFpaj5dzFV6t3jCB
# mDCBgKR+MHwxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYD
# VQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xJjAk
# BgNVBAMTHU1pY3Jvc29mdCBUaW1lLVN0YW1wIFBDQSAyMDEwAhMzAAABQa9/Updc
# 8txFAAAAAAFBMCIEIGfUHKSkGxNwdQkR3hDpPjbB4LMeda53NiK7jWyEAEAXMA0G
# CSqGSIb3DQEBCwUABIIBAEhk7XXlOFLZYYPoGTf5QLcUP76eP7mA6odhRPizPl+C
# ygpuqtYZGUU/mwsdiy9IGmq44Gs85NLAlwXB6bOCYnSQ8aPPj+4GJZy66ruC2ji4
# MxKh3/MQRQXdiW+IFjhMdRRwSfHBgauASyp0dOxH18NwfjWQDjyFF/V4YFEImLP/
# Sxnk0hlrnScUFy80JbAIKvCFMSKWyj7OIuu5r7h7Tr0tEHsUIdshXtBYd1U0G5pg
# AgW42dD3/CLTiEQH9LB0KrX2NvbI23s6GG6HXY2eu0idcNvRijyzRXD395V+s1k1
# YBZfwUYRuuELoS/wc7a8p4guPU1ybnSleuhW7Fe5Wq0=
# SIG # End signature block
