---
author: joannaleecy
title: XblSocialSubscribeToSocialRelationshipChange
description: >-
  Subscribes to the social service for people changed events. DEPRECATED. Calling this API is no longer required and it will be removed in a future release. RTA subscription will be managed automatically by XSAPI as [XblSocialRelationshipChangedHandler](xblsocialaddsocialrelationshipchangedhandler.md) are added and removed.
kindex: XblSocialSubscribeToSocialRelationshipChange
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblSocialSubscribeToSocialRelationshipChange  

Subscribes to the social service for people changed events. DEPRECATED. Calling this API is no longer required and it will be removed in a future release. RTA subscription will be managed automatically by XSAPI as [XblSocialRelationshipChangedHandler](xblsocialaddsocialrelationshipchangedhandler.md) are added and removed.  

## Syntax  
  
```cpp
HRESULT XblSocialSubscribeToSocialRelationshipChange(  
         XblContextHandle xboxLiveContext,  
         uint64_t xboxUserId,  
         XblRealTimeActivitySubscriptionHandle* subscriptionHandle  
)  
```  
  
### Parameters  
  
*xboxLiveContext* &nbsp;&nbsp;\_In\_  
Type: [XblContextHandle](../../types_c/handles/xblcontexthandle.md)  
  
An xbox live context handle created with XblContextCreateHandle.  
  
*xboxUserId* &nbsp;&nbsp;\_In\_  
Type: uint64_t  
  
The Xbox User ID of the player requesting the subscription.  
  
*subscriptionHandle* &nbsp;&nbsp;\_Out\_  
Type: [XblRealTimeActivitySubscriptionHandle*](../../real_time_activity_c/handles/xblrealtimeactivitysubscriptionhandle.md)  
  
Passes back a handle to the subscription which is used to un-subscribe.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Remarks  
  
Call [XblSocialUnsubscribeFromSocialRelationshipChange](xblsocialunsubscribefromsocialrelationshipchange.md) to un-subscribe.
  
## Requirements  
  
**Header:** social_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[social_c](../social_c_members.md)  
  
  