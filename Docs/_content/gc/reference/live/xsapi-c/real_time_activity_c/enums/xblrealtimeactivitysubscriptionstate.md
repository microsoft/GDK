---
author: joannaleecy
title: XblRealTimeActivitySubscriptionState
description: Enumeration for the possible states of a statistic subscription request to the real-time activity service.
kindex: XblRealTimeActivitySubscriptionState
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
quality: good
applies-to: pc-gdk
---

# XblRealTimeActivitySubscriptionState  

Enumeration for the possible states of a statistic subscription request to the real-time activity service.    

## Syntax  
  
```cpp
enum class XblRealTimeActivitySubscriptionState  : uint32_t  
{  
    Unknown,  
    PendingSubscribe,  
    Subscribed,  
    PendingUnsubscribe,  
    Closed  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| Unknown | The subscription state is unknown. |  
| PendingSubscribe | Waiting for the server to respond to the subscription request. |  
| Subscribed | Subscription confirmed. |  
| PendingUnsubscribe | Waiting for the server to respond to the unsubscribe request. |  
| Closed | Unsubscribe confirmed. |  
  
## Requirements  
  
**Header:** real_time_activity_c.h
  
## See also  
[real_time_activity_c](../real_time_activity_c_members.md)  
  
  