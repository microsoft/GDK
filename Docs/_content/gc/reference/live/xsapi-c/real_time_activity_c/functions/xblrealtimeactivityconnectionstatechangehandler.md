---
author: joannaleecy
title: XblRealTimeActivityConnectionStateChangeHandler
description: Handler function for when the client service loses or gains connectivity to the real time activity service.
kindex: XblRealTimeActivityConnectionStateChangeHandler
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblRealTimeActivityConnectionStateChangeHandler  

Handler function for when the client service loses or gains connectivity to the real time activity service.  

## Syntax  
  
```cpp
void XblRealTimeActivityConnectionStateChangeHandler(  
         void* context,  
         XblRealTimeActivityConnectionState connectionState  
)  
```  
  
### Parameters  
  
*context* &nbsp;&nbsp;\_In\_opt\_  
Type: void*  
  
Caller context that will be passed back to the handler function.  
  
*connectionState* &nbsp;&nbsp;\_In\_  
Type: [XblRealTimeActivityConnectionState](../enums/xblrealtimeactivityconnectionstate.md)  
  
State of the connection.  
  
  
### Return value  
Type: void
  

  
## Requirements  
  
**Header:** real_time_activity_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[real_time_activity_c](../real_time_activity_c_members.md)  
  
  