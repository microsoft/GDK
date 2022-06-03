---
author: joannaleecy
title: XblMultiplayerSessionPropertiesSetTurnCollection
description: Sets the collection of session MemberIds indicating whose turn it is.
kindex: XblMultiplayerSessionPropertiesSetTurnCollection
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# XblMultiplayerSessionPropertiesSetTurnCollection  

Sets the collection of session MemberIds indicating whose turn it is.  

## Syntax  
  
```cpp
HRESULT XblMultiplayerSessionPropertiesSetTurnCollection(  
         XblMultiplayerSessionHandle handle,  
         const uint32_t* turnCollectionMemberIds,  
         size_t turnCollectionMemberIdsCount  
)  
```  
  
### Parameters  
  
*handle* &nbsp;&nbsp;\_In\_  
Type: [XblMultiplayerSessionHandle](../handles/xblmultiplayersessionhandle.md)  
  
Handle to the multiplayer session.  
  
*turnCollectionMemberIds* &nbsp;&nbsp;\_In\_  
Type: uint32_t*  
  
Collection of MemberIds whose turn it is.  
  
*turnCollectionMemberIdsCount* &nbsp;&nbsp;\_In\_  
Type: size_t  
  
The size of the turnCollectionMemberIds array.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Requirements  
  
**Header:** multiplayer_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[multiplayer_c](../multiplayer_c_members.md)  
  
  