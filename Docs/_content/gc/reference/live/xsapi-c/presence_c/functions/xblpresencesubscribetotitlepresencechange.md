---
author: joannaleecy
title: XblPresenceSubscribeToTitlePresenceChange
description: Subscribes to title presence change notifications. DEPRECATED. This API will be removed in a future release. Individual RTA subscription will be managed automatically by XSAPI as titles are tracked with [XblPresenceTrackAdditionalTitles](xblpresencetrackadditionaltitles.md).
kindex: XblPresenceSubscribeToTitlePresenceChange
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# XblPresenceSubscribeToTitlePresenceChange  

Subscribes to title presence change notifications. DEPRECATED. This API will be removed in a future release. Individual RTA subscription will be managed automatically by XSAPI as titles are tracked with [XblPresenceTrackAdditionalTitles](xblpresencetrackadditionaltitles.md).  

## Syntax  
  
```cpp
HRESULT XblPresenceSubscribeToTitlePresenceChange(  
         XblContextHandle xblContextHandle,  
         uint64_t xuid,  
         uint32_t titleId,  
         XblRealTimeActivitySubscriptionHandle* subscriptionHandle  
)  
```  
  
### Parameters  
  
*xblContextHandle* &nbsp;&nbsp;\_In\_  
Type: [XblContextHandle](../../types_c/handles/xblcontexthandle.md)  
  
Xbox live context for the local user.  
  
*xuid* &nbsp;&nbsp;\_In\_  
Type: uint64_t  
  
The Xbox User ID of the person of the subscription.  
  
*titleId* &nbsp;&nbsp;\_In\_  
Type: uint32_t  
  
The title ID.  
  
*subscriptionHandle* &nbsp;&nbsp;\_Out\_  
Type: [XblRealTimeActivitySubscriptionHandle*](../../real_time_activity_c/handles/xblrealtimeactivitysubscriptionhandle.md)  
  
Passes back the RTA subscription handle that will be used to unsubscribe.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Requirements  
  
**Header:** presence_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[presence_c](../presence_c_members.md)  
  
  