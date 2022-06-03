---
title: Event-based Stat rules overview
description: Describes how user stat rules work.
kindex:
- Event-based Stat rules overview
- stats, Xbox Live
author: joannaleecy
ms.author: migreen
ms.topic: conceptual
ms.localizationpriority: medium
edited: 01/06/2020
security: public
---

# Event-based Stat rules overview



This topic describes how user stat rules work. They're used for event-based Stats, not for title-managed Stats.

Each stat rule has four parts.

- The producer event
- The name
- An operator
- A parameter

## Event

Each stat rule is triggered by a specific event name that's logged by the title. Note that multiple stat rules can be triggered by a single event.


## Naming requirements

* A rule name has a "root" name. It's optionally followed by one or more "fields."

* The *root* is an alphanumeric string. It can be up to 32 characters.

* The total length of the stat instance name must not exceed 128 characters.

* The name must start with a letter character and must contain only letters, numbers, and the hyphen (-) character. No spaces, commas, periods, underscores, or any other special character is allowed. Some example names are "EnemiesDefeated", "BestScoreUnder2Minutes", and "Total-Collectibles-Jewels".

* Fields are separated by the dot (.) character.

* Field names must exactly match the field names that are part of the producer event.
> [!IMPORTANT]
> When one or more fields are included as part of the stat rule name, this rule becomes a stat template. At runtime, the actual value of fields from the producer event is inserted into the stat instance name.

* Some example valid template names are "EnemiesDefeated.WeaponID", "BestScoreUnder2Minutes.TrackId.DifficultyID", and "Total-Collectibles-Jewels.Found".

* Some example valid instance names are "EnemiesDefeated.WeaponID.17", "BestScoreUnder2Minutes.TrackId.40.DifficultyID.Insane", and "Total-Collectibles-Jewels.Found.1".

## Data type recommendations

* We recommend that you use the integer data type for event fields that are part of a stat template name.

* If the event field data type is Boolean, the value inserted is "1" for `true`, and "0" for `false`.

* If the event field data type is Unicode string, you must ensure that the potential values for that field contain only valid characters (as previously described).


## Operator

The value of the stat instance is calculated at runtime when the producer event is being processed. The stat rule executes an *operation* with the specified *parameter*. The supported operation options are as follows.

* `SUM`
* `MAX`
* `MIN`
* `REPLACE`


## Parameter

The parameter can be either a constant value or a field name from the producing event as shown in the following table.

| Operator | Parameter |
| --- | --- |
| `SUM` | Constant or field |
| `MIN` | Field |
| `MAX` | Field |
| `REPLACE` | Constant or field |

The data type of the resulting stat instance is determined by the parameter's data type.

Integer, Float, and Boolean data types are supported by all operators.

The Unicode string data type is supported only by the `REPLACE` operator.

Stat and parameter data types are shown in the following table.

| Stat data type | Parameter data type | Notes |
| --- | --- |
| Integer | Int32, Int64, UInt32, UInt64, Boolean | The largest integer value supported is 56 bit. Boolean is converted from `TRUE` to 1 and `FALSE` to 0. |
| Float | Float, Double | 64-bit float. |
| String | UnicodeString, GUID | The maximum string length is 50 characters. |
