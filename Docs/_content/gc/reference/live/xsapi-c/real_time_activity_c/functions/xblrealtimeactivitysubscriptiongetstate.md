---
author: joannaleecy
title: XblRealTimeActivitySubscriptionGetState
description: Get the state of the subscription. DEPRECATED. The state of RTA subscriptions is no longer exposed publicly. XblRealTimeActivitySubscriptionState::Unknown will always be returned.
kindex: XblRealTimeActivitySubscriptionGetState
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblRealTimeActivitySubscriptionGetState  

Get the state of the subscription. DEPRECATED. The state of RTA subscriptions is no longer exposed publicly. XblRealTimeActivitySubscriptionState::Unknown will always be returned.  

## Syntax  
  
```cpp
HRESULT XblRealTimeActivitySubscriptionGetState(  
         XblRealTimeActivitySubscriptionHandle subscriptionHandle,  
         XblRealTimeActivitySubscriptionState* state  
)  
```  
  
### Parameters  
  
*subscriptionHandle* &nbsp;&nbsp;\_In\_  
Type: [XblRealTimeActivitySubscriptionHandle](../handles/xblrealtimeactivitysubscriptionhandle.md)  
  
Subscription handle returned from a subscribe API.  
  
*state* &nbsp;&nbsp;\_Out\_  
Type: [XblRealTimeActivitySubscriptionState*](../enums/xblrealtimeactivitysubscriptionstate.md)  
  
Passes back the current state of the subscription.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Requirements  
  
**Header:** real_time_activity_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[real_time_activity_c](../real_time_activity_c_members.md)  
  
  