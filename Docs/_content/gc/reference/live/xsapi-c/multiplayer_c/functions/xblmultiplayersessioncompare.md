---
author: joannaleecy
title: XblMultiplayerSessionCompare
description: Checks the deltas between 2 sessions and returns an Or'ed MultiplayerSessionChangeType. Useful to compare a session object passed to XblMultiplayerWriteSessionAsync with the session object returned.
kindex: XblMultiplayerSessionCompare
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblMultiplayerSessionCompare  

Checks the deltas between 2 sessions and returns an Or'ed MultiplayerSessionChangeType. Useful to compare a session object passed to XblMultiplayerWriteSessionAsync with the session object returned.  

## Syntax  
  
```cpp
XblMultiplayerSessionChangeTypes XblMultiplayerSessionCompare(  
         XblMultiplayerSessionHandle currentSessionHandle,  
         XblMultiplayerSessionHandle oldSessionHandle  
)  
```  
  
### Parameters  
  
*currentSessionHandle* &nbsp;&nbsp;\_In\_  
Type: [XblMultiplayerSessionHandle](../handles/xblmultiplayersessionhandle.md)  
  
A session to compare to the other.  
  
*oldSessionHandle* &nbsp;&nbsp;\_In\_  
Type: [XblMultiplayerSessionHandle](../handles/xblmultiplayersessionhandle.md)  
  
A session to compare to the other.  
  
  
### Return value  
Type: XblMultiplayerSessionChangeTypes
  
The Or'ed change types for a multiplayer session.
  
## Requirements  
  
**Header:** multiplayer_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[multiplayer_c](../multiplayer_c_members.md)  
  
  