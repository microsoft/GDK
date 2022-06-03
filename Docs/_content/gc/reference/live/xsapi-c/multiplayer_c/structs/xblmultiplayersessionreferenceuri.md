---
author: joannaleecy
title: XblMultiplayerSessionReferenceUri
description: Represents a URI path representation of a session reference.
kindex: XblMultiplayerSessionReferenceUri
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
quality: good
applies-to: pc-gdk
---

# XblMultiplayerSessionReferenceUri  

Represents a URI path representation of a session reference.  

## Syntax  
  
```cpp
typedef struct XblMultiplayerSessionReferenceUri {  
    char value[XBL_MULTIPLAYER_SESSION_REFERENCE_URI_MAX_LENGTH];  
} XblMultiplayerSessionReferenceUri  
```
  
### Members  
  
*value*  
Type: char[XBL_MULTIPLAYER_SESSION_REFERENCE_URI_MAX_LENGTH]  
  
The URI path.
  
## Remarks  
  
The format of the URI path is `/serviceconfigs/{scid}/sessiontemplates/{session-template-name}/sessions/{session-name}`, where `{scid}` is the service configuration ID specific to the title.
  
## Argument of
  
[XblMultiplayerSessionReferenceToUriPath](../functions/xblmultiplayersessionreferencetouripath.md)
  
## Requirements  
  
**Header:** multiplayer_c.h
  
## See also  
[multiplayer_c](../multiplayer_c_members.md)  
  
  