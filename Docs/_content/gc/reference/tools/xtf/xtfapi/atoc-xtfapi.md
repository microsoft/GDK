---
author: aablackm
title: Additional Xtf APIs (API contents)
description: The XTF API that is used for checking available space for apps and retrieving user friendly error messages.
ms.assetid: a78e1f66-39e9-cd13-57dc-de5392425d4a
kindex: Additional Xtf APIs
ms.author: stevenpr
ms.topic: navigation
edited: 03/27/2020
security: public
---

# Additional Xtf APIs
  
The Xbox Tools Framework (XTF) API is used for checking available space for apps and retrieving user friendly error messages.  
  
<a id="ID4EM"></a>


  
## App functions  
  
| App function | Description |  
| --- | --- |  
| [XtfPullAuditionApp](functions/xtfpullauditionapp-xtfapi-xbox-windows-m.md) | Reserved for internal use. |  
| [XtfPullRegisterApp](functions/xtfpullregisterapp-xtfapi-xbox-windows-m.md) | Reserved for internal use. |  
| [XtfPullSupplyMock](functions/xtfpullsupplymock-xtfapi-xbox-windows-m.md) | Reserved for internal use. |  
| [XtfPullUnregisterApp](functions/xtfpullunregisterapp-xtfapi-xbox-windows-m.md) | Reserved for internal use. |  
  
## Console info functions  
  
| Console info function | Description |  
| --- | --- |  
| [XtfCloseConsoleInfoList](functions/xtfcloseconsoleinfolist-xbox-microsoft-m.md) | Frees resources associated with an <api>XtfConsoleInfo</api> object returned by XtfGetConsoleInfoList. |  
| [XtfGetAvailableSpaceForAppInstallation](../xtfconsolecontrol/functions/xtfgetavailablespaceforappinstallation-xtfconsolecontrol-xbox-microsoft-m.md) | Gets the total number of bytes available on the specified storage device of a development console. |  
| [XtfGetConsoleFieldValue](functions/xtfgetconsolefieldvalue-xbox-microsoft-m.md) | Retrieves information about a console, one of Tools IP Address, Console IP Address, AccessKey, Console ID, HostName, Device ID, DevKit Cert type, SystemMajorVersion, SystemMinorVersion, SystemBuildVersion, or SystemRevisionVersion. |  
| [XtfGetConsoleInfoList](../xtfconsolecontrol/functions/xtfgetconsoleinfolist-xtfconsolecontrol-xbox-microsoft-m.md) | Returns an `XtfConsoleInfo` object that contains information about a console. |  
| [XtfGetSavedConsoleAddress](functions/xtfgetsavedconsoleaddress-xtfapi-xbox-windows-m.md) | Gets the Tools IP address of the default console for Xbox Tools Framework (XTF) apps. |  
| [XtfGetSystemUpTime](functions/xtfgetsystemuptime-xtfapi-xbox-windows-m.md) | Gets the amount of time in milliseconds that the System OS and Game OS have been running. |  
| [XtfWaitForConsoleOSReady](functions/xtfwaitforconsoleosready-xtfapi-xbox-windows-m.md) | Waits until the console OS is ready to receive commands before returning. |  
| [XtfWaitForConsoleState](functions/xtfwaitforconsolestate.md) | Blocks execution until either the specified console states are reached or a timeout occurs. |  
  
## Credential functions  
  
