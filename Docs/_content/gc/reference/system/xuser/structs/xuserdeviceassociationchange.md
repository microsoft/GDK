---
author: M-Stahl
title: XUserDeviceAssociationChange
description: Specifies the old and new device associations when a device association changes.
kindex: XUserDeviceAssociationChange
ms.author: v-sahain
ms.topic: reference
edited: 07/02/2019
quality: good
security: public
applies-to: pc-gdk
---

# XUserDeviceAssociationChange  

Specifies the old and new device associations when a device association changes.  

## Syntax  
  
```cpp
typedef struct XUserDeviceAssociationChange {  
    APP_LOCAL_DEVICE_ID deviceId;  
    XUserLocalId oldUser;  
    XUserLocalId newUser;  
} XUserDeviceAssociationChange  
```
  
### Members  
  
*deviceId*  
Type: [APP_LOCAL_DEVICE_ID](app_local_device_id.md)  
  
The ID of the device whose user association changes.  
  
*oldUser*  
Type: [XUserLocalId](xuserlocalid.md)  
  
The old user ID associated with the device.  
  
*newUser*  
Type: [XUserLocalId](xuserlocalid.md)  
  
The new user ID associated with the device.  

## Remarks

All arguments to XUserDeviceAssociationChange can be "null":

- If deviceId is equal to **XUserNullDeviceId**, the user change applies to all devices, where all devices have associations with a signed-in user.
- If oldUser is equal to **XUserNullUserLocalId**, the device-user association is new.
- If newUser is equal to **XUserNullUserLocalId**, the existing device-user associaton is lost.
> [!NOTE]
> *newUser* can only reference users that were already added to the title via a call to [XUserAddAsync](../functions/xuseraddasync.md). If the system picker was used to pair an input device to a user that the title doesn't know about, newUser will be equal to **XUserNullUserLocalId**. See [Users and input devices](../../../../system/overviews/user/users-input-devices.md) for more information.

These memebers should be treated as raw byte structure that can be compared using memcmp or an equivalent method.  For example:

```cpp
XUserDeviceAssociationChange *change; // incoming argument from callback

if(memcmp(&change->deviceId, &XUserNullDeviceId, sizeof(APP_LOCAL_DEVICE_ID) == 0))
{
}

if(memcmp(&change->newUser, &XUserNullUserLocalId, sizeof(XUserLocalId) == 0))
{
}
```

The [XUserDeviceAssociationChangedCallback](../functions/xuserdeviceassociationchangedcallback.md) callback function uses a pointer to an XUserDeviceAssociationChange structure.

The callback function passes context to the [XUserRegisterForDeviceAssociationChanged](../functions/xuserregisterfordeviceassociationchanged.md) function when the callback registers.

The [XUserRegisterForDeviceAssociationChanged](../functions/xuserregisterfordeviceassociationchanged.md) function registers a callback for user device association change events.

## Requirements  
  
**Header:** XUser.h
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also

[XUser](../xuser_members.md)
  
[XUserDeviceAssociationChangedCallback](../functions/xuserdeviceassociationchangedcallback.md)

[XUserRegisterForDeviceAssociationChanged](../functions/xuserregisterfordeviceassociationchanged.md)