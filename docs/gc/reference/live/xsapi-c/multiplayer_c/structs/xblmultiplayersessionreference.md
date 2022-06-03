---
author: joannaleecy
title: XblMultiplayerSessionReference
description: Represents a reference to a multiplayer session.
kindex: XblMultiplayerSessionReference
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
quality: good
applies-to: pc-gdk
---

# XblMultiplayerSessionReference  

Represents a reference to a multiplayer session.  

## Syntax  
  
```cpp
typedef struct XblMultiplayerSessionReference {  
    char Scid[XBL_SCID_LENGTH];  
    char SessionTemplateName[XBL_MULTIPLAYER_SESSION_TEMPLATE_NAME_MAX_LENGTH];  
    char SessionName[XBL_MULTIPLAYER_SESSION_NAME_MAX_LENGTH];  
} XblMultiplayerSessionReference  
```
  
### Members  
  
*Scid*  
Type: char[XBL_SCID_LENGTH]  
  
The service configuration ID (SCID) specific to the title.
  
*SessionTemplateName*  
Type: char[XBL_MULTIPLAYER_SESSION_TEMPLATE_NAME_MAX_LENGTH]  
  
The name of the template for the session.
  
*SessionName*  
Type: char[XBL_MULTIPLAYER_SESSION_NAME_MAX_LENGTH]  
  
The name of the session.
  
## Requirements  
  
**Header:** multiplayer_c.h
  
## See also  
[multiplayer_c](../multiplayer_c_members.md)  
  
  