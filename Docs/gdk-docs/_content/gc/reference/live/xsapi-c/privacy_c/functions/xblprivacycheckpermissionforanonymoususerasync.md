---
author: joannaleecy
title: XblPrivacyCheckPermissionForAnonymousUserAsync
description: Check a single permission for class of anonymous users.
kindex: XblPrivacyCheckPermissionForAnonymousUserAsync
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# XblPrivacyCheckPermissionForAnonymousUserAsync  

Check a single permission for class of anonymous users.  

## Syntax  
  
```cpp
HRESULT XblPrivacyCheckPermissionForAnonymousUserAsync(  
         XblContextHandle xblContextHandle,  
         XblPermission permissionToCheck,  
         XblAnonymousUserType userType,  
         XAsyncBlock* async  
)  
```  
  
### Parameters  
  
*xblContextHandle* &nbsp;&nbsp;\_In\_  
Type: [XblContextHandle](../../types_c/handles/xblcontexthandle.md)  
  
Xbox live context for the local user.  
  
*permissionToCheck* &nbsp;&nbsp;\_In\_  
Type: [XblPermission](../enums/xblpermission.md)  
  
The permission to check.  
  
*userType* &nbsp;&nbsp;\_In\_  
Type: [XblAnonymousUserType](../enums/xblanonymoususertype.md)  
  
The class of anonymous user to check permission for.  
  
*async* &nbsp;&nbsp;\_In\_  
Type: XAsyncBlock*  
  
The AsyncBlock for this operation.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Remarks  
  
Call [XblPrivacyCheckPermissionResultSize](xblprivacycheckpermissionresultsize.md) and [XblPrivacyCheckPermissionResult](xblprivacycheckpermissionresult.md) upon completion to get the result.
  
## Requirements  
  
**Header:** privacy_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[privacy_c](../privacy_c_members.md)  
  
  