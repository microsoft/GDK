---
author: joannaleecy
title: XblMultiplayerSessionChangedHandler
description: A callback method to be called when a session changes.
kindex: XblMultiplayerSessionChangedHandler
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblMultiplayerSessionChangedHandler  

A callback method to be called when a session changes.  

## Syntax  
  
```cpp
void XblMultiplayerSessionChangedHandler(  
         void* context,  
         XblMultiplayerSessionChangeEventArgs args  
)  
```  
  
### Parameters  
  
*context* &nbsp;&nbsp;\_In\_opt\_  
Type: void*  
  
Caller context to be passed the handler.  
  
*args* &nbsp;&nbsp;\_In\_  
Type: [XblMultiplayerSessionChangeEventArgs](../structs/xblmultiplayersessionchangeeventargs.md)  
  
Arguments to be passed the handler.  
  
  
### Return value  
Type: void
  

  
## Requirements  
  
**Header:** multiplayer_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[multiplayer_c](../multiplayer_c_members.md)  
  
  