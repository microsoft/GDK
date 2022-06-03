---
author: M-Stahl
title: XGameSaveGetContainerInfo
description: Retrieves info for the containers in a XGameSaveProvider.
kindex: XGameSaveGetContainerInfo
ms.author: kelcon
ms.topic: reference
edited: 07/02/2019
quality: good
security: public
applies-to: pc-gdk
---

# XGameSaveGetContainerInfo  

Retrieves info for the containers in an **XGameSaveProvider**.

## Syntax  
  
```cpp
HRESULT XGameSaveGetContainerInfo(  
         XGameSaveProviderHandle provider,  
         const char* containerName,  
         void* context,  
         XGameSaveContainerInfoCallback* callback  
)  
```  
  
### Parameters  
  
*provider* &nbsp;&nbsp;\_In\_  
Type: XGameSaveProviderHandle  

  
An **XGameSaveProvider** handle with the desired container.


*containerName* &nbsp;&nbsp;\_In\_z\_  
Type: char*  

  
Name of container to retrieve info about, will return only one result if found. If more than one container is desired use [XGameSaveEnumerateContainerInfo](xgamesaveenumeratecontainerinfo.md) or [XGameSaveEnumerateContainerInfoByName](xgamesaveenumeratecontainerinfobyname.md).


*context* &nbsp;&nbsp;\_In\_opt\_  
Type: void*  

  
Pointer to the calling object for context.  


*callback* &nbsp;&nbsp;\_In\_  
Type: XGameSaveContainerInfoCallback*  

  
Callback function to determine the results of and collect data from the [XGameSaveContainerInfo](../structs/xgamesavecontainerinfo.md) call.  


  
### Return value
Type: HRESULT
  
Function result  

#### Common errors

- E_GS_INVALID_CONTAINER_NAME
- E_GS_USER_CANCELED
- E_GS_CONTAINER_NOT_IN_SYNC
- E_GS_CONTAINER_SYNC_FAILED
- E_GS_HANDLE_EXPIRED
  
## Remarks  
  > [!NOTE]
> This function isn't safe to call on a time-sensitive thread. For more information, see [Time-sensitive threads](../../../../system/overviews/time-sensitive-threads.md).  
  
A container is a collection of metadata and a reference point for the set of blobs within it. If the container name is known ahead of time it is possible to use this API to return the information for just that container. This is useful for bringing back specific information about a player instead of calling for all of it each time you need information. You can find the make up of an **XGameSaveContainer** in the [XGameSaveContainerInfo](../structs/xgamesavecontainerinfo.md) struct.  
  
```cpp
void Sample::_GetContainerInfo(const char* name) 
{ 
    XGameSaveContainerInfoCallback* callback = [](_In_ const XGameSaveContainerInfo* info, _In_ void* ctx) -> bool 
    { 
        auto self = reinterpret_cast<Sample*>(ctx); 
        self->_UpdateContainerList(info); 
        return true; 
    }; 
  
    HRESULT hr = XGameSaveGetContainerInfo(_provider, name, this, callback); 
    if (FAILED(hr)) 
    { 
        _HandleContainerErrors(name, hr); 
    } 
} 
 
void Sample::_UpdateContainerList(const XGameSaveContainerInfo* container) 
{ 
    //update UX 
    printf("%s - %s: %I64dbytes %d blobs\n", container->name, container->displayName, container->totalSize, container->blobCount); 
    if (strcmp(container->name, "AutoSave") == 0) 
    { 
        _ReadContainerBlobsAsync(container); 
    } 
} 
 
void Sample::_HandleContainerErrors(const char* name, HRESULT hr) 
{ 
    switch (hr) 
    { 
    case E_GS_INVALID_CONTAINER_NAME: 
        printf("\'%s\' name is invalid for a container", name); 
        break; 
    case E_GS_USER_CANCELED: 
        printf("Container %s failed to sync user canceled hr=0x%08x\n", name, hr); 
        break; 
    case E_GS_CONTAINER_NOT_IN_SYNC: 
    case E_GS_CONTAINER_SYNC_FAILED: 
        printf("Container %s failed to sync hr=0x%08x\n", name, hr); 
        break; 
    case E_GS_HANDLE_EXPIRED: 
        printf("Container %s failed, re-initialize provider", name); 
        break; 
    case S_OK: 
        break; 
    default: 
        printf("Unknown Container error %s hr=0x%08X\n", name, hr); 
    } 
}
```
  
## Requirements  
  
**Header:** XGameSave.h
  
**Library:** xgameruntime.lib  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[XGameSave](../xgamesave_members.md)  
[XGameSaveCreateContainer](xgamesavecreatecontainer.md)  
[XGameSaveContainerInfo](../structs/xgamesavecontainerinfo.md)  
[Game save errors](../../../../system/overviews/game-save/game-saves-errors.md)