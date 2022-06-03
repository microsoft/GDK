---
author: M-Stahl
title: XGameSaveInitializeProvider
description: Provides and initializes a XGameSave Provider handle.
kindex: XGameSaveInitializeProvider
ms.author: kelcon
ms.topic: reference
edited: 07/02/2019
quality: good
security: public
applies-to: pc-gdk
---

# XGameSaveInitializeProvider  

Provides and initializes a XGameSave Provider handle.

## Syntax  
  
```cpp
HRESULT XGameSaveInitializeProvider(  
         XUserHandle requestingUser,  
         const char* configurationId,  
         bool syncOnDemand,  
         XGameSaveProviderHandle* provider  
)  
```  
  
### Parameters  
  
*requestingUser* &nbsp;&nbsp;\_In\_  
Type: XUserHandle  

  
Handle to an Xbox Live user.  


*configurationId* &nbsp;&nbsp;\_In\_z\_  
Type: char*  

  
Service configuration ID (SCID).  


*syncOnDemand* &nbsp;&nbsp;\_In\_  
Type: bool  

  
When true, syncOnDemand only downloads data from the service if needed. Does not work if device is offline. 
Setting to true may cause sync progress UI to be shown.


*provider* &nbsp;&nbsp;\_Outptr\_result\_nullonfailure\_  
Type: XGameSaveProviderHandle*  

  
A handle to the XGameSave Provider to be created.


  
### Return value
Type: HRESULT
  
Function result.  

#### Common errors

- E_GS_USER_CANCELED
- E_GS_USER_NOT_REGISTERED_IN_SERVICE
- E_GS_NO_ACCESS
- E_GS_NO_SERVICE_CONFIGURATION


The most commonly returned errors are E_OUTOFMEMORY, E_INVALIDARG, 
  
## Remarks  
  > [!NOTE]
> This function isn't safe to call on a time-sensitive thread. For more information, see [Time-sensitive threads](../../../../system/overviews/time-sensitive-threads.md).  
  
This function must be called successfully before other XGameSave APIs are used. This function should not 
be called on the game's UI thread as it can block and potentially show UI to the user as it synchronizes 
the player's game saves. If you need to intialize this from the UI thread, consider calling 
[XGameSaveInitializeProviderAsync](xgamesaveinitializeproviderasync.md).

![alert](../../../../../../resources/gamecore/images/en-us/common/note.gif) **NOTE:** The XGameSave API requires your title to have its title ID and service configuration ID (SCID) 
properly configured in order to work. For more information about these required IDs, see [Setting Up Sandboxes for Xbox 
Live Development](../../../../live/test-release/sandboxes/live-setting-up-sandboxes.md). Your game must be enabled for Xbox Live in Partner Center.

If you do not configure your SCID and Title ID properly, your XSaveGame API calls will fail with the following error code:

E_GS_NO_ACCESS - 0x80830002 - The operation failed because the title does not have access to the container storage spaces.

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
impossible. There is an asynchronous version of this function called 
[XGameSaveInitializeProviderAsync](xgamesaveinitializeproviderasync.md)  
  
```cpp
// SYNC Init - should not be called on time sensitive thread 
//             as this will block until the operation is complete 
void Sample::_InitializeSync() 
{ 
    HRESULT hr; 
    XGameSaveProviderHandle provider = nullptr; 
    hr = XGameSaveInitializeProvider(this->_xalUser, "SERVICE_CONFIG_ID-DEADBEEF0123", false, &provider); 
    if (SUCCEEDED(hr)) 
    { 
        this->_provider = provider; 
    } 
    else 
    { 
        _HandleInitializeErrors(this->_xalUser, hr); 
    } 
} 
 
// handle initialization errors  
void Sample::_HandleInitializeErrors(XUserHandle userContext, HRESULT hr) 
{ 
    switch (hr) 
    { 
    case E_GS_USER_CANCELED: 
        printf("User %p canceled initialization hr=0x%08x\n", userContext, hr); 
        break; 
    case E_GS_USER_NOT_REGISTERED_IN_SERVICE: 
        printf("User %p has no service registration\n", userContext); 
        break; 
    /* NOTE These should only be seen if there is a configuration issue */ 
    case E_GS_NO_ACCESS: 
    case E_GS_NO_SERVICE_CONFIGURATION: 
        printf("Problems with Service Configuration registration\n"); 
        break; 
    case S_OK: 
        break; 
    default: 
        printf("Unknown initialization error for User %p hr=0x%08X\n", userContext, hr); 
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
[XGameSaveInitializeProviderAsync](xgamesaveinitializeproviderasync.md)  
[Game save errors](../../../../system/overviews/game-save/game-saves-errors.md)