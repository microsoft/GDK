---
author: joannaleecy
title: XblMultiplayerSessionJoin
description: Joins the local user to the session, sets the user to active.
kindex: XblMultiplayerSessionJoin
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# XblMultiplayerSessionJoin  

Joins the local user to the session, sets the user to active.  

## Syntax  
  
```cpp
HRESULT XblMultiplayerSessionJoin(  
         XblMultiplayerSessionHandle handle,  
         const char* memberCustomConstantsJson,  
         bool initializeRequested,  
         bool joinWithActiveStatus  
)  
```  
  
### Parameters  
  
*handle* &nbsp;&nbsp;\_In\_  
Type: [XblMultiplayerSessionHandle](../handles/xblmultiplayersessionhandle.md)  
  
Handle to the multiplayer session.  
  
*memberCustomConstantsJson* &nbsp;&nbsp;\_In\_opt\_z\_  
Type: char*  
  
The custom constants to set for this member. This is the only time the member's constants can be set.  
  
*initializeRequested* &nbsp;&nbsp;\_In\_  
Type: bool  
  
True if the system should perform managed initialization, and false otherwise.  
  
*joinWithActiveStatus* &nbsp;&nbsp;\_In\_  
Type: bool  
  
True if player should join with active status.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Requirements  
  
**Header:** multiplayer_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[multiplayer_c](../multiplayer_c_members.md)  
  
  