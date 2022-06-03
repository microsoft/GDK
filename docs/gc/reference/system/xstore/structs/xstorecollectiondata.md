---
author: M-Stahl
title: XStoreCollectionData
description: Describes a store collection.
kindex: XStoreCollectionData
ms.author: shanede
ms.topic: reference
edited: 00/00/0000
quality: good
security: public
applies-to: pc-gdk
---

# XStoreCollectionData  

Describes the users entitlement for a specific sku.  

## Syntax  
  
```cpp
typedef struct XStoreCollectionData {  
    time_t acquiredDate;  
    time_t startDate;  
    time_t endDate;  
    bool isTrial;  
    uint32_t trialTimeRemainingInSeconds;  
    uint32_t quantity;  
    const char* campaignId;  
    const char* developerOfferId;  
} XStoreCollectionData  
```
  
### Members  
  
*acquiredDate*  
Type: time_t  
  
The date the entitlement was acquired.  
  
*startDate*  
Type: time_t  
  
The start date of the entitlement.  
  
*endDate*  
Type: time_t  
  
The date the entitlement ends.  
  
*isTrial*  
Type: bool  
  
Indicates if the entitlement is a trial.   
  
*trialTimeRemainingInSeconds*  
Type: uint32_t  
  
Time remaining in the trial.  
  
*quantity*  
Type: uint32_t  
  
Number of items in the entitlement. For consumables this represents the remaining balance.  
  
*campaignId*  
Type: const char*  
  
The campaign ID for the entitlement.  
  
*developerOfferId*  
Type: const char*  
  
The developer offer ID.  
  
## Remarks

**XStoreCollectionData** provides additional information about a store product Stock Keeping Unit (SKU). An **XStoreCollectionData** may refer to many types of products or collections of products. As such not all fields may have a value if they are not applicable to the SKU. **XStoreCollectionData is a member of the [StoreSku](xstoresku.md) struct.

## Requirements  
  
**Header:** XStore.h (included in XGameRuntime.h)
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[XStore](../xstore_members.md)  
[XStoreSku](xstoresku.md)  