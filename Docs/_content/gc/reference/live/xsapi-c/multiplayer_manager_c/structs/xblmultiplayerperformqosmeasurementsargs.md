---
author: joannaleecy
title: XblMultiplayerPerformQoSMeasurementsArgs
description: Event arguments returned for `XblMultiplayerEventType::PerformQosMeasurements` events.
kindex: XblMultiplayerPerformQoSMeasurementsArgs
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
quality: good
applies-to: pc-gdk
---

# XblMultiplayerPerformQoSMeasurementsArgs  

Event arguments returned for `XblMultiplayerEventType::PerformQosMeasurements` events.  

## Syntax  
  
```cpp
typedef struct XblMultiplayerPerformQoSMeasurementsArgs {  
    const XblMultiplayerConnectionAddressDeviceTokenPair* remoteClients;  
    size_t remoteClientsSize;  
} XblMultiplayerPerformQoSMeasurementsArgs  
```
  
### Members  
  
*remoteClients*  
Type: const [XblMultiplayerConnectionAddressDeviceTokenPair*](xblmultiplayerconnectionaddressdevicetokenpair.md)  
  
An array of remote clients to perform QoS measurements on.
  
*remoteClientsSize*  
Type: size_t  
  
The size of the `remoteClients` array.
  
## Argument of  
  
[XblMultiplayerEventArgsPerformQoSMeasurements](../functions/xblmultiplayereventargsperformqosmeasurements.md)  
  
## Requirements  
  
**Header:** multiplayer_manager_c.h
  
## See also  
[multiplayer_manager_c](../multiplayer_manager_c_members.md)  
  
  