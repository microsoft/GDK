---
author: joannaleecy
title: XblMultiplayerSessionSetInitializationSucceeded
description: This can only be set when creating a new session.
kindex: XblMultiplayerSessionSetInitializationSucceeded
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# XblMultiplayerSessionSetInitializationSucceeded  

This can only be set when creating a new session.  

## Syntax  
  
```cpp
void XblMultiplayerSessionSetInitializationSucceeded(  
         XblMultiplayerSessionHandle handle,  
         bool initializationSucceeded  
)  
```  
  
### Parameters  
  
*handle* &nbsp;&nbsp;\_In\_  
Type: [XblMultiplayerSessionHandle](../handles/xblmultiplayersessionhandle.md)  
  
Handle to the multiplayer session.  
  
*initializationSucceeded* &nbsp;&nbsp;\_In\_  
Type: bool  
  
True if initialization succeeded, and false otherwise.  
  
  
### Return value  
Type: void
  

  
## Requirements  
  
**Header:** multiplayer_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[multiplayer_c](../multiplayer_c_members.md)  
  
  