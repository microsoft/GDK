---
author: M-Stahl
title: XUserFindUserByLocalId
description: Retrieves a handle to the user for a specific local user ID.
kindex: XUserFindUserByLocalId
ms.author: jgup
ms.topic: reference
edited: 02/10/2020
quality: good
security: public
applies-to: pc-gdk
---

# XUserFindUserByLocalId  

Retrieves a handle to the user for a specific local user ID.  

## Syntax  
  
```cpp
HRESULT XUserFindUserByLocalId(  
         XUserLocalId userLocalId,  
         XUserHandle* handle  
)  
```  
  
### Parameters  
  
*userLocalId* &nbsp;&nbsp;\_In\_  
Type: [XUserLocalId](../structs/xuserlocalid.md)  

The local ID to get the user for.  

*handle* &nbsp;&nbsp;\_Out\_  
Type: XUserHandle*  

Contains a handle to the user associated with a specific local user ID.

### Return value
  > [!NOTE]
> This function isn't safe to call on a time-sensitive thread. For more information, see [Time-sensitive threads](../../../../system/overviews/time-sensitive-threads.md).  
  
Type: HRESULT
  
HRESULT success or error code.  

| Return Code                         | Description             |
|-------------------------------------|-------------------------|
| S_OK                                | The operation succeeded. |
| HRESULT_FROM_WIN32(ERROR_NOT_FOUND) | The user was not found.  |

## Remarks

For each **XUserHandle** handle that you retrieve from an **XUser** API, inluding **XUserFindUserByLocalId**, you must 
close that handle calling [XUserCloseHandle](xuserclosehandle.md). The reference count of the handle increases after calling Get / Find functions.

To retrieve a handle to a user for a specific local user ID, call XUserFindUserByLocalId.

To retrieve the Xbox User ID (XUID) for a local user, call [XUserFindUserById](xuserfinduserbyid.md).

To retrieve a user ID for a specific device ID, call [XUserFindForDevice](xuserfindfordevice.md).

## Requirements  
  
**Header:** XUser.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also

[XUser](../xuser_members.md)
  
[XUserFindUserById](xuserfinduserbyid.md)

[XUserFindForDevice](xuserfindfordevice.md)