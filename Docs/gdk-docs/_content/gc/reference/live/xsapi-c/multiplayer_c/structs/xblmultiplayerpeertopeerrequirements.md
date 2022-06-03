---
author: joannaleecy
title: XblMultiplayerPeerToPeerRequirements
description: Represents requirements for a connection between session members.
kindex: XblMultiplayerPeerToPeerRequirements
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
quality: good
applies-to: pc-gdk
---

# XblMultiplayerPeerToPeerRequirements  

Represents requirements for a connection between session members.  

## Syntax  
  
```cpp
typedef struct XblMultiplayerPeerToPeerRequirements {  
    uint64_t LatencyMaximum;  
    uint64_t BandwidthMinimumInKbps;  
} XblMultiplayerPeerToPeerRequirements  
```
  
### Members  
  
*LatencyMaximum*  
Type: uint64_t  
  
The maximum latency, in milliseconds, for the peer-to-peer connection.
  
*BandwidthMinimumInKbps*  
Type: uint64_t  
  
The minimum bandwidth, in kilobits per second, for the peer-to-peer connection.
  
## Member of
  
[XblMultiplayerSessionConstants](xblmultiplayersessionconstants.md)
  
## Argument of
  
[XblMultiplayerSessionConstantsSetPeerToPeerRequirements](../functions/xblmultiplayersessionconstantssetpeertopeerrequirements.md)
  
## Requirements  
  
**Header:** multiplayer_c.h
  
## See also  
[multiplayer_c](../multiplayer_c_members.md)  
  
  