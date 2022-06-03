---
author: M-Stahl
title: XUserGetMaxUsers
description: Retrieves the maximum number of users that a game session allows.
kindex: XUserGetMaxUsers
ms.author: v-sahain
ms.topic: reference
edited: 00/00/0000
quality: good
security: public
applies-to: pc-gdk
---

# XUserGetMaxUsers  

Retrieves the maximum number of users that a game session allows.  

## Syntax  
  
```cpp
HRESULT XUserGetMaxUsers(  
         uint32_t* maxUsers  
)  
```  
  
### Parameters  
  
*maxUsers* &nbsp;&nbsp;\_Out\_  
Type: uint32_t*  

Contains the maximum number of users that a game session allows.

### Return value

Type: HRESULT
  
HRESULT success or error code.  
For a list of error codes, see [Error Codes](../../../errorcodes.md).

## Remarks

To retrieve the user ID for a specific user, call [XUserGetId](xusergetid.md).

To retrieve the state of a specific user, call [XUserGetState](xusergetstate.md).

To retrieve the age group for a specific user, call [XUserGetAgeGroup](xusergetagegroup.md).

## Requirements  
  
**Header:** XUser.h
  
**Library:** xgameruntime.lib  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also

[XUser](../xuser_members.md)
  
[XUserGetId](xusergetid.md)  

[XUserGetState](xusergetstate.md)

[XUserGetAgeGroup](xusergetagegroup.md)