---
author: joannaleecy
title: XblProfileGetUserProfileAsync
description: Gets a user profile for a specific Xbox user.
kindex: XblProfileGetUserProfileAsync
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblProfileGetUserProfileAsync  

Gets a user profile for a specific Xbox user.  

## Syntax  
  
```cpp
HRESULT XblProfileGetUserProfileAsync(  
         XblContextHandle xboxLiveContext,  
         uint64_t xboxUserId,  
         XAsyncBlock* async  
)  
```  
  
### Parameters  
  
*xboxLiveContext* &nbsp;&nbsp;\_In\_  
Type: [XblContextHandle](../../types_c/handles/xblcontexthandle.md)  
  
An xbox live context handle created with XblContextCreateHandle.  
  
*xboxUserId* &nbsp;&nbsp;\_In\_  
Type: uint64_t  
  
The Xbox User ID of the user to get the profile for.  
  
*async* &nbsp;&nbsp;\_In\_  
Type: XAsyncBlock*  
  
Caller allocated AsyncBlock.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Remarks  
  
To get the result, call [XblProfileGetUserProfileResult](xblprofilegetuserprofileresult.md) inside the AsyncBlock callback or after the AsyncBlock is complete.
  
## REST Call  
  
Calls V2 GET /users/batch/profile/settings
  
## Requirements  
  
**Header:** profile_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[profile_c](../profile_c_members.md)  
  
  