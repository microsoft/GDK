---
author: M-Stahl
title: XUserDefaultAudioEndpointKind
description: Specifies whether the user's default audio endpoint renders or captures audio.
kindex: XUserDefaultAudioEndpointKind
ms.author: v-sahain
ms.topic: reference
edited: 00/00/0000
quality: good
security: public
applies-to: pc-gdk
---

# XUserDefaultAudioEndpointKind

Specifies whether the user's default audio endpoint renders or captures audio.

## Syntax  
  
```cpp
enum class XUserDefaultAudioEndpointKind  : uint32_t  
{  
    CommunicationRender = 0,  
    CommunicationCapture = 1  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| CommunicationRender | The user's default audio endpoint renders audio.  |  
| CommunicationCapture | The user's default audio endpoint captures audio.   |  
  
## Remarks

The [XUserGetDefaultAudioEndpointUtf16](../functions/xusergetdefaultaudioendpointutf16.md) function uses an XUserDefaultAudioEndpointKind enumeration argument to get the default audio endpoint for a user.
The [XUserDefaultAudioEndpointUtf16ChangedCallback](../functions/xuserdefaultaudioendpointutf16changedcallback.md) function takes an XUserDefaultAudioEndpointKind enumeration argument and is invoked when the default audio endpoint for a user changes.

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
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also

[XUser](../xuser_members.md)
  
[XUserGetDefaultAudioEndpointUtf16](../functions/xusergetdefaultaudioendpointutf16.md)

[XUserDefaultAudioEndpointUtf16ChangedCallback](../functions/xuserdefaultaudioendpointutf16changedcallback.md)