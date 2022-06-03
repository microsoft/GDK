---
author: joannaleecy
title: XblSocialUnsubscribeFromSocialRelationshipChange
description: >-
  Un-subscribes a previously created social relationship change subscription. DEPRECATED. Calling this API is no longer required and it will be removed in a future release. RTA subscription will be managed automatically by XSAPI as [XblSocialRelationshipChangedHandler](xblsocialremovesocialrelationshipchangedhandler.md)
  are added and removed.
kindex: XblSocialUnsubscribeFromSocialRelationshipChange
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblSocialUnsubscribeFromSocialRelationshipChange  

Un-subscribes a previously created social relationship change subscription. DEPRECATED. Calling this API is no longer required and it will be removed in a future release. RTA subscription will be managed automatically by XSAPI as [XblSocialRelationshipChangedHandler](xblsocialremovesocialrelationshipchangedhandler.md) are added and removed.  

## Syntax  
  
```cpp
HRESULT XblSocialUnsubscribeFromSocialRelationshipChange(  
         XblContextHandle xboxLiveContext,  
         XblRealTimeActivitySubscriptionHandle subscriptionHandle  
)  
```  
  
### Parameters  
  
*xboxLiveContext* &nbsp;&nbsp;\_In\_  
Type: [XblContextHandle](../../types_c/handles/xblcontexthandle.md)  
  
An xbox live context handle created with XblContextCreateHandle.  
  
*subscriptionHandle* &nbsp;&nbsp;\_In\_  
Type: [XblRealTimeActivitySubscriptionHandle](../../real_time_activity_c/handles/xblrealtimeactivitysubscriptionhandle.md)  
  
The subscription handle to unsubscribe.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Remarks  
  
Call this API only if [XblSocialSubscribeToSocialRelationshipChange](xblsocialsubscribetosocialrelationshipchange.md) was used to subscribe to social relationship changes.
  
## Requirements  
  
**Header:** social_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[social_c](../social_c_members.md)  
  
  