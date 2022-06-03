---
author: joannaleecy
title: XblMultiplayerEventArgsFindMatchCompleted
description: Retrieves additional information for `XblMultiplayerEventType.FindMatchCompleted` multiplayer events.
kindex: XblMultiplayerEventArgsFindMatchCompleted
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# XblMultiplayerEventArgsFindMatchCompleted  

Retrieves additional information for `XblMultiplayerEventType.FindMatchCompleted` multiplayer events.  

## Syntax  
  
```cpp
HRESULT XblMultiplayerEventArgsFindMatchCompleted(  
         XblMultiplayerEventArgsHandle argsHandle,  
         XblMultiplayerMatchStatus* matchStatus,  
         XblMultiplayerMeasurementFailure* initializationFailureCause  
)  
```  
  
### Parameters  
  
*argsHandle* &nbsp;&nbsp;\_In\_  
Type: [XblMultiplayerEventArgsHandle](../handles/xblmultiplayereventargshandle.md)  
  
The event arguments handle for the multiplayer event.  
  
*matchStatus* &nbsp;&nbsp;\_Out\_opt\_  
Type: [XblMultiplayerMatchStatus*](../enums/xblmultiplayermatchstatus.md)  
  
A caller-allocated structure that describes the current matchmaking status.  
  
*initializationFailureCause* &nbsp;&nbsp;\_Out\_opt\_  
Type: [XblMultiplayerMeasurementFailure*](../../multiplayer_c/enums/xblmultiplayermeasurementfailure.md)  
  
A caller-allocated structure that passes back the cause of why the initialization failed, or `XblMultiplayerMeasurementFailure::None` if there was no failure. This value is set when transitioning out of the `XblMultiplayerMatchStatus::Joining` or `XblMultiplayerMatchStatus::Measuring` initialization stages, if this member doesn't pass the initializaton stage.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Remarks  
  
Call this function to get more information about multiplayer events returned by [xblMultiplayerManagerDoWork](xblmultiplayermanagerdowork.md) for which the `EventType` member of the [XblMultiplayerEvent](../structs/xblmultiplayerevent.md) for a multiplayer event is set to `XblMultiplayerEventType.FindMatchCompleted`. <br />The event arguments handle for a multiplayer event can be retrieved from the `EventArgsHandle` member of the [XblMultiplayerEvent](../structs/xblmultiplayerevent.md) structure for that multiplayer event.  <br />For more information about multiplayer events, see [Multiplayer Manager API overview](../../../../../live/features/multiplayer/mpm/concepts/live-multiplayer-manager-api-overview.md).
  
## Requirements  
  
**Header:** multiplayer_manager_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[multiplayer_manager_c](../multiplayer_manager_c_members.md)  
[XblMultiplayerEventArgsMember](xblmultiplayereventargsmember.md)  
[XblMultiplayerEventArgsMembers](xblmultiplayereventargsmembers.md)  
[XblMultiplayerEventArgsMembersCount](xblmultiplayereventargsmemberscount.md)  
[XblMultiplayerEventArgsPerformQosMeasurements](xblmultiplayereventargsperformqosmeasurements.md)  
[XblMultiplayerEventArgsPropertiesJson](xblmultiplayereventargspropertiesjson.md)  
[XblMultiplayerEventArgsXuid](xblmultiplayereventargsxuid.md)  
[XblMultiplayerEventType](../enums/xblmultiplayereventtype.md)
  
  