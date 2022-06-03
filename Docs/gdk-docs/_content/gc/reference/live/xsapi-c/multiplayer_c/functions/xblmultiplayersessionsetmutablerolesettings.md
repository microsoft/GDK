---
author: joannaleecy
title: XblMultiplayerSessionSetMutableRoleSettings
description: Sets the max member count and/or target member counts for a role.
kindex: XblMultiplayerSessionSetMutableRoleSettings
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# XblMultiplayerSessionSetMutableRoleSettings  

Sets the max member count and/or target member counts for a role.  

## Syntax  
  
```cpp
HRESULT XblMultiplayerSessionSetMutableRoleSettings(  
         XblMultiplayerSessionHandle handle,  
         const char* roleTypeName,  
         const char* roleName,  
         uint32_t* maxMemberCount,  
         uint32_t* targetMemberCount  
)  
```  
  
### Parameters  
  
*handle* &nbsp;&nbsp;\_In\_  
Type: [XblMultiplayerSessionHandle](../handles/xblmultiplayersessionhandle.md)  
  
Handle to the multiplayer session.  
  
*roleTypeName* &nbsp;&nbsp;\_In\_z\_  
Type: char*  
  
Name of the role type for the role being modified.  
  
*roleName* &nbsp;&nbsp;\_In\_z\_  
Type: char*  
  
Name of the role to modify.  
  
*maxMemberCount* &nbsp;&nbsp;\_In\_opt\_  
Type: uint32_t*  
  
The maximum number of members that can have the role.  
  
*targetMemberCount* &nbsp;&nbsp;\_In\_opt\_  
Type: uint32_t*  
  
The target number of members for the role.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Remarks  
  
Only the session owner can modify role settings and only those that are mutable (see XblMultiplayerRoleType.MutableRoleSettings). In your session template, you also need to set 'hasOwners' capability and 'ownerManaged' to true for the specific role type that you want to modify.
  
## Requirements  
  
**Header:** multiplayer_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[multiplayer_c](../multiplayer_c_members.md)  
  
  