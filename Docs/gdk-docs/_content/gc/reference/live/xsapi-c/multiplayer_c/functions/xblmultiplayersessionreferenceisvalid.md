---
author: joannaleecy
title: XblMultiplayerSessionReferenceIsValid
description: Verifies whether an [XblMultiplayerSessionReference](../structs/xblmultiplayersessionreference.md) object is well formed.
kindex: XblMultiplayerSessionReferenceIsValid
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
quality: good
applies-to: pc-gdk
---

# XblMultiplayerSessionReferenceIsValid  

Verifies whether an [XblMultiplayerSessionReference](../structs/xblmultiplayersessionreference.md) object is well formed.  

## Syntax  
  
```cpp
bool XblMultiplayerSessionReferenceIsValid(  
         const XblMultiplayerSessionReference* sessionReference  
)  
```  
  
### Parameters  
  
*sessionReference* &nbsp;&nbsp;\_In\_  
Type: [XblMultiplayerSessionReference*](../structs/xblmultiplayersessionreference.md)  
  
The session reference.  
  
  
### Return value  
Type: bool
  
Returns true if session is well formed, false if session is not well formed.
  
## Remarks  
  
An [XblMultiplayerSessionReference](../structs/xblmultiplayersessionreference.md) object is considered to be well formed if none of the fields are empty strings.
  
## Requirements  
  
**Header:** multiplayer_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[multiplayer_c](../multiplayer_c_members.md)  
  
  