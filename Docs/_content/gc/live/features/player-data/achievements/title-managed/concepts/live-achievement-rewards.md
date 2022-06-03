---
title: Configure Xbox achievement rewards
description: Describes how to configure rewards for a title-managed Xbox achievement. This includes granting the player gamerscore, art, or in-app rewards for completing the achievement.
kindex:
- Achievement Rewards
- rewards
author: joannaleecy
ms.author: jeffshi
ms.topic: conceptual
ms.localizationpriority: medium
edited: 00/00/0000
security: public
---

# Configure Xbox achievement rewards

This topic describes how to configure rewards for a title-managed Xbox achievement. This includes granting the player gamerscore, art, or in-app rewards for completing the achievement.

Title-managed Achievements provides more flexibility than event-based Achievements to empower you to run the title as a service by adding value and maintaining player engagement over time.
Title-managed Achievements also provides more flexibility of how achievements are unlocked, how and when achievements are added, and the benefits that achievements can deliver to players.

The following diagram illustrates how developers, community managers, and publishers might manage the life cycle of a title over time for goals, prizes, and rewards to drive player behavior.

![An image of a diagram that shows game launch to 90 days after launch where developers review telemetry, add new goals and prizes, and release content updates with new goals and rewards. At 90 days, community managers build a schedule of activities and challenges. At 180 days, publishers create new goals to re-engage players for events or to generate excitement for the game's sequel. Shows an image of a brain. The left side is motivated by skills and bragging. The right side is motivated by prizes and deals.](../../../../../../../../resources/gamecore/secure/images/en-us/live/achievements/achievements_overview_01_drive_behavior.png)

## Flexible options for rewarding achievement

We've expanded the achievement system to support more flexible reward options.
Gamerscore remains a valuable reward that tracks a single, common gaming score for the player across the Xbox Live ecosystem. You&mdash;the developer or publisher&mdash;can use achievements as a delivery mechanism for a much wider range of rewards, both within your title and outside your title.

You can configure an achievement with multiple rewards, up to one reward of each reward type.
You can also configure an achievement with no explicit reward; in such a case, the achievement's icon acts as a visual badge for the player who acquired the achievement.

Xbox Live supports the following types of rewards.

* Gamerscore
* Art
* In-app


### Gamerscore

We're committed to preserving the integrity of the gamerscore value that has been established with our Xbox Live players.
There's only one gamerscore per player.
Any gamerscore that a player earns on existing Xbox Live platforms such as Xbox or Windows 10 counts toward a single gamerscore for that player.

When a player unlocks a gamerscore achievement, Xbox Live automatically increases the player's gamerscore by the configured amount.

There are restrictions on which titles can offer gamerscore as a reward on their achievements.

### Art rewards

Use the art reward to power lush, beautiful experiences in your titles and beyond that your players must earn. For example, you might have interesting concept art that your designers drew early in your title's inception phase; beautiful, high-resolution images that can decorate your hub application when players visit; and support for multiple skins.

You can offer high-resolution concept art, early design drawings, specially created art assets, and other digital art assets as a reward to players for unlocking an achievement.
You can display these assets within the Xbox dashboard experience and in companion experiences by querying the Achievements service to retrieve the pertinent metadata.

### In-app rewards

In-app rewards give developers much more flexibility and control over the rewards that an achievement offers.
In-app rewards enable you to use achievements to deliver custom in-game rewards directly to your players without necessarily updating your title.

Configure the achievement reward with a code, ID, or phrase that your title recognizes. When the player unlocks the achievement, Xbox Live sends that information to your title. This informs the title of the reward to deliver to the player.

The reward itself is up to the developer.
Reward ideas include the following:

* Extra in-game currency or points
* Access to a special character, weapon, or map
* A temporary experience multiplier

#### Configuring in-app rewards

Configuring an in-app reward for an achievement is fairly straightforward.
The achievement owner must provide a reward name, a reward description, and a reward icon in addition to a reward value.
This reward value is determined by the developer and must be something that either the game can interpret and properly handle *or* the player can enter as part of a title-specific reward redemption experience.

An example of a reward value that the game can interpret might be a 5-digit number or a special string that the game or the game's service knows and maps to a particular in-game item.
Developers might want to use the Title-Managed Storage (TMS) service to make it easy to add new reward values over time that the game can read.

An example of a reward value that the player must submit might be a special code or string that they enter into a redemption experience within the title, within a companion app, or on the developer's website.

#### Redeeming in-app rewards

An in-app reward takes effect when the player redeems the reward within the game.
Titles must be aware that a player has unlocked an achievement that is configured with an in-app reward so that the title can properly deliver the reward to the player.
To do this, titles should query the Achievements service when the title launches or resumes from suspension to see which unlocked achievements have in-app rewards and get the reward code for each reward. This should always be done to ensure that you catch any achievements that might have been unlocked while the title wasn't running or was running on another console.  

To query, you can use either the `XblAchievements*` APIs or the RESTful Achievements URIs.

