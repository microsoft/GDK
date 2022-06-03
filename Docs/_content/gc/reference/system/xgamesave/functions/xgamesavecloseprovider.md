---
author: M-Stahl
title: XGameSaveCloseProvider
description: Releases resources held by the XGameSaveProvider.
kindex: XGameSaveCloseProvider
ms.author: kelcon
ms.topic: reference
edited: 07/02/2019
quality: good
security: public
applies-to: pc-gdk
---

# XGameSaveCloseProvider  

Releases resources held by the XGameSaveProvider.  

## Syntax  
  
```cpp
void XGameSaveCloseProvider(  
         XGameSaveProviderHandle provider  
)  
```  
  
### Parameters  
  
*provider* &nbsp;&nbsp;\_In\_  
Type: XGameSaveProviderHandle  

  
XGameSaveProvider handle to be closed.  


  
### Return value
Type: void

  
## Remarks  
  > [!NOTE]
> This function isn't safe to call on a time-sensitive thread. For more information, see [Time-sensitive threads](../../../../system/overviews/time-sensitive-threads.md).  
  
Each provider holds on to resources that need to be cleaned up when no longer needed or when the existing provider has become invalid. A provider can become invalid for a few reasons with the primary one being that the while the application was suspended the context was stolen on a different device by the same user. This is represented as **E_GS_HANDLE_EXPIRED** and can be returned from any of the XGameSave APIs, the proper handling is to close the provider and then re-initialize and have the user prompted to deal with any possible conflict issues.  
  
```cpp
XGameSaveProviderHandle _provider; 
 
void Sample::_Uninitialize() 
{ 
    if (_provider) 
    { 
        XGameSaveCloseProvider(_provider); 
        _provider = nullptr; 
    } 
} 
```
  
## Requirements  
  
**Header:** XGameSave.h
  
**Library:** xgameruntime.lib  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[XGameSave](../xgamesave_members.md)  
[XGameSaveInitializeProvider](xgamesaveinitializeprovider.md)  
[XGameSaveInitializeProviderAsync](xgamesaveinitializeproviderasync.md)  
[Game save errors](../../../../system/overviews/game-save/game-saves-errors.md)