---
author: joannaleecy
title: XblMultiplayerPeerToHostRequirements
description: Represents requirements for each connection between a host candidate and session members.
kindex: XblMultiplayerPeerToHostRequirements
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
quality: good
applies-to: pc-gdk
---

# XblMultiplayerPeerToHostRequirements  

Represents requirements for each connection between a host candidate and session members.  

## Syntax  
  
```cpp
typedef struct XblMultiplayerPeerToHostRequirements {  
    uint64_t LatencyMaximum;  
    uint64_t BandwidthDownMinimumInKbps;  
    uint64_t BandwidthUpMinimumInKbps;  
    XblMultiplayerMetrics HostSelectionMetric;  
} XblMultiplayerPeerToHostRequirements  
```
  
### Members  
  
*LatencyMaximum*  
Type: uint64_t  
  
The maximum latency, in milliseconds, of the upstream (peer-to-host) connection.
  
*BandwidthDownMinimumInKbps*  
Type: uint64_t  
  
The minimum bandwidth, in kilobits per second, of the downstream (host-to-peer) connection.
  
*BandwidthUpMinimumInKbps*  
Type: uint64_t  
  
The minimum bandwidth, in kilobits per second, of the upstream (peer-to-host) connection.
  
*HostSelectionMetric*  
Type: [XblMultiplayerMetrics](../enums/xblmultiplayermetrics.md)  
  
The metric used to select the host.
  
## Remarks  
  
For more information, see [Target session initialization and QoS](../../../../../live/features/multiplayer/matchmaking/concepts/live-matchmaking-target-session.md).
  
## Member of
  
[XblMultiplayerSessionConstants](xblmultiplayersessionconstants.md)
  
## Argument of
  
[XblMultiplayerSessionConstantsSetPeerToHostRequirements](../functions/xblmultiplayersessionconstantssetpeertohostrequirements.md)
  
## Requirements  
  
**Header:** multiplayer_c.h
  
## See also  
[multiplayer_c](../multiplayer_c_members.md)  
  
  