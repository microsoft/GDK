---
author: joannaleecy
title: XblRealTimeActivitySubscriptionGetId
description: Get the unique ID for the subscription. DEPRECATED. The state of RTA subscriptions is no longer exposed publicly. This API will return a unique client side ID, but it is in no way related to the ID assigned by the RTA service.
kindex: XblRealTimeActivitySubscriptionGetId
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblRealTimeActivitySubscriptionGetId  

Get the unique ID for the subscription. DEPRECATED. The state of RTA subscriptions is no longer exposed publicly. This API will return a unique client side ID, but it is in no way related to the ID assigned by the RTA service.  

## Syntax  
  
```cpp
HRESULT XblRealTimeActivitySubscriptionGetId(  
         XblRealTimeActivitySubscriptionHandle subscriptionHandle,  
         uint32_t* id  
)  
```  
  
### Parameters  
  
*subscriptionHandle* &nbsp;&nbsp;\_In\_  
Type: [XblRealTimeActivitySubscriptionHandle](../handles/xblrealtimeactivitysubscriptionhandle.md)  
  
Subscription handle returned from a subscribe API.  
  
*id* &nbsp;&nbsp;\_Out\_  
Type: uint32_t*  
  
Passes back the ID for the subscription.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Requirements  
  
**Header:** real_time_activity_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[real_time_activity_c](../real_time_activity_c_members.md)  
  
  