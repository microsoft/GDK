---
title: Writing an event to power an event-based achievement
description: Describes how to write an event to power an event-based achievement.
kindex:
- Writing an event to power an event-based achievement
- Xbox Live, Achievements
author: joannaleecy
ms.author: migreen
ms.topic: conceptual
ms.localizationpriority: medium
edited: 00/00/0000
security: public
---

# Writing an event to power an event-based achievement

This topic shows example code of how to write an in-game event.

When the event is fired, the event-based stats on the service are updated according to the stat rules that you've defined in Partner Center.
Those stats, in turn, power event-based achievements.

#### Flat C API


```cpp
HRESULT hr = XblEventsWriteInGameEvent(
    xboxLiveContext,
    "PuzzleSolved",
    R"({"DifficultyLevelId":100, "GameplayModeId":"Adventure"})",
    R"({"LocationX":1,"LocationY":1})"
);
```

For more information, see [XblEventsWriteInGameEvent](../../../../../../reference/live/xsapi-c/events_c/functions/xbleventswriteingameevent.md).