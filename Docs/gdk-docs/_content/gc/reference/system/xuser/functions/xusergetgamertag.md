---
author: M-Stahl
title: XUserGetGamertag
description: Retrieves the gamertag for a specific user.
kindex: XUserGetGamertag
ms.author: v-sahain
ms.topic: reference
edited: 00/00/0000
quality: good
security: public
applies-to: pc-gdk
---

# XUserGetGamertag  

Retrieves the gamertag for a specific user.  

## Syntax  
  
```cpp
HRESULT XUserGetGamertag(  
         XUserHandle user,
         XUserGamertagComponent gamertagComponent,
         size_t gamertagSize,  
         char* gamertag,  
         size_t* gamertagUsed  
)  
```  
  
### Parameters  
  
*user* &nbsp;&nbsp;\_In\_  
Type: XUserHandle  

A handle to the user to retrieve the gamertag for.  

*gamertagComponent* &nbsp;&nbsp;\_In\_  
Type: [XUserGamertagComponent](../enums/xusergamertagcomponent.md)  

Type of gamertag to retrieve.

*gamertagSize* &nbsp;&nbsp;\_In\_  
Type: size_t  

Size in bytes of the buffer in the *gamertag* parameter.

*gamertag* &nbsp;&nbsp;\_Out\_writes\_bytes\_to\_(gamertagSize,*gamertagUsed)  
Type: char*  

Contains the gamertag for a specific user.  

*gamertagUsed* &nbsp;&nbsp;\_Out\_opt\_  
Type: size_t*  

Contains the amount of the buffer for holding the gamertag.  

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