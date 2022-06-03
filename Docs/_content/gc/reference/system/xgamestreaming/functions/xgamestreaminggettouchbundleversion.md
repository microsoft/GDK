---
author: M-Stahl
title: XGameStreamingGetTouchBundleVersion
description: Gets the version of the touch adaptation bundle that is currently being utilized on the specified device.
kindex: XGameStreamingGetTouchBundleVersion
ms.author: arikccohen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XGameStreamingGetTouchBundleVersion  

Gets the version of the touch adaptation bundle that is currently being utilized on the specified device.    

## Syntax  
  
```cpp
HRESULT XGameStreamingGetTouchBundleVersion(  
        XGameStreamingClientId client,
        XVersion* version,
        size_t versionNameSize,
        char* versionName
)  
```  
  
### Parameters  
  
*client* &nbsp;&nbsp;\_In\_  
Type: XGameStreamingClientId  
  
The streaming client that is being queried.
  
*version* &nbsp;&nbsp;\_Out\_opt\_  
Type: XVersion*  
  
The version number of the bundle that is currently being used on the specified client.  If no version number is specified in the bundle, 0.0.0.0 will be returned.
  
*versionNameSize* &nbsp;&nbsp;\_In\_  
Type: size_t  
  
The maximum size of the `versionName` to be returned.  The size that is specified can be found by calling [XGameStreamingGetTouchBundleVersionNameSize](xgamestreaminggettouchbundleversionnamesize.md).

*versionName* &nbsp;&nbsp;\_Out\_writes\_opt\_z\_  
Type: char*  
  
The version name of the bundle that is currently being used on the specified client.  If no version name is specified in the bundle, `null` will be returned.
  
  
### Return value
Type: HRESULT
  
Returns **S_OK** if successful; otherwise, returns an error code.

#### Potential Errors

| Error Code | Error Value | Reason for Error |
| --- | --- | --- | 
| E_GAMESTREAMING_NOT_INITIALIZED | 0x89245400 | The XGameStreaming runtime has not been initialized. Call XGameStreamingInitialize before calling other APIs.
| E_GAMESTREAMING_CLIENT_NOT_CONNECTED | 0x89245401 | The specified client is not connected. |

For a list of error codes, see [Error Codes](../../../errorcodes.md).

## Remarks  
  
Touch layouts that are presented to the player during game streaming use pre-defined layouts that are uploaded to Microsoft as part of a touch adaptation bundle. `XGameStreamingGetTouchBundleVersion` enables the game to make runtime decisions based on the set of touch controls that are being utilized on a particular client.  Some examples of where this might be utilized:
- To remove an element from the HUD if the player is using touch and the element is available via the touch overlay controls.
- To decide which graphical hints to display in the game based on the touch layouts that will be displayed.

The `version` will be unique per version that is uploaded to the service.  Every update will require a new version number.

The `versionName` can be used to provide a semantic version (e.g., this is a set of layouts that support DLC2) as opposed to locking to a specific version number. For example, if version numbers are assigned automatically by your build system, it may be difficult for game code to know the exact version number of the touch adaptation bundles that will appear at runtime. In order to allow the code to detect the presence of a bundle without having to know its exact version, it may choose to use a version name instead of doing comparisons based upon a version number.

## Example

```C++
void GameStreamingClientManager::GetClientTouchBundleVersion(XGameStreamingClientId client)
{
    // Get the touch bundle version and initialize the touch HUD based on the 
    // semantic version name that was returned
    
    size_t versionNameSize = XGameStreamingGetTouchBundleVersionNameSize(clientId);

    XVersion version{};
    std::vector<char> versionName(versionNameSize, 0);
    XGameStreamingGetTouchBundleVersion(clientId, &version, versionNameSize, &versionName[0]);

    InitializeTouchHUD(versionName);

    if (strcmp("DLC2", versionName.data()) == 0)
    {
        // we have our DLC2 controls, switch to the HUD layout that works best with those overlay controls.
        InitializeHUDForDLC2TouchControls();
    }
}
```
  
## Requirements  
  
**Header:** XGameStreaming.h  
  
**Library:** xgameruntime.lib  
  
**Supported Platforms**: Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[XGameStreaming](../xgamestreaming_members.md#ClientProperties)  
[XGameStreamingGetTouchBundleVersionNameSize](xgamestreaminggettouchbundleversionnamesize.md)  
