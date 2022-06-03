---
author: M-Stahl
title: XGameSaveDeleteContainerResult
description: Retrieves the result of a [XGameSaveDeleteContainerAsync](xgamesavedeletecontainerasync.md) call, use this function to check the success of the call.
kindex: XGameSaveDeleteContainerResult
ms.author: kelcon
ms.topic: reference
edited: 00/00/0000
quality: good
security: public
applies-to: pc-gdk
---

# XGameSaveDeleteContainerResult  

Retrieves the result of a [XGameSaveDeleteContainerAsync](xgamesavedeletecontainerasync.md) call, use this function to check the success of the call.

## Syntax  
  
```cpp
HRESULT XGameSaveDeleteContainerResult(  
         XAsyncBlock* async  
)  
```  
  
### Parameters  
  
*async* &nbsp;&nbsp;\_In\_  
Type: [XAsyncBlock*](../../xasync/structs/xasyncblock.md)  

  
AsyncBlock containing the context and callback function to be run after **XGameSaveDeleteContainerResult** completes its task.  

  
### Return value
Type: HRESULT
  
Function result 
  
## Remarks  
  
This function is called as a part of the asynchronous function [XGameSaveDeleteContainerAsync](xgamesavedeletecontainerasync.md). This function will retrieve the result for the [XGameSaveDeleteContainerAsync](xgamesavedeletecontainerasync.md) method which will inform to title on the success or failure of the method. Result methods are commonly written in line with the asynchronous call which will call them later, but can also be written as separate functions.  
  
## Requirements  
  
**Header:** XGameSave.h
  
**Library:** xgameruntime.lib  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[XGameSave](../xgamesave_members.md)  
[XGameSaveDeleteContainerAsync](xgamesavedeletecontainerasync.md)  
[Game save errors](../../../../system/overviews/game-save/game-saves-errors.md)