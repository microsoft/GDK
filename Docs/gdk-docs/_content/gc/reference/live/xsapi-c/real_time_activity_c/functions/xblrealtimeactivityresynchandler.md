---
author: joannaleecy
title: XblRealTimeActivityResyncHandler
description: Handler function for when there is a resync message from the real time activity service.
kindex: XblRealTimeActivityResyncHandler
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblRealTimeActivityResyncHandler  

Handler function for when there is a resync message from the real time activity service.  

## Syntax  
  
```cpp
void XblRealTimeActivityResyncHandler(  
         void* context  
)  
```  
  
### Parameters  
  
*context* &nbsp;&nbsp;\_In\_opt\_  
Type: void*  
  
Caller context that will be passed back to the handler function.  
  
  
### Return value  
Type: void
  

  
## Requirements  
  
**Header:** real_time_activity_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[real_time_activity_c](../real_time_activity_c_members.md)  
  
  