---
author: M-Stahl
title: XStoreConsumableResult
description: Represents the quantity of the consumable.
kindex: XStoreConsumableResult
ms.author: shanede
ms.topic: reference
edited: 00/00/0000
quality: good
security: public
applies-to: pc-gdk
---

# XStoreConsumableResult  

Represents the quantity of the consumable.  

## Syntax  
  
```cpp
typedef struct XStoreConsumableResult {  
    uint32_t quantity;  
} XStoreConsumableResult  
```
  
### Members  
  
*quantity*  
Type: uint32_t  
  
The remaining quantity of the consumable.  
  
## Remarks

While this struct contains the results of [XStoreQueryConsumableBalanceRemainingAsync](../functions/xstorequeryconsumablebalanceremainingasync.md) and [XStoreReportConsumableFulfillmentAsync](../functions/xstorereportconsumablefulfillmentasync.md) the structs are actually populated in their results functions which are [XStoreQueryConsumableBalanceRemainingResult](../functions/xstorequeryconsumablebalanceremainingresult.md) and [XStoreReportConsumableFulfillmentResult](../functions/xstorereportconsumablefulfillmentresult.md) respectively. **XStoreConsumableResult** is a parameter of [XStoreQueryConsumableBalanceRemainingResult](../functions/xstorequeryconsumablebalanceremainingresult.md). **XStoreConsumableResult** is a parameter of [XStoreReportConsumableFulfillmentResult](../functions/xstorereportconsumablefulfillmentresult.md). This struct can be returned in a variety of mechanisms, including after use or purchase of a consumable.

## Requirements  
  
**Header:** XStore.h (included in XGameRuntime.h)
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[XStore](../xstore_members.md)  
[XStoreQueryConsumableBalanceRemainingResult](../functions/xstorequeryconsumablebalanceremainingresult.md)  
[XStoreReportConsumableFulfillmentResult](../functions/xstorereportconsumablefulfillmentresult.md)  
  