---
author: M-Stahl
title: XUserPrivilegeDenyReason
description: Specifies the reason a user could not obtain a privilege.
kindex: XUserPrivilegeDenyReason
ms.author: v-sahain
ms.topic: reference
edited: 00/00/0000
quality: good
security: public
applies-to: pc-gdk
---

# XUserPrivilegeDenyReason  

Specifies the reason a user could not obtain a privilege.  

## Syntax  
  
```cpp
enum class XUserPrivilegeDenyReason  : uint32_t  
{  
    None = 0,  
    PurchaseRequired = 1,  
    Restricted = 2,  
    Banned = 3,  
    Unknown = 0xFFFFFFFF  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| None | No reason. |  
| PurchaseRequired | The user must make a purchase. |  
| Restricted | Restrictions on the user exist. |  
| Banned | A ban on the user exists. |  
| Unknown | Unknown reason. |  
  
## Remarks

To check if a user has a specific privilege, call the [XUserCheckPrivilege](../functions/xusercheckprivilege.md) function. The function accepts a pointer to an XUserPrivilegeDenyReason enumeration as an argument. The function returns an [XUserPrivilege](xuserprivilege.md) enumeration.

## Requirements  
  
**Header:** XUser.h
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also

[XUser](../xuser_members.md)
  
[XUserCheckPrivilege](../functions/xusercheckprivilege.md)

[XUserPrivilege](xuserprivilege.md)