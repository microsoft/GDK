---
author: joannaleecy
title: XblPresenceDevicePresenceChangedHandler
description: Event handler for device presence change notifications.
kindex: XblPresenceDevicePresenceChangedHandler
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# XblPresenceDevicePresenceChangedHandler  

Event handler for device presence change notifications.  

## Syntax  
  
```cpp
void XblPresenceDevicePresenceChangedHandler(  
         void* context,  
         uint64_t xuid,  
         XblPresenceDeviceType deviceType,  
         bool isUserLoggedOnDevice  
)  
```  
  
### Parameters  
  
*context* &nbsp;&nbsp;\_In\_opt\_  
Type: void*  
  
Caller context that will be passed back to the handler.  
  
*xuid* &nbsp;&nbsp;\_In\_  
Type: uint64_t  
  
The XboxUserID of the User whose device presence changed.  
  
*deviceType* &nbsp;&nbsp;\_In\_  
Type: [XblPresenceDeviceType](../enums/xblpresencedevicetype.md)  
  
The associated device type.  
  
*isUserLoggedOnDevice* &nbsp;&nbsp;\_In\_  
Type: bool  
  
Boolean for if user is logged on device.  
  
  
### Return value  
Type: void
  

  
## Argument of
  
[XblPresenceAddDevicePresenceChangedHandler](xblpresenceadddevicepresencechangedhandler.md)
  
## Requirements  
  
**Header:** presence_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[presence_c](../presence_c_members.md)  
  
  