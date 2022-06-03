---
author: joannaleecy
title: XblPrivacyGetMuteListResult
description: Get result for an XblPrivacyGetMuteListAsync call.
kindex: XblPrivacyGetMuteListResult
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# XblPrivacyGetMuteListResult  

Get result for an XblPrivacyGetMuteListAsync call.  

## Syntax  
  
```cpp
HRESULT XblPrivacyGetMuteListResult(  
         XAsyncBlock* async,  
         size_t xuidCount,  
         uint64_t* xuids  
)  
```  
  
### Parameters  
  
*async* &nbsp;&nbsp;\_In\_  
Type: XAsyncBlock*  
  
The AsyncBlock for this operation.  
  
*xuidCount* &nbsp;&nbsp;\_In\_  
Type: size_t  
  
Size of the xuids array. Use [XblPrivacyGetMuteListResultCount](xblprivacygetmutelistresultcount.md) to get the count required.  
  
*xuids* &nbsp;&nbsp;\_Out\_writes\_(xuidCount)  
Type: uint64_t*  
  
A caller allocated array that passes back the mute list xuids result.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Requirements  
  
**Header:** privacy_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[privacy_c](../privacy_c_members.md)  
  
  