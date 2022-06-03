---
title: Sending an event
description: Provides example code that shows how to write an event.
kindex: Sending an event
author: joannaleecy
ms.author: migreen
ms.topic: conceptual
ms.localizationpriority: medium
edited: 00/00/0000
security: public
---

# Sending an event

This topic provides example code that shows how to write an event.
This code updates event-based Stats based on the stat rules that you've defined in Partner Center.


#### Flat C API


```cpp
HRESULT hr = XblEventsWriteInGameEvent(
    xboxLiveContext,
    "PuzzleSolved",
    R"({"DifficultyLevelId":100, "GameplayModeId":"Adventure"})",
    R"({"LocationX":1,"LocationY":1})"
);
```

For more information, see [XblEventsWriteInGameEvent](../../../../../../../reference/live/xsapi-c/events_c/functions/xbleventswriteingameevent.md).
