---
title: Title-managed Stats overview
description: Describes how title-managed Stats track a players progress in a game for display.
kindex:
- Title-managed Stats overview
- stats, title-managed Stats
- stats, title-managed Leaderboards
author: joannaleecy
ms.author: migreen
ms.topic: conceptual
ms.localizationpriority: medium
ms.date: 07/02/2018
edited: 00/00/0000
security: public
---

# Title-managed Stats overview

This topic describes how title-managed Stats track a player's progress in a game for display.

Title-managed Stats was formerly known as _Stats 2017_.

With title-managed Stats, the title keeps track of the stat values, and sends the values to the service.
You can configure stats for individual players that signify their progress and prowess in a game.
These stats are a social tool that encourage players to be more competitive with their friends and the larger title's community. Stats also serve to showcase some of the capabilities and challenges your title has to offer.

For example, if you have a racing game with featured statistics like longest drift and best hang time, the stats help communicate the type of racing game your players can expect.

Seeing how players stack against their friends and the community at large gives them more incentive to buy and play your title.

Players see featured statistics on the title's GameHub.
Featured stats can also periodically appear in pinned content blocks that users can add to their Home view.

Title-managed Stats operates by accepting stat values as key-value pairs from your title and storing the stat values for display at a later time.
Title-managed Stats supports Xbox Live leaderboard scenarios by saving stats about individual players so they can be compared and ranked on a leaderboard.

Title-managed Stats accepts the stat values sent to it without validation. It's up to your title to handle the logic to determine the correct value for the stats.
Since your title is in full control of the stat values, it's easier to debug the flow of stat values end-to-end.


## Configured stats and featured leaderboards

Stats are configured on the [Partner Center dashboard](https://partner.microsoft.com/dashboard/windows/overview).
In order to configure stats, you must already have a title configured.


The stats you configure in Partner Center will appear in your title's GameHub similar to the image below.
Featured stats are highlighted in yellow.

![Official Club Page Social Leaderboard](../../../../../../../resources/gamecore/secure/images/en-us/live/stats/directly/gamehub_featuredstats-1000w.png)

On the Xbox console, users can pin games directly to their Home screen to quickly find relevant information, community driven content, and developer posts.
The stats you configure can also appear as a part of pinned Home content.

Stats will show the player along with a slightly higher ranked friend, encouraging them to play their way up the leaderboard.
Leaderboards in pinned content would appear as highlighted in the following image.

![Halo 5 Pinned Leaderboard](../../../../../../../resources/gamecore/secure/images/en-us/live/stats/directly/Halo_5_Pinned_Leaderboard-1000w.png)

Featured stats compare in-game progress based on configured statistics with other friends who also play the title.
This encourages more play time for your title when friends compete for high scores or simply bond over a shared experience.


Featured stat leaderboards are monthly leaderboards which are reset on the first day of the month.
  


## See also
  
[Configuring title-managed Featured Stats & Leaderboards in Partner Center](config/live-tm-leaderboards-portal.md)  
[Event-based vs. title-managed Stats](../live-stats-eb-vs-tm.md#update-frequency).  
[Writing title-managed stats](how-to/live-writing-tm-stats.md)  

  