---
author: M-Stahl
title: XUserDeviceAssociationChangedCallback
description: A callback that invokes when the user-device association changes.
kindex: XUserDeviceAssociationChangedCallback
ms.author: v-sahain
ms.topic: reference
edited: 00/00/0000
quality: good
security: public
applies-to: pc-gdk
---

# XUserDeviceAssociationChangedCallback

A callback that invokes when the user-device association changes.  

## Syntax  
  
```cpp
void XUserDeviceAssociationChangedCallback(  
         void* context,  
         const XUserDeviceAssociationChange* change  
)  
```  
  
### Parameters  
  
*context* &nbsp;&nbsp;\_In\_opt\_  
Type: void*  

The context the application defines and sends to [XUserRegisterForDeviceAssociationChanged](xuserregisterfordeviceassociationchanged.md) during callback registration.

*change* &nbsp;&nbsp;\_In\_  
Type: [XUserDeviceAssociationChange*](../structs/xuserdeviceassociationchange.md)  

A structure that contains the old and new device associations.  

### Return value

Type: void
  
## Remarks

To register a callback for user device association change events, call [XUserRegisterForDeviceAssociationChanged](xuserregisterfordeviceassociationchanged.md). The function takes a pointer to an **XUserDeviceAssociationChangedCallback** function as an argument. The function returns the pointer to the callback function.

## Requirements  
  
**Header:** XUser.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also

[XUser](../xuser_members.md)

[XUserRegisterForDeviceAssociationChanged](xuserregisterfordeviceassociationchanged.md)