---
author: aablackm
title: XtfSetOverlayFolder
description: Sets the Overlay Folder path for a specified package.
kindex: XtfSetOverlayFolder
ms.author: douglau
ms.topic: reference
edited: 06/10/2019
quality: good
security: public
---

# XtfSetOverlayFolder
Sets, or resets, the overlay folder value associated with a specific package full name.   

<a id="syntaxSection"></a>



## Syntax  

```cpp
HRESULT XtfSetOverlayFolder(
        PCWSTR address,
        PCWSTR packageFullName,
        PCWSTR overlayFolderPath
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
Type: PCWSTR 

[in] Pointer to a string that contains the overlay folder path. If overlayFolderPath is **null** then packageFullName is ignored and the Overlay Folder is reset (equivalent to [xbapp overlayfolder package_full_name /r (NDA topic)](../../../../../tools-console/xbox-tools-and-apis/commandlinetools/xbapp.md)).



<a id="ID4E1"></a>



### Return value  
Type: HRESULT 

A return value of **S_OK** indicates the function succeeded. Any other value indicates an unexpected error occurred.
<a id="remarks"></a>



## Remarks  


Use [XTFSetOverlayFolder](xtfsetoverlayfolder-xtfapi-xbox-windows-m.md) to set or clear an overlay folder. Use [XtfGetOverlayFolder](xtfgetoverlayfolder-xtfapi-xbox-windows-m.md) to retrieve the overlay folder path currently set for a package. Use [XtfClearAllOverlayFolders](xtfclearalloverlayfolders-xtfapi-xbox-windows-m.md) to clear all overlay folder that were previously set on the console. Use [IXtfApplicationClient::GetInstalled](../../xtfapplication/classes/IXtfApplicationClient/methods/getinstalled-ixtfapplicationclient-xtfapplication-xbox-microsoft-m.md) to enumerate all packages currently installed on the console.  

> [!NOTE]
> Overlay folders set using XtfSetOverlayFolder are persistent across reboots of the console.  

<a id="ID4E6C"></a>

## C++ Example
```cpp
int wmain(int argc, wchar_t **argv)
{
    HRESULT             hr = S_OK;
    PCWSTR              consoleAddress = L"190.167.10.18";
    PCWSTR              pOverlayFolderPFN = L"682716bc-bcec-4d5b-a21d-e2b6a4e3066d_1.0.0.0_x64__8wekyb3d8bbwe";
    PWSTR               pOverlayFolderPath = L"D:\\MyGame1\\";
    PWSTR               pOverlayFolderPathReturned = nullptr;
    UINT32              bufferSize = 0;

    hr = XtfSetOverlayFolder(consoleAddress, pOverlayFolderPFN, pOverlayFolderPath);
    if (FAILED(hr))
    {
        wprintf(L"\n\n*** XtfSetOverlayFolder failed 0x%x", hr);
        return hr;
    }

    pOverlayFolderPathReturned = new WCHAR[APPLICATION_USER_MODEL_ID_MAX_LENGTH];
    hr = XtfGetOverlayFolder(consoleAddress, pOverlayFolderPFN, pOverlayFolderPathReturned, &buffersize);
    if (FAILED(hr))
    {
        wprintf(L"\n\n*** Overlay Folder Path is set to %s", pOverlayFolderPathReturned);
    }
    else
    {
        wprintf(L"\n\n*** XtfGetOverlayFolder failed 0x%x", hr);
    }
    delete[] pOverlayFolderPathReturned;

    return hr;
}

```


## Requirements  

**Header:** xtfapi.h  

**Library:** XtfApi.lib  
  
**Supported platforms:** Windows (for Xbox console tools)  
  
## See also  
[Debugging with Overlay Folders (NDA topic)](../../../../../test-automation-publishing/test-automation-publishing-overviews/test-automation-publishing-debugging/debugging-with-overlay-folders.md)  
Command line tool [xbapp overlayfolder (NDA topic)](../../../../../tools-console/xbox-tools-and-apis/commandlinetools/xbapp.md)  
[XTF Transport Errors (NDA topic)](../../../../../tools-console/xbox-tools-and-apis/commandlinetools/xtf-transport-errors.md)