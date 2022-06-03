---
author: M-Stahl
title: XGameSaveContainerInfoCallback
description: The callback function for a call made to [XGameSaveGetContainerInfo](xgamesavegetcontainerinfo.md).
kindex: XGameSaveContainerInfoCallback
ms.author: kelcon
ms.topic: reference
edited: 00/00/0000
quality: good
security: public
applies-to: pc-gdk
---

# XGameSaveContainerInfoCallback  

Callback function for completing work after calling for data from XGameSave. 

## Syntax  
  
```cpp
bool XGameSaveContainerInfoCallback(  
         const XGameSaveContainerInfo* info,  
         void* context  
)  
```  
  
### Parameters  
  
*info* &nbsp;&nbsp;\_In\_  
Type: [XGameSaveContainerInfo*](../structs/xgamesavecontainerinfo.md)  

  
XGameSaveContainerInfo passed from the call made to [XGameSaveGetContainerInfo](xgamesavegetcontainerinfo.md), [XGameSaveEnumerateContainerInfo](xgamesaveenumeratecontainerinfo.md) or [XGameSaveEnumerateContainerInfoByName](xgamesaveenumeratecontainerinfobyname.md).  


*context* &nbsp;&nbsp;\_In\_opt\_  
Type: void*  

  
The object passed into [XGameSaveGetContainerInfo](xgamesavegetcontainerinfo.md), [XGameSaveEnumerateContainerInfo](xgamesaveenumeratecontainerinfo.md) or [XGameSaveEnumerateContainerInfoByName](xgamesaveenumeratecontainerinfobyname.md). The context pointer carries information about that object that may be needed in the callback function.

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
  
### Return value
Type: bool
  
Return false to stop enumeration.  
  
## Remarks  
  
Passed as a parameter to the [XGameSaveGetContainerInfo](xgamesavegetcontainerinfo.md), [XGameSaveEnumerateContainerInfo](xgamesaveenumeratecontainerinfo.md) or [XGameSaveEnumerateContainerInfoByName](xgamesaveenumeratecontainerinfobyname.md) call. This function is used as a callback so that other processes may continue while XGameSave information is obtained. This callback pattern also allows for data to be returned in sections. Whether your callback function is declared separately or inline the function must have the same parameters and boolean return value as **XGameSaveContainerInfoCallback**.  
  
## Requirements  
  
**Header:** XGameSave.h
  
**Library:** xgameruntime.lib  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[XGameSave](../xgamesave_members.md)  
[XGameSaveGetContainerInfo](xgamesavegetcontainerinfo.md)  
[XGameSaveEnumerateContainerInfo](xgamesaveenumeratecontainerinfo.md)  
[XGameSaveEnumerateContainerInfoByName](xgamesaveenumeratecontainerinfobyname.md)
[Game save errors](../../../../system/overviews/game-save/game-saves-errors.md)