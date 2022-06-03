---
author: joannaleecy
title: XblMultiplayerSessionRoleTypes
description: A set of role types associated with this session.
kindex: XblMultiplayerSessionRoleTypes
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# XblMultiplayerSessionRoleTypes  

A set of role types associated with this session.  

## Syntax  
  
```cpp
HRESULT XblMultiplayerSessionRoleTypes(  
         XblMultiplayerSessionHandle handle,  
         const XblMultiplayerRoleType** roleTypes,  
         size_t* roleTypesCount  
)  
```  
  
### Parameters  
  
*handle* &nbsp;&nbsp;\_In\_  
Type: [XblMultiplayerSessionHandle](../handles/xblmultiplayersessionhandle.md)  
  
Handle to the multiplayer session.  
  
*roleTypes* &nbsp;&nbsp;\_Out\_  
Type: [XblMultiplayerRoleType**](../structs/xblmultiplayerroletype.md)  
  
Passes back a pointer to an array of roleTypes. The memory for the pointer remains valid for the life of the XblMultiplayerSessionHandle object until it is closed.  
  
*roleTypesCount* &nbsp;&nbsp;\_Out\_  
Type: size_t*  
  
Passes back the number of roles types in the roleTypes array.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Requirements  
  
**Header:** multiplayer_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[multiplayer_c](../multiplayer_c_members.md)  
  
  