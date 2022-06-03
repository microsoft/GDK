---
author: joannaleecy
title: XblMultiplayerEventArgsMembers
description: Retrieves additional information for `XblMultiplayerEventType::MemberJoined` and `XblMultiplayerEventType::MemberLeft` events.
kindex: XblMultiplayerEventArgsMembers
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# XblMultiplayerEventArgsMembers  

Retrieves additional information for `XblMultiplayerEventType::MemberJoined` and `XblMultiplayerEventType::MemberLeft` events.  

## Syntax  
  
```cpp
HRESULT XblMultiplayerEventArgsMembers(  
         XblMultiplayerEventArgsHandle argsHandle,  
         size_t membersCount,  
         XblMultiplayerManagerMember* members  
)  
```  
  
### Parameters  
  
*argsHandle* &nbsp;&nbsp;\_In\_  
Type: [XblMultiplayerEventArgsHandle](../handles/xblmultiplayereventargshandle.md)  
  
The event arguments handle for the multiplayer event.  
  
*membersCount* &nbsp;&nbsp;\_In\_  
Type: size_t  
  
The size of the `members` array.  
  
*members* &nbsp;&nbsp;\_Out\_writes\_(membersCount)  
Type: [XblMultiplayerManagerMember*](../structs/xblmultiplayermanagermember.md)  
  
A caller-allocated array that passes back a list of members, depending on the multiplayer event: <br />`XblMultiplayerEventType::MemberJoined` - A list of members that joined the game.  <br />`XblMultiplayerEventType::MemberLeft` - A list of members that left the game.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Remarks  
  
Call the [XblMultiplayerEventArgsMembersCount](xblmultiplayereventargsmemberscount.md) function before you call this function, to return the size of the array you must allocate for the `members` parameter of this function. <br />The event arguments handle for a multiplayer event can be retrieved from the `EventArgsHandle` member of the [XblMultiplayerEvent](../structs/xblmultiplayerevent.md) structure for that multiplayer event.  <br />For more information about multiplayer events, see [Multiplayer Manager API overview](../../../../../live/features/multiplayer/mpm/concepts/live-multiplayer-manager-api-overview.md).
  
## Requirements  
  
**Header:** multiplayer_manager_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[multiplayer_manager_c](../multiplayer_manager_c_members.md)  
[XblMultiplayerEventArgsFindMatchCompleted](xblmultiplayereventargsfindmatchcompleted.md)  
[XblMultiplayerEventArgsMember](xblmultiplayereventargsmember.md)  
[XblMultiplayerEventArgsMembersCount](xblmultiplayereventargsmemberscount.md)  
[XblMultiplayerEventArgsPerformQosMeasurements](xblmultiplayereventargsperformqosmeasurements.md)  
[XblMultiplayerEventArgsPropertiesJson](xblmultiplayereventargspropertiesjson.md)  
[XblMultiplayerEventArgsXuid](xblmultiplayereventargsxuid.md)  
[XblMultiplayerEventType](../enums/xblmultiplayereventtype.md)
  
  