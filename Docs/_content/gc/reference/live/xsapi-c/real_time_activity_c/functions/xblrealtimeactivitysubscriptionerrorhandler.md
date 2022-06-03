---
author: joannaleecy
title: XblRealTimeActivitySubscriptionErrorHandler
description: Handler function for when there is an error in the real time activity service.
kindex: XblRealTimeActivitySubscriptionErrorHandler
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblRealTimeActivitySubscriptionErrorHandler  

Handler function for when there is an error in the real time activity service.  

## Syntax  
  
```cpp
void XblRealTimeActivitySubscriptionErrorHandler(  
         void* context,  
         XblRealTimeActivitySubscriptionHandle subscription,  
         HRESULT subscriptionError  
)  
```  
  
### Parameters  
  
*context* &nbsp;&nbsp;\_In\_opt\_  
Type: void*  
  
Caller context that will be passed back to the handler function.  
  
*subscription* &nbsp;&nbsp;\_In\_  
Type: [XblRealTimeActivitySubscriptionHandle](../handles/xblrealtimeactivitysubscriptionhandle.md)  
  
Subscription handle.  
  
*subscriptionError* &nbsp;&nbsp;\_In\_  
Type: HRESULT  
  
The HRESULT error code.  
  
  
### Return value  
Type: void
  

  
## Requirements  
  
**Header:** real_time_activity_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[real_time_activity_c](../real_time_activity_c_members.md)  
  
  