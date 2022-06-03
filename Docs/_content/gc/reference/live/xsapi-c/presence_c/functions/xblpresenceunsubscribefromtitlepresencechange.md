---
author: joannaleecy
title: XblPresenceUnsubscribeFromTitlePresenceChange
description: Unsubscribes a previously created title presence change subscription. DEPRECATED. This API will be removed in a future release. Individual RTA subscription will be managed automatically by XSAPI as titles are untracked with [XblPresenceStopTrackingAdditionalTitles](xblpresencestoptrackingadditionaltitles.md).
kindex: XblPresenceUnsubscribeFromTitlePresenceChange
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# XblPresenceUnsubscribeFromTitlePresenceChange  

Unsubscribes a previously created title presence change subscription. DEPRECATED. This API will be removed in a future release. Individual RTA subscription will be managed automatically by XSAPI as titles are untracked with [XblPresenceStopTrackingAdditionalTitles](xblpresencestoptrackingadditionaltitles.md).  

## Syntax  
  
```cpp
HRESULT XblPresenceUnsubscribeFromTitlePresenceChange(  
         XblContextHandle xblContextHandle,  
         XblRealTimeActivitySubscriptionHandle subscriptionHandle  
)  
```  
  
### Parameters  
  
*xblContextHandle* &nbsp;&nbsp;\_In\_  
Type: [XblContextHandle](../../types_c/handles/xblcontexthandle.md)  
  
Xbox live context for the local user.  
  
*subscriptionHandle* &nbsp;&nbsp;\_In\_  
Type: [XblRealTimeActivitySubscriptionHandle](../../real_time_activity_c/handles/xblrealtimeactivitysubscriptionhandle.md)  
  
Handle for the subscription created with [XblPresenceSubscribeToTitlePresenceChange](xblpresencesubscribetotitlepresencechange.md). This will cause the underlying object to be cleaned up,and will invalidate the subscription handle.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Requirements  
  
**Header:** presence_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[presence_c](../presence_c_members.md)  
  
  