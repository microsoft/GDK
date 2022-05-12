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

       $isOldPackagePresent = (([Version]$package.Version -lt [Version]'3.63.22003.0') -or ([Version]$package.Version -eq [Version]'1.43.2002.0'));

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
       Write-Output "Installing $AppxPath Version 3.63.22003.0 Volume $systemRoot";

       $allDepsFound = $TRUE;
       [string[]]$depPackageNames = 'Microsoft.NET.Native.Runtime.2.2','Microsoft.NET.Native.Framework.2.2','Microsoft.VCLibs.x64.14.00';
       $dependencyPaths = $depPackageNames | ForEach-Object {Join-Path -Path $AppxDepDirPath -ChildPath "$_.appx"};
       ForEach ($dep in $dependencyPaths) {if (-not (test-path $dep)) {$allDepsFound = $FALSE;}};

       if($allDepsFound)
       {
           Write-Output "Installing $AppxPath Version 3.63.22003.0 Volume $systemRoot -DependencyPath $dependencyPaths";
           add-appxpackage -forceApplicationShutdown -path $AppxPath -Volume $systemRoot -DependencyPath $dependencyPaths -ErrorAction Continue;
       }
       else
       {
           Write-Output "Installing $AppxPath Version 3.63.22003.0 Volume $systemRoot";
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
# MIIl5wYJKoZIhvcNAQcCoIIl2DCCJdQCAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCBw1cqpGa+nDFfh
# 2lMGotZVswSLO7tnMZ5lfcklMhNpeqCCC2cwggTvMIID16ADAgECAhMzAAAEOA/I
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
# B3slcUSrBmrm1MbfI5qWdcUxghnWMIIZ0gIBATCBlTB+MQswCQYDVQQGEwJVUzET
# MBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMV
# TWljcm9zb2Z0IENvcnBvcmF0aW9uMSgwJgYDVQQDEx9NaWNyb3NvZnQgQ29kZSBT
# aWduaW5nIFBDQSAyMDEwAhMzAAAEOA/IXba8U/0OAAAAAAQ4MA0GCWCGSAFlAwQC
# AQUAoIIBBDAZBgkqhkiG9w0BCQMxDAYKKwYBBAGCNwIBBDAcBgorBgEEAYI3AgEL
# MQ4wDAYKKwYBBAGCNwIBFTAvBgkqhkiG9w0BCQQxIgQgk2YkP1WUYLQotls9e8iF
# opusxGJ+SJFCJd6vNpBjMVcwPAYKKwYBBAGCNwoDHDEuDCxzRzFaekRPZ0EraTNM
# Y0NOWU83Uy9xdWhadEtaVWpoNy9RV0FOYi9Gam84PTBaBgorBgEEAYI3AgEMMUww
# SqAkgCIATQBpAGMAcgBvAHMAbwBmAHQAIABXAGkAbgBkAG8AdwBzoSKAIGh0dHA6
# Ly93d3cubWljcm9zb2Z0LmNvbS93aW5kb3dzMA0GCSqGSIb3DQEBAQUABIIBADC9
# Fu87CdjtN7Wrr6dnuFW5i/tkG1cF5z6sUw49LTDGJNJDKb8XXHybym0aeIXsMa4d
# imUNaoFuaSfJQt/1mu2eRrvSrZx3u3iAVQbVywpyqp57YGI6W7l2LApmwXirqZB7
# acC/6HXOQsxePd8Sy9mvSM9us+E81G26pKMLtvmFlzYM5sM6xkhp+fAUt3zxdz02
# 3Mj6ypqxqAj/zzlrmP+62klem7CORWqT2B/f1E6lefZ0V/FIpR+5wUkdmGc23fyQ
# V8aSW6NDJEqoPmmQtFyzhTAegR8vW/WzWzE8PN6IFRmxsLVkFdVeE6f3Y7jvWBYz
# op4pqEk6XWArV7soj9yhghcJMIIXBQYKKwYBBAGCNwMDATGCFvUwghbxBgkqhkiG
# 9w0BBwKgghbiMIIW3gIBAzEPMA0GCWCGSAFlAwQCAQUAMIIBVQYLKoZIhvcNAQkQ
# AQSgggFEBIIBQDCCATwCAQEGCisGAQQBhFkKAwEwMTANBglghkgBZQMEAgEFAAQg
# gnNwMMi2HZMDXMfDS0yNGPAkiD8ZGq45KeGdJPuAUMQCBmJrR4VWjBgTMjAyMjA1
# MDYxMDE3MTcuMzA1WjAEgAIB9KCB1KSB0TCBzjELMAkGA1UEBhMCVVMxEzARBgNV
# BAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jv
# c29mdCBDb3Jwb3JhdGlvbjEpMCcGA1UECxMgTWljcm9zb2Z0IE9wZXJhdGlvbnMg
# UHVlcnRvIFJpY28xJjAkBgNVBAsTHVRoYWxlcyBUU1MgRVNOOkY3QTYtRTI1MS0x
# NTBBMSUwIwYDVQQDExxNaWNyb3NvZnQgVGltZS1TdGFtcCBTZXJ2aWNloIIRXDCC
# BxAwggT4oAMCAQICEzMAAAGlAN4IxEAHcU4AAQAAAaUwDQYJKoZIhvcNAQELBQAw
# fDELMAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1Jl
# ZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEmMCQGA1UEAxMd
# TWljcm9zb2Z0IFRpbWUtU3RhbXAgUENBIDIwMTAwHhcNMjIwMzAyMTg1MTE5WhcN
# MjMwNTExMTg1MTE5WjCBzjELMAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0
# b24xEDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3Jh
# dGlvbjEpMCcGA1UECxMgTWljcm9zb2Z0IE9wZXJhdGlvbnMgUHVlcnRvIFJpY28x
# JjAkBgNVBAsTHVRoYWxlcyBUU1MgRVNOOkY3QTYtRTI1MS0xNTBBMSUwIwYDVQQD
# ExxNaWNyb3NvZnQgVGltZS1TdGFtcCBTZXJ2aWNlMIICIjANBgkqhkiG9w0BAQEF
# AAOCAg8AMIICCgKCAgEAurGG6CBqSLzC6g4wx3uuwRCeYCG1XyJTVjSK2werfRN0
# JckOa9mNpnzK84dgVWFPIPVvkkYm3BmNbPV+CUKqzHmoHE/VbHUJmexDW2JGxFZB
# zXZWQROaRjzHjoyAewbICaE8+myBGeSUZqLsepAUHfXH9COTHutsCWvo9uUHi06Z
# pHWcrGXhUiCy0PB+d4pqgQTDiI3/FN3O1mPDIaJjmE2npt562RyLOAkU7f/JEdiH
# SC2T5tESGuYiBtquuuBvPsyycDu2Uq8Zw72Idzr7azKasBXLcLNDggw08VxNPHzB
# Nn6Sm/qUWzV4bzGV+y7Y0NYqyGsyUofYmljNYBbV8I4PmKtewTgs6+LFlC9ud5AT
# r6IZ8hDBpuP59F2i4BTYCIT6Jo2wgNql0ppvxYvHPpU9FsQv4zowWRyyiK4oceiy
# EKnsmGZn2IzTKsTHZd5s6Fr9dDfjYqxEazaHTaClfrAHLJPx4PcwlUjFJGbgwsiK
# W9Zyl303euihrBstTqB2TuCgpZLr37DaO2i5cIRi3og99mryV2LQv8LBhu2/uZse
# Yhn05zQkQlzpv2BxUN+g+J6YwpzPXkEt6nLHuelDYyIMoixw6oqFe5kj49l6s04e
# GL++zLb8WP2UHqQmsxhJ9XQXZ+u8FIFcwHvGO/ymCpflBdR7ydPFvhR8nRwMC8EC
# AwEAAaOCATYwggEyMB0GA1UdDgQWBBRfpo8DAJeurq1w7vvcWRdLaKka3zAfBgNV
# HSMEGDAWgBSfpxVdAF5iXYP05dJlpxtTNRnpcjBfBgNVHR8EWDBWMFSgUqBQhk5o
# dHRwOi8vd3d3Lm1pY3Jvc29mdC5jb20vcGtpb3BzL2NybC9NaWNyb3NvZnQlMjBU
# aW1lLVN0YW1wJTIwUENBJTIwMjAxMCgxKS5jcmwwbAYIKwYBBQUHAQEEYDBeMFwG
# CCsGAQUFBzAChlBodHRwOi8vd3d3Lm1pY3Jvc29mdC5jb20vcGtpb3BzL2NlcnRz
# L01pY3Jvc29mdCUyMFRpbWUtU3RhbXAlMjBQQ0ElMjAyMDEwKDEpLmNydDAMBgNV
# HRMBAf8EAjAAMBMGA1UdJQQMMAoGCCsGAQUFBwMIMA0GCSqGSIb3DQEBCwUAA4IC
# AQCWmwsX5TAwooRHanRYmejgboYYad+DeqMN1odzm69di0boqYeuoB/9ioeSY2i1
# KvpkQSeUYIlhHtbe4n7lum+PTfAWoZ5+9CwohHb6rpOvOjO8/g2yh1ZNPlJWn8Lp
# MQMa4sL2Y5AoDi3IvjQdNbu3FvRwB1+CfIcWgj8Gxmj8Vpd7NDyE7jFSOEOnI014
# npZi9fk0L4e/2eZPLOOrISD8vZxcA6bERa988BDWV/G+u1TAbvmMZ5Rp7CSHC3Nq
# cKc/eXpiPAkUoHqfv9Ne2t+KTXFjWSB6/UnBDlpR0/HBJ0OYYThdM3azqk86Lwg7
# X305/oAS+HjV4PFHP7XVVRym4afu0lR5JNRIey/NDwQI6PnDvsy/nn8XyFa7Tt6C
# cbxKtaPn5MXE08KnH8AU2/PP6h1NFNl3gta6iZwwdSYsWJQY4B160XpKh8cbkRwW
# fQNMPVqkFnMI/zGwZBxmDBWqjui/bf+4gmUwIsDJNhlX0hMI/T1yJQlsoFUJA2sY
# SdD9csU72bKzLINGu8eFTm4Y91fPgm3b9k3slBhG5U1K4Kk3CgrQmvWzpyIO8cR4
# vKJzPGgh70YfdLJ9sfHq/+mEj6ITcNajVMIrvkQvqm3qTmLfr+Sfa5JVd1MfjhlW
# SHf+KFXe8TCzvy4aW+yIxysoGCmjcd1yMMeIehaxR/gYjDCCB3EwggVZoAMCAQIC
# EzMAAAAVxedrngKbSZkAAAAAABUwDQYJKoZIhvcNAQELBQAwgYgxCzAJBgNVBAYT
# AlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYD
# VQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xMjAwBgNVBAMTKU1pY3Jvc29mdCBS
# b290IENlcnRpZmljYXRlIEF1dGhvcml0eSAyMDEwMB4XDTIxMDkzMDE4MjIyNVoX
# DTMwMDkzMDE4MzIyNVowfDELMAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0
# b24xEDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3Jh
# dGlvbjEmMCQGA1UEAxMdTWljcm9zb2Z0IFRpbWUtU3RhbXAgUENBIDIwMTAwggIi
# MA0GCSqGSIb3DQEBAQUAA4ICDwAwggIKAoICAQDk4aZM57RyIQt5osvXJHm9DtWC
# 0/3unAcH0qlsTnXIyjVX9gF/bErg4r25PhdgM/9cT8dm95VTcVrifkpa/rg2Z4VG
# Iwy1jRPPdzLAEBjoYH1qUoNEt6aORmsHFPPFdvWGUNzBRMhxXFExN6AKOG6N7dcP
# 2CZTfDlhAnrEqv1yaa8dq6z2Nr41JmTamDu6GnszrYBbfowQHJ1S/rboYiXcag/P
# XfT+jlPP1uyFVk3v3byNpOORj7I5LFGc6XBpDco2LXCOMcg1KL3jtIckw+DJj361
# VI/c+gVVmG1oO5pGve2krnopN6zL64NF50ZuyjLVwIYwXE8s4mKyzbnijYjklqwB
# Sru+cakXW2dg3viSkR4dPf0gz3N9QZpGdc3EXzTdEonW/aUgfX782Z5F37ZyL9t9
# X4C626p+Nuw2TPYrbqgSUei/BQOj0XOmTTd0lBw0gg/wEPK3Rxjtp+iZfD9M269e
# wvPV2HM9Q07BMzlMjgK8QmguEOqEUUbi0b1qGFphAXPKZ6Je1yh2AuIzGHLXpyDw
# wvoSCtdjbwzJNmSLW6CmgyFdXzB0kZSU2LlQ+QuJYfM2BjUYhEfb3BvR/bLUHMVr
# 9lxSUV0S2yW6r1AFemzFER1y7435UsSFF5PAPBXbGjfHCBUYP3irRbb1Hode2o+e
# FnJpxq57t7c+auIurQIDAQABo4IB3TCCAdkwEgYJKwYBBAGCNxUBBAUCAwEAATAj
# BgkrBgEEAYI3FQIEFgQUKqdS/mTEmr6CkTxGNSnPEP8vBO4wHQYDVR0OBBYEFJ+n
# FV0AXmJdg/Tl0mWnG1M1GelyMFwGA1UdIARVMFMwUQYMKwYBBAGCN0yDfQEBMEEw
# PwYIKwYBBQUHAgEWM2h0dHA6Ly93d3cubWljcm9zb2Z0LmNvbS9wa2lvcHMvRG9j
# cy9SZXBvc2l0b3J5Lmh0bTATBgNVHSUEDDAKBggrBgEFBQcDCDAZBgkrBgEEAYI3
# FAIEDB4KAFMAdQBiAEMAQTALBgNVHQ8EBAMCAYYwDwYDVR0TAQH/BAUwAwEB/zAf
# BgNVHSMEGDAWgBTV9lbLj+iiXGJo0T2UkFvXzpoYxDBWBgNVHR8ETzBNMEugSaBH
# hkVodHRwOi8vY3JsLm1pY3Jvc29mdC5jb20vcGtpL2NybC9wcm9kdWN0cy9NaWNS
# b29DZXJBdXRfMjAxMC0wNi0yMy5jcmwwWgYIKwYBBQUHAQEETjBMMEoGCCsGAQUF
# BzAChj5odHRwOi8vd3d3Lm1pY3Jvc29mdC5jb20vcGtpL2NlcnRzL01pY1Jvb0Nl
# ckF1dF8yMDEwLTA2LTIzLmNydDANBgkqhkiG9w0BAQsFAAOCAgEAnVV9/Cqt4Swf
# ZwExJFvhnnJL/Klv6lwUtj5OR2R4sQaTlz0xM7U518JxNj/aZGx80HU5bbsPMeTC
# j/ts0aGUGCLu6WZnOlNN3Zi6th542DYunKmCVgADsAW+iehp4LoJ7nvfam++Kctu
# 2D9IdQHZGN5tggz1bSNU5HhTdSRXud2f8449xvNo32X2pFaq95W2KFUn0CS9QKC/
# GbYSEhFdPSfgQJY4rPf5KYnDvBewVIVCs/wMnosZiefwC2qBwoEZQhlSdYo2wh3D
# YXMuLGt7bj8sCXgU6ZGyqVvfSaN0DLzskYDSPeZKPmY7T7uG+jIa2Zb0j/aRAfbO
# xnT99kxybxCrdTDFNLB62FD+CljdQDzHVG2dY3RILLFORy3BFARxv2T5JL5zbcqO
# Cb2zAVdJVGTZc9d/HltEAY5aGZFrDZ+kKNxnGSgkujhLmm77IVRrakURR6nxt67I
# 6IleT53S0Ex2tVdUCbFpAUR+fKFhbHP+CrvsQWY9af3LwUFJfn6Tvsv4O+S3Fb+0
# zj6lMVGEvL8CwYKiexcdFYmNcP7ntdAoGokLjzbaukz5m/8K6TT4JDVnK+ANuOaM
# mdbhIurwJ0I9JZTmdHRbatGePu1+oDEzfbzL6Xu/OHBE0ZDxyKs6ijoIYn/ZcGNT
# TY3ugm2lBRDBcQZqELQdVTNYs6FwZvKhggLPMIICOAIBATCB/KGB1KSB0TCBzjEL
# MAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1v
# bmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEpMCcGA1UECxMgTWlj
# cm9zb2Z0IE9wZXJhdGlvbnMgUHVlcnRvIFJpY28xJjAkBgNVBAsTHVRoYWxlcyBU
# U1MgRVNOOkY3QTYtRTI1MS0xNTBBMSUwIwYDVQQDExxNaWNyb3NvZnQgVGltZS1T
# dGFtcCBTZXJ2aWNloiMKAQEwBwYFKw4DAhoDFQCzyXDbRbObEMqI3UuGHuZlZe60
# qKCBgzCBgKR+MHwxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAw
# DgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24x
# JjAkBgNVBAMTHU1pY3Jvc29mdCBUaW1lLVN0YW1wIFBDQSAyMDEwMA0GCSqGSIb3
# DQEBBQUAAgUA5h8ASjAiGA8yMDIyMDUwNjA2MDI1MFoYDzIwMjIwNTA3MDYwMjUw
# WjB0MDoGCisGAQQBhFkKBAExLDAqMAoCBQDmHwBKAgEAMAcCAQACAgsoMAcCAQAC
# AhFeMAoCBQDmIFHKAgEAMDYGCisGAQQBhFkKBAIxKDAmMAwGCisGAQQBhFkKAwKg
# CjAIAgEAAgMHoSChCjAIAgEAAgMBhqAwDQYJKoZIhvcNAQEFBQADgYEAaSoFRpgB
# CBPBTq0Z9V05Lj9ND+LG8aqDXCMjKhTXShRx7mUc3/x+kVDil7CPZCfAmaYE7ktu
# 3Z8UVk8wdaLaf6KNLc/kd0P4eV0JvaXx4jd0Bfla2TVIVidrQ4AY88QXr6W8DXmJ
# xT8icp/iziwaGT8JoapKPpeQDoF9xc+PeQMxggQNMIIECQIBATCBkzB8MQswCQYD
# VQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEe
# MBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMSYwJAYDVQQDEx1NaWNyb3Nv
# ZnQgVGltZS1TdGFtcCBQQ0EgMjAxMAITMwAAAaUA3gjEQAdxTgABAAABpTANBglg
# hkgBZQMEAgEFAKCCAUowGgYJKoZIhvcNAQkDMQ0GCyqGSIb3DQEJEAEEMC8GCSqG
# SIb3DQEJBDEiBCAvTiPucdaGEacXeoBFxP3K2j8vMNNrAy7/pSMtfm3EATCB+gYL
# KoZIhvcNAQkQAi8xgeowgecwgeQwgb0EILgKOHF+ZgSxoK3YBTzcqGH7okeXKTcH
# vS98wcyUEtxcMIGYMIGApH4wfDELMAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hp
# bmd0b24xEDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jw
# b3JhdGlvbjEmMCQGA1UEAxMdTWljcm9zb2Z0IFRpbWUtU3RhbXAgUENBIDIwMTAC
# EzMAAAGlAN4IxEAHcU4AAQAAAaUwIgQgXHf1wDsJdjUf+RK7vF/+gYgSuG0bUiCE
# LftV+EmR/QIwDQYJKoZIhvcNAQELBQAEggIAX/i4Sg8u/8835PzMTrgwnoijhRVP
# S8j3SST4w7bwyOvvLrF5DarWbUxHx/VgusUTCYu1E8d+5p8z8F5qTQYDqFYD7Gyx
# tCEzq9U9EHYLVawTt0kxtBAlwjrxpHwiQOry3MhcGpXXUWYLb9OTd5Lze1MWlt0o
# frrpg11uaJ3k2dVsY79skB21iY9H1VuNf0SZs8khbrfDZ/lE9WzIaGQy5G6jeGzT
# NmiD/8MrV6kL6hLrOUHP7skAA2TXpM9BH8ytGOlfPYJP3GOrf5Z/EX897cm6Wd/G
# NEhyicJ9w67KB/qTEP8IGlSRyYUmklURL+kPqXsRKEb7R6o3a25B+0b6G8m64/PN
# wsd2iDXQTE4Qlh7J4lo0o/qmRIEsu5xEn3SLeO3gjvDfY+3Mb/SDZF6jSrC1Q7yU
# 8MczG54OqtWjhxv0hMDHoLvCmDLGayxplM5Xs3SYB8JOVTUx9fl/ZgKVr9UHKck/
# QLyf6v4zlhmyEC0sl+dvQTXrnDmhVMYEa270bO9QZSpdGXoegyAcUep4CeP85wo5
# DSLPwHlGjTQbg/3RevIaFnzuFoZMdJtwkHuGHoKH1uW9UT/QCj/smKC4gn6Ue50i
# j/HdHo42C6gh0ITgzGufqpmudCSexxXlntvnSIwOCStfR6y5oW0rp+nanckD6AxS
# q7ToeO7c0GcRdoQ=
# SIG # End signature block
