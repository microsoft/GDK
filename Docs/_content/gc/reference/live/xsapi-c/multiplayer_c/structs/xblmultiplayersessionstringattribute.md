---
author: joannaleecy
title: XblMultiplayerSessionStringAttribute
description: An associative attribute that can be attached to a multiplayer session search handle when it is created. Attribute names be lower-case alphanumeric, and start with a letter.
kindex: XblMultiplayerSessionStringAttribute
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
quality: good
applies-to: pc-gdk
---

# XblMultiplayerSessionStringAttribute  

An associative attribute that can be attached to a multiplayer session search handle when it is created. Attribute names be lower-case alphanumeric, and start with a letter.  

## Syntax  
  
```cpp
typedef struct XblMultiplayerSessionStringAttribute {  
    char name[XBL_MULTIPLAYER_SEARCH_HANDLE_MAX_FIELD_LENGTH];  
    char value[XBL_MULTIPLAYER_SEARCH_HANDLE_MAX_FIELD_LENGTH];  
} XblMultiplayerSessionStringAttribute  
```
  
### Members  
  
*name*  
Type: char[XBL_MULTIPLAYER_SEARCH_HANDLE_MAX_FIELD_LENGTH]  
  
Name of the attribute.
  
*value*  
Type: char[XBL_MULTIPLAYER_SEARCH_HANDLE_MAX_FIELD_LENGTH]  
  
Attribute value.
  
## Requirements  
  
**Header:** multiplayer_c.h
  
## See also  
[multiplayer_c](../multiplayer_c_members.md)  
  
  