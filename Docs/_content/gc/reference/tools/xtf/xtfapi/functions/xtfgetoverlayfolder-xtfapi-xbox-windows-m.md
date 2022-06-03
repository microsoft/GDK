---
author: aablackm
title: XtfGetOverlayFolder
description: Gets the Overlay Folder path for a specified package.
kindex: XtfGetOverlayFolder
ms.author: douglau
ms.topic: reference
edited: 06/10/2019
quality: good
security: public
---

# XtfGetOverlayFolder
Gets the overlay folder path associated with a specific package full name.   

<a id="syntaxSection"></a>



## Syntax  

```cpp
HRESULT XtfGetOverlayFolder(
        PCWSTR address,
        PCWSTR packageFullName,
        PWSTR overlayFolderPath,
        UINT32* overlayFolderPathLength
)   
```

<a id="ID4ET"></a>



### Parameters  

*address*  
Type: PCWSTR 

[in] Pointer to the address of the console.


*packageFullName*  
Type: PCWSTR 

[in] Pointer to the package full name of the app.


*overlayFolderPath*  
Type: PWSTR 

[out, optional] The overlay folder path.


*overlayFolderPathLength*  
Type: UINT32 

[in, out] Length of overlayFolderPath in WCHAR.


<a id="ID4E1"></a>



### Return value  
Type: HRESULT 

If no path has been set for the specified package full name, then the returned value of overlayFolderPath is **null**, overlayFolderPathLength is zero (0), and **S_OK** is returned.

Returns **S_OK** if successful. Returns **HRESULT_FROM_WIN32(ERROR_MORE_DATA)** if overlayFolderPath is not large enough and the required buffer length will be returned in overlayFolderPathLength.

<a id="remarks"></a>



## Remarks  


Use [XTFSetOverlayFolder](xtfsetoverlayfolder-xtfapi-xbox-windows-m.md) to set or clear an overlay folder. Use [XtfGetOverlayFolder](xtfgetoverlayfolder-xtfapi-xbox-windows-m.md) to retrieve the overlay folder path currently set for a package. Use [XtfClearAllOverlayFolders](xtfclearalloverlayfolders-xtfapi-xbox-windows-m.md) to clear all overlay folder that were previously set on the console. Use [IXtfApplicationClient::GetInstalled](../../xtfapplication/classes/IXtfApplicationClient/methods/getinstalled-ixtfapplicationclient-xtfapplication-xbox-microsoft-m.md) to enumerate all packages currently installed on the console.  


## Requirements  

**Header:** xtfapi.h  

**Library:** XtfApi.lib  
  
**Supported platforms:** Windows (for Xbox console tools)  
  

## See also  

[XTF Transport Errors (NDA topic)](../../../../../tools-console/xbox-tools-and-apis/commandlinetools/xtf-transport-errors.md)  
[Additional Xtf APIs](../atoc-xtfapi.md)  
[Debugging with Overlay Folders (NDA topic)](../../../../../test-automation-publishing/test-automation-publishing-overviews/test-automation-publishing-debugging/debugging-with-overlay-folders.md)  
Command line tool [xbapp overlayfolder (NDA topic)](../../../../../tools-console/xbox-tools-and-apis/commandlinetools/xbapp.md)