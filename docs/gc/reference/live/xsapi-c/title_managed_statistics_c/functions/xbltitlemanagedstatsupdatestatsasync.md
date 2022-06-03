---
author: joannaleecy
title: XblTitleManagedStatsUpdateStatsAsync
description: Partially update the calling user's stats. Stats will only be overwritten if they already exist (any stats not referenced will remain unchanged).
kindex: XblTitleManagedStatsUpdateStatsAsync
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblTitleManagedStatsUpdateStatsAsync  

Partially update the calling user's stats. Stats will only be overwritten if they already exist (any stats not referenced will remain unchanged).  

## Syntax  
  
```cpp
HRESULT XblTitleManagedStatsUpdateStatsAsync(  
         XblContextHandle xblContextHandle,  
         const XblTitleManagedStatistic* statistics,  
         size_t statisticsCount,  
         XAsyncBlock* async  
)  
```  
  
### Parameters  
  
*xblContextHandle* &nbsp;&nbsp;\_In\_  
Type: [XblContextHandle](../../types_c/handles/xblcontexthandle.md)  
  
Xbox live context for the local user.  
  
*statistics* &nbsp;&nbsp;\_In\_  
Type: [XblTitleManagedStatistic*](../structs/xbltitlemanagedstatistic.md)  
  
A list of XblTitleManagedStatistic to submit.  
  
*statisticsCount* &nbsp;&nbsp;\_In\_  
Type: size_t  
  
Number of items in the statistics array.  
  
*async* &nbsp;&nbsp;\_In\_  
Type: XAsyncBlock*  
  
Used for async call.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Remarks  
  
Note that stat names are case insensitive. To get the result, call [XAsyncGetStatus](../../../../system/xasync/functions/xasyncgetstatus.md) inside the AsyncBlock callback or after the AsyncBlock is complete. If the call fails for any reason, it is the responsibility of the game to re-submit the request.
  
## Requirements  
  
**Header:** title_managed_statistics_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[title_managed_statistics_c](../title_managed_statistics_c_members.md)  
  
  