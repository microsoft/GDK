---
author: joannaleecy
title: XblAchievementsResultGetNextAsync
description: Gets the result of next page of achievements for a player of the specified title.
kindex: XblAchievementsResultGetNextAsync
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblAchievementsResultGetNextAsync  

Gets the result of next page of achievements for a player of the specified title.  

## Syntax  
  
```cpp
HRESULT XblAchievementsResultGetNextAsync(  
         XblAchievementsResultHandle resultHandle,  
         uint32_t maxItems,  
         XAsyncBlock* async  
)  
```  
  
### Parameters  
  
*resultHandle* &nbsp;&nbsp;\_In\_  
Type: [XblAchievementsResultHandle](../handles/xblachievementsresulthandle.md)  
  
Handle to the achievement result.  
  
*maxItems* &nbsp;&nbsp;\_In\_  
Type: uint32_t  
  
The maximum number of items that the result can contain. Pass 0 to attempt to retrieve all items.  
  
*async* &nbsp;&nbsp;\_In\_  
Type: XAsyncBlock*  
  
Caller allocated AsyncBlock.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Remarks  
  
To get the result, call [XblAchievementsResultGetNextResult](xblachievementsresultgetnextresult.md) inside the AsyncBlock callback or after the AsyncBlock is complete.
  
## REST Call  
  
V2 GET /users/xuid({xuid})/achievements
  
## Requirements  
  
**Header:** achievements_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[achievements_c](../achievements_c_members.md)  
  
  