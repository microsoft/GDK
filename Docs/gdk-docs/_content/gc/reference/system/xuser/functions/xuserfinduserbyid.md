---
author: M-Stahl
title: XUserFindUserById
description: Retrieves the XBox User ID (XUID) for a local user.
kindex: XUserFindUserById
ms.author: jgup
ms.topic: reference
edited: 02/10/2020
quality: good
security: public
applies-to: pc-gdk
---

# XUserFindUserById  

Retrieves the XUserHandle based on the Xbox User ID (XUID) of a local user.  

## Syntax  
  
```cpp
HRESULT XUserFindUserById(  
         uint64_t userId,  
         XUserHandle* handle  
)  
```  
  
### Parameters  
  
*userId* &nbsp;&nbsp;\_In\_  
Type: uint64_t  

The local user to retrieve the XUID for.  

*handle* &nbsp;&nbsp;\_Out\_  
Type: XUserHandle*  

Contains the XUID for the local user.  

### Return value

Type: HRESULT
  
HRESULT success or error code.  
For a list of error codes, see [Error Codes](../../../errorcodes.md).

## Remarks
  > [!NOTE]
> This function isn't safe to call on a time-sensitive thread. For more information, see [Time-sensitive threads](../../../../system/overviews/time-sensitive-threads.md).  
  
For each **XUserHandle** handle that you retrieve from an **XUser** API, inluding **XUserFindUserById**, you must 
close that handle calling [XUserCloseHandle](xuserclosehandle.md).

To retrieve the XBox User ID (XUID) for a local user, call XUserFindUserById.

To retrieve a handle to a user for a specific local user ID, call [XUserFindUserByLocalId](xuserfinduserbylocalid.md].

To retrieve a user ID for a specific device ID, call [XUserFindForDevice](xuserfindfordevice.md).

## Requirements  
  
**Header:** XUser.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also

[XUser](../xuser_members.md)
  
[XUserFindUserByLocalId](xuserfinduserbylocalid.md)

[XUserFindForDevice](xuserfindfordevice.md)