---
title: Portal configuration of event-based Achievements
description: Describes how to add and change achievements by using Partner Center.
kindex:
- Portal configuration of event-based Achievements
- Achievements
- Xbox Live, Achievements
author: joannaleecy
ms.author: migreen
ms.topic: conceptual
ms.localizationpriority: medium
edited: 01/06/2020
security: public
---

<a id="top"></a>

# Portal configuration of event-based Achievements
> [!NOTE]
> If your title uses event-based Achievements (formerly called Achievements 2013), and you want to support multiple platforms going forward, you must continue to use event-based Achievements. This is required so that users can retain their Achievements across all platforms.
> [!NOTE]
> This topic describes the features that are available only with proper permissions. For details, talk to your account manager or another contact at Microsoft.

This topic describes how to add and change a title's event-based Achievements in Partner Center. Achievements are unlocked according to the logic that you define in the service configuration. This logic is based on the values of player stats in the service. When the player stats meet the specific requirements for an achievement, it's unlocked automatically.

For an introduction to the Xbox Live service configuration, see [Portal configuration overview](../../../../../test-release/portal-config/live-portal-config-overview.md).

For an introduction to the event-based Data Platform, see [Event-based Player Data overview](../../../stats-leaderboards/event-based/live-how-data-platform-works.md).

You can use title-managed Achievements rather than event-based Achievements, even if you use event-based Stats.
Title-managed Achievements provides a simpler configuration experience but doesn't support challenges. It requires that titles manage unlocking achievements.

This topic covers the following:  

