---
author: M-Stahl
title: XUserUnregisterForDefaultAudioEndpointUtf16Changed
description: Unregisters a previously-registered default audio endpoint change callback.
kindex: XUserUnregisterForDefaultAudioEndpointUtf16Changed
ms.author: v-sahain
ms.topic: reference
edited: 02/10/2020
quality: good
security: public
applies-to: pc-gdk
---

# XUserUnregisterForDefaultAudioEndpointUtf16Changed  

Unregisters a previously-registered default audio endpoint change callback.  

## Syntax  
  
```cpp
bool XUserUnregisterForDefaultAudioEndpointUtf16Changed(  
         XTaskQueueRegistrationToken token,  
         bool wait  
)  
```  
  
### Parameters  
  
*token* &nbsp;&nbsp;  
Type: [XTaskQueueRegistrationToken](../../xtaskqueue/structs/xtaskqueueregistrationtoken.md)  

The token that the [XUserRegisterForDefaultAudioEndpointUtf16Changed](xuserregisterfordefaultaudioendpointutf16changed.md) function returns when registering the callback.

*wait* &nbsp;&nbsp;  
Type: bool  

Set to **true** to wait until the callback registers. Set to **false** to return immediately.

### Return value

Type: bool
  
Returns **true** if the callback successfully unregisters; **false** otherwise.  

## Remarks
  > [!NOTE]
> This function isn't safe to call on a time-sensitive thread. For more information, see [Time-sensitive threads](../../../../system/overviews/time-sensitive-threads.md).  
  
[XUserDefaultAudioEndpointUtf16ChangedCallback](xuserdefaultaudioendpointutf16changedcallback.md) is a callback function that an application invokes when the default audio endpoint for a specific user changes.

To register a callback that invokes when the default audio endpoint changes, call [XUserRegisterForDefaultAudioEndpointUtf16Changed](xuserregisterfordefaultaudioendpointutf16changed.md).

To register a callback for user device association change events, call [XUserRegisterForDeviceAssociationChanged](xuserregisterfordeviceassociationchanged.md).

## Requirements  
  
**Header:** XUser.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also

[XUser](../xuser_members.md)  
[XUserDefaultAudioEndpointUtf16ChangedCallback](xuserdefaultaudioendpointutf16changedcallback.md)  
[XUserRegisterForDefaultAudioEndpointUtf16Changed](xuserregisterfordefaultaudioendpointutf16changed.md)  