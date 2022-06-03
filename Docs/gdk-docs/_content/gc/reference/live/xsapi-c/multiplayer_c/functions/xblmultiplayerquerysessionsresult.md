---
author: joannaleecy
title: XblMultiplayerQuerySessionsResult
description: Gets the results of a session query.
kindex: XblMultiplayerQuerySessionsResult
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# XblMultiplayerQuerySessionsResult  

Gets the results of a session query.  

## Syntax  
  
```cpp
HRESULT XblMultiplayerQuerySessionsResult(  
         XAsyncBlock* async,  
         size_t sessionCount,  
         XblMultiplayerSessionQueryResult* sessions  
)  
```  
  
### Parameters  
  
*async* &nbsp;&nbsp;\_In\_  
Type: XAsyncBlock*  
  
The AsyncBlock for this operation.  
  
*sessionCount* &nbsp;&nbsp;\_In\_  
Type: size_t  
  
The number of sessions that matched the query. Use [XblMultiplayerQuerySessionsResultCount](xblmultiplayerquerysessionsresultcount.md) to get the count required.  
  
*sessions* &nbsp;&nbsp;\_Out\_writes\_(sessionCount)  
Type: [XblMultiplayerSessionQueryResult*](../structs/xblmultiplayersessionqueryresult.md)  
  
A caller allocated array to pass back the session query results.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Requirements  
  
**Header:** multiplayer_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[multiplayer_c](../multiplayer_c_members.md)  
  
  