---
author: joannaleecy
title: XblMultiplayerSessionReferenceToUriPath
description: Returns the URI path representation of a session reference.
kindex: XblMultiplayerSessionReferenceToUriPath
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
quality: good
applies-to: pc-gdk
---

# XblMultiplayerSessionReferenceToUriPath  

Returns the URI path representation of a session reference.  

## Syntax  
  
```cpp
HRESULT XblMultiplayerSessionReferenceToUriPath(  
         const XblMultiplayerSessionReference* sessionReference,  
         XblMultiplayerSessionReferenceUri* sessionReferenceUri  
)  
```  
  
### Parameters  
  
*sessionReference* &nbsp;&nbsp;\_In\_  
Type: [XblMultiplayerSessionReference*](../structs/xblmultiplayersessionreference.md)  
  
A session reference.  
  
*sessionReferenceUri* &nbsp;&nbsp;\_Out\_  
Type: [XblMultiplayerSessionReferenceUri*](../structs/xblmultiplayersessionreferenceuri.md)  
  
Passes back the URI representation of the session reference.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Requirements  
  
**Header:** multiplayer_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[multiplayer_c](../multiplayer_c_members.md)  
  
  