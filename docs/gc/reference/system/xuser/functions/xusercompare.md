---
author: M-Stahl
title: XUserCompare
description: Compares two user handles for equality.
kindex: XUserCompareUsers
ms.author: v-sahain
ms.topic: reference
edited: 00/00/0000
quality: good
security: public
applies-to: pc-gdk
---

# XUserCompare  

Compares two user handles for equality.  

## Syntax  
  
```cpp
int32_t XUserCompare(  
         XUserHandle user1,  
         XUserHandle user2  
)  
```  
  
### Parameters  
  
*user1* &nbsp;&nbsp;\_In\_opt\_  
Type: XUserHandle  

User handle 1.  

*user2* &nbsp;&nbsp;\_In\_opt\_  
Type: XUserHandle  

User handle 2.  

### Return value

Type: int32_t
  
Returns 0 if the handles are for the same user.  
  
## Remarks

An **XUserHandle** represents an XBox game user.
Different XUserHandles can point to the same user.
To see if two different XUserHandles point to the same user, call the **XUserCompare** function.

## Requirements  
  
**Header:** XUser.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also

[XUser](../xuser_members.md)
  
[XUserCloseSignOutDeferralHandle](xuserclosesignoutdeferralhandle.md)

[XUserCloseHandle](xuserclosehandle.md)