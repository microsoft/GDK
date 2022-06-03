---
author: joannaleecy
title: XblPrivacyGetAvoidListAsync
description: Get the list of Xuids the calling user should avoid during multiplayer matchmaking.
kindex: XblPrivacyGetAvoidListAsync
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# XblPrivacyGetAvoidListAsync  

Get the list of Xuids the calling user should avoid during multiplayer matchmaking.  

## Syntax  
  
```cpp
HRESULT XblPrivacyGetAvoidListAsync(  
         XblContextHandle xblContextHandle,  
         XAsyncBlock* async  
)  
```  
  
### Parameters  
  
*xblContextHandle* &nbsp;&nbsp;\_In\_  
Type: [XblContextHandle](../../types_c/handles/xblcontexthandle.md)  
  
Xbox live context for the local user.  
  
*async* &nbsp;&nbsp;\_In\_  
Type: XAsyncBlock*  
  
The AsyncBlock for this operation.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Remarks  
  
Call [XblPrivacyGetAvoidListResultCount](xblprivacygetavoidlistresultcount.md) and [XblPrivacyGetAvoidListResult](xblprivacygetavoidlistresult.md) upon completion to get the result.
  
## Requirements  
  
**Header:** privacy_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[privacy_c](../privacy_c_members.md)  
  
  