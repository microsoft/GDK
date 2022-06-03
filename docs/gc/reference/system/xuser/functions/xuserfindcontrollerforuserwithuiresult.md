---
author: M-Stahl
title: XUserFindControllerForUserWithUiResult
description: Retrieves the application local device ID (APP_LOCAL_DEVICE_ID) that a user has chosen to use.
kindex: XUserFindControllerForUserWithUiResult
ms.author: jgup
ms.topic: reference
security: public
applies-to: pc-gdk
edited: 00/00/0000
quality: good
---

# XUserFindControllerForUserWithUiResult  

Retrieves the application local device ID (APP_LOCAL_DEVICE_ID) that a user has chosen to use.

## Syntax  
  
```cpp
HRESULT XUserFindControllerForUserWithUiResult(  
         XAsyncBlock* async,  
         APP_LOCAL_DEVICE_ID* deviceId  
)  
```  
  
### Parameters  
  
*async* &nbsp;&nbsp;\_Inout\_  
Type: XAsyncBlock*  
  
The async block sent to [XUserFindControllerForUserWithUiAsync](xuserfindcontrollerforuserwithuiasync.md).
  
*deviceId* &nbsp;&nbsp;\_Out\_  
Type: APP_LOCAL_DEVICE_ID*  
  
The device ID of the controller that is now associated to the user.    
  
  
### Return value
Type: HRESULT
  
HRESULT success or error code. For a list of error codes, see [Error Codes](../../../errorcodes.md).

### Remarks
On desktop, this function will always return an all-zero device ID.
  
## Requirements  
  
**Header:** XUser.h  
**Library:** xgameruntime.lib  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[XUser](../xuser_members.md)  
[Dealing with Controller Loss (NDA topic)](../../../../system/overviews/user/users-dealing-with-controller-loss.md)  
  
  