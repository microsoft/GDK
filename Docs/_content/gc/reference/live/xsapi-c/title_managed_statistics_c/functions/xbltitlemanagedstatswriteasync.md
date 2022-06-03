---
author: joannaleecy
title: XblTitleManagedStatsWriteAsync
description: Completely update the calling user's stats. This call wipes out all existing stats (any stats not referenced in the provided array will be removed).
kindex: XblTitleManagedStatsWriteAsync
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblTitleManagedStatsWriteAsync  

Completely update the calling user's stats. This call wipes out all existing stats (any stats not referenced in the provided array will be removed).  

## Syntax  
  
```cpp
HRESULT XblTitleManagedStatsWriteAsync(  
         XblContextHandle xblContextHandle,  
         uint64_t xboxUserId,  
         const XblTitleManagedStatistic* statistics,  
         size_t statisticsCount,  
         XAsyncBlock* async  
)  
```  
  
### Parameters  
  
*xblContextHandle* &nbsp;&nbsp;\_In\_  
Type: [XblContextHandle](../../types_c/handles/xblcontexthandle.md)  
  
Xbox live context for the local user.  
  
*xboxUserId* &nbsp;&nbsp;\_In\_  
Type: uint64_t  
  
User whose stats are being updated (can only be the local user).  
  
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
  
To get the result, call [XAsyncGetStatus](../../../../system/xasync/functions/xasyncgetstatus.md) inside the AsyncBlock callback or after the AsyncBlock is complete. If the call fails for any reason, it is the responsibility of the game to re-submit the request.
  
## Requirements  
  
**Header:** title_managed_statistics_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[title_managed_statistics_c](../title_managed_statistics_c_members.md)  
  
  