---
title: Configuring the Multiplayer service
description: Describes how to configure the Multiplayer service, which includes configuring session templates, SmartMatch hoppers, and custom invite strings.
kindex:
- Configuring the Multiplayer service
- service configuration
- session template
- custom invite string
- SmartMatch hopper
author: joannaleecy
ms.author: migreen
ms.topic: conceptual
ms.assetid: d042d4d5-1c75-4257-8a6f-07eddd39ca7e
ms.localizationpriority: medium
ms.date: 07/12/2017
edited: 02/22/2021
security: public
---

# Configuring the Multiplayer service

This topic describes how to configure the Multiplayer service, which includes configuring session templates, SmartMatch hoppers, and custom invite strings. For your title to take advantage of the services that Xbox Live provides, you must first define your service configuration. Your service configuration exists in the Xbox Live cloud service and defines how the Xbox Live service interacts with devices that are running your game.

You can configure the following three aspects of Multiplayer services. 

* Session templates
* SmartMatch hoppers
* Custom invite strings

## Session templates

By using the Xbox Multiplayer service, players can create and join sessions, exchange session messages with other players in the same session, and post the results of their play to the session. Note that posting the results cleans up the session and updates the leaderboards for all players in the session.

For example, a multiplayer session could be a game of chess between two players. Another example of a multiplayer session could be a continuing session of an action and adventure title played by a large number of players. When a game creates a new multiplayer session, it creates it based on a predefined session template. This template is essentially a JSON object that contains attributes that describe the session.

When you create a new session template, you must define the values that are shown in the following table.

| Field | Description |
| --- | --- |
| Session name | Create a name that characterizes the multiplayer session template. Choose one that you can easily remember and recognize. The name must be a text string with a maximum of 100 characters. |
| Contract version | This value is autopopulated by the system and denotes the current system version of the JSON contract. Don't edit this value. |
| Session template (JSON text) | Specify the JSON data that describes the various attributes that are associated with a multiplayer session. |

For more information about multiplayer session templates, including several predefined templates that you can use as a basis for the JSON text, see [Multiplayer session templates](../mpsd/concepts/live-session-templates.md).
> [!IMPORTANT]
> After a title passes Final Certification, you can no longer change or delete existing multiplayer sessions in that title.

## SmartMatch hoppers

SmartMatch hoppers are an optional addition to the Xbox Multiplayer service. SmartMatch hoppers is the name of the Xbox server-based matchmaking service. It provides a method of grouping players together based on the following information.

* Provided by the title
* Stored in player statistics
* From the player's preferences
* From the Quality of Service (QoS)

Matchmaking is now server-based. Players can provide a request to the service and then be notified later when a match is found. It means that players aren't forced to wait in your title while the matchmaking process occurs. They're free to play the single-player portion of your title, or even play other titles, and still be candidates for matchmaking. This approach eliminates the need to achieve a critical mass of players before matches can be found.
> [!NOTE]
> You must base your matchmaking hopper on a previously defined session template.

When you create a new SmartMatch hopper, you must define the values shown in the following table.

| Field | Description |
|---|---|
|Name| Enter a name that characterizes the matchmaking hopper. Choose one that you can easily remember and recognize. The name is a text string that has a maximum of 140 characters. |
| Minimum group size | Specify the minimum acceptable number of players. The minimum value is 1. |
| Maximum group size | Specify the maximum acceptable number of players. The maximum value is 256. |
| Should rule expansion cycles | The default value is 3, and you shouldn't change it for typical player populations. |
| Ranked hopper | If a hopper is marked as a ranked hopper, it allows players in that hopper to be matched together&mdash;even if they've blocked each other. This helps prevent players from blocking other players that have a greater skill level. |
| Auto update from session | When this field is enabled, changes made to the session's member list, or to the members' custom properties, automatically propagate to a previously submitted ticket. |
> [!IMPORTANT]
> After a title passes Final Certification, you can no longer change or delete existing matchmaking hoppers in that title.


## Custom invite strings

When your title sends an invitation to a player to join a multiplayer game, you can choose to display a custom invite text string instead of the default invite string. When you create a new custom invite string, you must define the values in the following table.

| Field | Description |
|---|---|
| ID | The identifier of the custom invite string. `custominvitestrings_` is automatically appended to the beginning of your ID. The maximum length of this string is 100 characters. |
| Value | The text of the custom invite string that appears in your custom invite notification. The maximum length of this string is 100 characters. |


## Additional information

For more information about configuring the Multiplayer service, see the following topics.

| Topic name | Description |
|--- | ---|
| [Multiplayer session templates](../mpsd/concepts/live-session-templates.md) | Gives a brief overview of multiplayer session templates and provides several examples of templates that you can copy and modify |
| [Session template constants](../mpsd/concepts/live-session-template-constants.md) | Describes the predefined elements of a multiplayer session template |
| [Using large sessions for Multiplayer](../mpsd/concepts/live-large-sessions.md) | Describes when and how to use large sessions |

