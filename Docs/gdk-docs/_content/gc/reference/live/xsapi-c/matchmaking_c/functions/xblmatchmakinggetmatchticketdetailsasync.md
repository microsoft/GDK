---
author: joannaleecy
title: XblMatchmakingGetMatchTicketDetailsAsync
description: Retrieves the properties of a match ticket from the server.
kindex: XblMatchmakingGetMatchTicketDetailsAsync
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblMatchmakingGetMatchTicketDetailsAsync  

Retrieves the properties of a match ticket from the server.  

## Syntax  
  
```cpp
HRESULT XblMatchmakingGetMatchTicketDetailsAsync(  
         XblContextHandle xboxLiveContext,  
         const char* serviceConfigurationId,  
         const char* hopperName,  
         const char* ticketId,  
         XAsyncBlock* asyncBlock  
)  
```  
  
### Parameters  
  
*xboxLiveContext* &nbsp;&nbsp;\_In\_  
Type: [XblContextHandle](../../types_c/handles/xblcontexthandle.md)  
  
Xbox live context for the local user.  
  
*serviceConfigurationId* &nbsp;&nbsp;\_In\_  
Type: char*  
  
The Service Configuration ID (SCID) for the title. The SCID is considered case sensitive so paste it directly from the Partner Center.  
  
*hopperName* &nbsp;&nbsp;\_In\_  
Type: char*  
  
The name of the hopper where the match ticket is located.  
  
*ticketId* &nbsp;&nbsp;\_In\_  
Type: char*  
  
The ticket id of the match ticket to retrieve.  
  
*asyncBlock* &nbsp;&nbsp;\_In\_  
Type: XAsyncBlock*  
  
The AsyncBlock for this operation.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## REST Call  
  
Calls V103 GET /serviceconfigs/{serviceConfigId}/hoppers/{hopperName}/tickets/{ticketId}
  
## Requirements  
  
**Header:** matchmaking_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[matchmaking_c](../matchmaking_c_members.md)  
  
  