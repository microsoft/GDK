---
author: M-Stahl
title: XStoreSubscriptionInfo
description: Contains information on a subscription.
kindex: XStoreSubscriptionInfo
ms.author: shanede
ms.topic: reference
edited: 00/00/0000
quality: good
security: public
applies-to: pc-gdk
---

# XStoreSubscriptionInfo  

Contains information on a subscription.  

## Syntax  
  
```cpp
typedef struct XStoreSubscriptionInfo {  
    bool hasTrialPeriod;  
    XStoreDurationUnit trialPeriodUnit;  
    uint32_t trialPeriod;  
    XStoreDurationUnit billingPeriodUnit;  
    uint32_t billingPeriod;  
} XStoreSubscriptionInfo  
```
  
### Members  
  
*hasTrialPeriod*  
Type: bool  
  
Indicates whether the subscription has a trial period.  
  
*trialPeriodUnit*  
Type: [XStoreDurationUnit](../enums/xstoredurationunit.md)  
  
The trial period unit type.
  
*trialPeriod*  
Type: uint32_t  
  
The trial length period.  
  
*billingPeriodUnit*  
Type: [XStoreDurationUnit](../enums/xstoredurationunit.md)  
  
The billing period unit type.  
  
*billingPeriod*  
Type: uint32_t  
  
The billing period for the subscription.  
  
## Remarks
  
Subscriptions are created and configured in Partner Center. Each subscription type offered for your game requires a separate subscription configuration. 
**XStoreSubscriptionInfo** is a member of the [XStoreSku](xstoresku.md) struct.
  
## Requirements  
  
**Header:** XStore.h (included in XGameRuntime.h)
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[XStore](../xstore_members.md)  
[XStoreSku](xstoresku.md)  
  