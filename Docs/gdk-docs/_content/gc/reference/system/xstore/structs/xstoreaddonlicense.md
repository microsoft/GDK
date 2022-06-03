---
author: M-Stahl
title: XStoreAddonLicense
description: Describes an addon license.
kindex: XStoreAddonLicense
ms.author: shanede
ms.topic: reference
edited: 07/02/2019
quality: good
security: public
applies-to: pc-gdk
---

# XStoreAddonLicense  

Describes an addon license.  

## Syntax  
  
```cpp
typedef struct XStoreAddonLicense {  
    char skuStoreId[STORE_SKU_ID_SIZE];  
    char inAppOfferToken[IN_APP_OFFER_TOKEN_MAX_SIZE];  
    bool isActive;  
    time_t expirationDate;  
} XStoreAddonLicense  
```
  
### Members  
  
*skuStoreId*  
Type: char[STORE_SKU_ID_SIZE]  
  
The SKU ID for the license.    
  
*inAppOfferToken*  
Type: char[IN_APP_OFFER_TOKEN_MAX_SIZE]  
  
Title defined offer token that you can use to map items internally. For example: com.company.product.itemname.  
  
*isActive*  
Type: bool  
  
Indicates if the license is active.  
  
*expirationDate*  
Type: time_t  
  
Expiration date of the license.    

## Remarks

An add-on is a product or feature that you make available to your customers in the context of your game: for example, currency to be used in a game, new maps or weapons for a game, the ability to play your game without ads. Every game and add-on has an associated license that indicates whether the user is entitled to play the game or add-on. If the user is entitled to play the game or add-on as a trial, the license also provides additional info about the trial. **XStoreAddonLicense** is a parameter for the [XStoreQueryAddOnLicensesResult](../functions/xstorequeryaddonlicensesresult.md) function.
  
## Requirements  
  
**Header:** XStore.h (included in XGameRuntime.h)
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[XStore](../xstore_members.md)  
[XStoreQueryAddOnLicensesResult](../functions/xstorequeryaddonlicensesresult.md)  
  
  