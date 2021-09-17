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
# MIIh2wYJKoZIhvcNAQcCoIIhzDCCIcgCAQExDzANBglghkgBZQMEAgEFADB5Bgor
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
# B3slcUSrBmrm1MbfI5qWdcUxghXKMIIVxgIBATCBlTB+MQswCQYDVQQGEwJVUzET
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
# uhPfnXYVfLUJGWQFUK2hghL9MIIS+QYKKwYBBAGCNwMDATGCEukwghLlBgkqhkiG
# 9w0BBwKgghLWMIIS0gIBAzEPMA0GCWCGSAFlAwQCAQUAMIIBWAYLKoZIhvcNAQkQ
# AQSgggFHBIIBQzCCAT8CAQEGCisGAQQBhFkKAwEwMTANBglghkgBZQMEAgEFAAQg
# QpIzrX4GaKSfg2x7GDowcrB6dKg45paGgo7/KKGVybUCBmExMLN3tBgSMjAyMTA5
# MTAwNDA4MjEuNjhaMASAAgH0oIHYpIHVMIHSMQswCQYDVQQGEwJVUzETMBEGA1UE
# CBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9z
# b2Z0IENvcnBvcmF0aW9uMS0wKwYDVQQLEyRNaWNyb3NvZnQgSXJlbGFuZCBPcGVy
# YXRpb25zIExpbWl0ZWQxJjAkBgNVBAsTHVRoYWxlcyBUU1MgRVNOOjhENDEtNEJG
# Ny1CM0I3MSUwIwYDVQQDExxNaWNyb3NvZnQgVGltZS1TdGFtcCBTZXJ2aWNloIIO
# TTCCBPkwggPhoAMCAQICEzMAAAE6jY0x93dJScIAAAAAATowDQYJKoZIhvcNAQEL
# BQAwfDELMAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcT
# B1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEmMCQGA1UE
# AxMdTWljcm9zb2Z0IFRpbWUtU3RhbXAgUENBIDIwMTAwHhcNMjAxMDE1MTcyODIy
# WhcNMjIwMTEyMTcyODIyWjCB0jELMAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hp
# bmd0b24xEDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jw
# b3JhdGlvbjEtMCsGA1UECxMkTWljcm9zb2Z0IElyZWxhbmQgT3BlcmF0aW9ucyBM
# aW1pdGVkMSYwJAYDVQQLEx1UaGFsZXMgVFNTIEVTTjo4RDQxLTRCRjctQjNCNzEl
# MCMGA1UEAxMcTWljcm9zb2Z0IFRpbWUtU3RhbXAgU2VydmljZTCCASIwDQYJKoZI
# hvcNAQEBBQADggEPADCCAQoCggEBAM5fJOdfD5c/CUyF2J/zvTmpKnFqnSfGVyYQ
# JLPYciwfPgDVu2Z4G9be4sO05oHqKDsDJ24QkEB9eFMFnfIUBVnsSqlaXCBZ2N29
# efj2JoFXkOFyn1idzzzI04l7u93qVx4/V1+5oUtiFasBLwzrnTiN8kC/A/DjhtuG
# /tdMwwxMjecL2eQNVnL5dnkIQhutRnhzWl71zpaE0G5VRWzFjphr4h74EZUYUY4D
# Zrr9Sdsun0BbYhMNKXVygkBuvMUJQYXLuC5/m2C+B6Hk9pq7ZKRxMg2fn66/imv8
# 1Az9wbHB5CnZDRjjg37yXVh2ldFs69cJz7lILTm35wTtKEoyKQUCAwEAAaOCARsw
# ggEXMB0GA1UdDgQWBBQUVqCfFl8Sa6bJbxx1rK0JhUXzyzAfBgNVHSMEGDAWgBTV
# YzpcijGQ80N7fEYbxTNoWoVtVTBWBgNVHR8ETzBNMEugSaBHhkVodHRwOi8vY3Js
# Lm1pY3Jvc29mdC5jb20vcGtpL2NybC9wcm9kdWN0cy9NaWNUaW1TdGFQQ0FfMjAx
# MC0wNy0wMS5jcmwwWgYIKwYBBQUHAQEETjBMMEoGCCsGAQUFBzAChj5odHRwOi8v
# d3d3Lm1pY3Jvc29mdC5jb20vcGtpL2NlcnRzL01pY1RpbVN0YVBDQV8yMDEwLTA3
# LTAxLmNydDAMBgNVHRMBAf8EAjAAMBMGA1UdJQQMMAoGCCsGAQUFBwMIMA0GCSqG
# SIb3DQEBCwUAA4IBAQBeN+Q+pAEto3gCfARtSk5uQM9I6W3Y6akrzC7e3zla2gBB
# 5XYJNOASnE5oc42017I8IAjDAkvo1+E6KotHJ83EqA9i6YWQPfA13h+pUR+6kHV2
# x4MdP726tGMlZJbUkzL9Y88yO+WeXYab3OFMJ+BW+ggmhdv/q+0a9I/tgxgsJfGl
# qr0Ks4Qif6O3DaGFHyeFkgh7NTrI4DJlk5oJbjyMbd5FfIi2ZdiGYMq+XDTojYk6
# 2hQ6u4cSNeqA7KFtBECglfOJ1dcFklntUogCiMK+QbamMCfoZaHD8OanoVmwYky5
# 7XC68CnQG8LYRa9Qx390WMBaA88jbSkgf0ybAdmzMIIGcTCCBFmgAwIBAgIKYQmB
# KgAAAAAAAjANBgkqhkiG9w0BAQsFADCBiDELMAkGA1UEBhMCVVMxEzARBgNVBAgT
# Cldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29m
# dCBDb3Jwb3JhdGlvbjEyMDAGA1UEAxMpTWljcm9zb2Z0IFJvb3QgQ2VydGlmaWNh
# dGUgQXV0aG9yaXR5IDIwMTAwHhcNMTAwNzAxMjEzNjU1WhcNMjUwNzAxMjE0NjU1
# WjB8MQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMH
# UmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMSYwJAYDVQQD
# Ex1NaWNyb3NvZnQgVGltZS1TdGFtcCBQQ0EgMjAxMDCCASIwDQYJKoZIhvcNAQEB
# BQADggEPADCCAQoCggEBAKkdDbx3EYo6IOz8E5f1+n9plGt0VBDVpQoAgoX77Xxo
# SyxfxcPlYcJ2tz5mK1vwFVMnBDEfQRsalR3OCROOfGEwWbEwRA/xYIiEVEMM1024
# OAizQt2TrNZzMFcmgqNFDdDq9UeBzb8kYDJYYEbyWEeGMoQedGFnkV+BVLHPk0yS
# wcSmXdFhE24oxhr5hoC732H8RsEnHSRnEnIaIYqvS2SJUGKxXf13Hz3wV3WsvYpC
# TUBR0Q+cBj5nf/VmwAOWRH7v0Ev9buWayrGo8noqCjHw2k4GkbaICDXoeByw6ZnN
# POcvRLqn9NxkvaQBwSAJk3jN/LzAyURdXhacAQVPIk0CAwEAAaOCAeYwggHiMBAG
# CSsGAQQBgjcVAQQDAgEAMB0GA1UdDgQWBBTVYzpcijGQ80N7fEYbxTNoWoVtVTAZ
# BgkrBgEEAYI3FAIEDB4KAFMAdQBiAEMAQTALBgNVHQ8EBAMCAYYwDwYDVR0TAQH/
# BAUwAwEB/zAfBgNVHSMEGDAWgBTV9lbLj+iiXGJo0T2UkFvXzpoYxDBWBgNVHR8E
# TzBNMEugSaBHhkVodHRwOi8vY3JsLm1pY3Jvc29mdC5jb20vcGtpL2NybC9wcm9k
# dWN0cy9NaWNSb29DZXJBdXRfMjAxMC0wNi0yMy5jcmwwWgYIKwYBBQUHAQEETjBM
# MEoGCCsGAQUFBzAChj5odHRwOi8vd3d3Lm1pY3Jvc29mdC5jb20vcGtpL2NlcnRz
# L01pY1Jvb0NlckF1dF8yMDEwLTA2LTIzLmNydDCBoAYDVR0gAQH/BIGVMIGSMIGP
# BgkrBgEEAYI3LgMwgYEwPQYIKwYBBQUHAgEWMWh0dHA6Ly93d3cubWljcm9zb2Z0
# LmNvbS9QS0kvZG9jcy9DUFMvZGVmYXVsdC5odG0wQAYIKwYBBQUHAgIwNB4yIB0A
# TABlAGcAYQBsAF8AUABvAGwAaQBjAHkAXwBTAHQAYQB0AGUAbQBlAG4AdAAuIB0w
# DQYJKoZIhvcNAQELBQADggIBAAfmiFEN4sbgmD+BcQM9naOhIW+z66bM9TG+zwXi
# qf76V20ZMLPCxWbJat/15/B4vceoniXj+bzta1RXCCtRgkQS+7lTjMz0YBKKdsxA
# QEGb3FwX/1z5Xhc1mCRWS3TvQhDIr79/xn/yN31aPxzymXlKkVIArzgPF/UveYFl
# 2am1a+THzvbKegBvSzBEJCI8z+0DpZaPWSm8tv0E4XCfMkon/VWvL/625Y4zu2Jf
# mttXQOnxzplmkIz/amJ/3cVKC5Em4jnsGUpxY517IW3DnKOiPPp/fZZqkHimbdLh
# nPkd/DjYlPTGpQqWhqS9nhquBEKDuLWAmyI4ILUl5WTs9/S/fmNZJQ96LjlXdqJx
# qgaKD4kWumGnEcua2A5HmoDF0M2n0O99g/DhO3EJ3110mCIIYdqwUB5vvfHhAN/n
# MQekkzr3ZUd46PioSKv33nJ+YWtvd6mBy6cJrDm77MbL2IK0cs0d9LiFAR6A+xuJ
# KlQ5slvayA1VmXqHczsI5pgt6o3gMy4SKfXAL1QnIffIrE7aKLixqduWsqdCosnP
# GUFN4Ib5KpqjEWYw07t0MkvfY3v1mYovG8chr1m1rtxEPJdQcdeh0sVV42neV8HR
# 3jDA/czmTfsNv11P6Z0eGTgvvM9YBS7vDaBQNdrvCScc1bN+NR4Iuto229Nfj950
# iEkSoYIC1zCCAkACAQEwggEAoYHYpIHVMIHSMQswCQYDVQQGEwJVUzETMBEGA1UE
# CBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9z
# b2Z0IENvcnBvcmF0aW9uMS0wKwYDVQQLEyRNaWNyb3NvZnQgSXJlbGFuZCBPcGVy
# YXRpb25zIExpbWl0ZWQxJjAkBgNVBAsTHVRoYWxlcyBUU1MgRVNOOjhENDEtNEJG
# Ny1CM0I3MSUwIwYDVQQDExxNaWNyb3NvZnQgVGltZS1TdGFtcCBTZXJ2aWNloiMK
# AQEwBwYFKw4DAhoDFQAHJZHZ9Y9YF4Hcr2I+NQfK5DWeCKCBgzCBgKR+MHwxCzAJ
# BgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25k
# MR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xJjAkBgNVBAMTHU1pY3Jv
# c29mdCBUaW1lLVN0YW1wIFBDQSAyMDEwMA0GCSqGSIb3DQEBBQUAAgUA5OTpaDAi
# GA8yMDIxMDkxMDA0MTMyOFoYDzIwMjEwOTExMDQxMzI4WjB3MD0GCisGAQQBhFkK
# BAExLzAtMAoCBQDk5OloAgEAMAoCAQACAjHTAgH/MAcCAQACAhE7MAoCBQDk5jro
# AgEAMDYGCisGAQQBhFkKBAIxKDAmMAwGCisGAQQBhFkKAwKgCjAIAgEAAgMHoSCh
# CjAIAgEAAgMBhqAwDQYJKoZIhvcNAQEFBQADgYEAmPpaoRgI+qcy/ZeJEdcksbRI
# a4A7lFoWJ8vhtzlKf05H8dLyATdKAY9iorsFpj8GsU+79PUxWWib6td1SuBODpk5
# 5oGuAOCpQCnmJ5RkOat4Z/NbOsrDhtubv2opljdoOydMOyAze9KwbQnyZbIJAMI/
# QZUPT52tIjfVXDwbCWMxggMNMIIDCQIBATCBkzB8MQswCQYDVQQGEwJVUzETMBEG
# A1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWlj
# cm9zb2Z0IENvcnBvcmF0aW9uMSYwJAYDVQQDEx1NaWNyb3NvZnQgVGltZS1TdGFt
# cCBQQ0EgMjAxMAITMwAAATqNjTH3d0lJwgAAAAABOjANBglghkgBZQMEAgEFAKCC
# AUowGgYJKoZIhvcNAQkDMQ0GCyqGSIb3DQEJEAEEMC8GCSqGSIb3DQEJBDEiBCBE
# CIJgOqbFB0Pb/X292N9XPl8yV8vWYp5rtUSHzmd3cTCB+gYLKoZIhvcNAQkQAi8x
# geowgecwgeQwgb0EIJ+v0IQHqSxf+wXbL37vBjk/ooS/XOHIKOTX9WlDfLRtMIGY
# MIGApH4wfDELMAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNV
# BAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEmMCQG
# A1UEAxMdTWljcm9zb2Z0IFRpbWUtU3RhbXAgUENBIDIwMTACEzMAAAE6jY0x93dJ
# ScIAAAAAATowIgQgSiFoWwPGycuttacg0onmojlXPqxFTEbm+SF1cuB3YjcwDQYJ
# KoZIhvcNAQELBQAEggEAJoPLjl+R9ckVFtRn4wy6rd/vWx0xDn7Y2LdHp/Yb7Ksk
# tJ56p9oVHLlZTjDWmkiZ9Yb6mqmPlshZDWktiLW/SndrYbP7bZYeUdJhxxu/ZaFH
# eLe2WnaxW1RBbGO3O787hlwQOSc6xoPUmuUsnnExI1UPC0AAMnQYW1KIXbusofGH
# Jj6cDJjSDHVkarVFWbDYyVXsEKRqtLA6LWfxxWsWopzhHuH9BMIMq/UZ2sLFlki4
# HBKRMpBHVFSqi206kFNdIiDF3iMQOn+wrasAKWIoKpqAgcTLaC/SW5Pb492WZyFx
# /ycnabdfNfrad7UTcYFSfsUm5f8RM1x//GB9G86BjA==
# SIG # End signature block
