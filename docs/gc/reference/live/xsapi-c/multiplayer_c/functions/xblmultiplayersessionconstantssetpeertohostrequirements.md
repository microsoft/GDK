---
author: joannaleecy
title: XblMultiplayerSessionConstantsSetPeerToHostRequirements
description: These thresholds apply to each connection from a host candidate. This can only be set when creating a new session.
kindex: XblMultiplayerSessionConstantsSetPeerToHostRequirements
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# XblMultiplayerSessionConstantsSetPeerToHostRequirements  

These thresholds apply to each connection from a host candidate. This can only be set when creating a new session.  

## Syntax  
  
```cpp
HRESULT XblMultiplayerSessionConstantsSetPeerToHostRequirements(  
         XblMultiplayerSessionHandle handle,  
         XblMultiplayerPeerToHostRequirements requirements  
)  
```  
  
### Parameters  
  
*handle* &nbsp;&nbsp;\_In\_  
Type: [XblMultiplayerSessionHandle](../handles/xblmultiplayersessionhandle.md)  
  
Handle to the multiplayer session.  
  
*requirements* &nbsp;&nbsp;\_In\_  
Type: [XblMultiplayerPeerToHostRequirements](../structs/xblmultiplayerpeertohostrequirements.md)  
  
Object specifying the peer to host requirements for the session.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Requirements  
  
**Header:** multiplayer_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[multiplayer_c](../multiplayer_c_members.md)  
  
  