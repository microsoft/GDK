---
author: joannaleecy
title: XblPermissionCheckResult
description: Struct describing the result of a permission check request.
kindex: XblPermissionCheckResult
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
quality: good
applies-to: pc-gdk
---

# XblPermissionCheckResult  

Struct describing the result of a permission check request.  

## Syntax  
  
```cpp
typedef struct XblPermissionCheckResult {  
    bool isAllowed;  
    uint64_t targetXuid;  
    XblAnonymousUserType targetUserType;  
    XblPermission permissionRequested;  
    XblPermissionDenyReasonDetails* reasons;  
    size_t reasonsCount;  
} XblPermissionCheckResult  
```
  
### Members  
  
*isAllowed*  
Type: bool  
  
Value indicating whether or not permission to take the requested action is granted.
  
*targetXuid*  
Type: uint64_t  
  
Target Xuid for the permission check request. Will be 0 if the permission check was for an anonymous user.
  
*targetUserType*  
Type: [XblAnonymousUserType](../enums/xblanonymoususertype.md)  
  
The class of anonymous user the permission check was for. Will be XblAnonymousUserType::Unknown if the permission check was for an Xbox Live user.
  
*permissionRequested*  
Type: [XblPermission](../enums/xblpermission.md)  
  
The permission that was requested.
  
*reasons*  
Type: [XblPermissionDenyReasonDetails*](xblpermissiondenyreasondetails.md)  
  
Array of reasons why permission was denied. Null when isAllowed is true.
  
*reasonsCount*  
Type: size_t  
  
Number of entries in the reasons array.
  
## Argument of
  
[XblPrivacyCheckPermissionResult](../functions/xblprivacycheckpermissionresult.md)  
[XblPrivacyCheckPermissionForAnonymousUserResult](../functions/xblprivacycheckpermissionforanonymoususerresult.md)  
[XblPrivacyBatchCheckPermissionResult](../functions/xblprivacybatchcheckpermissionresult.md)
  
## Requirements  
  
**Header:** privacy_c.h
  
## See also  
[privacy_c](../privacy_c_members.md)  
  
  