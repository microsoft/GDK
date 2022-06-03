---
author: joannaleecy
title: XblMultiplayerEventArgsMembersCount
description: Retrieves additional information for `XblMultiplayerEventType::MemberJoined` and `XblMultiplayerEventType::MemberLeft` events.
kindex: XblMultiplayerEventArgsMembersCount
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# XblMultiplayerEventArgsMembersCount  

Retrieves additional information for `XblMultiplayerEventType::MemberJoined` and `XblMultiplayerEventType::MemberLeft` events.  

## Syntax  
  
```cpp
HRESULT XblMultiplayerEventArgsMembersCount(  
         XblMultiplayerEventArgsHandle argsHandle,  
         size_t* memberCount  
)  
```  
  
### Parameters  
  
*argsHandle* &nbsp;&nbsp;\_In\_  
Type: [XblMultiplayerEventArgsHandle](../handles/xblmultiplayereventargshandle.md)  
  
The event arguments handle for the multiplayer event.  
  
*memberCount* &nbsp;&nbsp;\_Out\_  
Type: size_t*  
  
The size of the `members` caller-allocated array for [XblMultiplayerEventArgsMembers](xblmultiplayereventargsmembers.md).  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Remarks  
  
Call this function before you call the [XblMultiplayerEventArgsMembers](xblmultiplayereventargsmembers.md) function, to return the size of the array you must allocate for the `members` parameter of the [XblMultiplayerEventArgsMembers](xblmultiplayereventargsmembers.md) function. <br />The event arguments handle for a multiplayer event can be retrieved from the `EventArgsHandle` member of the [XblMultiplayerEvent](../structs/xblmultiplayerevent.md) structure for that multiplayer event.  <br />For more information about multiplayer events, see [Multiplayer Manager API overview](../../../../../live/features/multiplayer/mpm/concepts/live-multiplayer-manager-api-overview.md).
  
## Requirements  
  
**Header:** multiplayer_manager_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[multiplayer_manager_c](../multiplayer_manager_c_members.md)  
[XblMultiplayerEventArgsFindMatchCompleted](xblmultiplayereventargsfindmatchcompleted.md)  
[XblMultiplayerEventArgsMember](xblmultiplayereventargsmember.md)  
[XblMultiplayerEventArgsMembers](xblmultiplayereventargsmembers.md)  
[XblMultiplayerEventArgsPerformQosMeasurements](xblmultiplayereventargsperformqosmeasurements.md)  
[XblMultiplayerEventArgsPropertiesJson](xblmultiplayereventargspropertiesjson.md)  
[XblMultiplayerEventArgsXuid](xblmultiplayereventargsxuid.md)  
[XblMultiplayerEventType](../enums/xblmultiplayereventtype.md)
  
  