---
author: joannaleecy
title: XblMatchmakingGetMatchTicketDetailsResultSize
description: Get the result size for an XblMatchmakingGetMatchTicketDetailsAsync call.
kindex: XblMatchmakingGetMatchTicketDetailsResultSize
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblMatchmakingGetMatchTicketDetailsResultSize  

Get the result size for an XblMatchmakingGetMatchTicketDetailsAsync call.  

## Syntax  
  
```cpp
HRESULT XblMatchmakingGetMatchTicketDetailsResultSize(  
         XAsyncBlock* asyncBlock,  
         size_t* resultSizeInBytes  
)  
```  
  
### Parameters  
  
*asyncBlock* &nbsp;&nbsp;\_In\_  
Type: XAsyncBlock*  
  
The AsyncBlock for this operation.  
  
*resultSizeInBytes* &nbsp;&nbsp;\_Out\_  
Type: size_t*  
  
The size in bytes required to store the Create Match Ticket result.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Requirements  
  
**Header:** matchmaking_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[matchmaking_c](../matchmaking_c_members.md)  
  
  