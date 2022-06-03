---
author: M-Stahl
title: XStoreGameLicense
description: Describes a game license.
kindex: XStoreGameLicense
ms.author: shanede
ms.topic: reference
edited: 07/02/2019
quality: good
security: public
applies-to: pc-gdk
---

# XStoreGameLicense  

Describes a game license.  

## Syntax  
  
```cpp
typedef struct XStoreGameLicense {  
    char skuStoreId[STORE_SKU_ID_SIZE];  
    bool isActive;  
    bool isTrialOwnedByThisUser;  
    bool isDiscLicense;  
    bool isTrial;  
    uint32_t trialTimeRemainingInSeconds;  
    char trialUniqueId[TRIAL_UNIQUE_ID_MAX_SIZE];  
    time_t expirationDate;  
} XStoreGameLicense  
```
  
### Members  
  
*skuStoreId*  
Type: char[STORE_SKU_ID_SIZE]  
  
The store ID.    
  
*isActive*  
Type: bool  
  
Indicates whether the license is active.    
  
*isTrialOwnedByThisUser*  
Type: bool  
  
Indicates whether the trial is owned by the user associated to the XStoreContext. If on PC, this will be the currently signed in user to the Microsoft Store App.
  
*isDiscLicense*  
Type: bool  
  
Indicates whether the license is a disc license.    
  
*isTrial*  
Type: bool  
  
Indicates whether the license is a trial license.    
  
*trialTimeRemainingInSeconds*  
Type: uint32_t  
  
Amount of time remaining for the trial license.  
  
*trialUniqueId*  
Type: char[TRIAL_UNIQUE_ID_MAX_SIZE]  
  
The unique ID for the trial.  

*expirationDate*  
Type: time_t  
  
Expiration date of the license.    
  
## Remarks

To acquire the game license call [XStoreQueryGameLicenseAsync](../functions/xstorequerygamelicenseasync.md). You will find the license returned in its result function [XStoreQueryGameLicenseResult](../functions/xstorequerygamelicenseresult.md). **XStoreGameLicense** is an output parameter of [XStoreQueryGameLicenseResult](../functions/xstorequerygamelicenseresult.md).

## Requirements  
  
**Header:** XStore.h (included in XGameRuntime.h)
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[XStore](../xstore_members.md)  
[XStoreQueryGameLicenseAsync](../functions/xstorequerygamelicenseasync.md)  
[XStoreQueryGameLicenseResult](../functions/xstorequerygamelicenseresult.md)  
  