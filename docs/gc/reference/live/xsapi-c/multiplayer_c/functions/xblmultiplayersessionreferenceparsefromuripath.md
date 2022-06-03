---
author: joannaleecy
title: XblMultiplayerSessionReferenceParseFromUriPath
description: Returns the session reference parsed from a URI.
kindex: XblMultiplayerSessionReferenceParseFromUriPath
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
quality: good
applies-to: pc-gdk
---

# XblMultiplayerSessionReferenceParseFromUriPath  

Returns the session reference parsed from a URI.  

## Syntax  
  
```cpp
HRESULT XblMultiplayerSessionReferenceParseFromUriPath(  
         const char* path,  
         XblMultiplayerSessionReference* sessionReference  
)  
```  
  
### Parameters  
  
*path* &nbsp;&nbsp;\_In\_  
Type: char*  
  
The URI path.  
  
*sessionReference* &nbsp;&nbsp;\_Out\_  
Type: [XblMultiplayerSessionReference*](../structs/xblmultiplayersessionreference.md)  
  
Passes back the session reference.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Requirements  
  
**Header:** multiplayer_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[multiplayer_c](../multiplayer_c_members.md)  
  
  