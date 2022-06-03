---
author: M-Stahl
title: XUserUnregisterForDeviceAssociationChanged
description: Unregisters a previously registered user device association change callback.
kindex: XUserUnregisterForDeviceAssociationChanged
ms.author: v-sahain
ms.topic: reference
edited: 02/10/2020
quality: good
security: public
applies-to: pc-gdk
---

# XUserUnregisterForDeviceAssociationChanged  

Unregisters a previously registered user device association change callback.  

## Syntax  
  
```cpp
bool XUserUnregisterForDeviceAssociationChanged(  
         XTaskQueueRegistrationToken token,  
         bool wait  
)  
```  
  
### Parameters  
  
*token* &nbsp;&nbsp;  
Type: [XTaskQueueRegistrationToken](../../xtaskqueue/structs/xtaskqueueregistrationtoken.md)  

The token that [XUserRegisterForDeviceAssociationChanged](xuserregisterfordeviceassociationchanged.md) returns when registering the callback.

*wait* &nbsp;&nbsp;  
Type: bool  

Specify **true** to wait until the callback unregisters; **false** to immediately return.  
  
### Return value

Type: bool
  
Returns **true** if the callback successfully unregisters; **false** otherwise.  
  
## Remarks
  > [!NOTE]
> This function isn't safe to call on a time-sensitive thread. For more information, see [Time-sensitive threads](../../../../system/overviews/time-sensitive-threads.md).  
  
To register a callback for user device association change events, call [XUserRegisterForDeviceAssociationChanged](xuserregisterfordeviceassociationchanged.md).

To register a callback that an application defines and invokes when the default audio endpoint is changes, call [XUserRegisterForDefaultAudioEndpointUtf16Changed](xuserregisterfordefaultaudioendpointutf16changed.md).

To unregister a previously-registered default audio endpoint change callback, call [XUserUnregisterForDefaultAudioEndpointUtf16Changed](xuserunregisterfordefaultaudioendpointutf16changed.md).

## Requirements  
  
**Header:** XUser.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also

[XUser](../xuser_members.md)
  
[XUserRegisterForDeviceAssociationChanged](xuserregisterfordeviceassociationchanged.md)

[XUserRegisterForDefaultAudioEndpointUtf16Changed](xuserregisterfordefaultaudioendpointutf16changed.md)

[XUserUnregisterForDefaultAudioEndpointUtf16Changed](xuserunregisterfordefaultaudioendpointutf16changed.md)