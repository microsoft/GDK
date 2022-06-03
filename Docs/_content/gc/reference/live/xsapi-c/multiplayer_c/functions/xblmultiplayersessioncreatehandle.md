---
author: joannaleecy
title: XblMultiplayerSessionCreateHandle
description: Creates a new local multiplayer session.
kindex: XblMultiplayerSessionCreateHandle
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# XblMultiplayerSessionCreateHandle  

Creates a new local multiplayer session.  

## Syntax  
  
```cpp
XblMultiplayerSessionHandle XblMultiplayerSessionCreateHandle(  
         uint64_t xuid,  
         const XblMultiplayerSessionReference* sessionReference,  
         const XblMultiplayerSessionInitArgs* initArgs  
)  
```  
  
### Parameters  
  
*xuid* &nbsp;&nbsp;\_In\_  
Type: uint64_t  
  
The Xbox User ID of the user who is creating this session.  
  
*sessionReference* &nbsp;&nbsp;\_In\_opt\_  
Type: [XblMultiplayerSessionReference*](../structs/xblmultiplayersessionreference.md)  
  
A reference that uniquely identifies the session.  
  
*initArgs* &nbsp;&nbsp;\_In\_opt\_  
Type: [XblMultiplayerSessionInitArgs*](../structs/xblmultiplayersessioninitargs.md)  
  
Additional args used to initialize the session. Must also include the sessionReference if these are included.  
  
  
### Return value  
Type: XblMultiplayerSessionHandle
  
Handle to a local multiplayer session.
  
## Remarks  
  
You must call [XblMultiplayerWriteSessionAsync](xblmultiplayerwritesessionasync.md) after this to write batched local changes to the service. If this is called without XblMultiplayerWriteSessionAsync, this will only create a local session object, but does not commit it to the service. When the local session object is no longer needed, call [XblMultiplayerSessionCloseHandle](xblmultiplayersessionclosehandle.md).
  
## Requirements  
  
**Header:** multiplayer_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[multiplayer_c](../multiplayer_c_members.md)  
  
  