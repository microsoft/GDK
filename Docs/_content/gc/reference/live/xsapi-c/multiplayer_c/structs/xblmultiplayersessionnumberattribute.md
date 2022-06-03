---
author: joannaleecy
title: XblMultiplayerSessionNumberAttribute
description: An associative attribute that can be attached to a multiplayer session search handle when it is created. Attribute names be lower-case alphanumeric, and start with a letter.
kindex: XblMultiplayerSessionNumberAttribute
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
quality: good
applies-to: pc-gdk
---

# XblMultiplayerSessionNumberAttribute  

An associative attribute that can be attached to a multiplayer session search handle when it is created. Attribute names be lower-case alphanumeric, and start with a letter.  

## Syntax  
  
```cpp
typedef struct XblMultiplayerSessionNumberAttribute {  
    char name[XBL_MULTIPLAYER_SEARCH_HANDLE_MAX_FIELD_LENGTH];  
    double value;  
} XblMultiplayerSessionNumberAttribute  
```
  
### Members  
  
*name*  
Type: char[XBL_MULTIPLAYER_SEARCH_HANDLE_MAX_FIELD_LENGTH]  
  
Name of the attribute. Attribute names be lower-case alphanumeric, and start with a letter.
  
*value*  
Type: double  
  
Attribute value.
  
## Requirements  
  
**Header:** multiplayer_c.h
  
## See also  
[multiplayer_c](../multiplayer_c_members.md)  
  
  