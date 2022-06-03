---
author: joannaleecy
title: XblMultiplayerQuerySessionsResultCount
description: Gets the number of sessions that matched a session query.
kindex: XblMultiplayerQuerySessionsResultCount
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# XblMultiplayerQuerySessionsResultCount  

Gets the number of sessions that matched a session query.  

## Syntax  
  
```cpp
HRESULT XblMultiplayerQuerySessionsResultCount(  
         XAsyncBlock* async,  
         size_t* sessionCount  
)  
```  
  
### Parameters  
  
*async* &nbsp;&nbsp;\_In\_  
Type: XAsyncBlock*  
  
The AsyncBlock for this operation.  
  
*sessionCount* &nbsp;&nbsp;\_Out\_  
Type: size_t*  
  
Passes back the number of matching sessions.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Requirements  
  
**Header:** multiplayer_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[multiplayer_c](../multiplayer_c_members.md)  
  
  