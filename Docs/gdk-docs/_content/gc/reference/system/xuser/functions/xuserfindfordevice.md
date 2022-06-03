---
author: M-Stahl
title: XUserFindForDevice
description: Retrieves the user ID for a specific device ID.
kindex: XUserFindForDevice
ms.author: v-sahain
ms.topic: reference
edited: 01/06/2020
quality: good
security: public
applies-to: pc-gdk
---

# XUserFindForDevice  

Retrieves the user ID for a specific device ID.  

## Syntax  
  
```cpp
HRESULT XUserFindForDevice(  
         const APP_LOCAL_DEVICE_ID* deviceId,  
         XUserHandle* handle  
)  
```  
  
### Parameters  
  
*deviceId* &nbsp;&nbsp;\_In\_  
Type: [APP_LOCAL_DEVICE_ID*](../structs/app_local_device_id.md)  
  
The ID of the device.  
*handle* &nbsp;&nbsp;\_Out\_  
Type: XUserHandle*  
  
Contains the XUID for the local user.  
  
### Return value

Type: HRESULT
  
Returns S_OK if successful; otherwise, returns an error code.
For a list of error codes, see [Error Codes](../../../errorcodes.md).  
  
## Remarks
  > [!NOTE]
> This function isn't safe to call on a time-sensitive thread. For more information, see [Time-sensitive threads](../../../../system/overviews/time-sensitive-threads.md).  

The association between user and device can change for many reasons:

* The user signs out from the console.
* Someone uses the input device to select a different user in the Account Picker.

To receive a notification when the user-device association changes, call [XUserRegisterForDeviceAssociationChanged](xuserregisterfordeviceassociationchanged.md) to get an [XUserDeviceAssociationChangedCallback](xuserdeviceassociationchangedcallback.md).
> [!NOTE]
> *XUserFindForDevice* cannot return a user handle to a user that hasn't been signed in with a call to [XUserAddAsync](xuseraddasync.md). See [Users and input devices](../../../../system/overviews/user/users-input-devices.md) for more information.

## Requirements  
  
**Header:** XUser.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also

[XUser](../xuser_members.md)
  
[XUserRegisterForDeviceAssociationChanged](xuserregisterfordeviceassociationchanged.md)

[XUserDeviceAssociationChangedCallback](xuserdeviceassociationchangedcallback.md)