---
title: User stats scenarios
description: Describes how to configure event rules for several common user stat scenarios.
kindex:
- Xbox Live stats scenarios
- stats scenarios, Xbox Live
author: joannaleecy
ms.author: migreen
ms.topic: conceptual
ms.localizationpriority: medium
edited: 00/00/0000
security: public
---

<a id="top"></a>

# User stats scenarios



This topic covers the following common scenarios for creating user statistics when you're using event-based Stats.

* [Using Boolean values for conditions](#ubvfc)

* [Using counters for cumulative values](#ucfcv)

* [Tracking a personal best](#tapb)

* [Tracking the most recent](#ttmr)



<a id="ubvfc"></a>

## Using Boolean values for conditions

### Goal: Track whether a particular condition has been met

Use this pattern when you want to flag whether the user has met a specific condition in the game logic.

### Use cases

* Flag if the user's character has died on a particular level

* Flag whether the user has unlocked each specific collectible

* Flag if the user is currently playing on hardcore difficulty

* Flag if the user has meet all five conditions to unlock a complex achievement


### Example: Flag if the user got 90 kills by using the shotgun or 10 kills by using the sniper

| Field | Value |
| --- | --- |
| Event name | `AchievementUnlocked` |
| Event fields | `UnlockId` (Data type: Int32) |
| Stat template name | `AchievementUnlocked.UnlockId` |
| Operator | `REPLACE` |
| Parameter | 1 |
| Access | `Open` |


### Rules

Apply the `REPLACE` operator with a literal value of "1" if the flag must be read as `TRUE`.

Apply the `SUM` operator with a literal value of "1" if the flag must be equal to or greater than 1 to trigger the game logic.


### Cautions

If necessary, initialize or reset the value for `REPLACE` Boolean stats. Otherwise, the most recently set value is persisted.

In some cases, it's convenient to define an event that allows resetting a Boolean stat to `FALSE`. In those cases, use a `REPLACE` operation with a literal value of "0".

 [Return to the top of this topic.](#top)


<a id="ucfcv"></a>

## Using counters for cumulative values

### Goal: Increment (or decrement) an all-time cumulative value for the user on a particular metric

Use this pattern when you want to increment the stat value by a fixed or variable amount each time that the event is processed.

### Use cases

* Player level

* Total kills

* Number of videos uploaded

* Number of times that the user has played on each map

* Cumulative distance driving each vehicle type

* Current number of items in inventory

### Example: Counter of multiplayer matches won

| Field | Value |
| --- | --- |  
| Event name | `MatchCompleted` |
| Event field 1 | `Result` (Data type: Int32) |
| Event field 2 | `Mode` (Data type: Unicode string) |
| Stat template name | `MatchesCompleted.Result.Mode` |
| Operator | `SUM` |
| Parameter | 1 |
| Access | `Open` |

### Rules

Apply the `SUM` operator to the corresponding event field or specify a fixed constant value as the parameter.

To decrement the value of the stat, use a negative value as the parameter, either as a fixed constant or as a runtime value in the event field.

### Cautions

Don't use string data type "literal" values as parameters with the `SUM` operator.

Don't apply the `SUM` operator to a string data type event field.

If you have multiple events that are updating the same stat, ensure that all the stat rules updating that stat use the same operator.

 [Return to the top of this topic.](#top)


<a id="tapb"></a>

## Tracking a personal best

### Goal: Track the all-time "best" score for the user on a particular metric

Use this pattern when you want to persist the largest (`MAX`) or smallest (`MIN`) record for the user. Discard any values that don't improve the user's record.

### Use cases

* Longest kill streak

* Fewest deaths on a multiplayer round

* Fastest time completing each race track

* Longest distance drive on every hole on any golf course

### Example: Fastest time completing any track in the Europe set

| Field | Value |
| --- | --- |
| Event name | `TrackCompleted` |
| Event field 1 | `TrackSet` (Data type: Unicode string) |
| Event field 2 | `TimeInSeconds` (Data type: Int32) |
| Stat template name | `BestFinishTimeInSeconds.TrackSet` |
| Operator | `MIN` |
| Parameter | `TimeInSeconds` |
| Access | `Open` |

### Rules

Apply the `MAX` or `MIN` operator to the corresponding event field.

### Cautions

Don't use "literal" values as parameters with the `MAX` or `MIN` operator.

Don't apply the `MAX` or `MIN` operator to a string data type event field.

If you have multiple events that are updating the same stat, ensure that all the stat rules updating that stat use the same operator.

 [Return to the top of this topic.](#top)


<a id="ttmr"></a>

## Tracking the most recent

### Goal: Track the most recent score posted by the user on a particular metric

Use this pattern when you want to persist the latest record for the user, regardless of whether the value improves the user's best record.

### Use cases

* Current difficulty

* Number of deaths on the current multiplayer round

* Top speed on the most recent race for each track

* Boolean flag for premium golf club currently equipped

### Example: Most recent completed time on any track

| Field | Value |
| --- | --- |
| Event name | `TrackCompleted` |
| Event field 1 | `TrackId` (Data type: Int32) |
| Event field 2 | `TimeInSeconds` (Data type: Int32) |
| Stat template name | `BestFinishTimeInSeconds.TrackId` |
| Operator | `REPLACE` |
| Parameter | `TimeInSeconds` |
| Access | `Open` |

### Rules

Apply the `REPLACE` operator to the corresponding event field or literal value.

### Cautions

If necessary, initialize or reset the value for `REPLACE` stats. Otherwise, the most recently set value is persisted.

 [Return to the top of this topic.](#top)
