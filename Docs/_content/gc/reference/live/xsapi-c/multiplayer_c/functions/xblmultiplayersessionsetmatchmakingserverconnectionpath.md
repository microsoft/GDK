---
author: joannaleecy
title: XblMultiplayerSessionSetMatchmakingServerConnectionPath
description: Forces a specific server connection string to be used, useful in preserveSession=always cases.
kindex: XblMultiplayerSessionSetMatchmakingServerConnectionPath
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# XblMultiplayerSessionSetMatchmakingServerConnectionPath  

Forces a specific server connection string to be used, useful in preserveSession=always cases.  

## Syntax  
  
```cpp
void XblMultiplayerSessionSetMatchmakingServerConnectionPath(  
         XblMultiplayerSessionHandle handle,  
         const char* serverConnectionPath  
)  
```  
  
### Parameters  
  
*handle* &nbsp;&nbsp;\_In\_  
Type: [XblMultiplayerSessionHandle](../handles/xblmultiplayersessionhandle.md)  
  
Handle to the multiplayer session.  
  
*serverConnectionPath* &nbsp;&nbsp;\_In\_z\_  
Type: char*  
  
The server connection path. Setting this path can be useful when the session is preserved.  
  
  
### Return value  
Type: void
  

  
## Requirements  
  
**Header:** multiplayer_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[multiplayer_c](../multiplayer_c_members.md)  
  
  