* [How achievements work in Xbox Live for Xbox One or later](#ID4EYB)  
* [Configure an achievement](#ID4E5L)
* [Create an achievement](#ID4EJC)  
* [Change an achievement](#ID4EXC)  
* [Delete an achievement](#ID4E5D)


<a id="ID4EYB"></a>

## How achievements work in Xbox Live for Xbox One or later

An achievement represents a specific goal that's set for the player by the title's developers.
In the event-based Data Platform, the service uses the values of specific player stats to determine whether the player has achieved the goal. The values are defined in the service configuration.

For a new player, achievements are *locked*. When the player meets the conditions required to meet an achievement's goal, the service grants the achievement by *unlocking* it. The player receives a reward in the form of gamerscore, but the title might grant additional rewards, such as art or in-game items.

Achievements can be based on a single player stat or multiple player stats. For example, an achievement might require that a player who has reached the Advanced Level use Orange Arrows to defeat three Blue Dragons in the Western Province.  

Achievements can be hidden from the player until they're achieved, or they can be made visible in a list of possible achievements.  

Planning the events and stat rules that are needed to unlock achievements often requires a sequential approach.

1. Decide which achievements and player experiences that you want to present in your title.
2. Create the stat rules and events to power those experiences.

 [Return to the top of this topic.](#top)

<a id="ID4E5L"></a>

## Configure an achievement

1. Sign in with your account on [Partner Center](https://developer.microsoft.com/dashboard/windows/overview).

2. Select your title, and then select **Services** > **Xbox Live**.

2. Select the link to **Achievements**.

1. Create and manage the achievements for your title on the **Achievements** page.

 [Return to the top of this topic.](#top)

<a id="ID4EJC"></a>

## Create an achievement

1. On the **Achievements** page, select **New achievement**. The **New achievement** page appears.

2. In the **Achievement name** box, enter the name that players see. The maximum length of the string is 44 characters.

3. In the **Locked description** box, describe the circumstances under which the achievement is locked. The maximum length of the string is 100 characters, and it's shown to players. If you select the **Secret** option, this description isn't displayed in the list of achievements.

4. In the **Image icon** box, provide the achievement icon that's the visual representation ("badge") of the achievement. Ensure that the icon is formatted as a .png file and is 1920 &#215; 1080 pixels in size. 

    The icon is visible to players. Xbox automatically scales it to a thumbnail size when a player views the list of achievements. However, selecting any individual achievement sets the icon as the background image. If the **Hidden** checkbox is selected, the icon isn't displayed in the list until the player unlocks it.

    While developing your title, you can select **use placeholder image** to use a default Xbox icon until your final image art is ready to replace it.

5. Under **What type of achievement is this?**, select from the following options.

    * **Base achievement**  
        The achievement is available to players when the title is initially released.  

    * **Non-base achievement**  
        The achievement isn't available to players until after the title is launched.

6. In the **Gamerscore** box, enter the amount of gamerscore to be awarded when an achievement is unlocked. Enter a value greater than 0 and less than or equal to 200. Your title has a total of 1,000 gamerscore points that you can allocate among the base achievements.

7. Under **How should the details be treated?**, select from the following options.

    * **Public**  
    Indicates that the achievement and its details are visible to all players.  

    * **Secret**  
    Indicates that the achievement and its details are visible only to players who have unlocked the achievement. This is useful for avoiding plot spoilers and rewarding players for experimenting.


8. Optional: in the **Achievement deep link** box, specify the in-game location where players are immediately redirected to so that they can attempt this achievement. For example, in `ms-xbl-11aa99ff://default?trackId=18`, `11aa99ff` is the TitleId. `default?trackId=18` is the code that your title uses to redirect players to a particular location in the title.

9.  Select an **Unlock logic** that determines how an achievement is unlocked.

    * **Do something with incremental progress**  
    Select a single player stat. When the player stat meets the specified criteria, the achievement is unlocked. Players can then see their progress toward unlocking the achievement.  
    
        To meet the criteria, a stat must be greater than or equal to the specified value. This doesn't apply to a stat that's configured with the `min` operator. Such a stat must be less than or equal to the specified value.

    * **Do multiple things, cumulatively**  
    Select multiple player stats that are configured with the `sum` operator. When all the player stats that you've selected meet the specified criteria, the achievement is unlocked.

    * **Min/max one of several things**  
    Select multiple player stats that have been configured with the `max` or `min` operator. When at least one player stat requirement is met, the achievement is unlocked.

    * **Do something once**  
    Select a player stat. When its instance is created as a result of triggering a stat rule, the achievement is unlocked.

    * **Custom logic**  
        To create a complex condition for unlocking the achievement, select **Add stat** and add a stat condition to the current condition. To add a new condition clause, select **Add condition**.  
        
         * All stats in a single condition clause must be of the same operator type and must meet the same criteria for satisfying the condition.
         * If the stats use the `min` or `max` operator, the clause uses the `OR` logic to meet the condition.  
         * If the stats use the `sum` operator, the clause uses the `AND` logic to meet the condition.  
                
        When all conditions are met, the achievement is unlocked.


10. Optional: to grant an additional reward (art or in-game) for unlocking the achievement, do the following:

    1. Select **Add reward**.

    2. On the **Achievement rewards** page, select either **Art** or **In-game**.

    3. In the **Display name** box, add the reward's name that players see.

    4. In the **Description** box, add the reward's description that players see. The maximum length of the description is 90 characters. It should include details such as the reward's duration (if applicable) and instructions for redeeming the reward.  
   
    5. Do the following, according to the reward type that you selected.  

        * If you selected the reward type **Art**, use the **Art** box to specify the art reward that the player gets when they unlock the achievement. The reward must be 1920 &#215; 1080 pixels in size and formatted as a .png file. While developing your title, you can select **use placeholder image** to use a default Xbox image until your final reward art is ready to replace it.

        * If you selected the reward type **In-game**, do the following:
          
          1. Use the **Image** box to specify an image that represents the reward that the player gets when they unlock the achievement. While developing your title, you can select **use placeholder image** to use a default Xbox image until your final in-game art is ready to replace it.
          
          2. Use the **In-game value** box to specify a value or code that's passed to your title. Ensure that your title can use this code to unlock a reward.

    1. Select **Add** to add the reward to the achievement, or select **Cancel** to cancel and return to the **New achievement** page.

1.  Select **Save** to save the achievement, or select **Cancel** to cancel and return to the **Achievements** page.

 [Return to the top of this topic.](#top)

<a id="ID4EXC"></a>

## Change an achievement  
> [!IMPORTANT]
> After a title passes Final Certification, existing achievements in that title can't be changed or deleted.

1. In the list of achievements on the **Achievements** page, select the **Achievement name** for the achievement you want to change. This opens a page whose title is the name of the achievement.  

2. Make changes to the achievement.  

3. Select **Save** to save the achievement, or click **Cancel** to cancel and return to the **Achievements** page.

 [Return to the top of this topic.](#top)

<a id="ID4E5D"></a>

## Delete an achievement  
> [!IMPORTANT]
> After a title passes Final Certification, existing achievements in that title can't be changed or deleted.  


1. In the list of achievements on the **Achievements** page, select **Delete** next to the achievement that you want to remove.

2. In the **Confirmation** dialog, select **Delete** to confirm the deletion; otherwise, select **Cancel**.  

 [Return to the top of this topic.](#top)
  