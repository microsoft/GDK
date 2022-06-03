---
author: joannaleecy
title: XblMultiplayerSessionConstantsSetPeerToPeerRequirements
description: These thresholds apply to each pairwise connection for all members in a session. This can only be set when creating a new session.
kindex: XblMultiplayerSessionConstantsSetPeerToPeerRequirements
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# XblMultiplayerSessionConstantsSetPeerToPeerRequirements  

These thresholds apply to each pairwise connection for all members in a session. This can only be set when creating a new session.  

## Syntax  
  
```cpp
HRESULT XblMultiplayerSessionConstantsSetPeerToPeerRequirements(  
         XblMultiplayerSessionHandle handle,  
         XblMultiplayerPeerToPeerRequirements requirements  
)  
```  
  
### Parameters  
  
*handle* &nbsp;&nbsp;\_In\_  
Type: [XblMultiplayerSessionHandle](../handles/xblmultiplayersessionhandle.md)  
  
Handle to the multiplayer session.  
  
*requirements* &nbsp;&nbsp;\_In\_  
Type: [XblMultiplayerPeerToPeerRequirements](../structs/xblmultiplayerpeertopeerrequirements.md)  
  
Object specifying the peer to peer requirements for the session.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Requirements  
  
**Header:** multiplayer_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[multiplayer_c](../multiplayer_c_members.md)  
  
  