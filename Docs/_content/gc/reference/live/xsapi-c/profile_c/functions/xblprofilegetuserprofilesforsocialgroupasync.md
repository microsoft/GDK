---
author: joannaleecy
title: XblProfileGetUserProfilesForSocialGroupAsync
description: Gets profiles for users in a specified social group.
kindex: XblProfileGetUserProfilesForSocialGroupAsync
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblProfileGetUserProfilesForSocialGroupAsync  

Gets profiles for users in a specified social group.  

## Syntax  
  
```cpp
HRESULT XblProfileGetUserProfilesForSocialGroupAsync(  
         XblContextHandle xboxLiveContext,  
         const char* socialGroup,  
         XAsyncBlock* async  
)  
```  
  
### Parameters  
  
*xboxLiveContext* &nbsp;&nbsp;\_In\_  
Type: [XblContextHandle](../../types_c/handles/xblcontexthandle.md)  
  
An xbox live context handle created with XblContextCreateHandle.  
  
*socialGroup* &nbsp;&nbsp;\_In\_z\_  
Type: char*  
  
The UTF-8 encoded name of the social group of users to search. Options are "Favorites" and "People".  
  
*async* &nbsp;&nbsp;\_In\_  
Type: XAsyncBlock*  
  
Caller allocated AsyncBlock.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Remarks  
  
To get the result, first call [XblProfileGetUserProfilesForSocialGroupResultCount](xblprofilegetuserprofilesforsocialgroupresultcount.md) to get the count of returned profiles and then call [XblProfileGetUserProfilesForSocialGroupResult](xblprofilegetuserprofilesforsocialgroupresult.md) inside the AsyncBlock callback or after the AsyncBlock is complete.
  
## REST Call  
  
Calls V2 GET /users/{userId}/profile/settings/people/{socialGroup}
  
## Requirements  
  
**Header:** profile_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[profile_c](../profile_c_members.md)  
  
  