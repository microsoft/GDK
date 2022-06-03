---
author: M-Stahl
title: XGameSaveDeleteContainerAsync
description: Deletes a XGameSaveContainer asynchronously.
kindex: XGameSaveDeleteContainerAsync
ms.author: kelcon
ms.topic: reference
edited: 00/00/0000
quality: good
security: public
applies-to: pc-gdk
---

# XGameSaveDeleteContainerAsync  

Deletes an XGameSaveContainer asynchronously.  

## Syntax  
  
```cpp
HRESULT XGameSaveDeleteContainerAsync(  
         XGameSaveProviderHandle provider,  
         const char* containerName,  
         XAsyncBlock* async  
)  
```  
  
### Parameters  
  
*provider* &nbsp;&nbsp;\_In\_  
Type: XGameSaveProviderHandle  

  
Handle to the XGameSaveProvider which contains the container to be deleted.  


*containerName* &nbsp;&nbsp;\_In\_z\_  
Type: char*  

  
The name of the container to be deleted.  


*async* &nbsp;&nbsp;\_In\_  
Type: XAsyncBlock*  

  
AsyncBlock containing the context and function callback for the XGameSaveDeleteContainerAsync call.  

  
### Return value
Type: HRESULT
  
Function result.  
  
## Remarks  
  
You will need to call [XGameSaveDeleteContainerResult](xgamesavedeletecontainerresult.md) in the AsyncBlock's function callback to retrieve the results of the **XGameSaveContainer** deletion. This operation is serialized to ensure we always have a consistent representation of the data. There is a synchronous version of this function, [XGameSaveDeleteContainer](xgamesavedeletecontainer.md).
  
## Requirements  
  
**Header:** XGameSave.h
  
**Library:** xgameruntime.lib  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[XGameSave](../xgamesave_members.md)  
[XGameSaveDeleteContainerResult](xgamesavedeletecontainerresult.md)  
[XGameSaveDeleteContainer](xgamesavedeletecontainer.md)  
[Game save errors](../../../../system/overviews/game-save/game-saves-errors.md)