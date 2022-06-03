---
title: Handling an event-based stat change
description: Provides example code for handling an event-based stat change.
kindex:
- Handling an event-based stat change
- stats, Xbox Live
author: joannaleecy
ms.author: migreen
ms.topic: conceptual
ms.localizationpriority: medium
ms.date: 11/22/2019
edited: 00/00/0000
security: public
---

# Handling an event-based stat change

This topic provides example code for handling an event-based stat change.

**To get notifications about event-based stat changes**

1. [Add a Stat-changed handler](#ID4EM1)
2. [Subscribe to a specific stat change](#ID4EM2)

**To clean up**

1. [Remove a Stat-changed handler](#ID4EM3)
2. [Unsubscribe from a specific stat change](#ID4EM4)


<a id="ID4EM1"></a>

## Add a Stat-changed handler

Register an event handler for statistic change notifications by using the following example code.
The event handler receives an [XblStatisticChangeEventArgs](../../../../../../reference/live/xsapi-c/user_statistics_c/structs/xblstatisticchangeeventargs.md) object.

#### Flat C API

```cpp
void* context{ nullptr };
XblFunctionContext statisticChangedFunctionContext = XblUserStatisticsAddStatisticChangedHandler(
    xboxLiveContext,
    [](XblStatisticChangeEventArgs eventArgs, void* context) 
    {
        // Handle stat change. 
        LogToScreen("Statistic changed callback: stat changed (%s = %s)",
            eventArgs.latestStatistic.statisticName, 
            eventArgs.latestStatistic.value); 
    },
    context
);
```

For more information, see the following:

* [XblStatisticChangeEventArgs](../../../../../../reference/live/xsapi-c/user_statistics_c/structs/xblstatisticchangeeventargs.md)
* [XblUserStatisticsAddStatisticChangedHandler](../../../../../../reference/live/xsapi-c/user_statistics_c/functions/xbluserstatisticsaddstatisticchangedhandler.md)


<a id="ID4EM2"></a>

## Subscribe to a specific stat change

Subscribe to statistic update notifications via the `XblUserStatisticsSubscribeToStatisticChange` handler by using the following example code.

#### Flat C API

```cpp
XblRealTimeActivitySubscriptionHandle subscriptionHandle{ nullptr };

HRESULT hr = XblUserStatisticsSubscribeToStatisticChange(
    xboxLiveContext,
    xboxUserId,
    scid,
    statisticName.c_str(),
    &subscriptionHandle
);
```

<a id="ID4EM3"></a>

## Remove a Stat-changed handler

Remove an event handler for statistic change notifications by using the following example code.

#### Flat C API

```cpp
XblUserStatisticsRemoveStatisticChangedHandler(
        xboxLiveContext,
        statisticChangedFunctionContext
);
```

<a id="ID4EM4"></a>

## Unsubscribe from a specific stat change

Unsubscribe a previously created statistic change subscription by using the following example code.

#### Flat C API

```cpp
hr = XblUserStatisticsUnsubscribeFromStatisticChange(
    xboxLiveContext,
    statisticChangeSubscriptionHandle
);
```
