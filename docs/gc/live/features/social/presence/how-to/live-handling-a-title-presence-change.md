---
title: Handling a title Presence change
description: Provides example code for handling a title Presence change.
kindex:
- Handling a title Presence change
- Presence
author: joannaleecy
ms.author: migreen
ms.topic: conceptual
ms.localizationpriority: medium
edited: 00/00/0000
security: public
---

# Handling a title Presence change

This topic provides example code for handling a title Presence change.

## Subscribing to a title Presence change

#### Flat C API



```cpp
uint64_t xuid{ 123 };

HRESULT hr = XblPresenceSubscribeToTitlePresenceChange(
    xboxLiveContext,
    xuid,
    titleId,
    &state.titlePresenceChangeSubscription
);
```

## Unsubscribing from a title Presence change

#### Flat C API


```cpp
HRESULT hr = XblPresenceUnsubscribeFromTitlePresenceChange(
    xboxLiveContext,
    state.titlePresenceChangeSubscription
);

state.titlePresenceChangeSubscription = nullptr;
```

## Adding a title Presence change handler

#### Flat C API


```cpp
state.titlePresenceChangedHandlerToken =  XblPresenceAddTitlePresenceChangedHandler(
    xboxLiveContext,
    [](void* context, uint64_t xuid, uint32_t titleId, XblPresenceTitleState titleState)
    {
        UNREFERENCED_PARAMETER(context);
        LogToFile("Title presence change notification received:");
        LogToFile("Xuid = %u, titleId = %u, titleState = %u", xuid, titleId, titleState);
    },
    nullptr
);
```

For more information, see
[XblPresenceTitleState](../../../../../reference/live/xsapi-c/presence_c/enums/xblpresencetitlestate.md).

## Removing a title Presence change handler

#### Flat C API


```cpp
HRESULT hr = XblPresenceRemoveTitlePresenceChangedHandler(
    xboxLiveContext,
    state.titlePresenceChangedHandlerToken
);

state.titlePresenceChangedHandlerToken = 0;
```
