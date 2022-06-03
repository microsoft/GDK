---
title: Scenarios for creating event-based achievements
description: Describes scenarios for creating event-based achievements.
kindex:
- Achievements
- Xbox Live
author: joannaleecy
ms.author: kevinasg
ms.topic: conceptual
ms.assetid: f777aca3-0116-46d8-abdd-63a360649d86
ms.localizationpriority: medium
ms.date: 04/04/2017
edited: 01/06/2020
security: public
---

# Scenarios for creating event-based achievements

This topic describes some common scenarios for creating achievements.
> [!NOTE]
> This topic is applicable if you are currently using event-based achievements (Achievements 2013) and want to continue using cross-progression. Otherwise, we recommend using [title-managed achievements](../../title-managed/live-achievements-tm-overview.md).


* [AND/OR logic for multiple conditions](#scenario-1)
* [Repeated actions](#scenario-2)
* [Collection of actions](#scenario-3)
* [Personal best](#scenario-4)
* [Binary value indicating conditions met](#scenario-5)

<a id='scenario-1'></a>

## AND/OR logic for multiple conditions

There are two common AND scenarios for achievements: synchronous AND and asynchronous AND.

### Asynchronous AND
Asynchronous AND logic defines an achievement that's unlocked when all of the achievement rules have been met. The user can fulfill each rule independently of the others, at separate points in time.

An example of this kind of achievement is "Kill 10 zombies and 20 ghosts." To define this achievement, configure multiple achievement rules as shown in the following table.

Field | Value
--- | ---
**Rule #1 Name** | **Kill 10 zombies**
Stats | Kills.EnemyType.Zombie
Action | SUM
Threshold | 10
**Rule #2 Name** | **Kill 20 ghosts**
Stats | Kills.EnemyType.Ghost
Action | SUM
Threshold | 20

### Synchronous AND
Synchronous AND logic defines an achievement that's unlocked when all of the achievement rules have been met, where the user must fulfill each criterion simultaneously. An example of this kind of achievement is "Kill 10 zombies with a bat while playing as Johnny."

A synchronous AND rule can't simply be defined by multiple achievement rules that capture each criterion separately. This doesn't work as needed because each achievement rule can be met independently. The example achievement would be incorrectly unlocked if a user did the following:
* Monday: play as Johnny and get zero kills.
* Tuesday: play as Sam and get 10 zombie kills.
* Friday: play as Tim and get five skeleton kills by using a bat.

To define an achievement like this, you must define a stat rule that encompasses each criterion. Only events contain the full context of a user's activity because they express exactly what occurs in a game at a given moment. Stats inherit from events, and achievements inherit from stats. You must define the achievement criteria as a stat to persist any context pertinent to the achievement. The achievement is unlocked only when the threshold is met via the specific stat instance containing the exact values that you require. The following configuration defines the example achievement.

Field | Value
--- | ---
**Rule #1 Name** | Kill 10 zombies with a bat while playing as Johnny
Stats | Kills.EnemyType.Zombie.WeaponType.Bat.PlayerCharacter.Johnny
Action | SUM
Threshold | 10

### OR logic for achievements
The most common OR scenario for achievements is to describe a particular goal as a set of different, explicitly enumerated possible means. The achievement can be unlocked in this way OR that way.

You can't implement this scenario by defining multiple achievement rules, one for each goal. Multiple rules on an achievement act as a logical AND, so each rule must be met for the achievement to be unlocked. Using one achievement rule for "finish a race in under three minutes on Racetrack A" and a second achievement rule for "drive 1,000 miles on Racetrack B" results in an achievement that's unlocked only when the user fulfills both of those goals.

Instead, to define an achievement with OR logic, you must configure a single achievement rule to be based on multiple stat instances, where each stat instance tracks an acceptable means.

#### Using a MIN or MAX rule

An example of this case is "Finish a race in under three minutes on Racetrack A, Racetrack B, or Racetrack F." The achievement configuration for this is shown in the following table.

Field | Value
--- | ---
**Rule #1 Name** | Finish race in under three minutes on track A, B, or F
Stat(s) | FinishTimeInSeconds.TrackId.A<br>FinishTimeInSeconds.TrackId.B<br>FinishTimeInSeconds.TrackId.F
Action | MIN
Threshold | 180

Because this achievement rule uses a MIN rule action, the achievement is unlocked when any of the listed stat instances fulfills the threshold. For example, if `FinishTimeInSeconds.TrackId.A is 220`, `FinishTimeInSeconds.TrackId.B is 163`, and `FinishTimeInSeconds.TrackId.F` is 199, the achievement is unlocked because the user had a finish time on Racetrack B that outperformed the threshold.

#### Using a SUM rule

An example of this case is "Drive 1,000 cumulative miles on Racetrack A, Racetrack B, or Racetrack F." The achievement configuration for this is shown in the following table.

Field | Value
--- | ---
**Rule #1 Name** | Drive 1,000+ miles on racetracks A, B, or F
Stats | MilesDriven.TrackId.A<br>MilesDriven.TrackId.B<br>MilesDriven.TrackId.F
Action | SUM
Threshold | 1000

Because this achievement rule uses a SUM rule action, the achievement is unlocked when the aggregated combination of the listed stat instances fulfills the threshold. For example, if `MilesDriven.TrackId.A is 900`, `MilesDriven.TrackId.B is 115`, and `MilesDriven.TrackId.F is 0`, the achievement is unlocked because the user's aggregated total across all three stats outperformed the threshold.

#### Reach this goal OR that goal

An achievement scenario that is not supported is to require the user to accomplish one of a few different goals. For example: "Finish a race in under 3 three minutes on Racetrack A OR drive 1000 miles on Racetrack B".

This achievement scenario is not currently supported in the achievements logic. You can't accomplish this by defining multiple achievement rules, one for each goal. Multiple rules on an achievement act as a logical AND, so each rule must be met in order for the achievement to unlock. Using one achievement rule for "finish a race in under three minutes on Racetrack A" and a second achievement rule for "drive 1,000 miles on Racetrack B" will result in an achievement that's unlocked only when the user fulfills both of those rules.
<a id='scenario-2'></a>

## Repeated actions

Use this pattern to define an achievement that requires a user to repeat an action more than once.

### Example 1: Win 50 multiplayer matches

Field | Value
--- | ---
**Rule Name** | Win 50 multiplayer matches
Stats | MatchesCompleted.Result.1.Mode.Multiplayer
 Action | SUM
Threshold | 50

### Example 2: Upload 10 videos and rate 100 videos

Field | Value
--- | ---
**Rule #1 Name** | **Upload 10 videos**
Stats | VideosUploaded
 Action | SUM
Threshold | 10
**Rule #2 Name** | **Rate 100 videos**
Stats | VideosRated
Action | SUM
Threshold | 100

For more information about designing user statistics, see [Using counters for cumulative values](../../../stats-leaderboards/event-based/config/live-user-stats-scenarios.md#ucfcv).

<a id='scenario-3'></a>
## Collection of actions

### Goal: Find X of Y items
Use this pattern to define an achievement that requires a user to act on all (or a subset of) members in a specific set.

### Example 1: Complete all levels on Hardcore difficulty

Field | Value
--- | ---
**Rule #1 Name** | **Complete level 1 on Hardcore**
Stats | LevelCompleted.Mode.3.LevelId.1
Action | SUM
Threshold | 1
**Rule #2 Name** | **Complete level 2 on Hardcore**
Stats | LevelCompleted.Mode.3.LevelId.2
Action | SUM
Threshold | 1
**Rule #3 Name** | **Complete level 3 on Hardcore**
Stats | LevelCompleted.Mode.3.LevelId.3
Action | SUM
Threshold | 1

### Example 2: Finish any of the Europe tracks in under three minutes
This achievement can be defined as a minimum of individual track finish times or by using the best finish time for a set of tracks. Use either of the following methods, but not both.

#### Method 1

Field | Value
--- | ---
**Rule Name** | Finish any Europe track in less than three minutes
Stats | LastFinishTimeInSeconds.TrackId.21<br>LastFinishTimeInSeconds.TrackId.22<br>LastFinishTimeInSeconds.TrackId.23<br>LastFinishTimeInSeconds.TrackId.24<br>LastFinishTimeInSeconds.TrackId.25<br>LastFinishTimeInSeconds.TrackId.26
Action | MIN
Threshold | 180

#### Method 2

Field | Value
--- | ---
**Rule Name** | Finish any Europe track in less than three minutes
Stats | BestFinishTimeInSeconds.TrackSet.Europe
Action | MIN
Threshold | 180

To design the associated user statistic, see [Tracking the most recent](../../../stats-leaderboards/event-based/config/live-user-stats-scenarios.md#ttmr) and [Tracking a personal best](../../../stats-leaderboards/event-based/config/live-user-stats-scenarios.md#tapb).

<a id='scenario-4'></a>

## Personal best

Use this pattern to define an achievement that requires a user to outperform the target in a single session or playthrough. This achievement can't be reached through aggregated effort, such as multiple runs.

#### Example 1: Complete the game with five or fewer deaths

Field | Value
--- | ---
**Rule Name** | Complete game with five or fewer deaths
Stats | PlaythroughDeaths.GameResultId.1
Action | MIN
Threshold | 5

#### Example 2: Win a match having scored at least 50 points as Lebron James

Field | Value
--- | ---
**Rule Name** | Win match AND play as Lebron AND score at least 50 points
Stats | BestScore.PlayerId.3056.MatchResultId.1
Action | SUM
Threshold | 10

<a id='scenario-5'></a>

## Binary value indicating conditions met

Use this pattern to define an achievement that requires a user to do a complex activity that can't be tracked easily via Xbox Live Stats or that isn't supported by other Xbox Live achievements configuration options.

### Example: Get 90 kills with shotgun or 10 kills with sniper

Field | Value
--- | ---
**Rule Name** | 90 shotgun kills OR 10 sniper kills
Stats | AchievementUnlocked.UnlockId.9010
Action | SUM
Threshold | 1

> [!IMPORTANT]
> This achievement configuration doesn't track either shotgun kills or sniper kills. It merely records the fact that one of those two conditions was met. The achievement must be set by the title because this scenario isn't supported by the data platform.