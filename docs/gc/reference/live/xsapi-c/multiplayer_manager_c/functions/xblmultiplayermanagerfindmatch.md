---
author: joannaleecy
title: XblMultiplayerManagerFindMatch
description: Submits a matchmaking request to the server.
kindex: XblMultiplayerManagerFindMatch
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# XblMultiplayerManagerFindMatch  

Submits a matchmaking request to the server.  

## Syntax  
  
```cpp
HRESULT XblMultiplayerManagerFindMatch(  
         const char* hopperName,  
         const char* attributesJson,  
         uint32_t timeoutInSeconds  
)  
```  
  
### Parameters  
  
*hopperName* &nbsp;&nbsp;\_In\_z\_  
Type: char*  
  
The name of the hopper for this request.  
  
*attributesJson* &nbsp;&nbsp;\_In\_opt\_z\_  
Type: char*  
  
Optional. The attributes of the match ticket for this request, as a JSON string.  
  
*timeoutInSeconds* &nbsp;&nbsp;\_In\_  
Type: uint32_t  
  
The maximum time, in seconds, to wait for users to join the match.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Remarks  
  
This function submits a matchmaking request for the lobby session to Multiplayer Manager (MPM). Before you can use this function, you must first configure hoppers in the service configuration for your title. A hopper defines the rules that SmartMatch uses to match players. For more information about hoppers, see [Matchmaking overview](../../../../../live/features/multiplayer/matchmaking/live-matchmaking-overview.md). If a lobby session doesn't exist, likely because [XblMultiplayerManagerInitialize](xblmultiplayermanagerinitialize.md) wasn't called, or if local users weren't added to the lobby session before calling this function, an error occurs. An error also occurs if matchmaking is already in progress. <br />The result of this function is delivered as a multiplayer event with an event type set to `XblMultiplayerEventType::FindMatchCompleted`. You can call [XblMultiplayerManagerDoWork](xblmultiplayermanagerdowork.md) to retrieve multiplayer events.
  
## Requirements  
  
**Header:** multiplayer_manager_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[multiplayer_manager_c](../multiplayer_manager_c_members.md)  
[XblMultiplayerManagerEstimatedMatchWaitTime](xblmultiplayermanagerestimatedmatchwaittime.md)
  
  