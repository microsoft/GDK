---
author: M-Stahl
title: XUserPrivilegeOptions
description: Specifies the user privilege options.
kindex: XUserPrivilegeOptions
ms.author: v-sahain
ms.topic: reference
edited: 00/00/0000
quality: good
security: public
applies-to: pc-gdk
---

# XUserPrivilegeOptions  

Specifies the user privilege options.  

## Syntax  
  
```cpp
enum class XUserPrivilegeOptions  : uint32_t  
{  
    None = 0x00,  
    AllUsers = 0x01,  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| None | No options. |  
| AllUsers | All users. |  
  
## Remarks

To check if a user has a specific privilege, call the [XUserCheckPrivilege](../functions/xusercheckprivilege.md) function. 

To display a resolution user interface for required privileges, call [XUserResolvePrivilegeWithUiAsync](../functions/xuserresolveprivilegewithuiasync.md).

Both functions accept an XUserPrivilegeOptions enumeration as an argument.

## Requirements  
  
**Header:** XUser.h
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also

[XUser](../xuser_members.md)
  
[XUserCheckPrivilege](../functions/xusercheckprivilege.md)

[XUserResolvePrivilegeWithUiAsync](../functions/xuserresolveprivilegewithuiasync.md)