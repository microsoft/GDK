---
author: joannaleecy
title: XblProfileGetUserProfilesAsync
description: Gets one or more user profiles for a collection of specified Xbox users.
kindex: XblProfileGetUserProfilesAsync
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblProfileGetUserProfilesAsync  

Gets one or more user profiles for a collection of specified Xbox users.  

## Syntax  
  
```cpp
HRESULT XblProfileGetUserProfilesAsync(  
         XblContextHandle xboxLiveContext,  
         uint64_t* xboxUserIds,  
         size_t xboxUserIdsCount,  
         XAsyncBlock* async  
)  
```  
  
### Parameters  
  
*xboxLiveContext* &nbsp;&nbsp;\_In\_  
Type: [XblContextHandle](../../types_c/handles/xblcontexthandle.md)  
  
An xbox live context handle created with XblContextCreateHandle.  
  
*xboxUserIds* &nbsp;&nbsp;\_In\_  
Type: uint64_t*  
  
C-style array of Xbox User IDs of the users to get profiles for.  
  
*xboxUserIdsCount* &nbsp;&nbsp;\_In\_  
Type: size_t  
  
The number of Xbox User IDs in the array.  
  
*async* &nbsp;&nbsp;\_In\_  
Type: XAsyncBlock*  
  
Caller allocated AsyncBlock.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Remarks  
  
To get the result, first call [XblProfileGetUserProfilesResultCount](xblprofilegetuserprofilesresultcount.md) to get the count of returned profiles and then call [XblProfileGetUserProfilesResult](xblprofilegetuserprofilesresult.md) inside the AsyncBlock callback or after the AsyncBlock is complete.
  
## REST Call  
  
Calls V2 GET /users/batch/profile/settings
  
## Requirements  
  
**Header:** profile_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[profile_c](../profile_c_members.md)  
  
  