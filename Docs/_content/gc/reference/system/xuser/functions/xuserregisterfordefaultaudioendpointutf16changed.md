---
author: M-Stahl
title: XUserRegisterForDefaultAudioEndpointUtf16Changed
description: Registers a callback that the application defines and invokes when the default audio endpoint changes.
kindex: XUserRegisterForDefaultAudioEndpointUtf16Changed
ms.author: v-sahain
ms.topic: reference
edited: 02/10/2020
quality: good
security: public
applies-to: pc-gdk
---

# XUserRegisterForDefaultAudioEndpointUtf16Changed  

Registers a callback that the application defines and invokes when the default audio endpoint changes.  

## Syntax  
  
```cpp
HRESULT XUserRegisterForDefaultAudioEndpointUtf16Changed(  
         XTaskQueueHandle queue,  
         void* context,  
         XUserDefaultAudioEndpointUtf16ChangedCallback* callback,  
         XTaskQueueRegistrationToken* token  
)  
```  
  
### Parameters  
  
*queue* &nbsp;&nbsp;\_In\_opt\_  
Type: XTaskQueueHandle  

A handle to the asynchronous queue to put the change callback on.  

*context* &nbsp;&nbsp;\_In\_opt\_  
Type: void*  

The context the application defines and passes to the callback.  

*callback* &nbsp;&nbsp;\_In\_  
Type: XUserDefaultAudioEndpointUtf16ChangedCallback*  

The callback the application defines and registers for audio endpoint change events.  

*token* &nbsp;&nbsp;\_Out\_  
Type: [XTaskQueueRegistrationToken*](../../xtaskqueue/structs/xtaskqueueregistrationtoken.md)  

On success, receives a token that identifies the callback. To un-register the callback, pass this token to the [XUserUnregisterForDefaultAudioEndpointUtf16Changed](xuserunregisterfordefaultaudioendpointutf16changed.md) function.  

### Return value

Type: HRESULT
  
HRESULT success or error code.  
For a list of error codes, see [Error Codes](../../../errorcodes.md).

## Remarks
  > [!NOTE]
> This function isn't safe to call on a time-sensitive thread. For more information, see [Time-sensitive threads](../../../../system/overviews/time-sensitive-threads.md).  
  
To unregister a previously-registered default audio endpoint change callback, call [XUserUnregisterForDefaultAudioEndpointUtf16Changed](xuserunregisterfordefaultaudioendpointutf16changed.md).

To register a user device association callback, call [XUserRegisterForDeviceAssociationChanged](xuserregisterfordeviceassociationchanged.md).

To un-register a previously registered user device association change callback, call [XUserUnregisterForDeviceAssociationChanged](xuserunregisterfordeviceassociationchanged.md).

## Requirements  
  
**Header:** XUser.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also

[XUser](../xuser_members.md)  
[XUserDefaultAudioEndpointUtf16ChangedCallback](xuserdefaultaudioendpointutf16changedcallback.md)  
[XUserUnregisterForDefaultAudioEndpointUtf16Changed](xuserunregisterfordefaultaudioendpointutf16changed.md)  
  