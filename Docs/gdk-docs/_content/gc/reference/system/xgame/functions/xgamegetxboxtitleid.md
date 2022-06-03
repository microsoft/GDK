---
author: M-Stahl
title: XGameGetXboxTitleId
description: Returns the TitleID for the game.
kindex: XGameGetXboxTitleId
ms.author: v-denken
ms.topic: reference
edited: 05/28/2019
quality: good
security: public
applies-to: pc-gdk
---

# XGameGetXboxTitleId  

Returns the TitleID for the game.  

## Syntax  
  
```cpp
HRESULT XGameGetXboxTitleId(  
         uint32_t* titleId  
)  
```  
  
### Parameters  
  
*titleId* &nbsp;&nbsp;\_Out\_  
Type: uint32_t*  
  
A pointer to the TitleID of the game.  
  
### Return value
Type: [HRESULT](/openspecs/windows_protocols/ms-erref/0642cb2f-2075-4469-918c-4441e69c548a)  
  
Returns **S_OK** if successful; otherwise, returns an error code. For a list of error codes, see [Error Codes](../../../errorcodes.md). If the TitleID is not configured by the game developer in the MicrosoftGame.config file, then the return value is set to **HRESULT_FROM_WIN32(ERROR_NOT_FOUND)**.  
  
## Remarks
  > [!NOTE]
> This function isn't safe to call on a time-sensitive thread. For more information, see [Time-sensitive threads](../../../../system/overviews/time-sensitive-threads.md).  
  
The TitleID uniquely identifies your game to Xbox Live services. It is used throughout Xbox Live services to enable your users to access your game's Live content, such as user statistics and achievements, and to enable Live multiplayer functionality. The TitleID is stored in the MicrosoftGame.config manifest file for your game.  
  
The following example generates a URL for calling a back-end REST service used by the game. The **XGameGetXBoxTitleId** function is called to include the TitleID as part of the URL.  
  
```cpp
std::string GetBackendServiceUrl()  
{  
    uint32_t titleId;  
  
    RetailAssert(SUCCEEDED(XGameGetXboxTitleId(&titleId)));  
  
    std::stringstream url;  
    url << "https://example.com/some/api/call";  
  
    url << std::hex << std::uppercase << std::setfill('0');  
    url << "/titleId/" << std::setw(8) << titleId;  
  
    return url.str();  
}   
```  

## Requirements  
  
**Header:** XGame.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also 
[MicrosoftGame.config](../../../../system/overviews/microsoft-game-config/MicrosoftGameConfig-toc.md)  
[XGame](../xgame_members.md)  
[Setting up sandboxes for Xbox Live development](../../../../live/test-release/sandboxes/live-setting-up-sandboxes.md)