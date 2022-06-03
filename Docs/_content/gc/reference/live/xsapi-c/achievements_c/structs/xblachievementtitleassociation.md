---
author: joannaleecy
title: XblAchievementTitleAssociation
description: Represents the association between a title and achievements.
kindex: XblAchievementTitleAssociation
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
quality: good
applies-to: pc-gdk
---

# XblAchievementTitleAssociation  

Represents the association between a title and achievements.  

## Syntax  
  
```cpp
typedef struct XblAchievementTitleAssociation {  
    const char* name;  
    uint32_t titleId;  
} XblAchievementTitleAssociation  
```
  
### Members  
  
*name*  
Type: const char*  
  
The UTF-8 encoded localized name of the title.
  
*titleId*  
Type: uint32_t  
  
The title ID.
  
## Member of
  
[XblAchievement](xblachievement.md)
  
## Requirements  
  
**Header:** achievements_c.h
  
## See also  
[achievements_c](../achievements_c_members.md)  
  
  