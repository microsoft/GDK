---
author: M-Stahl
title: XUserFindControllerForUserWithUiAsync
description: Shows a dialog that will prompt the user to turn on and identify which controller they want to use.
kindex: XUserFindControllerForUserWithUiAsync
ms.author: jgup
ms.topic: reference
security: public
applies-to: pc-gdk
edited: 00/00/0000
---

# XUserFindControllerForUserWithUiAsync  

Shows a dialog that will prompt the user to turn on and identify which controller they
want to use.

## Syntax  
  
```cpp
HRESULT XUserFindControllerForUserWithUiAsync(  
         XUserHandle user,  
         XAsyncBlock* async  
)  
```  
  
### Parameters  
  
*user* &nbsp;&nbsp;\_In\_  
Type: XUserHandle  
  
The XUserHandle of the user for which to find a controller.  
  
*async* &nbsp;&nbsp;\_In\_  
Type: XAsyncBlock*  
  
An XAsyncBlock for polling for the call’s status and retrieving call results.
  
  
### Return value
Type: HRESULT
  
HRESULT success or error code. For a list of error codes, see 
[Error Codes](../../../errorcodes.md).

### Remarks
On desktop, this function will not show UI. 

To get the results of what controller the user has selected, there are a couple of choices. 

1. Call [XUserFindControllerForUserWithUiResult](xuserfindcontrollerforuserwithuiresult.md). 
   This will return the device ID of the now bound controller.
1. Get the result from the [XUserDeviceAssociationChangedCallback](xuserdeviceassociationchangedcallback.md)
   callback that will happen when the user has selected their new controller.
  
## Requirements  
  
**Header:** XUser.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[XUser](../xuser_members.md)  
[Dealing with Controller Loss (NDA topic)](../../../../system/overviews/user/users-dealing-with-controller-loss.md)
  
  