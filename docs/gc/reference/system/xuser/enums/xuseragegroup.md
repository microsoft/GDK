---
author: M-Stahl
title: XUserAgeGroup
description: Specifies the age group of a user.
kindex: XUserAgeGroup
ms.author: v-sahain
ms.topic: reference
edited: 00/00/0000
quality: good
security: public
applies-to: pc-gdk
---

# XUserAgeGroup  

Specifies the age group of a user.  

## Syntax  
  
```cpp
enum class XUserAgeGroup  : uint32_t  
{  
    Unknown = 0,  
    Child = 1,  
    Teen = 2,  
    Adult = 3,  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| Unknown | User age is unknown. |  
| Child | User is a child. |  
| Teen | User is a teen. |  
| Adult | User is an adult. |  
  
## Remarks

To get the age group for a user, call the [XUserGetAgeGroup](../functions/xusergetagegroup.md) function.
The [XUserGetAgeGroup](../functions/xusergetagegroup.md) function accepts a pointer to an XUserAgeGroup enumeration as an argument.
The [XUserGetAgeGroup](../functions/xusergetagegroup.md) function returns a pointer to an XUserAgeGroup enumeration that represents the age group of the user.

## Requirements  
  
**Header:** XUser.h
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also

[XUser](../xuser_members.md)

[XUserGetAgeGroup](../functions/xusergetagegroup.md)  
  