---
author: M-Stahl
title: APP_LOCAL_DEVICE_ID
description: Specifies the root ID of a local input device.
kindex: APP_LOCAL_DEVICE_ID
ms.author: v-sahain
ms.topic: reference
edited: 00/00/0000
quality: good
security: public
applies-to: pc-gdk
---

# APP_LOCAL_DEVICE_ID  

Specifies the root ID of a local input device.  

## Syntax  
  
```cpp
typedef struct APP_LOCAL_DEVICE_ID {  
    BYTE value[APP_LOCAL_DEVICE_ID_SIZE];  
} APP_LOCAL_DEVICE_ID  
```
  
### Members  
  
*value*  
Type: BYTE[APP_LOCAL_DEVICE_ID_SIZE]  
  
The root ID of a local input device.  
  
## Remarks

The [IGameInput::GetDeviceFromId](../../../input/gameinput/interfaces/igameinput/methods/igameinput_finddevicefromid.md) method uses a pointer to an APP_LOCAL_DEVICE_ID constant to retrieve a device based on the DeviceID.

The [XInputGetDeviceId](../../../input/xinputongameinput/functions/xinputgetdeviceid.md) function uses a pointer to an APP_LOCAL_DEVICE_ID structure to return the APP_LOCAL_DEVICE_ID for the device at a given user index.

The [XUserDeviceAssociationChange](xuserdeviceassociationchange.md) structure includes an APP_LOCAL_DEVICE_ID structure member.

The [XUserFindForDevice](../functions/xuserfindfordevice.md) function uses a pointer to an APP_LOCAL_DEVICE_ID structure to retrieve a user ID for a specific device ID.

A "null" APP_LOCAL_DEVICE_ID will be equal to the value of **XUserNullDeviceId**.

## Requirements  
  
**Header:** XUser.h
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also

[XUser](../xuser_members.md)  

[XUserLocalId](xuserlocalid.md)
  
[IGameInput::GetDeviceFromId](../../../input/gameinput/interfaces/igameinput/methods/igameinput_finddevicefromid.md)

[XInputGetDeviceId](../../../input/xinputongameinput/functions/xinputgetdeviceid.md)