| Credential function | Description |  
| --- | --- |  
| [XtfAddCredential](functions/xtfaddcredential-xtfapi-xbox-windows-m.md) | Adds credentials (user name and password) to the given console for use by Run from PC Deployment. |  
| [XtfCloseCredentialInfoList](functions/xtfclosecredentialinfo-xtfapi-xbox-windows-m.md) | Frees resources associated with an XtfNetworkCredentials object returned by XtfGetCredentialInfoList. |  
| [XtfGetCredentialInfoCount](functions/xtfgetcredentialinfocount-xtfapi-xbox-windows-m.md) | Gets the count of credentials stored in an `XtfNetworkCredentials` object returned by [XtfGetCredentialInfoList](functions/xtfgetcredentialinfolist-xtfapi-xbox-windows-m.md). |  
| [XtfGetCredentialInfoList](functions/xtfgetcredentialinfolist-xtfapi-xbox-windows-m.md) | Returns an `XtfNetworkCredentials` object that contains the list of credentials currently stored on the console. |  
| [XtfGetCredentialServerName](functions/xtfgetcredentialtargetname-xtfapi-xbox-windows-m.md) | Gets the server name part of the credentials stored at an index in an XtfNetworkCredentials object returned by XtfGetCredentialInfoList. |  
| [XtfGetCredentialUserName](functions/xtfgetcredentialusername-xtfapi-xbox-windows-m.md) | Gets the user name part of the credentials stored at an index in an XtfNetworkCredentials object returned by XtfGetCredentialInfoList. |  
| [XtfRemoveCredential](functions/xtfremovecredential-xtfapi-xbox-windows-m.md) | Removes credentials from the given console. Use XtfAddCredential add credentials. |  
  
## Debug functions  
  
| Debug function | Description |  
| --- | --- |  
| [XtfCaptureOutputBegin](functions/xtfcaptureoutputbegin-xtfapi-xbox-windows-m.md) | Starts capture of debug output. |  
| [XtfCaptureOutputEnd](functions/xtfcaptureoutputend-xtfapi-xbox-windows-m.md) | Stop capture debug output. |  
| [XtfDebugStringCallback](functions/xtfdebugstringcallback-xtfapi-xbox-windows-m.md) | Callback invoked for each output debug string captured by [XtfCaptureOutputBegin](functions/xtfcaptureoutputbegin-xtfapi-xbox-windows-m.md). |  
| [XtfDebugStringErrorCallback](functions/xtfdebugstringerrorcallback-xtfapi-xbox-windows-m.md) | Callback invoked for each error captured by [XtfCaptureOutputBegin](functions/xtfcaptureoutputbegin-xtfapi-xbox-windows-m.md). |  
| [XtfGetErrorText](../xtfconsolecontrol/functions/xtfgeterrortext-xtfconsolecontrol-xbox-microsoft-m.md) | Gets a user-friendly error message and action text for the specified `HRESULT`. |  
  
## Game clip functions  
  
| Game clip function | Description |  
| --- | --- |  
| [XtfCaptureRecordedGameClip](functions/xtfcapturegameclip-xbox-microsoft-m.md) | Captures a video clip from the currently running game. |  
  
## Package info functions  
  
| Package info function | Description |  
| --- | --- |  
| [XtfClosePackageInfo](functions/xtfclosepackageinfo-xtfapi-xbox-windows-m.md) | Frees a package information object. |  
| [XtfGetAumid](functions/xtfgetaumid-xtfapi-xbox-windows-m.md) | Gets the application model user ID at an index from a package information object. |  
| [XtfGetCountofAppUserModelIds](functions/xtfgetcountofappusermodelids-xtfapi-xbox-windows-m.md) | Gets the count of application user model IDs from a package information object. |  
| [XtfGetPackageFullName](functions/xtfgetpackagefullname-xtfapi-xbox-windows-m.md) | Get the full package name from a package information object. |  
| [XtfRegisterAllPackagesOnDrive](functions/xtfregisterallpackagesondrive-xtfapi-xbox-windows-m.md) | Register all packages deployed on the specified drive. |  
| [XtfRegisterNetworkSharePackage](functions/xtfregisternetworksharepackage-xtfapi-xbox-windows-m.md) | Registers a package for Run from PC Deployment. |  
| [XtfRegisterPackage](functions/xtfregisterpackage-xtfapi-xbox-windows-m.md) | Registers a package deployed to the title scratch drive. |  
| [XtfRegisterPackageOnDrive](functions/xtfregisterpackageondrive-xtfapi-xbox-windows-m.md) | Registers a package deployed on the specified drive. |  
| [XtfUnregisterPackage](functions/xtfunregisterpackage-xtfapi-xbox-windows-m.md) | Unregisters a package deployed to the title scratch drive. |  
  
## Title OS functions  
  
