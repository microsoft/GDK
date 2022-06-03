---
title: Portal configuration of events
description: Describes the procedures for adding and changing events in the Partner Center service configuration for a title.
kindex:
- Xbox Live events
- events, Xbox Live
author: joannaleecy
ms.author: migreen
ms.topic: conceptual
ms.localizationpriority: medium
edited: 01/06/2020
security: public
---

<a id="top"></a>

# Portal configuration of events


> [!NOTE]
> This topic only applies if you're using event-based User Stats, not title-managed User Stats.
> [!NOTE]
> This topic describes the features that are available only with proper permissions. For details, talk to your account manager or another contact at Microsoft.

This topic describes the procedures for adding and changing events in the Partner Center service configuration for a title. If a title is using event-based Stats, events are the key data sent by the title to the Xbox Live service to update stats and leaderboards and to unlock achievements.

For an introduction to the Xbox Live service configuration, see [Xbox Live service configuration](/windows/uwp/xbox-live/xbox-live-service-configuration).



This topic covers the following:

   *  [What is an event?](#ID4EKB)  
   *  [Configure an event](#ID4EYM) 
   *  [Create an event](#ID4EUB)
   *  [Change an event](#ID4EYE)  
   *  [Copy an event](#ID4EBG)  
   *  [Delete an event](#ID4EBL)


<a id="ID4EKB"></a>

## What is an event?  

An *event* is anything that happens during play and can be *captured*. A player acquiring a weapon is an event, and so is defeating an enemy by using that weapon.  

An event consists of the event name, an event description, and a number of fields that contain event-related data. When a title writes an event, it's stored on the local device until it can be sent to the Xbox Live service. It receives the event and uses it to build and update stats, leaderboards, achievements, and other features of event-based Stats according to the rules that you define in the service configuration.

For more details about events, see [Events overview](../live-game-events.md).

 [Return to the top of this topic.](#top)

<a id="ID4EYM"></a>

## Configure an event

1. Sign in to your account on [Partner Center](https://developer.microsoft.com/dashboard/windows/overview).

1. Select your title, and then select **Services** > **Xbox Live**.

1. Select the link to **Stat rules**.

1. On the **Events and stat rules** page, shown as follows, configure the events and stat rules according to the events.

   

   ![Screenshot of the Events and stat rules page in Partner Center.](../../../../../../../../../resources/gamecore/secure/images/en-us/live/events/events-and-stat-rules-1.png)

 [Return to the top of this topic.](#top)

<a id="ID4EUB"></a>

## Create an event

1. Go to the **Events and stat rules** page as described in the previous section.

1. Select **New event**. The **Add new event** dialog appears, shown as follows.

   ![Screenshot of the Add new event dialog in Partner Center.](../../../../../../../../../resources/gamecore/secure/images/en-us/live/stats/pctr-add-new-event-dbox.png)

1. Specify the values for the following fields.

   * **Base event**: From the dropdown list, shown as follows, select the base event that you want to build your new event on. The selected base event controls the default fields that your new event is prepopulated with. You can add any other fields, but you can't remove the default fields.

   ![Screenshot of the Base event list in Partner Center.](../../../../../../../../../resources/gamecore/secure/images/en-us/live/stats/pctr-base-event-list.png)

   *  **Event name**: Enter a name that characterizes the event and that you can easily remember and recognize. The event name doesn't have to match the name of the base event that you selected for the new event. Event names aren't displayed to the player and are internal to the code and game studio. Event names must be unique within a provider namespace: game studios can't have duplicate event names.  

   *  **Description**: Enter a brief description of the event. This text is optional and hidden from the player. The following screenshot shows the **Add new event** dialog with information added to its fields.

   ![Screenshot of the Add new event dialog with information added to its fields in Partner Center.](../../../../../../../../../resources/gamecore/secure/images/en-us/live/stats/pctr-add-new-event-dbox-filled-in.png)

   *  **Event fields**:  
      * The fields in this list, shown as follows, represent the data that will be captured in connection with the new event.  
      * To add an event field, select **Add event field** and then specify the **Field** name and **DataType**.
      * Field types have character limits. They're as follows.  

         *  Achievement name: 44  
         *  Achievement rule name: 44  
         *  Locked description: 100  
         *  Unlocked description: 100  
         *  In-app reward name: 57  
         *  In-app reward description: 90  
         *  Art reward name: 57  
         *  Art reward description: 90  
         *  Rich presence: 44  
         *  Hero stat name: 44  

   ![Screenshot of adding an event field in Partner Center](../../../../../../../../../resources/gamecore/secure/images/en-us/live/stats/pctr-add-event-field.png)

1. Select **Save** to create the event and close the dialog, shown as follows.

   ![Screenshot of the Add new event dialog with a new Basic base event in Partner Center.](../../../../../../../../../resources/gamecore/secure/images/en-us/live/events/add-event-dialog.png)

Your new event is now listed on the **Events and stat rules** page, shown as follows.

![Screenshot of the Events and stat rules page with the RecruitUnit event added in Partner Center.](../../../../../../../../../resources/gamecore/secure/images/en-us/live/events/events-and-stat-rules-2.png)

Now that you've defined an event, you can select the right side of the **Events** row to define a stat rule that uses the event. For more information, see [Portal configuration of event-based Stats](../../config/live-stats-eb-portal.md).

 [Return to the top of this topic.](#top)

<a id="ID4EYE"></a>

## Change an event  
> [!IMPORTANT]
> * After a title passes Final Certification, existing events in that title can't be changed except to add new event fields.
>
> * It's possible to delete custom event fields but *not* the default event fields that are automatically provided when the event was created.

   1. On the **Events and stat rules** page, under **Events**, select the name of the event that you want to change.

   1. Make the changes in the **Update event** dialog.

   1. Select **Save**.

 [Return to the top of this topic.](#top)

<a id="ID4EBG"></a>

## Copy an event  

You can create a new event by copying an existing event and modifying its information.

   1. On the **Events and stat rules** page, under **Events**, select **Copy** for the event that you want to copy.

   1. Enter the **Event name** for your new event.

   1. Update the description, and then add or remove the event fields as needed.

   1. Select **Save** to create the event and close the dialog.

 [Return to the top of this topic.](#top)

<a id="ID4EBL"></a>

## Delete an event  
> [!IMPORTANT]
> * After a title passes Final Certification, existing events in that title can't be deleted.
>
> * Deleting an event deletes any chained dependencies that it might have. Before deleting an event, ensure that you also want to delete all its dependencies.
>
> * You can delete events while your title is in development but *not* after it has exited Final Certification&mdash;that is, after you've launched your title.

   1. On the **Events and stat rules** page, under **Events**, select **Delete** for the event that you want to delete.

   1. In the **Confirmation** dialog, select **Delete** or **Cancel**.

The following diagram shows how deleting an event deletes chained dependencies.

![Image of a diagram that shows how deleting an event deletes chained dependencies.](../../../../../../../../../resources/gamecore/secure/images/en-us/live/events/event_delete_dependency.png)  

 [Return to the top of this topic.](#top)  
