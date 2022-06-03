---
author: joannaleecy
title: XblMultiplayerManagerSetQosMeasurements
description: Sets json representing QoS measurements between the current user and a list of remote clients. This is only used when the title is manually managing QoS.
kindex: XblMultiplayerManagerSetQosMeasurements
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# XblMultiplayerManagerSetQosMeasurements  

Sets json representing QoS measurements between the current user and a list of remote clients. This is only used when the title is manually managing QoS.  

## Syntax  
  
```cpp
HRESULT XblMultiplayerManagerSetQosMeasurements(  
         const char* measurementsJson  
)  
```  
  
### Parameters  
  
*measurementsJson* &nbsp;&nbsp;\_In\_z\_  
Type: char*  
  
Json representing the QoS measurements. Example Json: "e69c43a8": { // remote client deviceToken "latency": 5953, // Milliseconds "bandwidthDown" : 19342, // Kilobits per second "bandwidthUp" : 944, // Kilobits per second "custom" : { } }, ... // additional remote client entries  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Requirements  
  
**Header:** multiplayer_manager_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[multiplayer_manager_c](../multiplayer_manager_c_members.md)  
  
  