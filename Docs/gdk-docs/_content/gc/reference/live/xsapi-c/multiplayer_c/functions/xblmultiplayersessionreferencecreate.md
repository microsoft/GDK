---
author: joannaleecy
title: XblMultiplayerSessionReferenceCreate
description: Creates an [XblMultiplayerSessionReference](../structs/xblmultiplayersessionreference.md) object from a service configuration ID (SCID), session template name, and session name.
kindex: XblMultiplayerSessionReferenceCreate
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
quality: good
applies-to: pc-gdk
---

# XblMultiplayerSessionReferenceCreate  

Creates an [XblMultiplayerSessionReference](../structs/xblmultiplayersessionreference.md) object from a service configuration ID (SCID), session template name, and session name.  

## Syntax  
  
```cpp
XblMultiplayerSessionReference XblMultiplayerSessionReferenceCreate(  
         const char* scid,  
         const char* sessionTemplateName,  
         const char* sessionName  
)  
```  
  
### Parameters  
  
*scid* &nbsp;&nbsp;\_In\_z\_  
Type: char*  
  
The SCID that the session is a part of. The SCID is case-sensitive, so paste it directly from Partner Center.  
  
*sessionTemplateName* &nbsp;&nbsp;\_In\_z\_  
Type: char*  
  
The name of the session template.  
  
*sessionName* &nbsp;&nbsp;\_In\_z\_  
Type: char*  
  
The name of the session.  
  
  
### Return value  
Type: XblMultiplayerSessionReference
  
A reference to the multiplayer session.
  
## Requirements  
  
**Header:** multiplayer_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[multiplayer_c](../multiplayer_c_members.md)  
  
  