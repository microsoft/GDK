---
title: Adding a field value to a stat rule
description: Describes how you should usually add a field name, rather than a field value, to a stat rule.
kindex:
- Xbox Live stat rules
- stat rules, Xbox Live
author: joannaleecy
ms.author: migreen
ms.topic: conceptual
ms.localizationpriority: medium
edited: 00/00/0000
security: public
---

# Adding a field value to a stat rule


This topic describes how you should usually add a field name, rather than a field value, to a stat rule.

## The event value is added to the stat name

Stat templates are powerful and flexible but can sometimes produce unintended results if they're not properly configured. Stat templates create variable stat paths, or stat instances. Stat templates result in stat names based on variables that are derived from the name _and value_ of selected fields in the source event.
This is how you might capture something like _how much_ gold a player earned in each map.

Not only are event _names_ added to the stat name, but the event _values_ are as well. This can often produce confusion and unintended outcomes.

## Example of a single stat rule

Suppose your game sends an event named `GameEnd`. It has an `int` field named `Map` and an `int` field named `Gold`.

To capture the high score by map by using a single stat rule, you'd give the stat a name, like `GoldByMap`, and add a `Map` field to the stat rule. In this example, the `Map` value is a numeric ID.


Your parameter (the field that contains the value you want to increment the stat by) would be the `Gold` field on the `GameEnd` event.


Suppose your game sends a `GameEnd` event to the Xbox Live service. The event's `Map` field value is 1. The `Gold` field value is 100.
The result is that the stat is written to the stat path: `GoldByMap.Map.1`. The new value for this stat path is 100.

The following table shows what we have so far.

| Item | Type | Notes |
| --- | --- | --- |
| `GameEnd` | An event | Sent by your game to the Xbox Live service |
| `Map` | A field on the event | An `int` |
| 1 | `int` | The value of the `Map` field |
| `Gold` | A field on the event | An `int` |
| 100 | `int` | The value of the `Gold` field |

The stat path has the parts that are shown in the following table.

| Item | Type | Notes |
| --- | --- | --- |
| `GoldByMap.Map.1` | A stat path | The value of this stat path is 100. |
| `GoldByMap` | A stat name | N/A. |
| `Map` | A stat rule | A numeric ID. |

If the next event comes in with a `Map` value of 2, the `Gold` field from that event is added to that new stat path: `GoldByMap.Map.2`.

Suppose that the `Gold` field on the event has the value 200.
We would now also have what's shown in the following table.

| Item | Type | Notes |
| --- | --- | --- |
| `GoldByMap.Map.2` | A stat path | The value of this stat path is 200. |

This way, you can keep stats values separate, without needing to define a stat for every `Map`.

## Example of mistakenly adding a field name rather than a field value to the stat rule

Using the previous example, let's see what bad results happen when you also add the `Gold` field name to the `Map` stat rule, instead of adding just the `Gold` parameter value. This would result in the following stat name: `GoldByMap.Map.1.Gold.100`.

Notice that the value of the gold earned by the player (100) is also in the name of the stat.
This means that a player earning 100 gold on Map 1 will get a value of 100 for this stat: `GoldByMap.Map.1.Gold.100`.

If a player earned 101 gold on that map, this configuration results in the following, which is a different stat name: `GoldByMap.Map.1.Gold.101`. The result is that these stats would only increment whenever the player earns the specific amount of gold that's defined in the stat name, which is probably not what was intended.
