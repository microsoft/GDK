---
author: M-Stahl
title: XGameSaveInitializeProviderResult
description: Contains the results of a [XGameSaveInitializeProviderAsync](xgamesaveinitializeproviderasync.md) call.
kindex: XGameSaveInitializeProviderResult
ms.author: kelcon
ms.topic: reference
edited: 00/00/0000
quality: good
security: public
applies-to: pc-gdk
---

# XGameSaveInitializeProviderResult  

Contains the results of a [XGameSaveInitializeProviderAsync](xgamesaveinitializeproviderasync.md) call.  

## Syntax  
  
```cpp
HRESULT XGameSaveInitializeProviderResult(  
         XAsyncBlock* async,  
         XGameSaveProviderHandle* provider  
)  
```  
  
### Parameters  
  
*async* &nbsp;&nbsp;\_In\_  
Type: [XAsyncBlock*](../../xasync/structs/xasyncblock.md)  

  
Asyncblock passed from the [XGameSaveInitializeProviderAsync](xgamesaveinitializeproviderasync.md) call. 


*provider* &nbsp;&nbsp;\_Outptr\_result\_nullonfailure\_  
Type: XGameSaveProviderHandle*  

  
the gs_provider_handle_t to be assigned.  


  
### Return value
Type: HRESULT
  
Function result.  
  
## Remarks  
  
This function is called as a part of the AsyncBlock call function of [XGameSaveInitializeProviderAsync](xgamesaveinitializeproviderasync.md). This function will be used to get the results of [XGameSaveInitializeProviderAsync](xgamesaveinitializeproviderasync.md) and will return the **XGameSaveProviderHandle** created by the call. Result methods are commonly written in line with the asynchronous call which will call them later, but can also be written as separate functions.
  
## Requirements  
  
**Header:** XGameSave.h
  
**Library:** xgameruntime.lib  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[XGameSave](../xgamesave_members.md)  
[XGameSaveInitializeProviderAsync](xgamesaveinitializeproviderasync.md)  
[Game save errors](../../../../system/overviews/game-save/game-saves-errors.md)