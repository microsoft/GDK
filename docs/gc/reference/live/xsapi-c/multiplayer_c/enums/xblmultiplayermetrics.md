---
author: joannaleecy
title: XblMultiplayerMetrics
description: Defines values that indicate the type of metric used to measure matchmaking Quality of Service (QoS) for a session.
kindex: XblMultiplayerMetrics
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
quality: good
applies-to: pc-gdk
---

# XblMultiplayerMetrics  

Defines values that indicate the type of metric used to measure matchmaking Quality of Service (QoS) for a session.    

## Syntax  
  
```cpp
enum class XblMultiplayerMetrics  : uint32_t  
{  
    Unknown,  
    BandwidthUp,  
    BandwidthDown,  
    Bandwidth,  
    Latency  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| Unknown | Unknown. |  
| BandwidthUp | Upstream (peer-to-host) bandwidth. |  
| BandwidthDown | Downstream (host-to-peer) bandwidth. |  
| Bandwidth | Combined bandwidth. |  
| Latency | Upstream (peer-to-host) latency. |  
  
## Remarks  
  
For more information, see [Target session initialization and QoS](../../../../../live/features/multiplayer/matchmaking/concepts/live-matchmaking-target-session.md).
  
## Member of
  
[XblMultiplayerPeerToHostRequirements](../structs/xblmultiplayerpeertohostrequirements.md)
  
## Requirements  
  
**Header:** multiplayer_c.h
  
## See also  
[multiplayer_c](../multiplayer_c_members.md)  
  
  