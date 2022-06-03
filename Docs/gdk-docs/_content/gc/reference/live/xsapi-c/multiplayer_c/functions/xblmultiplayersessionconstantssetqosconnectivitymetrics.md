---
author: joannaleecy
title: XblMultiplayerSessionConstantsSetQosConnectivityMetrics
description: Enables or disables connectivity metrics for the session. This can only be set when creating a new session.
kindex: XblMultiplayerSessionConstantsSetQosConnectivityMetrics
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# XblMultiplayerSessionConstantsSetQosConnectivityMetrics  

Enables or disables connectivity metrics for the session. This can only be set when creating a new session.  

## Syntax  
  
```cpp
HRESULT XblMultiplayerSessionConstantsSetQosConnectivityMetrics(  
         XblMultiplayerSessionHandle handle,  
         bool enableLatencyMetric,  
         bool enableBandwidthDownMetric,  
         bool enableBandwidthUpMetric,  
         bool enableCustomMetric  
)  
```  
  
### Parameters  
  
*handle* &nbsp;&nbsp;\_In\_  
Type: [XblMultiplayerSessionHandle](../handles/xblmultiplayersessionhandle.md)  
  
Handle to the multiplayer session.  
  
*enableLatencyMetric* &nbsp;&nbsp;\_In\_  
Type: bool  
  
True to enable the measuring of latency, and false to disable latency measurement.  
  
*enableBandwidthDownMetric* &nbsp;&nbsp;\_In\_  
Type: bool  
  
True to enable the measuring of bandwidth down, and false to disable bandwidth down measurement.  
  
*enableBandwidthUpMetric* &nbsp;&nbsp;\_In\_  
Type: bool  
  
True to enable the measuring of bandwidth up, and false to disable bandwidth up measurement.  
  
*enableCustomMetric* &nbsp;&nbsp;\_In\_  
Type: bool  
  
True to enable custom metrics, and false to disable them.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Remarks  
  
For ones that are enabled, they must be sufficient to satisfy the QoS requirements.
  
## Requirements  
  
**Header:** multiplayer_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[multiplayer_c](../multiplayer_c_members.md)  
  
  