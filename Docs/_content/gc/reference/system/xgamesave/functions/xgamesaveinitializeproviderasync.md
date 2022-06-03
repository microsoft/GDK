---
author: M-Stahl
title: XGameSaveInitializeProviderAsync
description: Provides and initializes an XGameSave Provider handle asynchronously.
kindex: XGameSaveInitializeProviderAsync
ms.author: kelcon
ms.topic: reference
edited: 07/02/2019
quality: good
security: public
applies-to: pc-gdk
---

# XGameSaveInitializeProviderAsync  

Provides and initializes an XGameSave Provider handle asynchronously.

## Syntax  
  
```cpp
HRESULT XGameSaveInitializeProviderAsync(  
         XUserHandle requestingUser,  
         const char* configurationId,  
         bool syncOnDemand,  
         XAsyncBlock* async  
)  
```  
  
### Parameters  
  
*requestingUser* &nbsp;&nbsp;\_In\_  
Type: XUserHandle  

  
Handle to an Xbox Live User. 


*configurationId* &nbsp;&nbsp;\_In\_z\_  
Type: char*  

  
Service configuration ID (SCID).  


*syncOnDemand* &nbsp;&nbsp;\_In\_  
Type: bool  

  
When true syncOnDemand only downloads data from the service if needed. Does not work if device is offline. 
Setting to true may cause sync progress UI to be shown.  


*async* &nbsp;&nbsp;\_In\_  
Type: [XAsyncBlock*](../../xasync/structs/xasyncblock.md)  

  
Contains the information for the Async call. This includes calling context and a call to the 
[XGameSaveInitializeProviderResult](xgamesaveinitializeproviderresult.md) function.


  
### Return value
Type: HRESULT
  
Function result.  
  
## Remarks  
  
This function must be called successfully before other XGameSave APIs are used. 

![alert](../../../../../../resources/gamecore/images/en-us/common/note.gif) **NOTE:** The XGameSave API requires your title to have its title ID and service configuration ID (SCID) 
properly configured in order to work. For more information about these required IDs, see [Setting Up Sandboxes for Xbox 
Live Development](../../../../live/test-release/sandboxes/live-setting-up-sandboxes.md). Your game must be enabled for Xbox Live in Partner Center.

If you do not configure your SCID and Title ID properly, your XSaveGame API calls will fail with the following error code:

E_GS_NO_ACCESS - 0x80830002 - The operation failed because the title does not have access to the container storage spaces.  

The resulting **XGameSaveProviderHandle** is obtained from the 
[XGameSaveInitializeProviderResult](xgamesaveinitializeproviderresult.md) function. This is the handle you will use to 
access your **XGameSaveProvider**. 

When this API is called with *syncOnDemand* set to true it behaves the same from a caller perspective but it does cause 
some behavior differences in the rest of the API. The *SyncOnDemand* **XGameSaveProvider** will only download data from 
the service if needed but this also comes with the drawback that any container operation might be delayed in this case 
and this delay may cause some UX to be shown to the user for the sync progress. Using any of the following methods can 
force a sync:
- [XGameSaveCreateUpdate](xgamesavecreateupdate.md)
- [XGameSaveEnumeratorBlobInfo](xgamesaveenumerateblobinfo.md) 
- [XGameSaveEnumerateBlobInfoByName](xgamesaveenumerateblobinfobyname.md)
- [XGameSaveEnumerateContainerInfo](xgamesaveenumeratecontainerinfo.md)
- [XGameSaveEnumerateContainerInfoByName](xgamesaveenumeratecontainerinfobyname.md)

Another drawback would be that if the device is offline or has connectivity issues then accessing the container is 
impossible. 

##Example

```cpp
// ASYNC Init - can be kicked off from a time sensitive thread 
//              work and callback will happen from platform provided threads 
void Sample::_InitializeAsync() 
{ 
    HRESULT hr; 
  
    struct InitContext 
    { 
        Sample* self; 
        XAsyncBlock async; 
    }; 
  
    InitContext* ctx = new InitContext{}; 
    if (ctx) 
    { 
        ctx->self = this; 
        ctx->async.context = ctx; 
        ctx->async.callback = [](XAsyncBlock* async) 
        { 
            auto ctx = reinterpret_cast<InitContext*>(async->context); 
            auto self = ctx->self; 
            XGameSaveProviderHandle provider = nullptr; 
            HRESULT hr = XGameSaveInitializeProviderResult(async, &provider); 
            if (SUCCEEDED(hr)) 
            { 
                self->_provider = provider; 
            } 
            else 
            { 
                self->_HandleInitializeErrors(self->_xalUser, hr); 
            } 
            delete ctx; 
        }; 
    } 
    else 
    { 
        hr = E_OUTOFMEMORY; 
    } 
  
    if (SUCCEEDED(hr)) 
    { 
        hr = XGameSaveInitializeProviderAsync(this->_xalUser, "SERVICE_CONFIG_ID-DEADBEEF0123", false, &ctx->async); 
    } 
    if (FAILED(hr)) 
    { 
        // if we didn't setup the async we need to cleanup our tracking context 
        delete ctx; 
        _HandleInitializeErrors(this->_xalUser, hr); 
    } 
} 
```  

Games cannot mix the usage of XGameSaveFiles with the usage of XGameSave. Games much choose which cloud save system
they want to use. If the game is using XGameSaveFiles and later calls XGameSaveInitializeProvider, it will error out 
with E_GS_PROVIDER_MISMATCH. Equally, if the game was using XGameSave and later calls XGameSaveFilesGetFolderWithUiAsync,
that will also error out with E_GS_PROVIDER_MISMATCH.

## Requirements  
  
**Header:** XGameSave.h
  
**Library:** xgameruntime.lib  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[XGameSave](../xgamesave_members.md)  
[XGameSaveInitializeProviderResult](xgamesaveinitializeproviderresult.md)  
[XGameSaveInitializeProvider](xgamesaveinitializeprovider.md)  
[Game save errors](../../../../system/overviews/game-save/game-saves-errors.md)