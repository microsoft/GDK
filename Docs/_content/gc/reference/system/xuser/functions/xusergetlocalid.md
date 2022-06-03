---
author: M-Stahl
title: XUserGetLocalId
description: Retrieves a unique game session id for a user.
kindex: XUserGetLocalId
ms.author: v-sahain
ms.topic: reference
edited: 07/02/2019
quality: good
security: public
applies-to: pc-gdk
---

# XUserGetLocalId  

Retrieves a unique game session id for a user.

## Syntax  
  
```cpp
HRESULT XUserGetLocalId(  
         XUserHandle user,  
         XUserLocalId* userLocalId  
)  
```  
  
### Parameters  
  
*user* &nbsp;&nbsp;\_In\_  
Type: XUserHandle  

A handle to the user to retrieve the local ID for.  

*userLocalId* &nbsp;&nbsp;\_Out\_  
Type: [XUserLocalId*](../structs/xuserlocalid.md)  

Contains a unique game session id for a user.  

### Return value

Type: HRESULT
  
HRESULT success or error code.  
For a list of error codes, see [Error Codes](../../../errorcodes.md).

## Remarks

To retrieve the user ID for a specific user, call [XUserGetId](xusergetid.md).

To retrieve the state of a specific user, call [XUserGetState](xusergetstate.md).

To retrieve the age group for a specific user, call [XUserGetAgeGroup](xusergetagegroup.md).

The **XUserLocalId** uniquely identifies a user within a gaming session. If you duplicate **XUserHandle**, both handles maintain the same **XUserLocalId**. Once the gaming session ends, the same user could have a different **XUserLocalId** during the next session. Do not use these IDs to track users across gaming sessions.  
  
The following example demonstrates how to use the **XUserLocalId** to retrieve the default audio endpoint for a user.  
  
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
  
[XUserGetId](xusergetid.md)

[XUserGetState](xusergetstate.md)

[XUserGetAgeGroup](xusergetagegroup.md)