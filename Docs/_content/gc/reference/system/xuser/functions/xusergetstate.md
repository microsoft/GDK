---
author: M-Stahl
title: XUserGetState
description: Retrieves the state of a user.
kindex: XUserGetState
ms.author: v-sahain
ms.topic: reference
edited: 00/00/0000
quality: good
security: public
applies-to: pc-gdk
---

# XUserGetState  

Retrieves the state of a user.  

## Syntax  
  
```cpp
HRESULT XUserGetState(  
         XUserHandle user,  
         XUserState* state  
)  
```  
  
### Parameters  
  
*user* &nbsp;&nbsp;\_In\_  
Type: XUserHandle  

A handle to the user to retrieve the state for.  

*state* &nbsp;&nbsp;\_Out\_  
Type: [XUserState*](../enums/xuserstate.md)  

Contains the state of a specific user.  

### Return value

Type: HRESULT
  
HRESULT success or error code.  
For a list of error codes, see [Error Codes](../../../errorcodes.md).  

## Remarks

A user can exist in three states within a game title. For details, visit [XUserState](../enums/xuserstate.md).

To monitor changes to a user’s state or information, call the [XUserRegisterForChangeEvent](xuserregisterforchangeevent.md) function. The function subscribes to an [XUserChangeEvent](../enums/xuserchangeevent.md) enumeration.

## Requirements  
  
**Header:** XUser.h
  
**Library:** xgameruntime.lib  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also

[XUser](../xuser_members.md)
  
[XUserState](../enums/xuserstate.md)  

[XUserRegisterForChangeEvent](xuserregisterforchangeevent.md)

[XUserChangeEvent](../enums/xuserchangeevent.md)