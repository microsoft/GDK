---
title: Handling a social relationship change
description: Provides example code for handling a social relationship change.
kindex:
- Handling a social relationship change
- relationships
author: joannaleecy
ms.author: migreen
ms.topic: conceptual
ms.localizationpriority: medium
edited: 00/00/0000
security: public
---

# Handling a social relationship change

This topic provides example code for handling a social relationship change.

## Subscribing to a relationship change

**Flat C API**

```cpp
HRESULT hr = XblSocialSubscribeToSocialRelationshipChange(
    xboxLiveContext, 
    xboxUserId,
    &state.socialSubscriptionHandle
);
```

## Unsubscribing from a relationship change

**Flat C API**

```cpp
HRESULT hr = XblSocialUnsubscribeFromSocialRelationshipChange(
    xboxLiveContext, 
    state.socialSubscriptionHandle
);

state.socialSubscriptionHandle = nullptr;
```

## Adding a relationship-changed handler


**Flat C API**

```cpp
state.socialRelationshipChangedHandlerToken = XblSocialAddSocialRelationshipChangedHandler(
    xboxLiveContext,
    [](const XblSocialRelationshipChangeEventArgs* args, void* context)
    {
        UNREFERENCED_PARAMETER(context);
        LogToFile("Social relationship changed:");
        std::stringstream ss;
        for (size_t i = 0; i < args->xboxUserIdsCount; ++i)
        {
            if (i > 0) 
            {
                ss << ", ";
            }
            ss << args->xboxUserIds[i];
        }
        LogToFile("socialNotification = %u, affectedXuids = %s", args->socialNotification, ss.str().data());
    },
    nullptr
);
```

## Removing a relationship-changed handler

**Flat C API**

```cpp
HRESULT hr = XblSocialRemoveSocialRelationshipChangedHandler(xboxLiveContext, state.socialRelationshipChangedHandlerToken);
state.socialRelationshipChangedHandlerToken = 0;
```

## See also

[XblSocialSubscribeToSocialRelationshipChange](../../../../../reference/live/xsapi-c/social_c/functions/xblsocialsubscribetosocialrelationshipchange.md)  
[XblSocialUnsubscribeFromSocialRelationshipChange](../../../../../reference/live/xsapi-c/social_c/functions/xblsocialunsubscribefromsocialrelationshipchange.md)  
[XblSocialAddSocialRelationshipChangedHandler](../../../../../reference/live/xsapi-c/social_c/functions/xblsocialaddsocialrelationshipchangedhandler.md)  
[XblSocialRemoveSocialRelationshipChangedHandler](../../../../../reference/live/xsapi-c/social_c/functions/xblsocialremovesocialrelationshipchangedhandler.md)  