| Title OS function | Description |  
| --- | --- |  
| [XtfCacheTitleOS](functions/xtfcachetitleos-xtfapi-xbox-windows-m.md) | Adds a Game OS to the OS cache. |  
| [XtfGetCachedTitleOSVersions](functions/xtfgetcachedtitleosversions-xtfapi-xbox-windows-m.md) | Gets the version information of each Game OS cached on the console. |  
| [XtfGetCachedTitleOSVersionsCallback](functions/xtfgetcachedtitleosversionscallback-xtfapi-xbox-windows-m.md) | Callback invoked for each Game OS found by [XtfGetCachedTitleOSVersions](functions/xtfgetcachedtitleosversions-xtfapi-xbox-windows-m.md). |  
| [XtfGetTitleOSFourPartVersion](functions/xtfgettitleosfourpartversion-xtfapi-xbox-windows-m.md) | Gets version information about the Game OS for the currently running title. |  
| [XtfGetTitleOSState](functions/xtfgettitleosstate-xtfapi-xbox-windows-m.md) | Query the state of the Title OS, Fast Iteration Mode, running Title, associate PID, and Package information. |  
| [XtfGetTitleProcessMemoryReports](functions/xtfgettitleprocessmemoryreports-xtfapi-xbox-windows-m.md) | Reserved for internal use. |  
| [XtfRemoveTitleOSFromCache](functions/xtfremovetitleosfromcache-xtfapi-xbox-windows-m.md) | Removes a Game OS from the cache on the console. |  
| [XtfRemoveTitleOSFromCacheByVersion](functions/xtfremovetitleosfromcachebyversion-xtfapi-xbox-windows-m.md) | Removes the Game OS matching the specified [FourPartVersion](structs/fourpartversion-xtfapi-xbox-windows-s.md) from the cache on the console. |  
| [XtfShutdownTitleOS](functions/xtfshutdowntitleos-xtfapi-xbox-windows-m.md) | Shuts down the active title and Game OS. |  
| [XtfStartTitleOS](functions/xtfstarttitleos-xtfapi-xbox-windows-m.md) | Starts or restarts the specified Game OS. |  
| [XtfStartTitleOSByGameConfig](functions/xtfstarttitleosbygameconfig-xtfapi-xbox-windows-m.md) | Starts or restarts the Game OS based on the contents of a MicrosoftGame.config file that is stored in memory as a string. |  
| [XtfStartTitleOSByVersion](functions/xtfstarttitleosbyversion-xtfapi-xbox-windows-m.md) | Starts or restarts the Game OS matching the specified [FourPartVersion](structs/fourpartversion-xtfapi-xbox-windows-s.md) from the cache on the console. |  
  
## Overlay Folder functions  
  
| Overlay Folder function | Description |  
| --- | --- |  
| [XtfClearAllOverlayFolders](functions/xtfclearalloverlayfolders-xtfapi-xbox-windows-m.md) | Clears the Overlay Folder paths for all packages installed/registered on the console. |  
| [XtfGetOverlayFolder](functions/xtfgetoverlayfolder-xtfapi-xbox-windows-m.md) | Gets the Overlay Folder path for a specified package. |  
| [XtfSetOverlayFolder](functions/xtfsetoverlayfolder-xtfapi-xbox-windows-m.md) | Sets the Overlay Folder path for a specified package. |  
  
## Structures  
  
| Structure | Description |  
| --- | --- |  
| [FourPartVersion](structs/fourpartversion-xtfapi-xbox-windows-s.md) | The four-part version number of a Game OS. |  
  
## Enumerations  
  
| Enumeration | Description |  
| --- | --- |  
| [XtfConsoleCertType Enumeration](enums/xtfconsolecerttype-xbox-windows-t.md) | Reserved for internal use. |  
| [XtfConsoleFieldId Enumeration](enums/xtfconsolefieldid-xbox-windows-t.md) | Identifies the value to return from [XtfGetConsoleFieldValue](functions/xtfgetconsolefieldvalue-xbox-microsoft-m.md). |  
| [XtfConsoleFieldType Enumeration](enums/xtfconsolefieldtype-xbox-windows-t.md) | Identifies the type of the value returned from XtfGetConsoleFieldValue. |  


