---
author: M-Stahl
title: XUserGetDefaultAudioEndpointUtf16
description: Retrieves the default audio endpoint for a specific user.
kindex: XUserGetDefaultAudioEndpointUtf16
ms.author: v-sahain
ms.topic: reference
edited: 02/10/2020
quality: good
security: public
applies-to: pc-gdk
---

# XUserGetDefaultAudioEndpointUtf16

Retrieves the default audio endpoint for a specific user.  

## Syntax  
  
```cpp
HRESULT XUserGetDefaultAudioEndpointUtf16(  
         XUserLocalId user,  
         XUserDefaultAudioEndpointKind defaultAudioEndpointKind,  
         size_t endpointIdUtf16Count,  
         wchar_t* endpointIdUtf16,  
         size_t* endpointIdUtf16Used  
)  
```  
  
### Parameters  
  
*user* &nbsp;&nbsp;  
Type: [XUserLocalId](../structs/xuserlocalid.md)  
The local ID of the user to get the default audio endpoint for.  
  
*defaultAudioEndpointKind* &nbsp;&nbsp;  
Type: [XUserDefaultAudioEndpointKind](../enums/xuserdefaultaudioendpointkind.md)  
An enumeration value that specifies whether the user's default audio endpoint renders or captures audio.  

*endpointIdUtf16Count* &nbsp;&nbsp;  
Type: size_t  
The wchar_t count of the buffer that the *endpointIdUtf16* parameter points to. Pass **XUserAudioEndpointMaxUtf16Count**.  

*endpointIdUtf16* &nbsp;&nbsp;\_Out\_writes\_to\_(endpointIdUtf16Count,*endpointIdUtf16Used)  
Type: wchar_t*  
Contains the ID of the user's default audio endpoint.  

*endpointIdUtf16Used* &nbsp;&nbsp;\_Out\_opt\_  
Type: size_t*  
  
Contains the actual wchar_t count of the ID that the *endpointIdUtf16* parameter returns.

### Return value

Type: HRESULT
  
Returns S_OK if successful; otherwise, returns an error code.
For a list of error codes, see [Error Codes](../../../errorcodes.md).  
  
## Remarks
  > [!NOTE]
> This function isn't safe to call on a time-sensitive thread. For more information, see [Time-sensitive threads](../../../../system/overviews/time-sensitive-threads.md).  
  
The XUserGetDefaultAudioEndpointUtf16 function takes an [XUserDefaultAudioEndpointKind](../enums/xuserdefaultaudioendpointkind.md) enumeration as an argument.

The [XUserDefaultAudioEndpointUtf16ChangedCallback](xuserdefaultaudioendpointutf16changedcallback.md) callback function invokes when the default audio endpoint for a specific user changes.

To register to receive a callback when the default audio endpoint changes, call [XUserRegisterForDefaultAudioEndpointUtf16Changed](xuserregisterfordefaultaudioendpointutf16changed.md).

To un-register to receive a callback when the default audio endpoint changes, call [XUserUnregisterForDefaultAudioEndpointUtf16Changed](xuserunregisterfordefaultaudioendpointutf16changed.md).

The following example demonstrates how to retrieve the default audio endpoint for a user.  
  
```cpp
HRESULT GetAudioDeviceAssociation(
    IMMDeviceEnumerator* audioDeviceEnumerator,
    XUserLocalId user,
    XUserDefaultAudioEndpointKind defaultAudioEndpointKind,
    _Outptr_result_maybenull_ IMMDevice** endpoint)
{
    wchar_t audioDeviceId[XUserAudioEndpointMaxUtf16Count];
    RETURN_IF_FAILED_WITH_EXPECTED(XUserGetDefaultAudioEndpointUtf16(user, defaultAudioEndpointKind, std::size(audioDeviceId), audioDeviceId, nullptr), E_NOTFOUND);

    return audioDeviceEnumerator->GetDevice(audioDeviceId, endpoint);
}

HRESULT GetAudioAssociations()
{
    Mwrl::ComPtr<IMMDeviceEnumerator> audioDeviceEnumerator;

    RETURN_IF_FAILED(CoCreateInstance(
        __uuidof(MMDeviceEnumerator),
        nullptr,
        CLSCTX_ALL,
        __uuidof(IMMDeviceEnumerator),
        (void**)&audioDeviceEnumerator));

    XUserLocalId userLocalId;
    RETURN_IF_FAILED(XUserGetLocalId(_handle.get(), &userLocalId));

    {
        wil::unique_cotaskmem_string id;
        Mwrl::ComPtr<IMMDevice> device;
        if (SUCCEEDED(GetAudioDeviceAssociation(audioDeviceEnumerator.Get(), userLocalId, XUserDefaultAudioEndpointKind::CommunicationRender, &device)))
        {
            RETURN_IF_FAILED(device->GetId(&id));
        }
        appLog.AddLog("Preferred render communication device id: %S\n", id.get());
    }

    {
        wil::unique_cotaskmem_string id;
        Mwrl::ComPtr<IMMDevice> device;
        if (SUCCEEDED(GetAudioDeviceAssociation(audioDeviceEnumerator.Get(), userLocalId, XUserDefaultAudioEndpointKind::CommunicationCapture, &device)))
        {
            RETURN_IF_FAILED(device->GetId(&id));
        }
        appLog.AddLog("Preferred capture communication device id: %S\n", id.get());
    }

    return S_OK;
}
```
  
  
## Requirements  
  
**Header:** XUser.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also

[XUser](../xuser_members.md)
  
[XUserDefaultAudioEndpointUtf16ChangedCallback](xuserdefaultaudioendpointutf16changedcallback.md)

[XUserRegisterForDefaultAudioEndpointUtf16Changed](xuserregisterfordefaultaudioendpointutf16changed.md)

[XUserUnregisterForDefaultAudioEndpointUtf16Changed](xuserunregisterfordefaultaudioendpointutf16changed.md)