---
title: Portal configuration of event-based Challenges
description: Describes how to add and change challenges by using Partner Center.
kindex:
- Challenges
- Xbox Live, Challenges
author: joannaleecy
ms.author: ald
ms.topic: conceptual
ms.localizationpriority: medium
edited: 01/06/2020
security: public
---

<a id="top"></a>

# Portal configuration of event-based Challenges
> [!NOTE]
> If your title uses event-based Achievements (formerly called Achievements 2013), and you want to support multiple platforms going forward, you must continue to use event-based Achievements. This is required so that users can retain their achievements across all platforms.
> [!NOTE]
> This topic describes the features that are available only with proper permissions. For details, talk to your account manager or another contact at Microsoft.

This topic describes how to add and change challenges in the Partner Center service configuration for a title. Challenges are similar to achievements but can be unlocked only during a specified time period. Like achievements, challenges are unlocked according to the logic that you define in the service configuration. This logic is based on player stat values in the service. The challenge is unlocked automatically when the player stats meet the specific requirements during the specified time period.

For an introduction to Xbox Live service configuration, see [Xbox Live service configuration IDs for Managed Partners](../../../../../test-release/portal-config/live-service-config-ids-mp.md).

For an introduction to the event-based Data Platform, see [Event-based Player Data overview](../../../stats-leaderboards/event-based/live-how-data-platform-works.md).

