---
title: Portal configuration of event-based Stats
description: Describes how to configure stat rules in Partner Center. Stat rules control how user events in a game trigger stat updates on the server.
kindex:
- Xbox Live stats
- stats, Xbox Live
author: joannaleecy
ms.author: migreen
ms.topic: conceptual
ms.localizationpriority: medium
edited: 01/06/2020
security: public
---

<a id="top"></a>

# Portal configuration of event-based Stats
> [!NOTE]
> This topic describes the features that are available only with proper permissions. For details, talk to your account manager or another contact at Microsoft.

This topic describes the procedures for adding and changing stat rules in the Partner Center service configuration for a title. Player stats are created and updated according to the stat rules that are triggered when a game sends events to the Xbox Live service.

For an introduction to Xbox Live service configuration, see [Portal configuration overview](../../../../../test-release/portal-config/live-portal-config-overview.md).

For an introduction to data platform 2013, see [Event-based Player Data overview](../live-how-data-platform-works.md).

This topic covers the following:  

   *  [What is a stat rule?](#ID4EMB)  
   *  [Prepare to configure a stat rule](#ID4ENC)
   *  [Create a stat rule](#ID4ELC)
   *  [Change an existing stat rule](#ID4E2C)  
   *  [Edit a stat rule](#ID4ELE)  
   *  [Copy an existing stat rule](#ID4EMS)
   *  [Delete an existing stat rule](#ID4EMF)


<a id="ID4EMB"></a>

## What is a stat rule?  

*Stat rules* are triggered when an event with a particular name is received by the Xbox data platform service. Triggering of a stat rule (by sending an appropriate event) causes the service to create or update one or more player stats.

Player stats are defined by the developer, calculated by the Xbox Live data platform, and stored as name-value pairs on a per-user basis. Here are a few examples of player stats.

*  Total number of zombies killed with a shotgun in hard difficulty
*  Highest number of enemies defeated in a match
*  Fastest time for completing a race
*  Name of the car driven most recently

Player stats can be displayed on the player's game hub UI as featured or hero stats, displayed in leaderboards, and used to unlock achievements.

Individual stat rules can be configured to produce one of the following:  

*  A single instance of a player stat  
*  Multiple instances of a player stat that are based on a stat template  

For information about stats and stat rules, see the following topics.

* [Event-based Stats overview](../live-stats-eb-overview.md)
* [Event-based Stat rules overview](live-user-stat-rules.md)
* [User stats scenarios](live-user-stats-scenarios.md)

The following diagram shows the flow of an event that triggers stat rules that update stat instances.

![Image of a diagram that shows the flow of an event that triggers stat rules that update stat instances.](../../../../../../../../resources/gamecore/secure/images/en-us/live/stats/evented/portal/event-stat-rule-instance-template.png)

 [Return to the top of this topic.](#top)

<a id="ID4ENC"></a>

## Prepare to configure a stat rule

**Prerequisite:** Because stat rules are based on events, you must create an event before you can create a stat rule. For more information, see [Portal configuration of events](../events/config/live-events-portal.md).

1. Sign in to your account on [Partner Center](https://partner.microsoft.com/dashboard/). The **Overview** page appears, showing a list of products.

2. Find and select your title. The **Game overview** page appears, shown as follows.

   ![Screenshot of the Game overview page in Partner Center.](../../../../../../../../resources/gamecore/secure/images/en-us/live/stats/pctr-product2013-gameoverview.png)

3. In the left navigation that has a gray background, select **Xbox Live** to expand it, and then select **Gameplay settings**. The **Gameplay Setting** page appears, shown as follows.

   

   



   ![Screenshot of the Gameplay Setting page in Partner Center.](../../../../../../../../resources/gamecore/secure/images/en-us/live/stats/pctr-gameplay-setting-page.png)

4. At the top of the page, select the **Player stats** menu, and then select **Stat rules**, shown as follows.
   In this Partner Center UI, "player stats" means "event-based User Stats."

   ![Screenshot of the Player stats menu in Partner Center.](../../../../../../../../resources/gamecore/secure/images/en-us/live/stats/pctr-stat-rules-menu.png)

   On the **Gameplay Setting** page, the **Events and stat rules** page appears, shown as follows.

   ![Screenshot of the Events and stat rules page in Partner Center.](../../../../../../../../resources/gamecore/secure/images/en-us/live/stats/pctr-events-and-stat-rules-page.png)

   Initially, the table at the bottom of the page is empty: "No player stats configured".

5. On the **Events and stat rules** page, configure the events and stat rules that are based on those events. For details, see the following sections.

 [Return to the top of this topic.](#top)

<a id="ID4ELC"></a>

## Create a stat rule

**Prerequisite:** Stat rules are based on events. As a result, you must create an event before you can create a stat rule. For more information, see [Portal configuration of events](../events/config/live-events-portal.md).

1. Go to the **Events and stat rules** page as described in the previous section.

2. In an event row, in the **Actions** column on the right, select the ellipsis button (...), and then select **New stat rule**, shown as follows.

   ![Screenshot of selecting an event to create a stat rule in Partner Center.](../../../../../../../../resources/gamecore/secure/images/en-us/live/stats/evented/portal/new-stat-rule-menuitem.png)

   The **Add stat rule** dialog appears, shown as follows.

   ![Screenshot of the Add stat rule dialog in Partner Center.](../../../../../../../../resources/gamecore/secure/images/en-us/live/stats/evented/portal/add-stat-rule-dbox.png)

   *  **Event fields added to the stat rule**  
      - Use this optional field to select fields that are included in the base event as part of the stat rule.
      - In the dropdown, select a field to add to the stat rule. You can add multiple fields this way. The selected fields are appended to the stat rule's root name and separated by the dot (.) character.
      - To remove a field, select the **X** next to its name.

   *  **Stat rule name**  
      Specify a name that characterizes the stat rule and that you can easily remember and recognize. Names of stat rules are composed of a *root* name, optionally followed by one or more *fields* that are separated by the dot (.) character. For more information about the naming requirements of stat rule names, see [Event-based Stat rules overview](live-user-stat-rules.md).

   *  **Operator**  
      Select one of the following operators.  

      *  **Sum**  
      Increment the existing stat value by the value that's specified in the **Parameter** field.  

      *  **Min**  
      Use the minimum of the existing stat value and the **Parameter** field's value.  

      *  **Max**  
      Use the maximum of the existing stat value and the **Parameter** field's value.  

      *  **Replace**  
         Replace the stat value with the value that's specified in the **Parameter** field.  

         We don't recommend using the **Replace** operator for stats that drive achievements. Events aren't always processed in order, and this operator might cause an achievement to never unlock. Instead, use the **SUM** operator.  

   *  **Parameter**  
      Specify the value to use in the operator that was selected in the **Operator** field.  

         * If you want to use a static number that you specify, select the **literal** option button and specify the value in the box that follows the option button.  

         * If you want to use the value of a field, select the **field** option button and, in the dropdown list that follows the option button, select the field that you want to use.  

   * **Restrict other features like achievements and featured stats from accessing this info.**  
   Select this checkbox to make the stat rule private.

   * **Only allow changes to this stat from a server event. Client events will be ignored.**  
   Select this checkbox to indicate that the stat rule is triggered only by events sent via the server-to-server API, not from game clients that are running on the console or PC.

Your new stat rule is now listed on the **Events & Stat Rules** page whenever the rule's event is selected.

 [Return to the top of this topic.](#top)

<a id="ID4E2C"></a>

## Change an existing stat rule  
> [!IMPORTANT]
> After a title passes Final Certification, existing stat rules for an event in that title can't be changed or deleted.  

   1. In the **Stat rules** column on the **Events and stat rules** page for the product instance, select the stat rule that you want to change.  

   1. Make the changes in the **Update stat rule** dialog for the event.

   1. Select **Save**.

 [Return to the top of this topic.](#top)

<a id="ID4ELE"></a>

## Edit a stat rule

Editing a stat rule takes place when a stat rule's name or an event field has been removed, added, or reordered.
This operation will be treated as a deletion and creation of a new stat rule. All stat instances will be deleted as part of editing, according to this definition.  

 [Return to the top of this topic.](#top)

<a id="ID4EMS"></a>

## Copy an existing stat rule  
> [!IMPORTANT]
> After a title passes Final Certification, existing stat rules for an event in that title can't be changed or deleted.  

   1. On the **Events and stat rules** page for the product instance, find the row with the stat rule that you want to delete.

   2. Select **Copy** in the **Actions** column in that row.

   3. Make your changes in the **Update stat rule** dialog for the event.

   4. Select **Save**.

 [Return to the top of this topic.](#top)

<a id="ID4EMF"></a>

## Delete an existing stat rule  
> [!IMPORTANT]
> * After a title passes Final Certification, existing stat rules for an event in that title can't be changed or deleted.
>  
> * Deletion of a stat rule is a permanent action and can't be undone or reversed.
>
> * Deleting a stat rule deletes any chained dependencies that it might have. Before deleting a stat rule, be sure that you also want to delete all of its dependencies.

   1. On the **Events and stat rules** page for the product instance, find the row with the stat rule that you want to delete.

   1. Select **Delete** in the **Actions** column in that row.

   1. Select **Delete** in the **Confirmation** dialog.

   The following diagram shows that deleting a stat event rule deletes any dependencies on that rule.

   ![Image of a diagram that shows deleting a stat rule deletes any dependencies on that rule.](../../../../../../../../resources/gamecore/secure/images/en-us/live/events/event_delete_dependency.png)

 [Return to the top of this topic.](#top)
