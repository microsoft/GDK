---
author: joannaleecy
title: XblRealTimeActivityDeactivate
description: >-
  Indicates that a client real-time activity session is complete. If there are no remaining real-time service activations, the WebSocket connection will be cleaned up along with remaining subscriptions. DEPRECATED. Calling this API is no longer required. The WebSocket connection will be cleaned up automatically by XSAPI
  when it is no longer needed. This API will be removed in a future release.
kindex: XblRealTimeActivityDeactivate
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblRealTimeActivityDeactivate  

Indicates that a client real-time activity session is complete. If there are no remaining real-time service activations, the WebSocket connection will be cleaned up along with remaining subscriptions. DEPRECATED. Calling this API is no longer required. The WebSocket connection will be cleaned up automatically by XSAPI when it is no longer needed. This API will be removed in a future release.  

## Syntax  
  
```cpp
HRESULT XblRealTimeActivityDeactivate(  
         XblContextHandle xboxLiveContext  
)  
```  
  
### Parameters  
  
*xboxLiveContext* &nbsp;&nbsp;\_In\_  
Type: [XblContextHandle](../../types_c/handles/xblcontexthandle.md)  
  
Xbox Live context handle.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Requirements  
  
**Header:** real_time_activity_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[real_time_activity_c](../real_time_activity_c_members.md)  
  
  