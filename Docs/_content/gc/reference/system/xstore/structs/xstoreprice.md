---
author: M-Stahl
title: XStorePrice
description: Store price information.
kindex: XStorePrice
ms.author: shanede
ms.topic: reference
edited: 07/02/2019
quality: good
security: public
applies-to: pc-gdk
---

# XStorePrice  

Store price information.  

## Syntax  
  
```cpp
typedef struct XStorePrice {  
    float basePrice;  
    float price;  
    float recurrencePrice;  
    const char* currencyCode;  
    char formattedBasePrice[PRICE_MAX_SIZE];  
    char formattedPrice[PRICE_MAX_SIZE];  
    char formattedRecurrencePrice[PRICE_MAX_SIZE];  
    bool isOnSale;  
    time_t saleEndDate;  
} XStorePrice  
```
  
### Members  
  
*basePrice*  
Type: float  
  
The normal non-promotional price or MSRP of the product.
  
*price*  
Type: float  
  
The actual price that the user would pay if they purchased the item.  
  
*recurrencePrice*  
Type: float  
  
The recurrence price.  
  
*currencyCode*  
Type: const char*  
  
Currency code for the price.  
  
*formattedBasePrice*  
Type: char[PRICE_MAX_SIZE]  
  
The formatted basePrice that can be shown in the game's UI.
  
*formattedPrice*  
Type: char[PRICE_MAX_SIZE]  
  
The formatted price that should be used in your UI to advertise the product.
  
*formattedRecurrencePrice*  
Type: char[PRICE_MAX_SIZE]  
  
The formatted recurrence price.  
  
*isOnSale*  
Type: bool  
  
Indicates whether the product is on sale.  
  
*saleEndDate*  
Type: time_t  
  
The end date for the sale.  

## Remarks
*basePrice* is not necessarily the price that should be advertised. You should always advertise in your UI the values found in the price variables and not the basePrice variables. You can use the basePrice variable to determine how much of a discount is being offered during a sale. You can then use the basePrice with a text strikethrough next to the price variable in your UI to help users understand the value and savings.  
  
**XStorePrice** is a member of the [XStoreAvailability](xstoreavailability.md) struct. **XStorePrice** is a member of the [XStoreProduct](xstoreproduct.md) struct. **XStorePrice** is a member of the [XStoreSku](xstoresku.md) struct.  


## Requirements  
  
**Header:** XStore.h (included in XGameRuntime.h)
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[XStore](../xstore_members.md)  
[XStoreAvailability](xstoreavailability.md)  
[XStoreProduct](xstoreproduct.md)  
[XStoreSku](xstoresku.md)  