---
author: joannaleecy
title: XblMultiplayerEventArgsMember
description: Retrieves additional information for `XblMultiplayerEventType::HostChanged` and `XblMultiplayerEventType::MemberPropertyChanged` events.
kindex: XblMultiplayerEventArgsMember
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# XblMultiplayerEventArgsMember  

Retrieves additional information for `XblMultiplayerEventType::HostChanged` and `XblMultiplayerEventType::MemberPropertyChanged` events.  

## Syntax  
  
```cpp
HRESULT XblMultiplayerEventArgsMember(  
         XblMultiplayerEventArgsHandle argsHandle,  
         XblMultiplayerManagerMember* member  
)  
```  
  
### Parameters  
  
*argsHandle* &nbsp;&nbsp;\_In\_  
Type: [XblMultiplayerEventArgsHandle](../handles/xblmultiplayereventargshandle.md)  
  
The event arguments handle for the multiplayer event.  
  
*member* &nbsp;&nbsp;\_Out\_  
Type: [XblMultiplayerManagerMember*](../structs/xblmultiplayermanagermember.md)  
  
The applicable member, depending on the multiplayer event: <br />`XblMultiplayerEventType::HostChanged` - The new host member. If an existing host leaves, there is no new host member to return in this parameter. In this case, this function returns `HRESULT_FROM_WIN32(ERROR_RESOURCE_DATA_NOT_FOUND)`.  <br />`XblMultiplayerEventType::MemberPropertyChanged` - The member whose property changed.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Remarks  
  
Call this function to get more information about multiplayer events returned by [xblMultiplayerManagerDoWork](xblmultiplayermanagerdowork.md) for which the `EventType` member of the [XblMultiplayerEvent](../structs/xblmultiplayerevent.md) for a multiplayer event is set to either `XblMultiplayerEventType::HostChanged` or `XblMultiplayerEventType::MemberPropertyChanged`. <br />The event arguments handle for a multiplayer event can be retrieved from the `EventArgsHandle` member of the [XblMultiplayerEvent](../structs/xblmultiplayerevent.md) structure for that multiplayer event.  <br />For more information about multiplayer events, see [Multiplayer Manager API overview](../../../../../live/features/multiplayer/mpm/concepts/live-multiplayer-manager-api-overview.md).
  
## Requirements  
  
**Header:** multiplayer_manager_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[multiplayer_manager_c](../multiplayer_manager_c_members.md)  
[XblMultiplayerEventArgsFindMatchCompleted](xblmultiplayereventargsfindmatchcompleted.md)  
[XblMultiplayerEventArgsMembers](xblmultiplayereventargsmembers.md)  
[XblMultiplayerEventArgsMembersCount](xblmultiplayereventargsmemberscount.md)  
[XblMultiplayerEventArgsPerformQosMeasurements](xblmultiplayereventargsperformqosmeasurements.md)  
[XblMultiplayerEventArgsPropertiesJson](xblmultiplayereventargspropertiesjson.md)  
[XblMultiplayerEventArgsXuid](xblmultiplayereventargsxuid.md)  
[XblMultiplayerEventType](../enums/xblmultiplayereventtype.md)
  
  