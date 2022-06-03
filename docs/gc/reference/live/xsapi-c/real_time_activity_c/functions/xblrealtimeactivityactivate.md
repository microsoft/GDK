---
author: joannaleecy
title: XblRealTimeActivityActivate
description: Forces XSAPI to open a WebSocket connection to the Xbox Live real-time activity service. DEPRECATED. Calling this API is no longer required. The WebSocket connection will be made automatically by XSAPI as necessary. This API will be removed in a future release.
kindex: XblRealTimeActivityActivate
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblRealTimeActivityActivate  

Forces XSAPI to open a WebSocket connection to the Xbox Live real-time activity service. DEPRECATED. Calling this API is no longer required. The WebSocket connection will be made automatically by XSAPI as necessary. This API will be removed in a future release.  

## Syntax  
  
```cpp
HRESULT XblRealTimeActivityActivate(  
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
  
  