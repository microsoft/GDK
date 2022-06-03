---
title: Writing an event to power an event-based stat
description: Provides example code for writing an event to power an event-based stat.
kindex: Writing an event to power an event-based Stat
author: joannaleecy
ms.author: migreen
ms.topic: conceptual
ms.localizationpriority: medium
ms.date: 11/22/2019
edited: 00/00/0000
security: public
---

# Writing an event to power an event-based stat

This topic provides example code that shows how to write an event.
On the service, this example code updates event-based stats based on the stat rules that you've defined in Partner Center.


#### Flat C API

```cpp
HRESULT hr = XblEventsWriteInGameEvent(
    xboxLiveContext,
    "PuzzleSolved",
    R"({"DifficultyLevelId":100, "GameplayModeId":"Adventure"})",
    R"({"LocationX":1,"LocationY":1})"
);
```

For more information, see
[XblEventsWriteInGameEvent](../../../../../../reference/live/xsapi-c/events_c/functions/xbleventswriteingameevent.md).
