---
author: M-Stahl
title: XGameSaveGetRemainingQuotaResult
description: Retrieves the results of the [XGameSaveGetRemainingQuotaAsync](xgamesavegetremainingquotaasync.md) function.
kindex: XGameSaveGetRemainingQuotaResult
ms.author: kelcon
ms.topic: reference
edited: 00/00/0000
quality: good
security: public
applies-to: pc-gdk
---

# XGameSaveGetRemainingQuotaResult  

Retrieves the results of the [XGameSaveGetRemainingQuotaAsync](xgamesavegetremainingquotaasync.md) function.  

## Syntax  
  
```cpp
HRESULT XGameSaveGetRemainingQuotaResult(  
         XAsyncBlock* async,  
         int64_t* remainingQuota  
)  
```  
  
### Parameters  
  
*async* &nbsp;&nbsp;\_In\_  
Type: [XAsyncBlock*](../../xasync/structs/xasyncblock.md)  

  
[XAsyncBlock*](../../xasync/structs/xasyncblock.md) passed from the [XGameSaveGetRemainingQuotaAsync](xgamesavegetremainingquotaasync.md) function.


*remainingQuota* &nbsp;&nbsp;\_Out\_  
Type: int64_t*  

  
Amount of data available to be used as storage.  


  
### Return value
Type: HRESULT
  
Function result.  

May return **E_GS_QUOTA_EXCEEDED** in the event that there is no more room for the application to store data about a user, otherwise will return successfully.
  
## Remarks  
  
Call this function as a part of the callback function for [XGameSaveGetRemainingQuotaAsync](xgamesavegetremainingquotaasync.md). The function allows you to retrieve the results for calling [XGameSaveGetRemainingQuotaAsync](xgamesavegetremainingquotaasync.md), which will include the function result which will help you determine any errors as well as the value of the remaining quota called for. Result methods are commonly written in line with the asynchronous call which will call them later, but can also be written as separate functions.
  
## Requirements  
  
**Header:** XGameSave.h
  
**Library:** xgameruntime.lib  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[XGameSave](../xgamesave_members.md)  
[XGameSaveGetRemainingQuotaAsync](xgamesavegetremainingquotaasync.md)  
[Game save errors](../../../../system/overviews/game-save/game-saves-errors.md)