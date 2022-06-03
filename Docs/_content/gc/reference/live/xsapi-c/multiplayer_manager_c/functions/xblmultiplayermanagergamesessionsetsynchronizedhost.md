---
author: joannaleecy
title: XblMultiplayerManagerGameSessionSetSynchronizedHost
description: Sets the host for the game session, using `XblMultiplayerSessionWriteMode::SynchronizedUpdate`.
kindex: XblMultiplayerManagerGameSessionSetSynchronizedHost
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# XblMultiplayerManagerGameSessionSetSynchronizedHost  

Sets the host for the game session, using `XblMultiplayerSessionWriteMode::SynchronizedUpdate`.  

## Syntax  
  
```cpp
HRESULT XblMultiplayerManagerGameSessionSetSynchronizedHost(  
         const char* deviceToken,  
         void* context  
)  
```  
  
### Parameters  
  
*deviceToken* &nbsp;&nbsp;\_In\_  
Type: char*  
  
The device token of the host.  
  
*context* &nbsp;&nbsp;\_In\_opt\_  
Type: void*  
  
Optional. The application-defined data to correlate the [XblMultiplayerEvent](../structs/xblmultiplayerevent.md) to the initiating call.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Remarks  
  
This function sets the host for the game session. Use this function to ensure atomicity and resolve any conflicts between devices trying to set the host at the same time. <br />The service may reject the request to set the host if a race condition occurs due to a conflict. If the request is rejected, the service returns `HTTP_E_STATUS_PRECOND_FAILED`. If a conflict occurs, re-evaluate the need to change the host and, if needed, call this function again to re-submit the request.  <br />The result of this function is delivered as a multiplayer event with an event type set to `XblMultiplayerEventType::SynchronizedHostWriteCompleted`. You can call [XblMultiplayerManagerDoWork](xblmultiplayermanagerdowork.md) to retrieve multiplayer events.  Note that host device tokens are generated from a session member's secure device address, so ensure that the secure device address is set for the desired host prior to calling this method.
  
## Requirements  
  
**Header:** multiplayer_manager_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[multiplayer_manager_c](../multiplayer_manager_c_members.md)  
[XblMultiplayerManagerGameSessionSetSynchronizedProperties](xblmultiplayermanagergamesessionsetsynchronizedproperties.md)  
[XblMultiplayerEvent](../structs/xblmultiplayerevent.md)  
[XblMultiplayerManagerLobbySessionSetLocalMemberConnectionAddress](xblmultiplayermanagerlobbysessionsetlocalmemberconnectionaddress.md)
  
  