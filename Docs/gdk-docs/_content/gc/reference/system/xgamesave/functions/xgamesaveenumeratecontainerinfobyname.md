---
author: M-Stahl
title: XGameSaveEnumerateContainerInfoByName
description: Retrieves the container info for a XGameSaveProvider.
kindex: XGameSaveEnumerateContainerInfoByName
ms.author: kelcon
ms.topic: reference
edited: 07/02/2019
quality: good
security: public
applies-to: pc-gdk
---

# XGameSaveEnumerateContainerInfoByName  

Retrieves the container info for an **XGameSaveProvider**. Providing a prefix will cause the function to return only words which have that same prefix.

## Syntax  
  
```cpp
HRESULT XGameSaveEnumerateContainerInfoByName(  
         XGameSaveProviderHandle provider,  
         const char* containerNamePrefix,  
         void* context,  
         XGameSaveContainerInfoCallback* callback  
)  
```  
  
### Parameters  
  
*provider* &nbsp;&nbsp;\_In\_  
Type: XGameSaveProviderHandle  

  
**XGameSaveProvider** containing the [XGameSaveContainerInfo](../structs/xgamesavecontainerinfo.md).  


*containerNamePrefix* &nbsp;&nbsp;\_In\_opt\_z\_  
Type: char*  

  
A prefix that will be used to search the list of containers for matching container names.  


*context* &nbsp;&nbsp;\_In\_opt\_  
Type: void*  

  
Pointer that will be passed into the callback function. 


*callback* &nbsp;&nbsp;\_In\_  
Type: XGameSaveContainerInfoCallback*  

  
The callback function to run for every container that matches the prefix, return false to stop the enumeration. Use this function to collect the [XGameSaveContainerInfo](../structs/xgamesavecontainerinfo.md).  

  
### Return value
Type: HRESULT
  
Function result.  
  
## Remarks  
  > [!NOTE]
> While this function is safe to call on a time-sensitive thread, the XGameSaveContainerInfoCallback may cause delays, depending on what the title does within the callback. As an example, copying data from the callback is fine; however, doing any non-time sensitive call can delay the callbacks return. For more information, see [Time-sensitive threads](../../../../system/overviews/time-sensitive-threads.md).   
  
Use this function to inspect what containers are available for a user. This may include data that is needed to show in UX. Enumerating this set will not cause a sync for a SyncOnDemand provider and will allow the caller to actually inspect the sync status via the needsSync field of [XGameSaveContainerInfo](../structs/xgamesavecontainerinfo.md). Any read of blob data or usage of an update context on a container that has *needsSync* set to true will force a sync and could potentially return various sync errors. You may use [XGameSaveEnumerateContainerInfo](xgamesaveenumeratecontainerinfo.md) if you do not need to specify a prefix for your enumerated containers. [XGameSaveEnumerateContainerInfo](xgamesaveenumeratecontainerinfo.md) will return the full list of available containers.  
  
```cpp
// Enumerate Container List by prefix, if no prefix is supplied it is 
// the same as calling XGameSaveEnumerateContainerInfo. 
// NOTE: this should be safe to call from a time critical thread 
// but the we are at the mercy of the callback. 
void Sample::_EnumerateContainerInfoByName(const char* prefix) 
{ 
    HRESULT hr = XGameSaveEnumerateContainerInfoByName(_provider, prefix, this, 
        [](const XGameSaveContainerInfo* container, void* context) 
    { 
        auto self = reinterpret_cast<Sample*>(context); 
        self->_UpdateContainerList(container); 
        return true; 
    }); 
    if (FAILED(hr)) 
    { 
        _HandleContainerErrors(prefix, hr); 
    } 
  
} 
```
  
## Requirements  
  
**Header:** XGameSave.h
  
**Library:** xgameruntime.lib  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[XGameSave](../xgamesave_members.md)  
[XGameSaveEnumerateContainerInfo](xgamesaveenumeratecontainerinfo.md)  
[Game save errors](../../../../system/overviews/game-save/game-saves-errors.md)