---
author: joannaleecy
title: XblPreferredColor
description: Preferred color for the user. Set via the shell.
kindex: XblPreferredColor
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
quality: good
applies-to: pc-gdk
---

# XblPreferredColor  

Preferred color for the user. Set via the shell.  

## Syntax  
  
```cpp
typedef struct XblPreferredColor {  
    char primaryColor[XBL_COLOR_CHAR_SIZE];  
    char secondaryColor[XBL_COLOR_CHAR_SIZE];  
    char tertiaryColor[XBL_COLOR_CHAR_SIZE];  
} XblPreferredColor  
```
  
### Members  
  
*primaryColor*  
Type: char[XBL_COLOR_CHAR_SIZE]  
  
UTF-8 encoded user's primary color.
  
*secondaryColor*  
Type: char[XBL_COLOR_CHAR_SIZE]  
  
UTF-8 encoded user's secondary color.
  
*tertiaryColor*  
Type: char[XBL_COLOR_CHAR_SIZE]  
  
UTF-8 encoded user's tertiary color.
  
## Member of
  
[XblSocialManagerUser](xblsocialmanageruser.md)
  
## Requirements  
  
**Header:** social_manager_c.h
  
## See also  
[social_manager_c](../social_manager_c_members.md)  
  
  