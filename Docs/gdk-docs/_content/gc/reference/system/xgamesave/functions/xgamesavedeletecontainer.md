---
author: M-Stahl
title: XGameSaveDeleteContainer
description: Deletes a XGameSaveContainer from cloud storage.
kindex: XGameSaveDeleteContainer
ms.author: kelcon
ms.topic: reference
edited: 02/10/2020
quality: good
security: public
applies-to: pc-gdk
---

# XGameSaveDeleteContainer  

Deletes an XGameSaveContainer from cloud storage.  

## Syntax  
  
```cpp
HRESULT XGameSaveDeleteContainer(  
         XGameSaveProviderHandle provider,  
         const char* containerName  
)  
```  
  
### Parameters  
  
*provider* &nbsp;&nbsp;\_In\_  
Type: XGameSaveProviderHandle  

  
Handle to the XGameSaveProvider which contains the container to be deleted.  


*containerName* &nbsp;&nbsp;\_In\_z\_  
Type: char*  

  
The name of the container to be deleted.  


  
### Return value
Type: HRESULT
  
Function result.  
  
## Remarks  
  > [!NOTE]
> This function isn't safe to call on a time-sensitive thread. For more information, see [Time-sensitive threads](../../../../system/overviews/time-sensitive-threads.md).  
  
This operation may sometimes run slow, it is somewhat dependent on the size of the data being deleted. This operation is serialized to ensure we always have a consistent representation of the data. This method has an asynchronous version, [XGameSaveDeleteContainerAsync](xgamesavedeletecontainerasync.md).
  
```cpp
void Sample::_DeleteContainer(const char* name) 
{ 
    HRESULT hr = XGameSaveDeleteContainer(_provider, name); 
    if (FAILED(hr)) 
    { 
        _HandleContainerErrors(name, hr); 
    } 
} 
```
  
## Requirements  
  
**Header:** XGameSave.h
  
**Library:** xgameruntime.lib  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[XGameSave](../xgamesave_members.md)  
[XGameSaveDeleteContainerAsync](xgamesavedeletecontainerasync.md)  
[Game save errors](../../../../system/overviews/game-save/game-saves-errors.md)