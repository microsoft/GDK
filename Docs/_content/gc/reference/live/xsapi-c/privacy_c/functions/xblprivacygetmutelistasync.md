---
author: joannaleecy
title: XblPrivacyGetMuteListAsync
description: Get the list of Xuids that the calling user should not hear (mute) during multiplayer matchmaking.
kindex: XblPrivacyGetMuteListAsync
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# XblPrivacyGetMuteListAsync  

Get the list of Xuids that the calling user should not hear (mute) during multiplayer matchmaking.  

## Syntax  
  
```cpp
HRESULT XblPrivacyGetMuteListAsync(  
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
  
Call [XblPrivacyGetMuteListResultCount](xblprivacygetmutelistresultcount.md) and [XblPrivacyGetMuteListResult](xblprivacygetmutelistresult.md) upon completion to get result.
  
## Requirements  
  
**Header:** privacy_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[privacy_c](../privacy_c_members.md)  
  
  