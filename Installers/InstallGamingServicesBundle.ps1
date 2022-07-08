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

       $isOldPackagePresent = (([Version]$package.Version -lt [Version]'4.66.28001.0') -or ([Version]$package.Version -eq [Version]'1.43.2002.0'));

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
       Write-Output "Installing $AppxPath Version 4.66.28001.0 Volume $systemRoot";

       $allDepsFound = $TRUE;
       [string[]]$depPackageNames = 'Microsoft.NET.Native.Runtime.2.2','Microsoft.NET.Native.Framework.2.2','Microsoft.VCLibs.x64.14.00';
       $dependencyPaths = $depPackageNames | ForEach-Object {Join-Path -Path $AppxDepDirPath -ChildPath "$_.appx"};
       ForEach ($dep in $dependencyPaths) {if (-not (test-path $dep)) {$allDepsFound = $FALSE;}};

       if($allDepsFound)
       {
           Write-Output "Installing $AppxPath Version 4.66.28001.0 Volume $systemRoot -DependencyPath $dependencyPaths";
           add-appxpackage -forceApplicationShutdown -path $AppxPath -Volume $systemRoot -DependencyPath $dependencyPaths -ErrorAction Continue;
       }
       else
       {
           Write-Output "Installing $AppxPath Version 4.66.28001.0 Volume $systemRoot";
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
# MIIl9AYJKoZIhvcNAQcCoIIl5TCCJeECAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCAn3alm6ya4o3yj
# gXk2/0FHWjAcpSrApUj+4GUCoozq+qCCC2cwggTvMIID16ADAgECAhMzAAAEOA/I
# Xba8U/0OAAAAAAQ4MA0GCSqGSIb3DQEBCwUAMH4xCzAJBgNVBAYTAlVTMRMwEQYD
# VQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNy
# b3NvZnQgQ29ycG9yYXRpb24xKDAmBgNVBAMTH01pY3Jvc29mdCBDb2RlIFNpZ25p
# bmcgUENBIDIwMTAwHhcNMjEwOTAyMTgyNTU3WhcNMjIwOTAxMTgyNTU3WjB0MQsw
# CQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9u
# ZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMR4wHAYDVQQDExVNaWNy
# b3NvZnQgQ29ycG9yYXRpb24wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIB
# AQCurn8/CcSq9qOPnAFrKtGtCy/iX+WUNZ9pll+bOTwGISP3nAKZGu3AJVgzK2Kx
# dEciTQExXZIEpUKSBJDNY4QX6beqtbbU6lGNlbxB3b73e5tQ16DpQGYUkeHJk2a9
# uT3cv0j8VOZDZCqb1zFpJtrF4vggAimoc2DPUVa7B7oDemRU8GQuCCFPl1IydL4u
# 57q9W7gb0zIm0DGw1P03Yv7SzQPAFbVRe+92D8f4W9SM8/EYDAAEdOn1RwRmRZd5
# avK5U1D3/APqdldgNzn0UozCWbiz84AsHR7BheqzDWEx0wvSsCIywv82xUW7wY2c
# 0K6eXMKAIjhAOtJT5RCun1CnAgMBAAGjggFuMIIBajAfBgNVHSUEGDAWBgorBgEE
# AYI3PQYBBggrBgEFBQcDAzAdBgNVHQ4EFgQUgZix3QHakOJ1+OMpggGOIMFUPxgw
# RQYDVR0RBD4wPKQ6MDgxHjAcBgNVBAsTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEW
# MBQGA1UEBRMNMjMwODY1KzQ2NzM5NzAfBgNVHSMEGDAWgBTm/F97uyIAWORyTrX0
# IXQjMubvrDBWBgNVHR8ETzBNMEugSaBHhkVodHRwOi8vY3JsLm1pY3Jvc29mdC5j
# b20vcGtpL2NybC9wcm9kdWN0cy9NaWNDb2RTaWdQQ0FfMjAxMC0wNy0wNi5jcmww
# WgYIKwYBBQUHAQEETjBMMEoGCCsGAQUFBzAChj5odHRwOi8vd3d3Lm1pY3Jvc29m
# dC5jb20vcGtpL2NlcnRzL01pY0NvZFNpZ1BDQV8yMDEwLTA3LTA2LmNydDAMBgNV
# HRMBAf8EAjAAMA0GCSqGSIb3DQEBCwUAA4IBAQDOS4QT+AjIqX3O7FH4FD6TTJWK
# viXQBZv1aL02GgTGqHvFqbilEbQ8TW81TcoU7t7WB2QGqu/utgFqh1UaNsrQNf+R
# +NIvcB5hESNsDco18jQtul935jlJu+J01I1CeeoW4/Xlrbmbuluugm5wUcGclLi5
# 3uALKWQGMp2d14BeIu52stPJQdnn292bk6b9aONC4ic3rjSZGxwz92kmO2XRFsdK
# 5DPVlJj06FLU7i4nzcOLijtLkuIm9vcWDIwgpSV+JHYirr3nGis2AbR9qzTGhOHq
# OfsHvN7gunVTcP3Fz8JRds8nmyS0tSR9ulYU/n1uyDx1CxRq5seFa7fGBfVMMIIG
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
# B3slcUSrBmrm1MbfI5qWdcUxghnjMIIZ3wIBATCBlTB+MQswCQYDVQQGEwJVUzET
# MBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMV
# TWljcm9zb2Z0IENvcnBvcmF0aW9uMSgwJgYDVQQDEx9NaWNyb3NvZnQgQ29kZSBT
# aWduaW5nIFBDQSAyMDEwAhMzAAAEOA/IXba8U/0OAAAAAAQ4MA0GCWCGSAFlAwQC
# AQUAoIIBBDAZBgkqhkiG9w0BCQMxDAYKKwYBBAGCNwIBBDAcBgorBgEEAYI3AgEL
# MQ4wDAYKKwYBBAGCNwIBFTAvBgkqhkiG9w0BCQQxIgQgGZVAbUW4je8Z6/iXMi0l
# tgeRIidqQtltNlHR2orqvl8wPAYKKwYBBAGCNwoDHDEuDCxSbU5FSFRzZkMrNHhY
# djZJMitTTW9VUDRiZjZxUHpjQ3Q2VjRrTFNMWFc0PTBaBgorBgEEAYI3AgEMMUww
# SqAkgCIATQBpAGMAcgBvAHMAbwBmAHQAIABXAGkAbgBkAG8AdwBzoSKAIGh0dHA6
# Ly93d3cubWljcm9zb2Z0LmNvbS93aW5kb3dzMA0GCSqGSIb3DQEBAQUABIIBAIDP
# gYkde4n2OqFLq3OPMeehtWlT8JiGF5E+gdQP/5wWTlhnTKqTTPo2VEAsaSZpRpwP
# GttOsXm1aNjZhjiNUQ/CaZmkiIane/SXwIP1uVG0mrooRWwveBFt4wCw77gJyDeF
# ajx3MQhp9jZIme6NLIB4Bm8dtvI2Ue4sFzAuCXqJAv6pYyTNMVzZYgfGqZU+tiea
# hJNhg9YsX6rXUdM4Ow46s1jlVpPJtGxYqvQ4hWMGMYEns3/IfUHxo1eXyokrshMK
# 3zJyMcXdLcZFXCs0vudMUr2iR/6o6bJ6f7XxCc/Yc95FJiwoWXfCUsiKqRojhwIb
# CjDUgh84WdSCWRhodfihghcWMIIXEgYKKwYBBAGCNwMDATGCFwIwghb+BgkqhkiG
# 9w0BBwKgghbvMIIW6wIBAzEPMA0GCWCGSAFlAwQCAQUAMIIBWQYLKoZIhvcNAQkQ
# AQSgggFIBIIBRDCCAUACAQEGCisGAQQBhFkKAwEwMTANBglghkgBZQMEAgEFAAQg
# Qmzbzc8e4Q8MzsRwVmOjP+AmbzoRfUrDe1dzLh3aSnQCBmK5srG/QxgTMjAyMjA3
# MDYxMTQ1MjMuMjY1WjAEgAIB9KCB2KSB1TCB0jELMAkGA1UEBhMCVVMxEzARBgNV
# BAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jv
# c29mdCBDb3Jwb3JhdGlvbjEtMCsGA1UECxMkTWljcm9zb2Z0IElyZWxhbmQgT3Bl
# cmF0aW9ucyBMaW1pdGVkMSYwJAYDVQQLEx1UaGFsZXMgVFNTIEVTTjo4NkRGLTRC
# QkMtOTMzNTElMCMGA1UEAxMcTWljcm9zb2Z0IFRpbWUtU3RhbXAgU2VydmljZaCC
# EWUwggcUMIIE/KADAgECAhMzAAABjAGXYkc2dmY7AAEAAAGMMA0GCSqGSIb3DQEB
# CwUAMHwxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQH
# EwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xJjAkBgNV
# BAMTHU1pY3Jvc29mdCBUaW1lLVN0YW1wIFBDQSAyMDEwMB4XDTIxMTAyODE5Mjc0
# NFoXDTIzMDEyNjE5Mjc0NFowgdIxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNo
# aW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29y
# cG9yYXRpb24xLTArBgNVBAsTJE1pY3Jvc29mdCBJcmVsYW5kIE9wZXJhdGlvbnMg
# TGltaXRlZDEmMCQGA1UECxMdVGhhbGVzIFRTUyBFU046ODZERi00QkJDLTkzMzUx
# JTAjBgNVBAMTHE1pY3Jvc29mdCBUaW1lLVN0YW1wIFNlcnZpY2UwggIiMA0GCSqG
# SIb3DQEBAQUAA4ICDwAwggIKAoICAQDTSGhMoRP5IaxrLD70EV2b65n6S8Q8Yt3m
# wXxeVPdTLhgapPzr4OvwbeTqr+VFqCLFEq+f6DYAVEv1W5moLW5O9rt1k30KGKi0
# ccWbLJBk9qVd0lMLycoituBMxcDCH+ZuGeahrGwj2MaWK9iCLkY04Tu7pNXhQ62d
# U/yKiFNR80wqFlol3OZYOOFYLsuM9ciFqb1CFGRXOuTF8kpzn0CxoYPc++JGSAeg
# bF+l1Yc89pbyKIQeNzg8OYIqW5bcn4h1Tfwf4yQo+Z6QLsa1FMtcoEK5YpdLxONl
# j/CQ1zNY0Sj6Xknc5l0d5WKDGnMKd6yRl9wdfGsJfaG57uom9auSwVK2Rls4bshi
# Zp9gxCtka6WXvY+dLWgh1B1idHn+eBy9JBvXUZDSQ0wPOIqxJ37mJ9RphsktnRcT
# E1XiotcJLrkOP7wXKAKO02+QOIHkez0jsr3PFmxRvt8opIYRn3IDQmBNZtwA8Jg+
# 24AdUnxQppP3rukmbv6veGBx7fxVTf2yl54ceBoJLi9et6VMuJQwCXQ62TmdwpAp
# zaQae+7A/ZEJLeQQQUDGifAufynJ53Kt5lNsExAGp/WjeSPSKU4nv9/8/dzWudpg
# 7TUYMmia/ui2lvnP7WGtKgizy77p6u4koJOKF3SL/xtzrsAoXvrCla69b0GFtQxO
# xaTDDivjZwIDAQABo4IBNjCCATIwHQYDVR0OBBYEFJbOU4apgiFgiHlWnT6Iyt1A
# i1IjMB8GA1UdIwQYMBaAFJ+nFV0AXmJdg/Tl0mWnG1M1GelyMF8GA1UdHwRYMFYw
# VKBSoFCGTmh0dHA6Ly93d3cubWljcm9zb2Z0LmNvbS9wa2lvcHMvY3JsL01pY3Jv
# c29mdCUyMFRpbWUtU3RhbXAlMjBQQ0ElMjAyMDEwKDEpLmNybDBsBggrBgEFBQcB
# AQRgMF4wXAYIKwYBBQUHMAKGUGh0dHA6Ly93d3cubWljcm9zb2Z0LmNvbS9wa2lv
# cHMvY2VydHMvTWljcm9zb2Z0JTIwVGltZS1TdGFtcCUyMFBDQSUyMDIwMTAoMSku
# Y3J0MAwGA1UdEwEB/wQCMAAwEwYDVR0lBAwwCgYIKwYBBQUHAwgwDQYJKoZIhvcN
# AQELBQADggIBANdoxUVYwgmp1uVBkrqiSztx0JTB48CaYQh52zK6yBQwhCVCpqN8
# I/2IbnzI4VJHHaTn2PaEAFJkHEWZuRWPCFgQLXIk9Cb3jriBTPkb645bnWLy5554
# HeHaL4OahY0o1K6Ug3J9IaBbo8IMKJGo7eqfwphXMvOh6Z8+Kv9RXHkICBVwQMAy
# 3FtGtMdcEAFfIJrppDf6O6RYHlpDMvDqqEeHPscg5T2r9D1jY2dUEo9/MiXA+NvY
# 2tAZ9CddOyx8UP3w6lEerTtlTHbWDimzxXfeFJKQna4PCG2nlW0UacX4DHMUGUK9
# zfcs9OZexzOXLr7JCABHCY0d40DbrZaosskzzgjPw5LVV8TU3rJgKQuODzX7MZey
# O8waaMGWLLFnBdYZYmayi8HpPqHUat+a8wq504T3YPrtJHfNPcN0DknAv1MDNfxS
# GLRoZi2fm41QMVvEijMhEyktWk/9g4ueD6va/yzyXJa/Rp+PBlgcEnrgxZU3Edxo
# 22PORi1CN1nluHKRrp1f4O1AP1uHfOOLRKWt9UMgvERvo6PKq18aPuJZm8mtvgCo
# hWAdBoPOC6LERL2J60WKQd9/qn3sLmqhtNNsrA3QAQ/erm17Ij00g5WUmXSCLkht
# 3nweJ/cks7q+n7nIdeOhIv8yWEWa8a1piZDAPsrNOb24AMXgHM/+bHa/MIIHcTCC
# BVmgAwIBAgITMwAAABXF52ueAptJmQAAAAAAFTANBgkqhkiG9w0BAQsFADCBiDEL
# MAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1v
# bmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEyMDAGA1UEAxMpTWlj
# cm9zb2Z0IFJvb3QgQ2VydGlmaWNhdGUgQXV0aG9yaXR5IDIwMTAwHhcNMjEwOTMw
# MTgyMjI1WhcNMzAwOTMwMTgzMjI1WjB8MQswCQYDVQQGEwJVUzETMBEGA1UECBMK
# V2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0
# IENvcnBvcmF0aW9uMSYwJAYDVQQDEx1NaWNyb3NvZnQgVGltZS1TdGFtcCBQQ0Eg
# MjAxMDCCAiIwDQYJKoZIhvcNAQEBBQADggIPADCCAgoCggIBAOThpkzntHIhC3mi
# y9ckeb0O1YLT/e6cBwfSqWxOdcjKNVf2AX9sSuDivbk+F2Az/1xPx2b3lVNxWuJ+
# Slr+uDZnhUYjDLWNE893MsAQGOhgfWpSg0S3po5GawcU88V29YZQ3MFEyHFcUTE3
# oAo4bo3t1w/YJlN8OWECesSq/XJprx2rrPY2vjUmZNqYO7oaezOtgFt+jBAcnVL+
# tuhiJdxqD89d9P6OU8/W7IVWTe/dvI2k45GPsjksUZzpcGkNyjYtcI4xyDUoveO0
# hyTD4MmPfrVUj9z6BVWYbWg7mka97aSueik3rMvrg0XnRm7KMtXAhjBcTyziYrLN
# ueKNiOSWrAFKu75xqRdbZ2De+JKRHh09/SDPc31BmkZ1zcRfNN0Sidb9pSB9fvzZ
# nkXftnIv231fgLrbqn427DZM9ituqBJR6L8FA6PRc6ZNN3SUHDSCD/AQ8rdHGO2n
# 6Jl8P0zbr17C89XYcz1DTsEzOUyOArxCaC4Q6oRRRuLRvWoYWmEBc8pnol7XKHYC
# 4jMYctenIPDC+hIK12NvDMk2ZItboKaDIV1fMHSRlJTYuVD5C4lh8zYGNRiER9vc
# G9H9stQcxWv2XFJRXRLbJbqvUAV6bMURHXLvjflSxIUXk8A8FdsaN8cIFRg/eKtF
# tvUeh17aj54WcmnGrnu3tz5q4i6tAgMBAAGjggHdMIIB2TASBgkrBgEEAYI3FQEE
# BQIDAQABMCMGCSsGAQQBgjcVAgQWBBQqp1L+ZMSavoKRPEY1Kc8Q/y8E7jAdBgNV
# HQ4EFgQUn6cVXQBeYl2D9OXSZacbUzUZ6XIwXAYDVR0gBFUwUzBRBgwrBgEEAYI3
# TIN9AQEwQTA/BggrBgEFBQcCARYzaHR0cDovL3d3dy5taWNyb3NvZnQuY29tL3Br
# aW9wcy9Eb2NzL1JlcG9zaXRvcnkuaHRtMBMGA1UdJQQMMAoGCCsGAQUFBwMIMBkG
# CSsGAQQBgjcUAgQMHgoAUwB1AGIAQwBBMAsGA1UdDwQEAwIBhjAPBgNVHRMBAf8E
# BTADAQH/MB8GA1UdIwQYMBaAFNX2VsuP6KJcYmjRPZSQW9fOmhjEMFYGA1UdHwRP
# ME0wS6BJoEeGRWh0dHA6Ly9jcmwubWljcm9zb2Z0LmNvbS9wa2kvY3JsL3Byb2R1
# Y3RzL01pY1Jvb0NlckF1dF8yMDEwLTA2LTIzLmNybDBaBggrBgEFBQcBAQROMEww
# SgYIKwYBBQUHMAKGPmh0dHA6Ly93d3cubWljcm9zb2Z0LmNvbS9wa2kvY2VydHMv
# TWljUm9vQ2VyQXV0XzIwMTAtMDYtMjMuY3J0MA0GCSqGSIb3DQEBCwUAA4ICAQCd
# VX38Kq3hLB9nATEkW+Geckv8qW/qXBS2Pk5HZHixBpOXPTEztTnXwnE2P9pkbHzQ
# dTltuw8x5MKP+2zRoZQYIu7pZmc6U03dmLq2HnjYNi6cqYJWAAOwBb6J6Gngugnu
# e99qb74py27YP0h1AdkY3m2CDPVtI1TkeFN1JFe53Z/zjj3G82jfZfakVqr3lbYo
# VSfQJL1AoL8ZthISEV09J+BAljis9/kpicO8F7BUhUKz/AyeixmJ5/ALaoHCgRlC
# GVJ1ijbCHcNhcy4sa3tuPywJeBTpkbKpW99Jo3QMvOyRgNI95ko+ZjtPu4b6MhrZ
# lvSP9pEB9s7GdP32THJvEKt1MMU0sHrYUP4KWN1APMdUbZ1jdEgssU5HLcEUBHG/
# ZPkkvnNtyo4JvbMBV0lUZNlz138eW0QBjloZkWsNn6Qo3GcZKCS6OEuabvshVGtq
# RRFHqfG3rsjoiV5PndLQTHa1V1QJsWkBRH58oWFsc/4Ku+xBZj1p/cvBQUl+fpO+
# y/g75LcVv7TOPqUxUYS8vwLBgqJ7Fx0ViY1w/ue10CgaiQuPNtq6TPmb/wrpNPgk
# NWcr4A245oyZ1uEi6vAnQj0llOZ0dFtq0Z4+7X6gMTN9vMvpe784cETRkPHIqzqK
# Oghif9lwY1NNje6CbaUFEMFxBmoQtB1VM1izoXBm8qGCAtQwggI9AgEBMIIBAKGB
# 2KSB1TCB0jELMAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNV
# BAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEtMCsG
# A1UECxMkTWljcm9zb2Z0IElyZWxhbmQgT3BlcmF0aW9ucyBMaW1pdGVkMSYwJAYD
# VQQLEx1UaGFsZXMgVFNTIEVTTjo4NkRGLTRCQkMtOTMzNTElMCMGA1UEAxMcTWlj
# cm9zb2Z0IFRpbWUtU3RhbXAgU2VydmljZaIjCgEBMAcGBSsOAwIaAxUANKLyFOur
# 9DyimnB4bK5ks0Qmr9WggYMwgYCkfjB8MQswCQYDVQQGEwJVUzETMBEGA1UECBMK
# V2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0
# IENvcnBvcmF0aW9uMSYwJAYDVQQDEx1NaWNyb3NvZnQgVGltZS1TdGFtcCBQQ0Eg
# MjAxMDANBgkqhkiG9w0BAQUFAAIFAOZvZaswIhgPMjAyMjA3MDYwOTM2NDNaGA8y
# MDIyMDcwNzA5MzY0M1owdDA6BgorBgEEAYRZCgQBMSwwKjAKAgUA5m9lqwIBADAH
# AgEAAgIOajAHAgEAAgIRWTAKAgUA5nC3KwIBADA2BgorBgEEAYRZCgQCMSgwJjAM
# BgorBgEEAYRZCgMCoAowCAIBAAIDB6EgoQowCAIBAAIDAYagMA0GCSqGSIb3DQEB
# BQUAA4GBADNNHzwKGp2az5vzKqeFXRE0gBZYCuZGUMOYYBV8vXhm7oaQnQTaTaKe
# 3ylVpdNExTbMUykTCwOKFlbH87ej1zL3U2pD5SuoOPBJ7LgymaX0cN2jMb/XglZX
# PGy8RkPKtAVMG82K/YUaXq8R4I/D/NqUkcJA64a2qFFnu67rK41qMYIEDTCCBAkC
# AQEwgZMwfDELMAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNV
# BAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEmMCQG
# A1UEAxMdTWljcm9zb2Z0IFRpbWUtU3RhbXAgUENBIDIwMTACEzMAAAGMAZdiRzZ2
# ZjsAAQAAAYwwDQYJYIZIAWUDBAIBBQCgggFKMBoGCSqGSIb3DQEJAzENBgsqhkiG
# 9w0BCRABBDAvBgkqhkiG9w0BCQQxIgQgmFnXF8hUahcK6/D1KlJw4F+6KnEYkD89
# Iia07uDqUh8wgfoGCyqGSIb3DQEJEAIvMYHqMIHnMIHkMIG9BCDVrYv4FSqQzwZ/
# xOYhBZ2B4pNOthcjA6h864mIGJhpnjCBmDCBgKR+MHwxCzAJBgNVBAYTAlVTMRMw
# EQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVN
# aWNyb3NvZnQgQ29ycG9yYXRpb24xJjAkBgNVBAMTHU1pY3Jvc29mdCBUaW1lLVN0
# YW1wIFBDQSAyMDEwAhMzAAABjAGXYkc2dmY7AAEAAAGMMCIEIIrJPKCvSQbgSQ4i
# tdHArJF/qXBVPdUs2LcmSP9cpvamMA0GCSqGSIb3DQEBCwUABIICAF/QWHyOMgiD
# iFs7uNu4mWnyzKz0yKDfwcYhuDNcn3A6ujVulq4wrZYCtkyhzxysIxpchftKfGXO
# srIMgPhWB6QHygx75AtANqhWeb0gm8zR+uKcE+wIRwyWpcrc3GWAoopdWWhkIB5f
# WuNQVVkpRHBWzmfMc1iJI91MroOMZp8J8ON0PeNT3DMSdVKOpmNovsfgNA5gpMwI
# APD1PDi+5XqRqY+j55SClaruiJgfXRsxdb+hYsfcBZo8ltJ7Gk/FpplDK9rTvtTv
# mS4LYQCmn6BwONHPZVFyl3hw5w1WDc4+ZJF2SX90OW5HYm7rvglc6ANnNExbrobw
# r2zgrmK208TDrSnliVSVAEv0KJdmnzgJh+xW6O9AwiQotOVawzQ9wOyfWVZ3udc1
# zmRn1gDeZdtUO1kstkllxAgafIIaAeyjRjak8zTlDLzJoMQifgHr90OemXWyOUF0
# 98q4AepBWgUoBwS0Kfk+iTCAn3+yJuGm1S5lBPUsCo0gJle8pUKwVMVnqZvIcKv7
# cIx9NP4nS4tN4zpDaKtxM7yV98mPrCGMKhP9ylj7CPTuu5HrgaR4CcbunBYvzbEc
# MXY+UhLIcPE7a2uS5UOw2mZ6YOSuM1XCrxtlWp102h8PUygQVAOxw4Y7iqc+VSwb
# BHIlhoOYT9SGyoy8Gh2BlyNUsz/fQY36
# SIG # End signature block
