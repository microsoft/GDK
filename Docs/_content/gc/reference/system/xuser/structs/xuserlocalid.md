---
author: M-Stahl
title: XUserLocalId
description: Specifies a game session ID for a user.
kindex: XUserLocalId
ms.author: v-sahain
ms.topic: reference
edited: 07/02/2019
quality: good
security: public
applies-to: pc-gdk
---

# XUserLocalId  

Specifies a game session ID for a user.  

## Syntax  
  
```cpp
typedef struct XUserLocalId {  
    uint64_t value;  
} XUserLocalId  
```
  
### Members  
  
*value*  
Type: uint64_t  
  
The game session ID for a user.  

## Remarks

The XUserLocalId uniquely identifies a user within a gaming session. If we duplicate **XUserHandle**, both handles maintain the same XUserLocalId. Once a gaming session ends, the same user can have a different XUserLocalIds in the next session. You cannot use these IDs to track users across gaming sessions. The IDs are valid per gaming session.

A "null" XUserLocalId will be equal to the value of **XUserNullUserLocalId**.

The following callback functions and function take an XUserLocalId structure or a pointer to one as an argument:

- [XUserChangeEventCallback](../functions/xuserchangeeventcallback.md): A callback function for a user change event.
- [XUserDefaultAudioEndpointUtf16ChangedCallback](../functions/xuserdefaultaudioendpointutf16changedcallback.md): A callback that invokes when the default audio endpoint for a user changes.
- [XUserFindUserByLocalId](../functions/xuserfinduserbylocalid.md): A function that uses a specific local ID to retrieve a handle to a user.
- [XUserGetDefaultAudioEndpointUtf16](../functions/xusergetdefaultaudioendpointutf16.md): A function that retrieves the default audio endpoint for a specific user.
- [XUserGetLocalId](../functions/xusergetlocalid.md): A function that retrieves the unique game session ID for a user.

The following example demonstrates how to use the XUserLocalId structure to retrieve the default audio endpoint for a user.
  
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
  
[XUserChangeEventCallback](../functions/xuserchangeeventcallback.md)

[XUserDefaultAudioEndpointUtf16ChangedCallback](../functions/xuserdefaultaudioendpointutf16changedcallback.md)

[XUserFindUserByLocalId](../functions/xuserfinduserbylocalid.md)

[XUserGetDefaultAudioEndpointUtf16](../functions/xusergetdefaultaudioendpointutf16.md)

[XUserGetLocalId](../functions/xusergetlocalid.md)