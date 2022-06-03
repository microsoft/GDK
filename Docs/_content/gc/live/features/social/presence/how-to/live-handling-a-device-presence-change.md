---
title: Handling a device Presence change
description: Provides example code for handling a device Presence change.
kindex:
- Handling a device Presence change
- Presence
author: joannaleecy
ms.author: migreen
ms.topic: conceptual
ms.localizationpriority: medium
edited: 00/00/0000
security: public
---

# Handling a device Presence change

This topic provides example code for handling a device Presence change.

This topic covers the following:

* [Subscribing to a device Presence change​](#stadpc)
* [Unsubscribing from a device Presence change​](#ufadpc)
* [Adding a device Presence change handler​](#aadpch)
* [Removing a device Presence change handler](#radpch)


<a id="stadpc"></a>

## Subscribing to a device Presence change​

#### Flat C API



```cpp
uint64_t xuid{ 123 };

HRESULT hr = XblPresenceSubscribeToDevicePresenceChange(
    xboxLiveContext,
    xuid,
    &state.devicePresenceChangeSubscription
);
```

<a id="ufadpc"></a>

## Unsubscribing from a device Presence change​

#### Flat C API


```cpp
HRESULT hr = XblPresenceUnsubscribeFromDevicePresenceChange(
    xboxLiveContext,
    state.devicePresenceChangeSubscription
);

state.devicePresenceChangeSubscription = nullptr;
```

<a id="aadpch"></a>

## Adding a device Presence change handler​

#### Flat C API


```cpp
state.devicePresenceChangedHandlerToken = XblPresenceAddDevicePresenceChangedHandler(
    xboxLiveContext,
    [](void* context, uint64_t xuid, XblPresenceDeviceType deviceType, bool isUserLoggedOnDevice)
    {
        UNREFERENCED_PARAMETER(context);
        LogToFile("Device presence change notification received:");
        LogToFile("Xuid = %u, deviceType = %u, isUserLoggedOnDevice = %u", xuid, deviceType, isUserLoggedOnDevice);
    },
    nullptr
);
```

For more information, see
[XblPresenceDeviceType](../../../../../reference/live/xsapi-c/presence_c/enums/xblpresencedevicetype.md).


<a id="radpch"></a>

## Removing a device Presence change handler

#### Flat C API


```cpp
HRESULT hr = XblPresenceRemoveDevicePresenceChangedHandler(
    xboxLiveContext,
    state.devicePresenceChangedHandlerToken
);

state.devicePresenceChangedHandlerToken = 0;
```