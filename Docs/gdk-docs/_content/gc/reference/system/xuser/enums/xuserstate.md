---
author: M-Stahl
title: XUserState
description: Specifies the current state of the user.
kindex: XUserState
ms.author: v-sahain
ms.topic: reference
edited: 00/00/0000
quality: good
security: public
applies-to: pc-gdk
---

# XUserState  

Specifies the current state of the user.  

## Syntax  
  
```cpp
enum class XUserState  : uint32_t  
{  
    SignedIn = 0,  
    SigningOut = 1,  
    SignedOut = 2,  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| SignedIn | The user is signed in. |  
| SigningOut | The user is signing out. |  
| SignedOut | The user is signed out. |  
  
## Remarks

To get the state of a given user, call the [XUserGetState](../functions/xusergetstate.md) function. The function accepts a pointer to an XUserState enumeration as an argument.

To monitor changes in the state of a user, subscribe to [XUserChangeEvent](xuserchangeevent.md) by calling [XUserRegisterForChangeEvent](../functions/xuserregisterforchangeevent.md).

## Requirements  
  
**Header:** XUser.h
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also

[XUser](../xuser_members.md)
  
[XUserChangeEvent](xuserchangeevent.md)

[XUserRegisterForChangeEvent](../functions/xuserregisterforchangeevent.md)