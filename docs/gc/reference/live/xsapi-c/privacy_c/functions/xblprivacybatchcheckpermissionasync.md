---
author: joannaleecy
title: XblPrivacyBatchCheckPermissionAsync
description: Check multiple permissions with multiple target users. Each permission will be checked against each target user.
kindex: XblPrivacyBatchCheckPermissionAsync
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# XblPrivacyBatchCheckPermissionAsync  

Check multiple permissions with multiple target users. Each permission will be checked against each target user.  

## Syntax  
  
```cpp
HRESULT XblPrivacyBatchCheckPermissionAsync(  
         XblContextHandle xblContextHandle,  
         XblPermission* permissionsToCheck,  
         size_t permissionsCount,  
         uint64_t* targetXuids,  
         size_t xuidsCount,  
         XblAnonymousUserType* targetAnonymousUserTypes,  
         size_t targetAnonymousUserTypesCount,  
         XAsyncBlock* async  
)  
```  
  
### Parameters  
  
*xblContextHandle* &nbsp;&nbsp;\_In\_  
Type: [XblContextHandle](../../types_c/handles/xblcontexthandle.md)  
  
Xbox live context for the local user.  
  
*permissionsToCheck* &nbsp;&nbsp;\_In\_reads\_(permissionsCount)  
Type: [XblPermission*](../enums/xblpermission.md)  
  
Array of permissions to check.  
  
*permissionsCount* &nbsp;&nbsp;\_In\_  
Type: size_t  
  
Number of entries in the permissions array.  
  
*targetXuids* &nbsp;&nbsp;\_In\_reads\_(xuidsCount)  
Type: uint64_t*  
  
Array of target Xuids to check permissions against.  
  
*xuidsCount* &nbsp;&nbsp;\_In\_  
Type: size_t  
  
Number of entries in the xuids array.  
  
*targetAnonymousUserTypes* &nbsp;&nbsp;\_In\_reads\_(targetAnonymousUserTypesCount)  
Type: [XblAnonymousUserType*](../enums/xblanonymoususertype.md)  
  
Array of anonymous user types to check permissions against.  
  
*targetAnonymousUserTypesCount* &nbsp;&nbsp;\_In\_  
Type: size_t  
  
Number of entries in the user types array.  
  
*async* &nbsp;&nbsp;\_In\_  
Type: XAsyncBlock*  
  
The AsyncBlock for this operation.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Remarks  
  
Call [XblPrivacyBatchCheckPermissionResultSize](xblprivacybatchcheckpermissionresultsize.md) and [XblPrivacyBatchCheckPermissionResult](xblprivacybatchcheckpermissionresult.md) upon completion to get result.
  
## Requirements  
  
**Header:** privacy_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[privacy_c](../privacy_c_members.md)  
  
  