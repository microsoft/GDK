---
author: joannaleecy
title: XblPrivacyCheckPermissionAsync
description: Check a single permission with a single target user.
kindex: XblPrivacyCheckPermissionAsync
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# XblPrivacyCheckPermissionAsync  

Check a single permission with a single target user.  

## Syntax  
  
```cpp
HRESULT XblPrivacyCheckPermissionAsync(  
         XblContextHandle xblContextHandle,  
         XblPermission permissionToCheck,  
         uint64_t targetXuid,  
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
  
*targetXuid* &nbsp;&nbsp;\_In\_  
Type: uint64_t  
  
The target user's Xuid for validation.  
  
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
  
  