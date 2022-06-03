---
author: M-Stahl
title: XUserAddByIdWithUiResult
description: Retrieves a handle to the user that XUserAddByIdWithUiAsync creates. This function should only be used in response to a game invite.
kindex: XUserAddByIdWithUiResult
ms.author: jgup
ms.topic: reference
edited: 00/00/0000
quality: good
security: public
applies-to: pc-gdk
---

# XUserAddByIdWithUiResult  

Retrieves a handle to the user that [XUserAddByIdWithUiAysnc](xuseraddbyidwithuiasync.md) creates. 
This function should only be used in response to a game invite. 

## Syntax  
  
```cpp
HRESULT XUserAddByIdWithUiResult(  
         XAsyncBlock* async,  
         XUserHandle* newUser  
)  
```  
  
### Parameters  
  
*async* &nbsp;&nbsp;\_Inout\_  
Type: [XAsyncBlock*](../../xasync/structs/xasyncblock.md)  

The [XAsyncBlock](../../xasync/structs/xasyncblock.md) previously sent to [XUserAddByIdWithUiAysnc](xuseraddbyidwithuiasync.md).

*newUser* &nbsp;&nbsp;\_Out\_  
Type: XUserHandle*  

Contains a handle to the new user.

### Return value
Type: HRESULT
  
HRESULT success or error code.
For a list of error codes, see [Error Codes](../../../errorcodes.md).

| Return Code           | Description             |
|-----------------------|-------------------------|
| S_OK                  | The operation succeeded. |
| E_GAMEUSER_USER_NOTFOUND | The user specified in the XUID passed into [XUserAddByIdWithUiAysnc](xuseraddbyidwithuiasync.md) is no longer signed into the device. |


## Remarks

For more details on how to use this function, see [XUserAddByIdWithUiAysnc](xuseraddbyidwithuiasync.md).
  
## Requirements  
  
**Header:** XUser.h
  
**Library:** xgameruntime.lib  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[XUser](../xuser_members.md)  
[XUserCloseHandle](xuserclosehandle.md)  
  