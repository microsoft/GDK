---
title: Overview of event-based Achievements
description: Describes how the event-based Achievements service uses Data Platform telemetry to track player achievements.
kindex:
- Achievements
- Xbox Live, Achievements
author: joannaleecy
ms.author: migreen
ms.topic: conceptual
ms.localizationpriority: medium
edited: 01/06/2020
security: public
---

# Overview of event-based Achievements

This topic describes how the event-based Achievements service uses Data Platform telemetry to track player achievements.
> [!NOTE]
> If your title uses event-based Achievements (formerly called Achievements 2013), and you want to support multiple platforms going forward, you must continue to use event-based Achievements. This is required so that users can retain their achievements across all platforms.



To help developers and publishers manage their titles as a service, the Achievement service is built on the Xbox Live event-based Data Platform.

The event-based Data Platform consists of a single, event-driven data model and pipeline that title developers can use to collect usage telemetry and build user experiences based on this data. One of the key innovations for the Data Platform is a common user statistics taxonomy that supports shared semantics that publishers can use to obtain deep insights into their players' behavior.

All achievements are derived from user statistics rather than requiring direct API calls from the title. This was done for two reasons.

1. Developers can add achievements after title launch without requiring additional code changes or title updates. If a title is well-instrumented at launch, the developer can add new achievements by updating the title's service configuration in the cloud.

2. The title can make fewer service calls for the same in-title user behavior. For example, the title might log a single event whose user statistics apply to several areas. The event may ultimately contribute to an achievement, a leaderboard, and to business intelligence (BI) reports.

### Data pipeline

A high-level view of the key stages in using the Achievements service is provided by the following steps.

1. Configuration
  Design and publish the title configuration that specifies the pertinent data that Xbox Live should process or store.

2. Instrumentation
  Implement event logging within the title so that data is properly encoded and transmitted.

3. Collection
  The title uses the client logging library to feed events into the Data Platform. Its services process events to aggregate, correlate, route, and store statistics as appropriate, based on title configuration.

4. Achievement processing
  The service processes incoming changes to statistics to detect when achievement goals are met. Based on the title configuration, the service unlocks achievements, alerts the appropriate reward systems, and stores the achievement records.

5. Notifications
  The Achievements service communicates unlock activity to users (via system toast notifications), titles, Xbox Live clients, and other Xbox Live services to power additional experiences and features.

6. Analytics
  The online reporting and BI platform that publishers use to understand how players are using their title.

### Key features of the Achievement service

Xbox Live has greatly expanded the Achievement service, which gives title developers more options and control in how they can use achievements to drive user engagement.
The Event-based Achievements service introduced the following features:
* Cloud-triggered unlocks
* Challenges
* Using deep links in achievements
* Achievement progression

#### Cloud-triggered unlocks

With event-based achievements, titles don't make achievement-specific calls to Xbox Live to unlock an achievement. Instead, developers and publishers now configure the achievement's unlocking rules online in the service configuration in the cloud. Xbox Live handles the processing of those rules  in real time in the cloud. This empowers developers and publishers to add new achievements and challenges after a title launches without having to update it.

#### Challenges (limited-time achievements)

Challenges are no longer available in the more modern Title-managed Achievement service, and using challenges is no longer recommended. For more information, see [Event-Based vs Title-Managed Achievements](../live-achievements-eb-vs-tm.md).

 Challenges are time-bound achievements that users can unlock only during a specified time window. They're configured just like achievements, with an icon, unlock rules, and the option to be hidden, except that they also require that an eligible time window be defined.

When a user completes a challenge, it's stored as an unlocked achievement in the user's achievement history. If a user participated in a challenge, but the challenge didn't unlock during the eligible time window, that record isn't saved in the user's achievement history.

#### Using deep links in achievements

A title can use the Achievements schema to specify a deep link that is displayed in the achievement details. The deep link links to the place in the game where the achievement can be earned. The link is formatted as a string that's passed to the game during protocol activation. The title must parse the string to determine where in the game to go. For example, an achievement that's related to completing a level in the game can include a deep link in the achievement details that passes a string to the game. This tells the game to go to that level.

#### Achievement progression

The Xbox Live Achievement service measures achievement progress and provides data that titles can use to display that progress to players.

The Achievements service provides progression details per achievement rule. If an achievement has multiple requirements that must be met to unlock it, the service response includes progression details for each requirement. If an achievement has one requirement that's based on multiple stats, the service returns a single progression value that combines the underlying stats.

### Progression object

Querying for a list of user achievements returns a progression object. It contains the detailed data about the achievement rule (requirement) and the user's current state of progression toward meeting that requirement. For more information, see the [XblAchievementProgression](../../../../../reference/live/xsapi-c/achievements_c/structs/xblachievementprogression.md) reference.