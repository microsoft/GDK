---
author: joannaleecy
title: XblAchievementsResultGetNextResult
description: Get XblAchievementsResultHandle from an XblAchievementsResultGetNextAsync call.
kindex: XblAchievementsResultGetNextResult
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# XblAchievementsResultGetNextResult  

Get XblAchievementsResultHandle from an XblAchievementsResultGetNextAsync call.  

## Syntax  
  
```cpp
HRESULT XblAchievementsResultGetNextResult(  
         XAsyncBlock* async,  
         XblAchievementsResultHandle* result  
)  
```  
  
### Parameters  
  
*async* &nbsp;&nbsp;\_In\_  
Type: XAsyncBlock*  
  
The same AsyncBlock that passed to XblAchievementsResultGetNextAsync.  
  
*result* &nbsp;&nbsp;\_Out\_  
Type: [XblAchievementsResultHandle*](../handles/xblachievementsresulthandle.md)  
  
Returns the next achievement result handle. Note that this is a separate handle than the one passed to the XblAchievementsResultGetNextAsync API. Each result handle must be closed separately.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Requirements  
  
**Header:** achievements_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[achievements_c](../achievements_c_members.md)  
  
  