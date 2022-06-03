---
author: joannaleecy
title: XblPrivacyGetAvoidListResult
description: Get result for an XblPrivacyGetAvoidListAsync call.
kindex: XblPrivacyGetAvoidListResult
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# XblPrivacyGetAvoidListResult  

Get result for an XblPrivacyGetAvoidListAsync call.  

## Syntax  
  
```cpp
HRESULT XblPrivacyGetAvoidListResult(  
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
  
Size of the xuids array. Use [XblPrivacyGetAvoidListResultCount](xblprivacygetavoidlistresultcount.md) to get the count required.  
  
*xuids* &nbsp;&nbsp;\_Out\_writes\_(xuidCount)  
Type: uint64_t*  
  
A caller allocated array that passes back the avoid list xuids result.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Requirements  
  
**Header:** privacy_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[privacy_c](../privacy_c_members.md)  
  
  