---
author: joannaleecy
title: XblTitleManagedStatsDeleteStatsAsync
description: Delete stats for the calling user (any stats not referenced will remain unchanged).
kindex: XblTitleManagedStatsDeleteStatsAsync
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblTitleManagedStatsDeleteStatsAsync  

Delete stats for the calling user (any stats not referenced will remain unchanged).  

## Syntax  
  
```cpp
HRESULT XblTitleManagedStatsDeleteStatsAsync(  
         XblContextHandle xblContextHandle,  
         const char** statisticNames,  
         size_t statisticNamesCount,  
         XAsyncBlock* async  
)  
```  
  
### Parameters  
  
*xblContextHandle* &nbsp;&nbsp;\_In\_  
Type: [XblContextHandle](../../types_c/handles/xblcontexthandle.md)  
  
Xbox live context for the local user.  
  
*statisticNames* &nbsp;&nbsp;\_In\_  
Type: char**  
  
A list of names of statistics to delete. If there isn't an existing statistic matching a provided name, no changes will be made for that statistic.  
  
*statisticNamesCount* &nbsp;&nbsp;\_In\_  
Type: size_t  
  
Number of items in the statisticNames array.  
  
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
  
  