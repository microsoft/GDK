---
author: joannaleecy
title: XblMultiplayerGetSessionAsync
description: Gets an existing session object with all its attributes from the server.
kindex: XblMultiplayerGetSessionAsync
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblMultiplayerGetSessionAsync  

Gets an existing session object with all its attributes from the server.  

## Syntax  
  
```cpp
HRESULT XblMultiplayerGetSessionAsync(  
         XblContextHandle xblContext,  
         const XblMultiplayerSessionReference* sessionReference,  
         XAsyncBlock* async  
)  
```  
  
### Parameters  
  
*xblContext* &nbsp;&nbsp;\_In\_  
Type: [XblContextHandle](../../types_c/handles/xblcontexthandle.md)  
  
Xbox live context for the local user.  
  
*sessionReference* &nbsp;&nbsp;\_In\_  
Type: [XblMultiplayerSessionReference*](../structs/xblmultiplayersessionreference.md)  
  
A XblMultiplayerSessionReference object containing identifying information for the session.  
  
*async* &nbsp;&nbsp;\_In\_  
Type: XAsyncBlock*  
  
The AsyncBlock for this operation.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## REST Call  
  
Calls V102 GET /serviceconfigs/{serviceConfigurationId}/sessionTemplates/{sessiontemplateName}/sessions/{sessionName}
  
## Requirements  
  
**Header:** multiplayer_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[multiplayer_c](../multiplayer_c_members.md)  
  
  