---
author: joannaleecy
title: XblMatchmakingCreateMatchTicketAsync
description: Sends a matchmaking request to the server and returns the match ticket with a ticket id. Call XblMatchmakingCreateMatchTicketResult upon completion to get the result.
kindex: XblMatchmakingCreateMatchTicketAsync
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblMatchmakingCreateMatchTicketAsync  

Sends a matchmaking request to the server and returns the match ticket with a ticket id. Call XblMatchmakingCreateMatchTicketResult upon completion to get the result.  

## Syntax  
  
```cpp
HRESULT XblMatchmakingCreateMatchTicketAsync(  
         XblContextHandle xboxLiveContext,  
         XblMultiplayerSessionReference ticketSessionReference,  
         const char* matchmakingServiceConfigurationId,  
         const char* hopperName,  
         const uint64_t ticketTimeout,  
         XblPreserveSessionMode preserveSession,  
         const char* ticketAttributesJson,  
         XAsyncBlock* asyncBlock  
)  
```  
  
### Parameters  
  
*xboxLiveContext* &nbsp;&nbsp;\_In\_  
Type: [XblContextHandle](../../types_c/handles/xblcontexthandle.md)  
  
Xbox live context for the local user.  
  
*ticketSessionReference* &nbsp;&nbsp;\_In\_  
Type: [XblMultiplayerSessionReference](../../multiplayer_c/structs/xblmultiplayersessionreference.md)  
  
The multiplayer session to use for the match.  
  
*matchmakingServiceConfigurationId* &nbsp;&nbsp;\_In\_  
Type: char*  
  
The service configuration ID for the match.  
  
*hopperName* &nbsp;&nbsp;\_In\_  
Type: char*  
  
The name of the hopper.  
  
*ticketTimeout* &nbsp;&nbsp;\_In\_  
Type: uint64_t  
  
The maximum time to wait for players to join the session.  
  
*preserveSession* &nbsp;&nbsp;\_In\_  
Type: [XblPreserveSessionMode](../enums/xblpreservesessionmode.md)  
  
Indicates if the session should be preserved.  
  
*ticketAttributesJson* &nbsp;&nbsp;\_In\_  
Type: char*  
  
The ticket attributes for the session. (Optional)  
  
*asyncBlock* &nbsp;&nbsp;\_In\_  
Type: XAsyncBlock*  
  
The AsyncBlock for this operation.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Remarks  
  
The match ticket object contains server returned information such as ticket id and wait time, and also contains copies of the title specified data from the ticket data object.
  
## REST Call  
  
Calls V103 POST /serviceconfigs/{serviceConfigId}/hoppers/{hopperName}
  
## Requirements  
  
**Header:** matchmaking_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[matchmaking_c](../matchmaking_c_members.md)  
  
  