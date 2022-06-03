---
author: joannaleecy
title: XblMultiplayerSessionTag
description: A searchable tag that can be attached to a multiplayer session search handle when it is created. Tags must be alphanumeric and start with a letter. They're case-insensitive.
kindex: XblMultiplayerSessionTag
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
quality: good
applies-to: pc-gdk
---

# XblMultiplayerSessionTag  

A searchable tag that can be attached to a multiplayer session search handle when it is created. Tags must be alphanumeric and start with a letter. They're case-insensitive.  

## Syntax  
  
```cpp
typedef struct XblMultiplayerSessionTag {  
    char value[XBL_MULTIPLAYER_SEARCH_HANDLE_MAX_FIELD_LENGTH];  
} XblMultiplayerSessionTag  
```
  
### Members  
  
*value*  
Type: char[XBL_MULTIPLAYER_SEARCH_HANDLE_MAX_FIELD_LENGTH]  
  
The multiplayer search handle.
  
## Requirements  
  
**Header:** multiplayer_c.h
  
## See also  
[multiplayer_c](../multiplayer_c_members.md)  
  
  