---
title: Event-based Stats overview
description: >-
  Describes how the game sends events to the Xbox Live stats processor service. The processor uses the stat rules that you've defined in your Xbox Live service configuration (in Partner Center) to process these events and update stats on the service. The game can then retrieve the updated stats from
  the Xbox Live stats service.
kindex:
- Event-based Stats overview
- stats, Xbox Live
author: joannaleecy
ms.author: migreen
ms.topic: conceptual
ms.localizationpriority: medium
edited: 00/00/0000
security: public
---

# Event-based Stats overview





This topic describes how user stats are developer-defined data points that are calculated by the Xbox Live service and stored as name-value pairs on a per-user basis.

Some examples of user stats include the following:
* Total number of zombies killed with a shotgun in Hard difficulty
* Fastest time for completing level 3
* Highest score achieved in a multiplayer match
* Name of the car driven most recently

Event-based Stats was formerly named _Stats 2013_.

With event-based Stats, stats are calculated in the Xbox Live service based on events that are logged by the title and statistics rules that are defined by the developer via the Partner Center Service Configuration Tool.

The game sends events to the Xbox Live stats processor service. The processor uses the stat rules defined in your Xbox Live service configuration (in Partner Center) to process these events and update stats on the service. The game can then retrieve the updated stats from the Xbox Live stats service.



A statistics rule can be configured to produce either of the following:
* A single stat instance
* Multiple stat instances based on a stat template


## Defining stat instances

A _stat instance_ uses a single name-value pair.
This is the basic way to use stats.

Configure stat rules to control how the Xbox Live service should produce stat instances based on events that are sent by the game (figure 1).
For more information, see [Event-based Stat rules overview](config/live-user-stat-rules.md).

**Figure 1. Events, stat rules, and user stats.**

![Image of a figure that shown events, stat rules, and user stats. The first block shows Event and Enemy defeated. The second block shows Stat Rule and Kills. The third block shows Stat Instance and Kills.](../../../../../../../resources/gamecore/secure/images/en-us/live/stats/events-and-user-stats2.png)

A stat instance name refers to a particular name-value pair. For example:
* EnemiesDefeated
* HighScoreMP
* CurrentCarName


## Defining stat templates

A more advanced type of stat is a _stat template_.
A stat template includes some number of event fields in its name to produce several stat instances.

A _stat template_ uses a statistics rule with event fields in its name to produce multiple stat instances (figure 2).

**Figure 2. Events and stat templates.**

![Image of a figure that show events and stat templates. The first block shows Event and EnemyDefeated with WeaponID, DifficultyLevel. The second block shows Stat Rule with Kills.WeaponID. The third block shows Stat Instance with Kills.WeaponID.Pistol and KillsWeaponID.Rifle.](../../../../../../../resources/gamecore/secure/images/en-us/live/stats/stat-templates.png)

A stat template is produced by a statistics rule that includes one or more event fields as part of its name so it can produce multiple stat instances.
For example:
* Stat template: BestTime.LevelId
* Stat Instance: BestTime.LevelId.3
* Stat Instance: BestTime.LevelId.55
* Stat template: EnemiesDefeated.EnemyTypeId.WeaponId.DifficultyLevelId
* Stat Instance: EnemiesDefeated.EnemyTypeId.6.WeaponId.17.DifficultyLevelId.4
* Stat Instance: EnemiesDefeated.EnemyTypeId.9.WeaponId.33.DifficultyLevelId.1

Every event has an event name and a set of fields.
Stat rules are triggered when an event of a particular name is received by the Xbox Live service.
Statistics rules produce stat instances (figure 3).

**Figure 3. Events, stat rules, and user stats with the locations of processing.**

![Image of a figure that shows events, stat rules, and user stats with the locations of processing.](../../../../../../../resources/gamecore/secure/images/en-us/live/stats/stats2013diagram.jpg)

## See also
  
[Event-based vs. title-managed Stats](../live-stats-eb-vs-tm.md#update-frequency)  
  