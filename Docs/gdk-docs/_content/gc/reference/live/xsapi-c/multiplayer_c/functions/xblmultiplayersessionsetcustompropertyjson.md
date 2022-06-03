---
author: joannaleecy
title: XblMultiplayerSessionSetCustomPropertyJson
description: Set a session custom property to the specified JSON string.
kindex: XblMultiplayerSessionSetCustomPropertyJson
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# XblMultiplayerSessionSetCustomPropertyJson  

Set a session custom property to the specified JSON string.  

## Syntax  
  
```cpp
HRESULT XblMultiplayerSessionSetCustomPropertyJson(  
         XblMultiplayerSessionHandle handle,  
         const char* name,  
         const char* valueJson  
)  
```  
  
### Parameters  
  
*handle* &nbsp;&nbsp;\_In\_  
Type: [XblMultiplayerSessionHandle](../handles/xblmultiplayersessionhandle.md)  
  
Handle to the multiplayer session.  
  
*name* &nbsp;&nbsp;\_In\_z\_  
Type: char*  
  
The name of the property to set.  
  
*valueJson* &nbsp;&nbsp;\_In\_z\_  
Type: char*  
  
The JSON value to assign to the property. This must be a valid JSON string. Examples include "\"JsonString\"", "{\"name\":\"A\"}", or "true".  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Requirements  
  
**Header:** multiplayer_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[multiplayer_c](../multiplayer_c_members.md)  
  
  