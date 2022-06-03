---
author: M-Stahl
title: XUserRegisterForDeviceAssociationChanged
description: Registers a callback for user device association change events.
kindex: XUserRegisterForDeviceAssociationChanged
ms.author: v-sahain
ms.topic: reference
edited: 02/10/2020
quality: good
security: public
applies-to: pc-gdk
---

# XUserRegisterForDeviceAssociationChanged

Registers a callback for user device association change events.  

## Syntax  
  
```cpp
HRESULT XUserRegisterForDeviceAssociationChanged(  
         XTaskQueueHandle queue,  
         void* context,  
         XUserDeviceAssociationChangedCallback* callback,  
         XTaskQueueRegistrationToken* token  
)  
```  
  
### Parameters  
  
*queue* &nbsp;&nbsp;\_In\_opt\_  
Type: XTaskQueueHandle  

A handle to the asynchronous queue to put the change callback on.  

*context* &nbsp;&nbsp;\_In\_opt\_  
Type: void*  

A callback the application defines and passes back to the callback.  

*callback* &nbsp;&nbsp;\_In\_  
Type: [XUserDeviceAssociationChangedCallback*](xuserdeviceassociationchangedcallback.md)  

A callback the application defines and registers.

*token* &nbsp;&nbsp;\_Out\_  
Type: [XTaskQueueRegistrationToken*](../../xtaskqueue/structs/xtaskqueueregistrationtoken.md)  

On success contains a token identifying the callback you can use to un-register the callback.  

### Return value

Type: HRESULT
  
HRESULT success or error code.  
For a list of error codes, see [Error Codes](../../../errorcodes.md).  

## Remarks
  > [!NOTE]
> This function isn't safe to call on a time-sensitive thread. For more information, see [Time-sensitive threads](../../../../system/overviews/time-sensitive-threads.md).  
  
Calling **XUserDeviceAssociationRegisterForChangeEvent** does not invalidate previously registered callbacks.

To unregister a user device association change callback, call [XUserUnregisterForDeviceAssociationChanged](xuserunregisterfordeviceassociationchanged.md).

To register a callback that the application defines and invokes when the default endpoint changes, call [XUserRegisterForDefaultAudioEndpointUtf16Changed](xuserregisterfordefaultaudioendpointutf16changed.md).

To unregister a default audio endpoint change callback, call [XUserUnregisterForDefaultAudioEndpointUtf16Changed](xuserunregisterfordefaultaudioendpointutf16changed.md).

## Requirements  
  
**Header:** XUser.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also

[XUser](../xuser_members.md)
  
[XUserUnregisterForDeviceAssociationChanged](xuserunregisterfordeviceassociationchanged.md)

[XUserRegisterForDefaultAudioEndpointUtf16Changed](xuserregisterfordefaultaudioendpointutf16changed.md)

[XUserUnregisterForDefaultAudioEndpointUtf16Changed](xuserunregisterfordefaultaudioendpointutf16changed.md)