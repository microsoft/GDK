---
author: joannaleecy
title: XblMultiplayerEventArgsPerformQoSMeasurements
description: Retrieves additional information for `XblMultiplayerEventType::PerformQosMeasurements` events.
kindex: XblMultiplayerEventArgsPerformQoSMeasurements
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# XblMultiplayerEventArgsPerformQoSMeasurements  

Retrieves additional information for `XblMultiplayerEventType::PerformQosMeasurements` events.  

## Syntax  
  
```cpp
HRESULT XblMultiplayerEventArgsPerformQoSMeasurements(  
         XblMultiplayerEventArgsHandle argsHandle,  
         XblMultiplayerPerformQoSMeasurementsArgs* performQoSMeasurementsArgs  
)  
```  
  
### Parameters  
  
*argsHandle* &nbsp;&nbsp;\_In\_  
Type: [XblMultiplayerEventArgsHandle](../handles/xblmultiplayereventargshandle.md)  
  
The event arguments handle for the multiplayer event.  
  
*performQoSMeasurementsArgs* &nbsp;&nbsp;\_Out\_  
Type: [XblMultiplayerPerformQoSMeasurementsArgs*](../structs/xblmultiplayerperformqosmeasurementsargs.md)  
  
A caller-allocated structure that passes back the remote clients for which QoS information is needed.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Remarks  
  
Call this function to get more information about multiplayer events returned by [XblMultiplayerManagerDoWork](xblmultiplayermanagerdowork.md) for which the `EventType` member of the [XblMultiplayerEvent](../structs/xblmultiplayerevent.md) for a multiplayer event is set to `XblMultiplayerEventType::PerformQosMeasurements`. <br />The event arguments handle for a multiplayer event can be retrieved from the `EventArgsHandle` member of the [XblMultiplayerEvent](../structs/xblmultiplayerevent.md) structure for that multiplayer event.  <br />For more information about multiplayer events, see [Multiplayer Manager API overview](../../../../../live/features/multiplayer/mpm/concepts/live-multiplayer-manager-api-overview.md).
  
## Requirements  
  
**Header:** multiplayer_manager_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[multiplayer_manager_c](../multiplayer_manager_c_members.md)  
[XblMultiplayerEventArgsFindMatchCompleted](xblmultiplayereventargsfindmatchcompleted.md)  
[XblMultiplayerEventArgsMember](xblmultiplayereventargsmember.md)  
[XblMultiplayerEventArgsMembers](xblmultiplayereventargsmembers.md)  
[XblMultiplayerEventArgsMembersCount](xblmultiplayereventargsmemberscount.md)  
[XblMultiplayerEventArgsPropertiesJson](xblmultiplayereventargspropertiesjson.md)  
[XblMultiplayerEventArgsXuid](xblmultiplayereventargsxuid.md)  
[XblMultiplayerEventType](../enums/xblmultiplayereventtype.md)
  
  