---
author: joannaleecy
title: XblMultiplayerEventArgsXuid
description: Retrieves additional information for `XblMultiplayerEventType::UserAdded`, `XblMultiplayerEventType::UserRemoved`, and `XblMultiplayerEventType::JoinLobbyCompleted` events.
kindex: XblMultiplayerEventArgsXuid
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# XblMultiplayerEventArgsXuid  

Retrieves additional information for `XblMultiplayerEventType::UserAdded`, `XblMultiplayerEventType::UserRemoved`, and `XblMultiplayerEventType::JoinLobbyCompleted` events.  

## Syntax  
  
```cpp
HRESULT XblMultiplayerEventArgsXuid(  
         XblMultiplayerEventArgsHandle argsHandle,  
         uint64_t* xuid  
)  
```  
  
### Parameters  
  
*argsHandle* &nbsp;&nbsp;\_In\_  
Type: [XblMultiplayerEventArgsHandle](../handles/xblmultiplayereventargshandle.md)  
  
The event arguments handle for the multiplayer event.  
  
*xuid* &nbsp;&nbsp;\_Out\_  
Type: uint64_t*  
  
The applicable Xbox User ID, depending on the multiplayer event: <br />`XblMultiplayerEventType::UserAdded` - The Xbox User ID of the member that was added.  <br />`XblMultiplayerEventType::UserRemoved` - The Xbox User ID of the member that was removed.  <br />`XblMultiplayerEventType::JoinLobbyCompleted` - The Xbox User ID of the member that was invited.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Remarks  
  
Call this function to get more information about multiplayer events returned by [xblMultiplayerManagerDoWork](xblmultiplayermanagerdowork.md) for which the `EventType` member of the [XblMultiplayerEvent](../structs/xblmultiplayerevent.md) for a multiplayer event is set to either `XblMultiplayerEventType::UserAdded`, `XblMultiplayerEventType::UserRemoved`, or `XblMultiplayerEventType::JoinLobbyCompleted`. <br />The event arguments handle for a multiplayer event can be retrieved from the `EventArgsHandle` member of the [XblMultiplayerEvent](../structs/xblmultiplayerevent.md) structure for that multiplayer event.  <br />For more information about multiplayer events, see [Multiplayer Manager API overview](../../../../../live/features/multiplayer/mpm/concepts/live-multiplayer-manager-api-overview.md).
  
## Requirements  
  
**Header:** multiplayer_manager_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[multiplayer_manager_c](../multiplayer_manager_c_members.md)  
[XblMultiplayerEventArgsFindMatchCompleted](xblmultiplayereventargsfindmatchcompleted.md)  
[XblMultiplayerEventArgsMember](xblmultiplayereventargsmember.md)  
[XblMultiplayerEventArgsMembers](xblmultiplayereventargsmembers.md)  
[XblMultiplayerEventArgsMembersCount](xblmultiplayereventargsmemberscount.md)  
[XblMultiplayerEventArgsPerformQosMeasurements](xblmultiplayereventargsperformqosmeasurements.md)  
[XblMultiplayerEventArgsPropertiesJson](xblmultiplayereventargspropertiesjson.md)  
[XblMultiplayerEventType](../enums/xblmultiplayereventtype.md)
  
  