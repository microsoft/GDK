---
author: joannaleecy
title: XblMultiplayerSessionGetRoleByName
description: Fetches the XblMultiplayerRole object by role type name and role name.
kindex: XblMultiplayerSessionGetRoleByName
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# XblMultiplayerSessionGetRoleByName  

Fetches the XblMultiplayerRole object by role type name and role name.  

## Syntax  
  
```cpp
HRESULT XblMultiplayerSessionGetRoleByName(  
         XblMultiplayerSessionHandle handle,  
         const char* roleTypeName,  
         const char* roleName,  
         const XblMultiplayerRole** role  
)  
```  
  
### Parameters  
  
*handle* &nbsp;&nbsp;\_In\_  
Type: [XblMultiplayerSessionHandle](../handles/xblmultiplayersessionhandle.md)  
  
Handle to the multiplayer session.  
  
*roleTypeName* &nbsp;&nbsp;\_In\_z\_  
Type: char*  
  
Name of the role type the role belongs to.  
  
*roleName* &nbsp;&nbsp;\_In\_z\_  
Type: char*  
  
Name of the role.  
  
*role* &nbsp;&nbsp;\_Out\_  
Type: [XblMultiplayerRole**](../structs/xblmultiplayerrole.md)  
  
Passes back a pointer to the role object with info about the role. The memory for the pointer will remain valid for the life of the XblMultiplayerSessionHandle object until it is closed. If no such role exists, nullptr will be passed back.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Remarks  
  
Note that newly created sessions will not have role info populated until the XblMultiplayerWriteSessionAsync is called.
  
## Requirements  
  
**Header:** multiplayer_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[multiplayer_c](../multiplayer_c_members.md)  
  
  