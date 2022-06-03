---
author: joannaleecy
title: XblMultiplayerSessionCurrentUserSetQosMeasurements
description: Sets a collection of XblMultiplayerQosMeasurements for the members. This is only useful when the title is manually managing QoS. (If the platform is automatically performing QoS, this does not need to be called)
kindex: XblMultiplayerSessionCurrentUserSetQosMeasurements
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# XblMultiplayerSessionCurrentUserSetQosMeasurements  

Sets a collection of XblMultiplayerQosMeasurements for the members. This is only useful when the title is manually managing QoS. (If the platform is automatically performing QoS, this does not need to be called)  

## Syntax  
  
```cpp
HRESULT XblMultiplayerSessionCurrentUserSetQosMeasurements(  
         XblMultiplayerSessionHandle handle,  
         const char* measurements  
)  
```  
  
### Parameters  
  
*handle* &nbsp;&nbsp;\_In\_  
Type: [XblMultiplayerSessionHandle](../handles/xblmultiplayersessionhandle.md)  
  
Handle to the multiplayer session.  
  
*measurements* &nbsp;&nbsp;\_In\_z\_  
Type: char*  
  
Json representing the QoS measurements of members. Example Json: { "e69c43a8": { // Device token of peer "latency": 5953, // Milliseconds "bandwidthDown" : 19342, // Kilobits per second "bandwidthUp" : 944, // Kilobits per second "custom" : { } }, ... // additional device tokens }  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Requirements  
  
**Header:** multiplayer_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[multiplayer_c](../multiplayer_c_members.md)  
  
  