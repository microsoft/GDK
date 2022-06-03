---
author: joannaleecy
title: XblMultiplayerMeasurementFailure
description: Defines values that indicate why Quality of Service (QoS) measurement failed during session initialization.
kindex: XblMultiplayerMeasurementFailure
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
quality: good
applies-to: pc-gdk
---

# XblMultiplayerMeasurementFailure  

Defines values that indicate why Quality of Service (QoS) measurement failed during session initialization.    

## Syntax  
  
```cpp
enum class XblMultiplayerMeasurementFailure  : uint32_t  
{  
    Unknown,  
    None,  
    Timeout,  
    Latency,  
    BandwidthUp,  
    BandwidthDown,  
    Group,  
    Network,  
    Episode  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| Unknown | Unknown measurement failure. |  
| None | No measurement failure. |  
| Timeout | Measurement timed out. |  
| Latency | Measurement of latency failed. |  
| BandwidthUp | Measurement of upstream (peer-to-host) bandwidth failed. |  
| BandwidthDown | Measurement of downstream (host-to-peer) bandwidth failed. |  
| Group | Measurement failed for this player failed because measurement failed for another player in the group. |  
| Network | Measurement failed due to a network error; for example, the player was unreachable. |  
| Episode | Measurement failed because the initialization episode failed. This likely happened because not enough users were in the session. |  
  
## Remarks  
  
For more information, see [Target session initialization and QoS](../../../../../live/features/multiplayer/matchmaking/concepts/live-matchmaking-target-session.md).
  
## Member of
  
[XblMultiplayerSessionMember](../structs/xblmultiplayersessionmember.md)
  
## Argument of
  
[XblMultiplayerEventArgsFindMatchCompleted](../../multiplayer_manager_c/functions/xblmultiplayereventargsfindmatchcompleted.md)
  
## Requirements  
  
**Header:** multiplayer_c.h
  
## See also  
[multiplayer_c](../multiplayer_c_members.md)  
  
  