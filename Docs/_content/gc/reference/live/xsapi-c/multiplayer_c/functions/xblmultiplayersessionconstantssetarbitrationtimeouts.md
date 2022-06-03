---
author: joannaleecy
title: XblMultiplayerSessionConstantsSetArbitrationTimeouts
description: Sets the arbitration timeouts for the session. This can only be set when creating a new session.
kindex: XblMultiplayerSessionConstantsSetArbitrationTimeouts
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblMultiplayerSessionConstantsSetArbitrationTimeouts  

Sets the arbitration timeouts for the session. This can only be set when creating a new session.  

## Syntax  
  
```cpp
HRESULT XblMultiplayerSessionConstantsSetArbitrationTimeouts(  
         XblMultiplayerSessionHandle handle,  
         uint64_t arbitrationTimeout,  
         uint64_t forfeitTimeout  
)  
```  
  
### Parameters  
  
*handle* &nbsp;&nbsp;\_In\_  
Type: [XblMultiplayerSessionHandle](../handles/xblmultiplayersessionhandle.md)  
  
Handle to the multiplayer session.  
  
*arbitrationTimeout* &nbsp;&nbsp;\_In\_  
Type: uint64_t  
  
The timeout for arbitration, in milliseconds representing the point at which results are finalized.  
  
*forfeitTimeout* &nbsp;&nbsp;\_In\_  
Type: uint64_t  
  
The timeout for forfeit, in milliseconds representing the point at which, if the session has no active users, the match is canceled.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Requirements  
  
**Header:** multiplayer_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[multiplayer_c](../multiplayer_c_members.md)  
  
  