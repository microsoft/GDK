---
author: aablackm
title: XtfGetTitleOSState
description: Query the state of the Title OS, Fast Iteration Mode, running Title, associate PID, and Package information.
ms.assetid: M:Windows.Xbox.xtfapi.XtfGetCredentialInfoList(PCWSTR,UINT32*,UINT32*,PWSTR,UINT32*,PWSTR,UINT32*)
kindex: XtfGetTitleOSState
ms.author: stevenpr
ms.topic: reference
edited: 06/10/2019
security: public
---

# XtfGetTitleOSState
  
Get information about the running game, including its state, process ID, package full name, and Application User Model IDs (AUMIDs).  
  
<a id="syntaxSection"></a>
  
## Syntax
  
```cpp
HRESULT XtfGetTitleOSState(
        PCWSTR address,
        UINT32* titleStateFlags,
        UINT32* pid,
        PWSTR packageFullName,
        UINT32* packageFullNameLength,
        PWSTR aumid,
        UINT32* aumidLength)
```
  
<a id="parametersSection"></a>
  
### Parameters
  
*address*  
Type: PCWSTR  
  
\[in\] The address of the console.  
  
*titleStateFlags*  
Type: UINT32\*  
  
\[out, optional\] A bitwise-OR combination of flags that provide additional information about the game. If this value is not required, set this to `nullptr`. This parameter supports the following flags:
  
| Flag | Value | Description |  
| ---- | ----- | ----------- |  
| XTF_TITLESTATE_FASTITERATION_ENABLED | 0x0001 | Fast Iteration Mode is enabled for this game. For more information about Fast Iteration Mode, see [Application Management (xbapp.exe) (NDA topic)](../../../../../tools-console/xbox-tools-and-apis/commandlinetools/xbapp.md) and [Managing applications and files (NDA topic)](../../../../../tools-console/xbox-tools-and-apis/xbom/manager-tool-managing-applications.md). |  
| XTF_TITLESTATE_TITLE_RUNNING | 0x0002 | The game is currently running. |  
| XTF_TITLESTATE_TITLEOS_RUNNING | 0x0004 | The Game OS for the game is currently running. |  
| XTF_TITLESTATE_TITLENETWORK_READY | 0x0008 | Networking is ready for the game. |  
  
*pid*  
Type: UINT32\*  
  
\[out, optional\] The process ID of the game, if the game is currently running; otherwise, zero. If this value is not required, set this to `nullptr`.  
  
*packageFullName*  
Type: PWSTR  
  
\[out, optional\] The package full name of the game, if the game is currently running; otherwise, an empty string (""). If this value is not required or if the buffer length is required, set this to `nullptr`.  
  
*packageFullNameLength*  
Type: UINT32\*  
  
\[out, optional\] The length of the buffer required for *packageFullName* in WCHAR. If this value is not required, set this to `nullptr`.  
  
*aumid*  
Type: PWSTR  
  
\[out, optional\] The AUMID of the game, if the game is currently running; otherwise, an empty string (""). If this value is not required, set this to `nullptr`.  
  
*aumidLength*  
Type: UINT32\*  
  
\[out, optional\] The length of the buffer required for *aumid* in WCHAR. If this value is not required, set this to `nullptr`.  
  
<a id="retvalSection"></a>
  
### Return value
  
Type: HRESULT 

Returns `S_OK` if successful; otherwise, returns an HRESULT error code. Returns `HRESULT_FROM_WIN32(ERROR_MORE_DATA)` if `packageFullName` or `aumid` buffers are too small.  
  
<a id="remarksSection"></a>
  
## Remarks
  
This function returns information about the state of the currently running game, including title state flags, process ID, package full name, and Application User Model ID (AUMID). For more information about packaging, see [Packaging](../../../../../packaging/gc-packaging-toc.md).  
  
To retrieve the required buffer lengths for the `packageFullName` and `aumid` buffers, perform the following steps:  
  
1. Set `packageFullName` and `aumid` parameters to `nullptr`  
1. Set `packageFullNameLength` and `aumidLength` parameters to valid UINT32 pointers  
1. Call `XtfGetTitleOSState`  
  
If the function runs successfully, the `packageFullNameLength` and `aumidLength` parameters contain the required buffer lengths, in WCHAR, for `packageFullName` and `aumidLength`, respectively.  
  
<a id="requirementsSection"></a>
  
## Requirements
  
**Header:** xtfapi.h  
  
**Library:** XtfApi.lib  
  
**Supported platforms:** Windows (for Xbox console tools)  
  
<a id="seealsoSection"></a>
  
## See also
  
[XtfGetAumid](xtfgetaumid-xtfapi-xbox-windows-m.md)  
[XtfGetPackageFullName](xtfgetpackagefullname-xtfapi-xbox-windows-m.md)  
[XTF Transport Errors (NDA topic)](../../../../../tools-console/xbox-tools-and-apis/commandlinetools/xtf-transport-errors.md)  
[Additional Xtf APIs](../atoc-xtfapi.md)  
  