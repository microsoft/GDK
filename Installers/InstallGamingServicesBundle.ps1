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
# Gfuis7ZV3AIiimevkjZiTJOqkQPaeKCCC2cwggTvMIID16ADAgECAhMzAAAFp7iP
# +5ddNYTsAAAAAAWnMA0GCSqGSIb3DQEBCwUAMH4xCzAJBgNVBAYTAlVTMRMwEQYD
# VQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNy
# b3NvZnQgQ29ycG9yYXRpb24xKDAmBgNVBAMTH01pY3Jvc29mdCBDb2RlIFNpZ25p
# bmcgUENBIDIwMTAwHhcNMjQwODIyMTkyNTU3WhcNMjUwNzA1MTkyNTU3WjB0MQsw
# CQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9u
# ZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMR4wHAYDVQQDExVNaWNy
# b3NvZnQgQ29ycG9yYXRpb24wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIB
# AQCWGlTKjYt60rB8oNyPWJUGQV2NGwlRXKJg3484q2nJiv9+Frz96fGoXlblIeJ3
# xqQxEoCEDYjjbYClgx31MZcoRqJD0sKjNtYDKA0NiSdOJQut3+HN0rSx74yqobDB
# P8AKAyWANZitUQHnPH1EkTXMdRlnJnD1RtFljMYOJnrxfqrAdtNNxU1pIYYmY6oD
# 8dye81i9RHxSJGEgfMnEIpn/1ySkikTV+NOHFj1QH7+SHZWYNcdgL48QSa1jC30A
# i6MKLh91FOsCsuNU0cTC6z6QkP51l9dU8B+xnvZa2/WzvJhByZnjXS+tVeN2KB5E
# p0seOtuFwvI6KoOXrETKCDg7AgMBAAGjggFuMIIBajAfBgNVHSUEGDAWBgorBgEE
# AYI3PQYBBggrBgEFBQcDAzAdBgNVHQ4EFgQUUhW6zVNwhzmLbscozYppwd8fKxIw
# RQYDVR0RBD4wPKQ6MDgxHjAcBgNVBAsTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEW
# MBQGA1UEBRMNMjMwODY1KzUwMjcwMzAfBgNVHSMEGDAWgBTm/F97uyIAWORyTrX0
# IXQjMubvrDBWBgNVHR8ETzBNMEugSaBHhkVodHRwOi8vY3JsLm1pY3Jvc29mdC5j
# b20vcGtpL2NybC9wcm9kdWN0cy9NaWNDb2RTaWdQQ0FfMjAxMC0wNy0wNi5jcmww
# WgYIKwYBBQUHAQEETjBMMEoGCCsGAQUFBzAChj5odHRwOi8vd3d3Lm1pY3Jvc29m
# dC5jb20vcGtpL2NlcnRzL01pY0NvZFNpZ1BDQV8yMDEwLTA3LTA2LmNydDAMBgNV
# HRMBAf8EAjAAMA0GCSqGSIb3DQEBCwUAA4IBAQAl1cQIQ+FD/ubaWIiMg8wQtEx3
# SksQ5r6qAgferOe6TZ5bmTcMj2VUkHLrvmhScoRe9pQ/CqwZ676YuM90tiqPrMDj
# XO8kLCA+kTeDZoKQL0MI2ShbDhXrDIsui9hGNhd8PwGTWQksnoO4HxqGG2Mfiqsn
# OgMo9HimmTF2/H1XLc/g2TPpF8GyXAco7khch4l1hIIpmVEZN6ZFCk2/kOf7m2sC
# l8h5+BWQDmSaECtI2xc5SLbqot1isWvFiERtaw9xQb31MWYas2l2/XdcbH7QFYpK
# pG4dDZhKIdlRVmYpUyRaNOZWNwNc7G6bzKIC3HAGFOIEc4aDQu2yT/q0yJ7WMIIG
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
# aWduaW5nIFBDQSAyMDEwAhMzAAAFp7iP+5ddNYTsAAAAAAWnMA0GCWCGSAFlAwQC
# AQUAoIIBBDAZBgkqhkiG9w0BCQMxDAYKKwYBBAGCNwIBBDAcBgorBgEEAYI3AgEL
# MQ4wDAYKKwYBBAGCNwIBFTAvBgkqhkiG9w0BCQQxIgQg+r33narhg6fKq+hs3dDu
# rZejDnJ1V12rawo20SV2X7UwPAYKKwYBBAGCNwoDHDEuDCxzUFk3eFBCN2hUNWc1
# SEhyWXQ4ckRMU005VnVaUnVXWmFlZjJlMjJSczU0PTBaBgorBgEEAYI3AgEMMUww
# SqAkgCIATQBpAGMAcgBvAHMAbwBmAHQAIABXAGkAbgBkAG8AdwBzoSKAIGh0dHA6
# Ly93d3cubWljcm9zb2Z0LmNvbS93aW5kb3dzMA0GCSqGSIb3DQEBAQUABIIBAGkH
# o/08SEPDvvmuGGmxB8wi0Oy4PErQ3yb8z+G9om1wrxr+cm3F31fu7LiQbfvOvQYk
# xTxjolpkg5xRmFtzi+64h7YA1MOTJGgYOr6Ug1Jn83wkLiKoAH3xMU7qzr9YSG5R
# Ha/TCDo9Ej0UJg/mk2TDjZg1Xv1bbv2+EirblAeCmYO5b7exXba+gs3LuLjQYdy9
# j2RnzzuRszsjMX7R3DEYaOOvW5E8Yn4l3bl12NBV9SsU+e3UgBCnNALfxZQvKByy
# 0aSHIbK0+TvxtZWyf+bdkzoCCOkQN7j2zh0A+pi8RSzheqtkEWVtYo4+/X3NbYbE
# CjNxz4PJN7jsGDuVV2ShghetMIIXqQYKKwYBBAGCNwMDATGCF5kwgheVBgkqhkiG
# 9w0BBwKggheGMIIXggIBAzEPMA0GCWCGSAFlAwQCAQUAMIIBWgYLKoZIhvcNAQkQ
# AQSgggFJBIIBRTCCAUECAQEGCisGAQQBhFkKAwEwMTANBglghkgBZQMEAgEFAAQg
# hJM39gtIwzRgLaRcvbMUFOlDhyk/24IWetrnhWVUIIUCBmc7wbByFBgTMjAyNDEx
# MjAxNDAyNDYuOTI5WjAEgAIB9KCB2aSB1jCB0zELMAkGA1UEBhMCVVMxEzARBgNV
# BAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jv
# c29mdCBDb3Jwb3JhdGlvbjEtMCsGA1UECxMkTWljcm9zb2Z0IElyZWxhbmQgT3Bl
# cmF0aW9ucyBMaW1pdGVkMScwJQYDVQQLEx5uU2hpZWxkIFRTUyBFU046NTIxQS0w
# NUUwLUQ5NDcxJTAjBgNVBAMTHE1pY3Jvc29mdCBUaW1lLVN0YW1wIFNlcnZpY2Wg
# ghH7MIIHKDCCBRCgAwIBAgITMwAAAgAL16p/GyoXVgABAAACADANBgkqhkiG9w0B
# AQsFADB8MQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UE
# BxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMSYwJAYD
# VQQDEx1NaWNyb3NvZnQgVGltZS1TdGFtcCBQQ0EgMjAxMDAeFw0yNDA3MjUxODMx
# MjFaFw0yNTEwMjIxODMxMjFaMIHTMQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2Fz
# aGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENv
# cnBvcmF0aW9uMS0wKwYDVQQLEyRNaWNyb3NvZnQgSXJlbGFuZCBPcGVyYXRpb25z
# IExpbWl0ZWQxJzAlBgNVBAsTHm5TaGllbGQgVFNTIEVTTjo1MjFBLTA1RTAtRDk0
# NzElMCMGA1UEAxMcTWljcm9zb2Z0IFRpbWUtU3RhbXAgU2VydmljZTCCAiIwDQYJ
# KoZIhvcNAQEBBQADggIPADCCAgoCggIBAK9V2mnSpD9k5Lp6Exee9/7ReyiTPQ6I
# r93HL9upqp1IZr9gzOfYpBE+Fp0X6OW4hSB3Oi6qyHqgoE/X0/xpLOVSjvdGUFtm
# r4fzzB55dJGX1/yOc3VaKFx23VFJD4mXzV7M1rMJi/VJVqPJs8r/S6fUwLcP6Fzm
# EwMXWEqjgeVM89UNwPLgqTZbpkDQyRg2OnEp9DJWLpF5JQKwoaupfimK5eq/1pzq
# l0pJwAaYIErCd96C96J5g4jfWFAKWcI5zYfTOpA2p3ks+/P2LQ/9qRqcffy1xC6G
# sxFBcYcoOCnZqFhjWMHUe/4nfNYHjhEevZeXSb+9Uv5h/i8W+i+vdp/LhJgFcOn1
# bxPnPMI4GGW5WQjTwMpwpw3bkS3ZNY7MAqo6jXN1/1iMwOxhrOB1EuGCKwFMfB9g
# PeLwzYgPAFmu2fx0sEwsiIHlW5XV2DNgbcTCqt5J3kaE9uzUO2O5/GU2gI3uwZX4
# 7vN7KRj/0FmDWdcGM2FRkcjqXQPFpsauVfH+a+B2hvcz3MpDsiaUWcvld0RooIRZ
# rAiVwHDM4ju+h4p8AiIyJpwhShifyGy4x+ie3yV6kT24Ph+q2C2fFwaZlwRR+D02
# pGVWMQfz/hEGy+SzcNGSDPnrn8QpY1eDvpx5DPs4EsfPtOwVWTwSrJaKHm7JoSHA
# TtO+/ZHoXImDAgMBAAGjggFJMIIBRTAdBgNVHQ4EFgQUgCUk2r4JIyqoHucUDl59
# +X13dzowHwYDVR0jBBgwFoAUn6cVXQBeYl2D9OXSZacbUzUZ6XIwXwYDVR0fBFgw
# VjBUoFKgUIZOaHR0cDovL3d3dy5taWNyb3NvZnQuY29tL3BraW9wcy9jcmwvTWlj
# cm9zb2Z0JTIwVGltZS1TdGFtcCUyMFBDQSUyMDIwMTAoMSkuY3JsMGwGCCsGAQUF
# BwEBBGAwXjBcBggrBgEFBQcwAoZQaHR0cDovL3d3dy5taWNyb3NvZnQuY29tL3Br
# aW9wcy9jZXJ0cy9NaWNyb3NvZnQlMjBUaW1lLVN0YW1wJTIwUENBJTIwMjAxMCgx
# KS5jcnQwDAYDVR0TAQH/BAIwADAWBgNVHSUBAf8EDDAKBggrBgEFBQcDCDAOBgNV
# HQ8BAf8EBAMCB4AwDQYJKoZIhvcNAQELBQADggIBACjwhvZ40bSKkPn7hAoMc1jL
# EDiNx71u7FfT5hFggjlpU7hgiMzYt4m3S2UtG9iAx4NMi67XVbgYtxcVXXrCF7s2
# MqHyHv2pUwXVeA4Yoy017QezYDp6Oxtdojt7eo8tYT0qrsxi68v9phGQcCLEqEtg
# /h/txwicTw8oczBaj/qZZbTwAgf0DcGe6vhxsmb97/Hrfq0GIPLBdz07lng4N3Uf
# 85NTWsCf3XxQg2JVjXggQi7zT0AXHjGFxURSoXElMLO5hXSAw4WacasiCg9lg8Bc
# jSBhHs5/p3eJF0bqXjRMfnkqSV8pUQ/tXeOYW+j8ziBewZHD7UbRVtsF4JIy6rU1
# lpQZL85drjX2Cdwj2VWg8jA2ml4Dvh+g4q7CeCBvYpCHfeNfplg3o5I+WmJ/UDek
# Tn6PxzR4NbYpsKRaFIr6gBbuoq1mRcOVfsi6/BS3O52zGtpRUosc7ves3Zw7DyJs
# 9HOkrW2MoSkpTN7g0YvVFsnUiqpxG7SejJPmLsb86a5LlkCWFn6T77oPsE54qMpF
# cHNMkVXLHeMTM5550bWQxjElBJfbTFZ3m2EbIcGSMiU7AYC2ZhzO6tkxSv1/feOE
# pCKsmNtgHLi3tBqqDXwEgiHGbc22f8z+JU9vzdKQ259n3wM42ZISPkK6q/fN5kGV
# sGXa905NTGBJQ04c9g9DMIIHcTCCBVmgAwIBAgITMwAAABXF52ueAptJmQAAAAAA
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
# cmF0aW9ucyBMaW1pdGVkMScwJQYDVQQLEx5uU2hpZWxkIFRTUyBFU046NTIxQS0w
# NUUwLUQ5NDcxJTAjBgNVBAMTHE1pY3Jvc29mdCBUaW1lLVN0YW1wIFNlcnZpY2Wi
# IwoBATAHBgUrDgMCGgMVAIyTny2W94r4qS97Ei5VhWy61o5koIGDMIGApH4wfDEL
# MAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1v
# bmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEmMCQGA1UEAxMdTWlj
# cm9zb2Z0IFRpbWUtU3RhbXAgUENBIDIwMTAwDQYJKoZIhvcNAQELBQACBQDq6DpS
# MCIYDzIwMjQxMTIwMTAzNzA2WhgPMjAyNDExMjExMDM3MDZaMHQwOgYKKwYBBAGE
# WQoEATEsMCowCgIFAOroOlICAQAwBwIBAAICInIwBwIBAAICEucwCgIFAOrpi9IC
# AQAwNgYKKwYBBAGEWQoEAjEoMCYwDAYKKwYBBAGEWQoDAqAKMAgCAQACAwehIKEK
# MAgCAQACAwGGoDANBgkqhkiG9w0BAQsFAAOCAQEALMVEnhal53jebJirLCULl4Nh
# fjvbJKdHWySkmPYNsEQwaJXvM0ty2CqAfYgZkXLwb9Fn8nqawXeiuZsF64wlfOP2
# iIUhgunkURpfGdXmDSm578u5ZnH8O/b7KyQmJYawGdaMP082h5BrsQ6HvPqNV8ox
# CGRiXfOrEonWILaygoONBklH8q0RiQtfzSBAI5jMmgrDKtFyWJ2vM1QXDWSIvM1S
# HTi33tTqrUSvC3dczku5EjfKpMG7PgaBKTW7FmP6P7q4qZ5woT54DYnaB9zfIJwK
# Y7qj0ifbGPNb+pkcQhNTsjJGegfb2rXfwYdv1OkpUc8n2gssfWk/hM5CdsCf4zGC
# BA0wggQJAgEBMIGTMHwxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9u
# MRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRp
# b24xJjAkBgNVBAMTHU1pY3Jvc29mdCBUaW1lLVN0YW1wIFBDQSAyMDEwAhMzAAAC
# AAvXqn8bKhdWAAEAAAIAMA0GCWCGSAFlAwQCAQUAoIIBSjAaBgkqhkiG9w0BCQMx
# DQYLKoZIhvcNAQkQAQQwLwYJKoZIhvcNAQkEMSIEIE6GBk+TTjlSzgiooavZPSXq
# +iTC0EXITUOqSA5qyROvMIH6BgsqhkiG9w0BCRACLzGB6jCB5zCB5DCBvQQg1Mjt
# 7DWd27qwTQxlAleDXzNoB+GlrkbnSJP/SgJP2ScwgZgwgYCkfjB8MQswCQYDVQQG
# EwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwG
# A1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMSYwJAYDVQQDEx1NaWNyb3NvZnQg
# VGltZS1TdGFtcCBQQ0EgMjAxMAITMwAAAgAL16p/GyoXVgABAAACADAiBCCqoaC3
# JvW7zG2hY77Q6j3JOBRhe47PasRIjUVPVd3KkTANBgkqhkiG9w0BAQsFAASCAgAz
# fk3vtUMJ8f4U5yoy1DIyIpM48HqI7/DeVMZ5OzddjG/DDS/GA1d3bp97yEsYatAo
# 9JDgI3tzwa6Jw5tcc+bypnNWBRotvUFf+QIzERQ93FeKRum7eQAZM9YT+c4sBBSg
# 76iXf+XB5HKDsTMOP3Ei+cvJAmOPzgukTpP9TmXbrc+w1J5Iw1IOf8l2lMKHPbyT
# 4OIYACM9OSMfRm5oPy4wzp2uDKyEZOevXRpgRX0gqZe1mXt32eoG4Hb46ze9V/uN
# K/B1gEh/S4VIrIx0WqwCt+xCaEhVLQQWpbgTv7oG2aAALd3nQSVMs4XIrQQkPKuZ
# I1wOLpgpdNPJRXAjdWbu0hEIwOFTHoSWPShL+rr/qnk3YcqAiecClPtLG9VnsWiB
# Ykok6Y/v/rv5xLTF/A3+KPW9n2WVfBEnnZGZEfymekTqr5nzJsb9Ud3Mz7w7M8MI
# gzDVqM1/hUnyILDUc9EZl3yp45DLsG246VPO0NQxVZSNqec7vm0webA9WrhU24w3
# FjESmZbkY+mq5gh1LmpyzXqdW8ZAElgap9du9KDCwkmYH7Fq5KlkkpbPPrhRWLlf
# frOOoYAB1ogKDb8c8OEqvCml2BT7hhCgZeysqf09i72ZSIVTu9OIkHxdOjm2qvhW
# U4rCGvhFMQxnbfIPPzPHaBsD8annY9ORTT7b8cO9jA==
# SIG # End signature block
