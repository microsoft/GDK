---
author: M-Stahl
title: XUserDefaultAudioEndpointUtf16ChangedCallback
description: A callback that an application defines and invokes when the default audio endpoint for a user changes.
kindex: XUserDefaultAudioEndpointUtf16ChangedCallback
ms.author: v-sahain
ms.topic: reference
edited: 00/00/0000
quality: good
security: public
applies-to: pc-gdk
---

# XUserDefaultAudioEndpointUtf16ChangedCallback

A callback that an application defines and invokes when the default audio endpoint for a user changes.  

## Syntax  
  
```cpp
void XUserDefaultAudioEndpointUtf16ChangedCallback(  
         void* context,  
         XUserLocalId user,  
         XUserDefaultAudioEndpointKind defaultAudioEndpointKind,  
         const wchar_t* endpointIdUtf16  
)  
```  
  
### Parameters  
  
*context* &nbsp;&nbsp;\_In\_opt\_  
Type: void*  

The context the application defines and sends to the [XUserRegisterForDefaultAudioEndpointUtf16Changed](xuserregisterfordefaultaudioendpointutf16changed.md) function when the callback registers.  

*user* &nbsp;&nbsp;  
Type: [XUserLocalId](../structs/xuserlocalid.md)  

The local ID of the user whose default audio endpoint changes.  

*defaultAudioEndpointKind* &nbsp;&nbsp;  
Type: [XUserDefaultAudioEndpointKind](../enums/xuserdefaultaudioendpointkind.md)  
  
An enumeration value that specifies whether the user's default audio endpoint renders or captures audio.

*endpointIdUtf16* &nbsp;&nbsp;\_In\_opt\_z\_  
Type: wchar_t*  
  
A pointer to a string that represents the multimedia device resource.  

### Return value

Type: void
  
## Remarks

To register a callback that an application invokes when the default audio endpoint changes, call the [XUserRegisterForDefaultAudioEndpointUtf16Changed](xuserregisterfordefaultaudioendpointutf16changed.md) function.
The function takes a pointer to an XUserDefaultAudioEndpointUtf16ChangedCallback function as an argument.

To unregister a previously-registered default audio endpoint change callback, call the [XUserUnregisterForDefaultAudioEndpointUtf16Changed](xuserunregisterfordefaultaudioendpointutf16changed.md) function.

## Requirements  
  
**Header:** XUser.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also

[XUser](../xuser_members.md)  
[XUserRegisterForDefaultAudioEndpointUtf16Changed](xuserregisterfordefaultaudioendpointutf16changed.md)  
[XUserUnregisterForDefaultAudioEndpointUtf16Changed](xuserunregisterfordefaultaudioendpointutf16changed.md)  
  