---
author: M-Stahl
title: XGameSaveGetRemainingQuota
description: Returns the amount of data available to store using the XGameSave api.
kindex: XGameSaveGetRemainingQuota
ms.author: kelcon
ms.topic: reference
edited: 07/02/2019
quality: good
security: public
applies-to: pc-gdk
---

# XGameSaveGetRemainingQuota  

Returns the amount of data available to store using the **XGameSave** api.  

## Syntax  
  
```cpp
HRESULT XGameSaveGetRemainingQuota(  
         XGameSaveProviderHandle provider,  
         int64_t* remainingQuota  
)  
```  
  
### Parameters  
  
*provider* &nbsp;&nbsp;\_In\_  
Type: XGameSaveProviderHandle  

  
Handle to the **XGameSaveProvider** to query remaining data for.  


*remainingQuota* &nbsp;&nbsp;\_Out\_  
Type: int64_t*  

  
Amount of data available to be used as storage.  


  
### Return value
Type: HRESULT
  
Function result.  
  
## Remarks  
  > [!NOTE]
> This function isn't safe to call on a time-sensitive thread. For more information, see [Time-sensitive threads](../../../../system/overviews/time-sensitive-threads.md).  
  
Each application has a quota on how much data they can save for a user, if this is exceeded any attempts to save more data may fail with **E_GS_QUOTA_EXCEEDED**. As this is not a fixed size we have exposed access to the remaining quota so the application can try to avoid **E_GS_QUOTA_EXCEEDED** failures. To give an accurate view we always make sure that any outstanding writes, updates or deletes are handled first before returning since any of these can change the remaining quota. It is recommended that you call this function to make sure there is a reasonable amount of data left to execute a call to [XGameSaveSubmitUpdate](xgamesavesubmitupdate.md).
  
```cpp
void Sample::_GetQuotaSync(uint64_t* remainingQuota) 
{ 
    HRESULT hr = XGameSaveGetRemainingQuota(_provider, remainingQuota); 
    if (FAILED(hr)) 
    { 
        printf("Error retrieving Quota hr=0x%08x\n", hr); 
    } 
} 
```
  
## Requirements  
  
**Header:** XGameSave.h
  
**Library:** xgameruntime.lib  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[XGameSave](../xgamesave_members.md)  
[XGameSaveSubmitUpdate](xgamesavesubmitupdate.md)  
[Game save errors](../../../../system/overviews/game-save/game-saves-errors.md)  