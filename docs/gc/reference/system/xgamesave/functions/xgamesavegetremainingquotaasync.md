---
author: M-Stahl
title: XGameSaveGetRemainingQuotaAsync
description: Returns the amount of data available to store using the XGameSave api asynchronously.
kindex: XGameSaveGetRemainingQuotaAsync
ms.author: kelcon
ms.topic: reference
edited: 07/02/2019
quality: good
security: public
applies-to: pc-gdk
---

# XGameSaveGetRemainingQuotaAsync  

Returns the amount of data available to store using the XGameSave api asynchronously.  

## Syntax  
  
```cpp
HRESULT XGameSaveGetRemainingQuotaAsync(  
         XGameSaveProviderHandle provider,  
         XAsyncBlock* async  
)  
```  
  
### Parameters  
  
*provider* &nbsp;&nbsp;\_In\_  
Type: XGameSaveProviderHandle  

  
Handle to the XGameSaveProvider to query remaining data for.  


*async* &nbsp;&nbsp;\_In\_  
Type: [XAsyncBlock*](../../xasync/structs/xasyncblock.md)  

  
AsyncBlock containing the calling context and the callback function.


  
### Return value
Type: HRESULT
  
Function result.  
  
## Remarks  
  
Result and remaining quota are retrieved from the [XGameSaveGetRemainingQuotaResult](xgamesavegetremainingquotaresult.md) function. 

Each application has a quota on how much data they can save for a user, if this is exceeded any attempts to save more data may fail with **E_GS_QUOTA_EXCEEDED**. As this is not a fixed size we have exposed access to the remaining quota so the application can try to avoid **E_GS_QUOTA_EXCEEDED** failures. To give an accurate view we always make sure that any outstanding writes, updates or deletes are handled first before returning since any of these can change the remaining quota.  
  
## Requirements  
  
**Header:** XGameSave.h
  
**Library:** xgameruntime.lib  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[XGameSave](../xgamesave_members.md)  
[XGameSaveGetRemainingQuotaResult](xgamesavegetremainingquotaresult.md)  
[Game save errors](../../../../system/overviews/game-save/game-saves-errors.md)