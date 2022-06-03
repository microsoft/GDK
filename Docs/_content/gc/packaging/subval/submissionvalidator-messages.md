---
author: zhooper
title: Submission Validator Messages
description: Describes the list of messages that Submission Validator can output.
kindex:
- Submission Validator (SubmissionValidator.dll)
- SubmissionValidator.dll
- validation
- Warnings
- Errors
- Advisory
- Messages
ms.author: zhooper
ms.topic: conceptual
edited: 02/18/2022
security: public
---

# Submission Validator Messages

Below is a list of messages (Warnings, Errors and Advisory statements) outputted by [Submission Validator (SubmissionValidator.dll)](submissionvalidator.md) when validating a package created with the GDK.

| Message Name | Message Type | Message Output |
| ILI_NoOnline | Warning | Submission Validator was unable to connect to the internet resource to check it is the most recent version. Error: 0x%08X |
| ILI_NoOnlineVersionFile | Warning | Submission Validator either was unable to connect to the internet resource or was able to connect for the version check but could not complete the check for other reasons. Error: 0x%08X |
| ILI_NoOnlineVersionDownload | Warning | Submission Validator was able to connect to the internet resource for the version check but could not complete the check for other reasons. Error: 0x%08X |
| ILI_OnlineVersionFileInvalid | Failure | Submission Validator version information file is missing from the server or invalid. Version check could not be completed. |
| ILI_OnlineVersionFileIncomplete | Failure | Submission Validator version information file is missing from the server or invalid. Version check could not be completed. |
| ILI_OnlineSubValUnsupportedGDK | Failure | A required update to Submission Validator is available. The latest version can be downloaded from https://aka.ms/subval_gdk. Download and install the update, then rebuild the package. Contact your Developer Account Manager for assistance. |
| ILI_OnlineSubValPendingExpirationGDK | Warning | An update to Submission Validator is now available. Version %ws will expire soon. Update to version %ws from https://aka.ms/subval_gdk as soon as possible. |
| ILI_LayoutParsingError | Warning | Error parsing XML layout file. |
| ILI_NoLayoutFileSpecified | Warning | The path and name of the title layout XML file must be set before calling makepkg.  Check not performed. |
| ILI_InvalidLayoutFileSpecified | Warning | Layout filepath points to a file that does not exist or is not accessible: '%s'. Check not performed |
| ILI_XvcSizeCheckSkipped | Warning | Package size check not run (package was not found). |
| ILI_XvcSizeQueryFailed | Warning | Failed to get the package size (0x%08x). |
| ILI_XvcLaunchSizeQueryFailed | Warning | Failed to get the package launch set size (0x%08x). |
| ILI_XvcPackageSizeExceeded | Warning | The size of this package exceeds the maximum allowed size for mastering to a disc. If you intend to produce physical disc media, you should create a DiscLayout.xml file and test individual optical disc image layouts using the SplitPkg.exe tool. Please refer to the GDK/XDK documentation for further details. |
| ILI_XvcPrintLaunchSize | Advisory | The total size of the chunks in the entire package launch set is %llu bytes (%0.3f GB). See the Package Specifier Check below for details on the largest and smallest launch sizes a user will experience. |
| ILI_DlcFinalChunkMustBeLaunchChunk | Failure | Content Packages require final layout chunk to include attribute Marker=\"Launch\" |
| ILI_LayoutTraversalError | Warning | Error traversing package layout. |
| ILI_SymbolBundlingDisabled | Advisory | Symbol bundling disabled. Ensure the command line to MakePkg does not specify /skipsymbolbundling and verify the environment variable SUBMISSION_VALIDATION_NO_SYMBOL_BUNDLING does not exist or is set to 0 to enable symbol bundling |
| ILI_SymbolHandlingInitError | Warning | Failed to initialize symbol handling (0x%08x). |
| ILI_SymbolHandlingInitCachePathError | Warning | Failed to find a temporary path for creating the cache folder (0x%08x). |
| ILI_SymbolHandlingLookupError | Warning | Failed to find matching symbols for %s (0x%08x). |
| ILI_SymbolHandlingLookupFileNotFound | Warning | Symbol file not found for %s. Try specifying a semicolon delimited list of paths where symbols can be found for this file to /symbolpaths via MakePkg (October 2016 and later GDKs/XDKs) or setting the environment variable _NT_SYMBOL_PATH. The GUID for this PDB is %s. |
| ILI_SymbolHandlingLookupPdbInfoMissing | Warning | Symbol information is not available in the PE header for %s. If this is unexpected, ensure this file was compiled with symbol information. |
| ILI_SymbolHandlingZipCreationError | Warning | Failed to create symbol cache compressed folder (0x%08x). |
| ILI_SymbolHandlingFileCopyError | Warning | Failed to copy the file %s to the temporary cache folder (0x%08x). |
| ILI_SymbolHandlingDirectoryCreationError | Warning | Failed to create the directory structure for the symbol cache: %s (0x%08x). |
| ILI_SymbolBundlingNotNeeded | Advisory | Symbol bundling is not needed for ADK applications. |
| ILI_SymbolHandlingNoFilesToBundle | Warning | No symbol files found to bundle. Bundle will not be created. |
| ILI_SymbolHandlingFilePathTooLong | Warning | The file path is too long to be bundled and this file will be skipped: %s. |
| ILI_SpecifierCheckSkipped | Warning | Package specifier check not run (package was not found). |
| ILI_ChunkSizeCheckFailed | Warning | The size of chunk %d is larger than %llu bytes (%0.3f GB), which could restrict options for creating a multi-disc product. Consider breaking this chunk into two or more smaller chunks. |
| ILI_SpecifierCheckFailed | Failure | The specifier check unexpectedly failed (0x%08x). Verify the package was created as expected. |
| ILI_LaunchChunkSizeCheckSmallest | Advisory | The smallest launch set on a %ws device is %llu bytes (%0.3f GB) for %ws. |
| ILI_LaunchChunkSizeCheckLargest | Advisory | The largest launch set on a %ws device is %llu bytes (%0.3f GB) for %ws. |
| ILI_LaunchChunkSizeCheckDiscrepency | Warning | The size of your smallest launch set on %ws devices is less than half the size of your largest launch set. Please verify your usage of the \"Devices\" and \"Languages\" specifiers to ensure this is intentional. |
| ILI_DoesNotUseIntelligentInstall | Advisory | Package does not take advantage of intelligent install. Consider adding recipes and features, and tagging chunks, to improve user experience and download sizes. |
| ILI_DoesNotFullyUseIntelligentInstall | Advisory | Package does not take full advantage of intelligent install. Consider adding recipes and features to improve user experience and download sizes. |
| ILI_ConfigMissingShellVisuals | Failure | The ShellVisuals element is required before submitting this package to certification. |
| ILI_ConfigMissingLogoFile | Failure | The %s attribute in the ShellVisuals element is required before submitting this package to certification. |
| ILI_LogoFileNotInLayout | Failure | The %s file is not found in the layout for this package (%s) |
| ILI_LogoFileNotInLayoutForLanguage | Failure | The %s file for language %s is not found in the layout for this package (%s) |
| ILI_LogoFileNotFound | Failure | The %s file was not found (%s) |
| ILI_LogoFileFallingBackToDefault | Advisory | %s: Using default image for language %s (%s) |
| ILI_LogoFileBadDimensions | Failure | %s: image dimensions incorrect (%dx%d). Requires %dx%d (%s) |
| ILI_LogoFileBadDimensionsForLanguage | Failure | %s: image dimensions incorrect for language %s (%dx%d). Requires %dx%d (%s) |
| ILI_LogoFileBadDimensionsWithAlts | Failure | %s: image dimensions incorrect (%dx%d). Requires %dx%d or %dx%d (%s) |
| ILI_LogoFileBadDimensionsForLanguageWithAlts | Failure | %s: image dimensions incorrect for language %s (%dx%d). Requires %dx%d or %dx%d (%s) |
| ILI_LogoFileBadBpp | Failure | %s: bit-per-pixel value incorrect (%s). Requires 24 bpp + Alpha (%s) |
| ILI_LogoFileBadBppForLanguage | Failure | %s: bit-per-pixel value incorrect for language %s (%s). Requires 24 bpp + Alpha (%s) |
| ILI_UsedExtendedAttribute | Warning | ExtendedAttribute '%s' with value '%s' may require a certification exception. Contact your Development Account Manager for more information. |
| ILI_NoRetailExecutable | Failure | No executable found without the IsDevOnly attribute set to true. The built retail package will have no executables. |
| ILI_MoreThanOneRetailExecutable | Failure | Multiple shipping executables specified in the MicrosoftGame.config file. Please use the IsDevOnly attribute to mark all executables not intended to ship in the retail package. |
| ILI_NonRetailExecutableInCertPackage | Failure | One or more developer executables are specified in the MicrosoftGame.config file. If planning to submit this package, please remove any executable elements with the IsDevOnly=\"true\" attribute from the MicrosoftGame.config file and create a new package before submitting to certification. |
| ILI_GameConfigCtrlCharacters | Failure | String '%s' contains one or more invalid characters. Try converting to ASCII if the character is not visible. |
| ILI_RequiresXboxLive | Advisory | The RequiresXboxLive element is set to true in the MicrosoftGame.config file. This element will require the console to be online to launch and play your title. This element does not need to be set to true for your title to utilize Xbox Live Services. |
| ILI_DlcCannotHaveTitleId | Failure | A DLC package should not specify the TitleId element in the MicrosoftGame.config file. Please remove this element before packaging your DLC content. |
| ILI_NoMSAAppIdOrTitleId | Failure | The MicrosoftGame.config file does not contain both a TitleId and MSAAppId element. If one of these values is specified, then they must both be specified when using configVersion >= 1. Please provide the value for your application from Partner Center or by running the Store Association Wizard in the MicrosoftGame.config Editor tool before submitting to certification. |
| ILI_DefaultMSAAppId | Failure | The MicrosoftGame.config file has the default value for the MSAAppId element. Please correct this to the real value for your application from Partner Center or by running the Store Association Wizard in the MicrosoftGame.config Editor tool before submitting to certification. |
| ILI_DefaultTitleId | Failure | The MicrosoftGame.config file has the default value for the TitleId element. Please correct this to the real value for your application from Partner Center or by running the Store Association Wizard in the MicrosoftGame.config Editor tool before submitting to certification. |
| ILI_DeprecatedPCEntries | Failure | The MicrosoftGame.config file contains deprecated DesktopRegistration entries.  Please remove 'modFolder', 'enableWritesToPackageRoot', 'disableRegistryWriteVirtualization' and 'disableFilesystemWriteVirtualization' entries before submitting to certification. |
| ILI_MissingLanguageGameCore | Failure | The language %ws was specified in the layout but not present in the game config. Please add this language to the game config. |
| ILI_SkippingBinaryScan | Warning | Skipping Binary Scan due to environment variable SUBMISSION_VALIDATION_SKIP_BINARY_SCAN |
| ILI_UsingDirectoryStructureForSearch | Warning | The path and name of the title layout XML file should be set before calling MakePkg, this check will instead be based on directory structure starting at the following directory: %ws |
| ILI_NonLocalizedApp | Warning | Non-localized app: 'resources.pri' is missing in the title root |
| ILI_BadExtensionFoundSuspect | Warning | File with suspect extension. Ensure this file is intentionally included: %ws |
| ILI_NeedsCertException | Warning | File found which possibly matches a component requiring an XR-12 exception. Please work with your DAM to ensure you have approval to ship this file: %ws |
| ILI_ArchitectureAmd64Mismatch | Warning | File with an x64 architecture detected while the ProcessorArchitecture of the package is marked as x86: %ws. Ensure your ProcessorArchitecture matches the architecture of the runtime components of your game. |
| ILI_ArchitectureX86Mismatch | Warning | File with an x86 architecture detected while the ProcessorArchitecture of the package is marked as x64: %ws. Ensure your ProcessorArchitecture matches the architecture of the runtime components of your game. |
| ILI_CannotCheckNonRetailDependenciesForPC | Warning | Failed to scan for non-retail dependencies in file %ws. This may be expected if the file is protected with anti-tampering software. If this is the case, this safety check cannot be performed but this will not impact your title at certification time. |
| ILI_BadScarlettDependency | Warning | %ws: Binary file appears to have a dependency on the Scarlett graphics stack (d3d12_xs.dll). If this is a Scarlett package ensure the primary executable specifies the TargetDeviceFamily attribute as \"Scarlett\" in the MicrosoftGame.config file. |
| ILI_BadGen8Dependency | Warning | %ws: Binary file appears to have a dependency on the Xbox One graphics stack (d3d12_x.dll). If this is an Xbox One family package ensure the primary executable specifies the TargetDeviceFamily attribute as \"XboxOne\" in the MicrosoftGame.config file. |
| ILI_ErrorParsingXmlLayout | Failure | Error parsing XML layout file. Check that you have set XML_Cert_Layout to the full path and filename. Cannot continue validation |
| ILI_BadExtensionFoundSevere | Failure | File with suspect extension. Ensure this file is intentionally included: %ws |
| ILI_BlockedFileFound | Failure | %ws |
| ILI_CannotCheckNonRetailDependencies | Failure | Failed to scan for non-retail dependencies in file %ws |
| ILI_NonRetailDependencyFound | Failure | Non-retail dependency in file %ws: %ws |
| ILI_HasMissingDependency | Failure | %ws: Binary file has a dependency on a Microsoft Visual Studio C++ Redistributable package (%ws). This must be specifically listed as a framework dependency in your MicrosoftGame.config file. It can be listed using a KnownDependency element with the name '%ws'. |
| ILI_HasOldMissingDependency | Failure | %ws: Binary file has a dependency on an older Microsoft Visual Studio C++ DLL (%ws). This file must be included in the layout for your package. |
| ILI_InvalidBinaryManaged | Failure | Managed: %ws |
| ILI_InvalidBinaryNotAmd64 | Failure | Not AMD64: %ws |
| ILI_InvalidBinary | Failure | Invalid: %ws |
| ILI_LongSourceFilePathFound | Warning | Source file found with a long absolute path (greater than 260 characters) that is not supported with your XDK/GDK tools. This file may be silently omitted from the package or may cause packaging to fail: %ws |
| ILI_LongDestFilePathFound | Warning | Destination file found with a long path (greater than 255 characters) that is not supported with your XDK/GDK tools. This file may be silently omitted from the package or may cause packaging to fail: %ws |
| ILI_XcapiNotFound | Failure | Update required for XCAPI.dll. Contact your Developer Account Manager for assistance |
| ILI_XcapiVersionFailure | Failure | Unable to determine XCAPI version information. Contact your Developer Account Manager for assistance |
| ILI_OutOfDatePCTooling | Warning | PC submissions may experience update performance problems if built with tools prior to the October 2110 GDK.  For more information, contact your Developer Account Manager. |
| ILI_NoVersionForMsComponent | Warning | Failed to extract version information for: %ws. If you built your own version of this DLL then this is expected and this warning can be ignored. |
| ILI_UsingOfflineVersionList | Warning | Could not validate the MS component versions against the online approved library list. Using the offline fallback version check. |
| ILI_GameOsVersionNotReleased | Warning | Because of the GameOS used, this package has a dependency on an Xbox recovery which will not be available to retail consumers until a future date. |
| ILI_GameOsVersionUpdatesOnly | Warning | The GameOS included in this package is not approved for new title submissions. This version is allowed only for Content Updates where the original release used this version. Use only supported GameOS versions according to the Approved Libraries page on the Developer Network Porta },
| ILI_GameOsVersionMismatch | Warning | The extracted GameOSVersion of the GameOS included in this package does not match the expected GameOSVersion matching the GUID from Partner Center. This is unexpected and you should contact your Microsoft representative. |
| ILI_GameOsVersionMismatchWithCompiledBinaries | Warning | The GameOS included in this package does not match any GameOS version used in compilation of the game binaries: %ws |
| ILI_UpdateOnlyBinaryVersion | Warning | %ws included in this package is not approved for new title submissions. This version is allowed only for Content Updates where the original release used this version. Use only supported component versions according to the Approved Libraries page on the Developer Network Portal. |
| ILI_CannotDetermineGameOsVersion | Failure | Version identifier of GameOS for this title cannot be determined. Set environment variable XDK_Cert_GameOS before calling MakePkg |
| ILI_CannotIdentifyEmbeddedGameOsVersion | Failure | Version identifier of embedded GameOS cannot be determined. Package: %ws |
| ILI_CannotIdentifyGameOsVersion | Failure | Version identifier of GameOS cannot be determined. GameOS: %ws |
| ILI_NoVersionForMsComponentCritical | Failure | Failed to extract version information for: %ws |
| ILI_GameOsVersionNotApproved| Failure | The GameOS included in this package is not an approved version. Use only supported GameOS versions according to the Approved Libraries page on the Developer Network Portal |
| ILI_NotApprovedBinaryVersion| Failure | %ws included in this package is not an approved version. Use only supported component versions according to the Approved Libraries page on the Developer Network Portal |
| ILI_GameOsAndMsComponentMismatch | Failure | The GameOS version does not match the version of other Microsoft components included in this package. Use only components from the same GDK/XDK release. Refer to the Approved Libraries page on the Developer Network Portal |
| ILI_MsComponentMismatch | Failure | Mismatched component versions. Use only components from the same GDK/XDK release. Refer to the Approved Libraries page on the Developer Network Portal |
| ILI_AdkOnlyComponent | Failure | %ws included in this package is an ADK only component. GDK/XDK titles should only use supported GDK/XDK components according to the Approved Libraries page on the Developer Network Portal |

## See also  
 [Submission Validator (SubmissionValidator.dll)](submissionvalidator.md)

 [Submission Validator quality checks](submissionvalidator-tests.md) 

 [Make package (makepkg.exe)](../deployment/makepkg.md)

 [Title packaging, content updates, and streaming-installation testing](../title-packaging-streaming-install-testing.md)

 Xbox Requirements (XRs) [(Xbox Developer Downloads->Partner, Publishing, and Release Management Information->XGD Partner Documentation)](https://aka.ms/xgddl)

  