This topic covers the following:  

   *  [How challenges work in Xbox Live](#ID4EYB)  
   *  [Configure a challenge](#ID4E5M)
   *  [Create a challenge](#ID4EJC)
   *  [Change an existing achievement or challenge rule](#ID4EXC)
   *  [Delete a challenge](#ID4E5D)


<a id="ID4EYB"></a>

## How challenges work in Xbox Live

Challenges are achievements that are available only during a specified time period. For example, you might want to create an achievement that's available only on three consecutive days that begin and end at midnight. Because of the time limitation, this achievement would be considered a challenge.  

Like achievements, challenges can be either visible (in the list of possible achievements) or hidden. Unlike achievements, challenges can't be configured to grant gamerscore to players upon completion.  

 [Return to the top of this topic.](#top)

<a id="ID4E5M"></a>

## Configure a challenge

1. Sign in with your account on [Partner Center](https://developer.microsoft.com/dashboard/windows/overview).

2. Select your title, and then select **Services** > **Xbox Live**.

3. Select the link to the **Challenges** page.

4. Create and manage the challenges for your title on the **Challenges** page.

 [Return to the top of this topic.](#top)

<a id="ID4EJC"></a>

## Create a challenge

1. On the **Challenges** page, select **New challenge**. The **New challenge** page appears.

2. In the **Challenge name** box, enter the name that players see. The maximum length of the string is 44 characters.

3. In the **Locked description** box, enter the description that players see when the challenge is locked. The maximum length of the string is 100 characters. If you select **Secret**, this description isn't displayed in the list of achievements.

4. In the **Image icon** box, specify the achievement icon that's the visual representation ("badge") of the challenge. Ensure that the icon is formatted as a .png file and is 1920 &#215; 1080 pixels in size.  

    The icon is visible to players. Xbox automatically scales it to a thumbnail size when a player views the list of achievements. However, selecting any individual achievement sets the icon as the background image. If the **Hidden** checkbox is selected, the icon isn't displayed in the list until the player unlocks it.

    While developing your title, you can select **use placeholder image** to use a default Xbox icon until your final image art is ready to replace it.

5. In the **Promo icon** box, specify the promotional icon. It must be 424 &#215; 424 pixels in size and formatted as 1:1 PNG.

    While developing your title, you can select **use placeholder image** to use a default Xbox icon until your final promotional art is ready to replace it.

6. Under **Time frame**, specify the **Start time** and **End time** of the challenge. The challenge can only be unlocked during the time period that's specified here. The end date can't be later than three months after the start date. Times are based on Coordinated Universal Time (Greenwich Mean Time).

7. Under **How should the details be treated?**, select from the following options.

    * **Public**  
    Indicates that the challenge and its details are visible to all players.  

    * **Secret**  
   Indicates that the challenge and its details are visible only to players who have unlocked the challenge. This is useful for avoiding plot spoilers and rewarding players for experimenting.


8. Optional: in the **Challenge deep link** box, specify the in-game location where players are immediately redirected to so that they can attempt this challenge. For example, in `ms-xbl-11aa99ff://default?trackId=18`, `11aa99ff` is the TitleId. `default?trackId=18` is the code that your title uses to redirect players to a particular location in the title.

9. To grant an additional reward (art or in-game) for unlocking the achievement, do the following:

    1. Select **Add reward**.

    2. On the **Achievement rewards** page, select either **Art** or **In-game**.

    3. In the **Display name** box, add the reward's name that players see.

    4. In the **Description** box, add the reward's description that players see. The maximum length of the description is 90 characters. It should include details such as the reward's duration (if applicable) and instructions for redeeming the reward.  

    5. Do the following, according to the reward type that you selected.  
       
       * If you selected the reward type **Art**, use the **Art** box to specify the art reward that the player gets when they unlock the challenge. The reward must be 1920 &#215;
 1080 pixels in size and formatted as a .png file. While developing your title, you can select **use placeholder image** to use a default Xbox image until your final reward art is ready to replace it.

        * If you selected the reward type **In-game**, do the following:  

          1. Use the **Image** box to specify an image that represents the reward that the player gets when they unlock the challenge. While developing your title, you can select **use placeholder image** to use a default Xbox image until your final in-game art is ready to replace it.
        
          2. Use the **In-game value** to specify a value or code that's passed to your title. Ensure that your title can use this code to unlock a reward.

    6. Select **Add** to add the reward to the challenge, or select **Cancel** to cancel and return to the **New challenge** page.


10. Select an **Unlock logic** that determines how a challenge is unlocked.

    * **Do something with incremental progress**  
    Select a single player stat. When the player stat meets the specified criteria, the challenge is unlocked. Players can then see their progress toward unlocking the challenge.  
    
        To meet the criteria, a stat must be greater than or equal to the specified value. This doesn't apply to a stat that's configured with the `min` operator. Such a stat must be less than or equal to the specified value.

    * **Do multiple things, cumulatively**  
    Select multiple player stats that are configured with the `sum` operator. When all the player stats that you've selected meet the specified criteria, the challenge is unlocked.

    * **Min/max one of several things**  
    Select multiple player stats that have been configured with the `max` or `min` operator. When at least one player stat requirement is met, the challenge is unlocked.

     * **Do something once**  
    Select a player stat. When its instance is created as a result of triggering a stat rule, the challenge is unlocked.

    * **Custom logic**  
        To create a complex condition for unlocking the challenge, select **Add stat** and add a stat condition to the current condition. To add a new condition clause, select **Add condition**.  
        
         * All stats in a single condition clause must be of the same operator type and must meet the same criteria for satisfying the condition.
         * If the stats use the `min` or `max` operator, the clause uses the `OR` logic to meet the condition.  
         * If the stats use the `sum` operator, the clause uses the `AND` logic to meet the condition.  
                
        When all conditions are met, the challenge is unlocked.

11. Select **Save** to save the challenge, or select **Cancel** to cancel and return to the **Challenges** page.

 [Return to the top of this topic.](#top)

<a id="ID4EXC"></a>

## Change an existing achievement or challenge rule
> [!IMPORTANT]
> After a title passes Final Certification, existing achievements in that title can't be changed or deleted.

   1. In the list of challenges on the **Challenges** page, select the **Name** for the challenge you want to change. This opens a page whose title is the name of the challenge.  
 
   2. Make changes to the challenge.  

   3. Select **Save** to save the challenge, or select **Cancel** to cancel and return to the **Challenges** page.

 [Return to the top of this topic.](#top)

<a id="ID4E5D"></a>

## Delete a challenge  
> [!IMPORTANT]
> After a title passes Final Certification, existing achievements and challenges in that title can't be changed or deleted.

1. In the list of challenges on the **Achievements** page, select **Delete** next to the challenge that you want to remove.

2. In the **Confirmation** dialog, select **Delete** to confirm the deletion; otherwise, select **Cancel**.

 [Return to the top of this topic.](#top)  
