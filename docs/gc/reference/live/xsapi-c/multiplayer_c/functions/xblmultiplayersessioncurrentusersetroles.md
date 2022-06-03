---
author: joannaleecy
title: XblMultiplayerSessionCurrentUserSetRoles
description: Set the role info of the local member. The member must first be joined to the session.
kindex: XblMultiplayerSessionCurrentUserSetRoles
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblMultiplayerSessionCurrentUserSetRoles  

Set the role info of the local member. The member must first be joined to the session.  

## Syntax  
  
```cpp
HRESULT XblMultiplayerSessionCurrentUserSetRoles(  
         XblMultiplayerSessionHandle handle,  
         const XblMultiplayerSessionMemberRole* roles,  
         size_t rolesCount  
)  
```  
  
### Parameters  
  
*handle* &nbsp;&nbsp;\_In\_  
Type: [XblMultiplayerSessionHandle](../handles/xblmultiplayersessionhandle.md)  
  
Handle to the multiplayer session.  
  
*roles* &nbsp;&nbsp;\_In\_  
Type: [XblMultiplayerSessionMemberRole*](../structs/xblmultiplayersessionmemberrole.md)  
  
Indicates a collection of roles for the user.  
  
*rolesCount* &nbsp;&nbsp;\_In\_  
Type: size_t  
  
The size of the role array.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Requirements  
  
**Header:** multiplayer_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[multiplayer_c](../multiplayer_c_members.md)  
  
  