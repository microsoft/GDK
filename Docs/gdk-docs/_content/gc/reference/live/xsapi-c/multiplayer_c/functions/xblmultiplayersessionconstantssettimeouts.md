---
author: joannaleecy
title: XblMultiplayerSessionConstantsSetTimeouts
description: Sets the timeouts for the session. This can only be set when creating a new session.
kindex: XblMultiplayerSessionConstantsSetTimeouts
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblMultiplayerSessionConstantsSetTimeouts  

Sets the timeouts for the session. This can only be set when creating a new session.  

## Syntax  
  
```cpp
HRESULT XblMultiplayerSessionConstantsSetTimeouts(  
         XblMultiplayerSessionHandle handle,  
         uint64_t memberReservedTimeout,  
         uint64_t memberInactiveTimeout,  
         uint64_t memberReadyTimeout,  
         uint64_t sessionEmptyTimeout  
)  
```  
  
### Parameters  
  
*handle* &nbsp;&nbsp;\_In\_  
Type: [XblMultiplayerSessionHandle](../handles/xblmultiplayersessionhandle.md)  
  
Handle to the multiplayer session.  
  
*memberReservedTimeout* &nbsp;&nbsp;\_In\_  
Type: uint64_t  
  
The timeout for a member reservation, in milliseconds. A value of 0 is allowed and indicates an immediate timeout. If the timeout is not specified, it is considered infinite.  
  
*memberInactiveTimeout* &nbsp;&nbsp;\_In\_  
Type: uint64_t  
  
The timeout for a member to be considered inactive, in milliseconds. A value of 0 is allowed and indicates an immediate timeout. If the timeout is not specified, it is considered infinite.  
  
*memberReadyTimeout* &nbsp;&nbsp;\_In\_  
Type: uint64_t  
  
The timeout for a member to be considered ready, in milliseconds. A value of 0 is allowed and indicates an immediate timeout. If the timeout is not specified, it is considered infinite.  
  
*sessionEmptyTimeout* &nbsp;&nbsp;\_In\_  
Type: uint64_t  
  
The timeout for an empty session, in milliseconds. A value of 0 is allowed and indicates an immediate timeout. If the timeout is not specified, it is considered infinite.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Requirements  
  
**Header:** multiplayer_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[multiplayer_c](../multiplayer_c_members.md)  
  
  