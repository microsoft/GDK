---
author: joannaleecy
title: XblMultiplayerSessionSubscribedChangeTypes
description: Returns an OR'd set of XblMultiplayerSessionChangeTypes values representing the aspects of the session that the current xboxlivecontext is subscribed to, of XblMultiplayerSessionChangeTypes::None if there is none.
kindex: XblMultiplayerSessionSubscribedChangeTypes
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# XblMultiplayerSessionSubscribedChangeTypes  

Returns an OR'd set of XblMultiplayerSessionChangeTypes values representing the aspects of the session that the current xboxlivecontext is subscribed to, of XblMultiplayerSessionChangeTypes::None if there is none.  

## Syntax  
  
```cpp
XblMultiplayerSessionChangeTypes XblMultiplayerSessionSubscribedChangeTypes(  
         XblMultiplayerSessionHandle handle  
)  
```  
  
### Parameters  
  
*handle* &nbsp;&nbsp;\_In\_  
Type: [XblMultiplayerSessionHandle](../handles/xblmultiplayersessionhandle.md)  
  
Handle to the multiplayer session.  
  
  
### Return value  
Type: XblMultiplayerSessionChangeTypes
  
An OR'd set of XblMultiplayerSessionChangeTypes values representing the aspects of the session.
  
## Requirements  
  
**Header:** multiplayer_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[multiplayer_c](../multiplayer_c_members.md)  
  
  