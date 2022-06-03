---
author: M-Stahl
title: XStoreDurationUnit
description: Units of a duration value.
kindex: XStoreDurationUnit
ms.author: shanede
ms.topic: reference
edited: 00/00/0000
quality: good
security: public
applies-to: pc-gdk
---

# XStoreDurationUnit  

Units of a duration value.  

## Syntax  
  
```cpp
enum class XStoreDurationUnit  : uint32_t  
{  
    Minute = 0,  
    Hour = 1,  
    Day = 2,  
    Week = 3,  
    Month = 4,  
    Year = 5,  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| Minute | Duration is in minutes. |  
| Hour | Duration is in hours. |  
| Day | Duration is in days. |  
| Week | Duration is in weeks. |  
| Month | Duration is in months. |  
| Year | Duration is in years. |  
  
## Remarks

**XStoreDurationUnit** is a member of the [XStoreSubscriptionInfo](../structs/xstoresubscriptioninfo.md) struct. It describes two different values, the amount of time that a subscription can be used on a trial basis, and the billing period which determines how often the subscription must be paid for. The **XStoreDurationUnit** is not used to make up a time stamp and only one value is used at a time to describe a subscription period. For example a trial period measured in weeks, or a billing period measured in months.
  
## Requirements  
  
**Header:** XStore.h (included in XGameRuntime.h)
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[XStore](../xstore_members.md)  
[XStoreSubscriptionInfo](../structs/xstoresubscriptioninfo.md)  