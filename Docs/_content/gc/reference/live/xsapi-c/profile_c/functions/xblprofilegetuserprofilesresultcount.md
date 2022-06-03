---
author: joannaleecy
title: XblProfileGetUserProfilesResultCount
description: Gets the number of profiles from a completed get XblProfileGetUserProfilesAsync operation.
kindex: XblProfileGetUserProfilesResultCount
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblProfileGetUserProfilesResultCount  

Gets the number of profiles from a completed get XblProfileGetUserProfilesAsync operation.  

## Syntax  
  
```cpp
HRESULT XblProfileGetUserProfilesResultCount(  
         XAsyncBlock* async,  
         size_t* profileCount  
)  
```  
  
### Parameters  
  
*async* &nbsp;&nbsp;\_In\_  
Type: XAsyncBlock*  
  
The same AsyncBlock that was passed to XblProfileGetUserProfilesAsync.  
  
*profileCount* &nbsp;&nbsp;\_Out\_  
Type: size_t*  
  
Passes back the number of profiles.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Requirements  
  
**Header:** profile_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[profile_c](../profile_c_members.md)  
  
  