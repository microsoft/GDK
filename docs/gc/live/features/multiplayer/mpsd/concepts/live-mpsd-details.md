---
title: Multiplayer Session advanced topics
description: Provides details about multiplayer sessions.
kindex:
- Multiplayer Session advanced topics
- multiplayer 2015
- session
- MPSD
author: joannaleecy
ms.author: migreen
ms.topic: conceptual
ms.assetid: 5aeae339-4a97-45f4-b0e7-e669c994f249
ms.localizationpriority: medium
ms.date: 04/04/2017
edited: 00/00/0000
security: public
---

<a id="top"></a>

# Multiplayer Session advanced topics

Use this topic to learn about advanced concepts in Multiplayer Session.

This topic covers the following:

* [Session overview](#session-overview)
* [Member properties](#member-properties)
* [Session capabilities](#session-capabilities)
* [Session size](#session-size)
* [Session user states](#session-user-states)
* [Visibility and joinability](#visibility-and-joinability)
* [Session time-outs](#session-timeouts)
* [Multiple signed-in users on a single console](#multiple-signed-in-users-on-a-single-console)
* [Process lifecycle management](#process-lifecycle-management)
* [Cleanup of inactive sessions](#cleanup-of-inactive-sessions)
* [Session arbiter](#session-arbiter)


<a id="session-overview"></a>

## Session overview

A *session* in Multiplayer Session Directory (MPSD) has a session name and is identified as an instance of a session template.
A *session template* is a JSON document that provides default settings for the session.

The session template is part of a service configuration with a service configuration identifier (SCID), which is a GUID.
The session template is on [Partner Center](https://partner.microsoft.com/dashboard/windows/overview).

*Service configurations* are the developer-facing resources used for ingestion, management, and security policy.
When a session is accessed through MPSD, principal authorization is performed against the service configuration according to the access policies set by the developer through Partner Center.
Secondary access checks, like session membership validation, are performed at the session level when the session is loaded after access to the service configuration is authorized.
> [!IMPORTANT]
> Functionality that's set through a template can't be changed through writes to MPSD. To change the values, you must create and submit a new template with the necessary changes. Any items that aren't set through a template can be changed through writes to MPSD.


### Contract version number

This topic assumes that your template uses contract version 107, which is the version used by the current MPSD for Xbox One (or later).



### Session reference

Each MPSD session is uniquely referred to by a session reference, represented in the multiplayer API by the [XblMultiplayerSessionReference](../../../../../reference/live/xsapi-c/multiplayer_c/structs/xblmultiplayersessionreference.md) structure.
The session reference contains the following string values.
-   Service configuration identifier (SCID)
-   Session template name
-   Session name

The session reference maps into the URI for identifying sessions, shown as follows.
In the following example mapping, `authority` is sessiondirectory.xboxlive.com.

```HTTP
https://{authority}/serviceconfigs/{service-config-id}/sessiontemplates/{session-template-name}/sessions/{session-name}
```


### Elements of a session

Each session contains groups of elements that enforce mutability and security rules. They vary by session element, along with read-only housekeeping information (metadata).
This section describes the groups of session elements that are included in the JSON files to configure your session, and in the JSON file for the template that you choose.
> [!NOTE]
> If you're using custom wrappers for an HTTP/REST implementation, your session and template must define JSON objects that precisely reflect the functionality of the implementation.

Two inner objects are inside each of the element groups.

-   **System objects:** These objects have a fixed schema that's enforced and interpreted by MPSD. They're validated and merged. Because MPSD defines and knows what they mean, it can act on them. For the full definition of each of the system objects, see the references for both the `XblMultiplayerSession` prefix and the Session Directory URIs.

-   **Custom objects:** These objects are optional and have no schema. They're used to store metadata that relates to a multiplayer game. Because MPSD can't interpret this data, it isn't acted on. Game data or saved information should be stored in Title-Managed Storage (TMS). For more information about TMS, see [Xbox Live Title Storage overview](../../../cloud-storage/title-storage/live-title-storage-overview.md).

Here's an example of a custom JSON object.
```JSON
    "custom": {
      "myField1": true,
      "myField2": "string",
      "myField3": 5.5,
      "myField4": { "myObject": null },
      "myField5": [ "my", "array" ]
    }
```


#### Session constants

*Session constants* are set only at creation time by the creator or by the session template.
The `/constants/system` object is used to define constants for the multiplayer system as it's known through MPSD.
The wrapper that's associated with this object is represented by the [XblMultiplayerSessionConstants](../../../../../reference/live/xsapi-c/multiplayer_c/structs/xblmultiplayersessionconstants.md) structure.

The `/constants/system` object can define a number of items. They include a `capabilities` object, a `metrics` object, a `managedInitialization` (template contract version 104 or 105) or `memberInitialization` (contract version 107) object, a `peerToPeerRequirements` object, a `peerToHostRequirements` object, and a `measurementsServerAddresses` object.


#### Session properties

Use the `/properties/system` object to define session properties for MPSD.
The wrapper that's associated with this object is the [XblMultiplayerSessionProperties](../../../../../reference/live/xsapi-c/multiplayer_c/structs/xblmultiplayersessionproperties.md) structure.
Session properties are writable by session members at any time.

Examples of session properties in JSON format are `joinRestriction`, `initializationSucceeded`, and the `matchmaking` object.
For an example of the use of this element group, see [Target session initialization and QoS](../../matchmaking/concepts/live-matchmaking-target-session.md).


#### Member constants

Set the member constants at join time for each session member.
The JSON object is `/members/{index}/constants/system`.
The wrapper class that represents a session member is the [XblMultiplayerSessionMember](../../../../../reference/live/xsapi-c/multiplayer_c/structs/xblmultiplayersessionmember.md) structure.


 [Return to the top of this topic.](#top)

<a id="member-properties"></a>

## Member properties

Member properties are writable only by a session member.
They're set in the `/members/{index}/properties/system` object and reflect the elements of the [XblMultiplayerSessionMember](../../../../../reference/live/xsapi-c/multiplayer_c/structs/xblmultiplayersessionmember.md) structure.

Here's an example.

```JSON
    {
      // These flags control the member status and "activeTitle" and are mutually exclusive (it's an error to set both to true).
      // For each, false is the same as not present. The default status is "inactive"; that is, neither present.
      "ready": true,
      "active": false,

      // Base-64 blob, or not present. An empty string is the same as not present.
      "secureDeviceAddress": "ryY=",

      // During member initialization, if any members in the list fail, this member will also fail.
      // Can't be set on large sessions.
      "initializationGroup": [ 5 ],

      // List of the groups I'm in and the encounters I just had.
      // An encounter is a brief interaction with a group. When an encounter is reported, it counts as retroactively joining the group 30 seconds ago and just now leaving.
      // Group names use the session name validation rules (like case-insensitive).
      // On large sessions, groups are used to report who played with whom (rather than just session membership). Members
      // who are active in at least one group together at the same time are counted as playing together.
      // Empty lists are the same as no value specified.
      // The set of encounters is a point-in-time property, so it's immediately consumed and will never appear on a response.
      "groups": [ "team-buzz", "posse.99" ],
      "encounters": [ "CoffeeShop-757093D8-E41F-49D0-BB13-17A49B20C6B9" ],

      // Optional list of role preferences that the player has specified for role-based game modes.
      // All role names have to match across all members in the session. Role weights are
      // defined from 0-100.
      "RolePreference": { "medic": 75, "sniper": 25, "assault": 50, "support": 100 },

      // Quality of Service (QoS) measurements by lowercase device token.
      // Like all fields, "measurements" must be updated as a whole. It should be set once when measurement is complete, not incrementally.
      // Metrics can be omitted if they weren't successfully measured; that is, the peer is unreachable.
      // If a "measurements" object is set, it can't contain an entry for the member's own address.
      "measurements": {
        "e69c43a8": {
          "bandwidthDown": 19342,  // Kilobits per second.
          "bandwidthUp": 944,  // Kilobits per second.
          "custom": { }
        }

      // QoS measurements by game-server connection string. Like all fields, "serverMeasurements" must be updated as a whole, so it should be set once when measurement is complete.
      // If empty, it means that none of the measurements were completed within the "serverMeasurementTimeout".
      "serverMeasurements": {
        "server farm a": {
          "latency": 233  // Milliseconds.
        }
      },

      // Subscriptions for shoulder taps on session changes. The "profile" indicates which session changes to tap and other properties of the registration like the minimum time between taps.
      // The subscription is named with a title-generated GUID that's also sent back with the tap as a context ID.
      // Subscriptions can be added and removed individually, without affecting other subscriptions in the "subscriptions" object.
      // To remove a subscription, set its context ID to null.
      // (Like the "ready" and "active" flags, the "subscriptions" data is copied out and maintained internally, so the normal replace-all rule on system fields doesn't apply to "subscriptions".)
      // Can't be set on large sessions.
      "subscriptions": {
        "961dc162-3a8c-4982-b58b-0347ed086bc9": {
          "profile": "party",  // Or "matchmaking", "initialization", "roster", "queuehost", or "queue".
          "onBehalfOfTitleId": "3948320593",  // Optional decimal title ID of the registered channel. If not set, the title ID is taken from the token.
        },
        "709fef70-4638-4b94-905b-24cb02706eb5": null
      }
    }
```

#### Server elements

*Servers* are non-users that have joined or been invited into a session.
The associated JSON objects are `/servers/{server-name}/constants/system` and `/servers/{server-name}/properties/system`.
These objects are writable only by servers.
> [!NOTE]
> The `/servers/{server-name}/constants/system` object isn't currently used.

### Session configuration

You can control the configuration of sessions in the following ways.

-   Use session templates ingested through Partner Center.
-   Use calls to the multiplayer and matchmaking APIs or REST APIs. You must still use a template, but it doesn't have to contain the values that you want to configure. Note that your title can't override the constants that are already set in the template.

A separate JSON document is provided to define the session itself.
In addition, you must implement any wrapper functionality that's required for a particular title.
The contents of the JSON documents and any wrapper code must reflect each other precisely and must reflect the latest template contract version.

The schema for a session is versioned with the session version (major version) and the protocol revision (minor version).
The versions are combined into the X-Xbl-Contract-Version header as "100 \* major + minor".
For example, a v1.7 title includes the following header on every REST request, assuming the latest template contract version of 107: X-Xbl-Contract-Version: 107.
> [!NOTE]
> We recommend that most titles (using Xbox Services API (XSAPI)) use contract version 105 and session template version 107.


### Session templates

Each session template is a JSON document, part of the service configuration, that defines the framework for the session being created and provides constants for the new session.
For more information, see [Multiplayer session templates](live-session-templates.md).

 [Return to the top of this topic.](#top)

<a id="session-capabilities"></a>

## Session capabilities

*Capabilities* are constants in the MPSD session that configure behavior that MPSD should apply to that session.
You most commonly use Partner Center to set capabilities in the session template.

Capabilities are set in the `/constants/system/capabilities` object.
If no capabilities are needed, use an empty `capabilities` object.
> [!NOTE]
> Titles almost never change or access session capabilities by using the multiplayer API or the matchmaking API.

Session capabilities are represented by the [XblMultiplayerSessionCapabilities](../../../../../reference/live/xsapi-c/multiplayer_c/structs/xblmultiplayersessioncapabilities.md) structure.
They're Boolean values that indicate what the session can support.

-   Connectivity
-   Gameplay
-   Large size
-   Connection required for active members

The [XblMultiplayerSessionConstants](../../../../../reference/live/xsapi-c/multiplayer_c/structs/xblmultiplayersessionconstants.md) structure contains a `SessionCapabilities` member (which is of type [XblMultiplayerSessionCapabilities](../../../../../reference/live/xsapi-c/multiplayer_c/structs/xblmultiplayersessioncapabilities.md)) that defines the following properties that relate to session capabilities.

-   `CapabilitiesConnectivity`
-   `CapabilitiesGameplay`
-   `CapabilitiesLarge`
> [!NOTE]
> If the title defines a dynamic session capability, the corresponding property is set to `true` for session constants.

 [Return to the top of this topic.](#top)

<a id="session-size"></a>

## Session size

The size of an MPSD session is determined by the number of members in that session.


### Maximum session size

The maximum size of a session is the maximum number of session members it can accommodate.
It's represented by the [XblMultiplayerSessionConstants](../../../../../reference/live/xsapi-c/multiplayer_c/structs/xblmultiplayersessionconstants.md)`::MaxMembersInSession` property.
The maximum member size is set in the `/constants/system` object.

The maximum session size is between 1 and 100 session members and defaults to 100 if not set on creation.
If the required size is over 100, the session is called a "large" session and is set in a special way.

#### Disconnect

Setting a maximum size for a session can cause an open slot to appear as full during certain disconnect scenarios.
For example, if a player is disconnected as a result of a network or power failure, the delay isn't immediately reflected in the session.
The member is set to Inactive by using the disconnect detection feature. For more information, see the [MPSD change notification handling and disconnect detection](../live-mpsd-overview.md#mpsd-change-notification-handling-and-disconnect-detection) section in the Multiplayer Session Directory overview topic.

In comparison, a peer mesh that uses a heartbeat to detect a disconnection is often aware of a disconnect within two to three seconds and can open up the player slot immediately.
However, the arbiter can't remove other members.


### Large sessions

A large MPSD session can have up to 1,000 members, but it has some session features disabled, like getting a list of all members.
Session largeness is represented by the [XblMultiplayerSessionCapabilities](../../../../../reference/live/xsapi-c/multiplayer_c/structs/xblmultiplayersessioncapabilities.md)`::Large` property.

This property is set to `true` to indicate a large session. The "large" capability is indicated in the `/constants/system/capabilities` object.
For more information, see [Session capabilities](#session-capabilities).



 [Return to the top of this topic.](#top)

<a id="session-user-states"></a>

## Session user states

MPSD defines a *user state* as the status of a user who has been added to a session.
Possible user states are defined by the [XblMultiplayerSessionStatus](../../../../../reference/live/xsapi-c/multiplayer_c/enums/xblmultiplayersessionstatus.md) enumeration.
The user also is considered to have a status of "available" before being added to a session.

You can use [XblMultiplayerSessionCurrentUserSetStatus](../../../../../reference/live/xsapi-c/multiplayer_c/functions/xblmultiplayersessioncurrentusersetstatus.md) to change the session user state.
Make this change for REST by setting `/members/{index}/properties/system` correctly in the game session JSON document.


### Reserved user state

The user is placed in the Reserved user state when the arbiter has selected the user to fill one of the open slots within the session.
In this state, the user hasn't yet officially accepted the invite to the session or joined the session to begin connecting with peers.


### Active user state

When a user is in the Active state, the title has joined the session on behalf of the user, and the user is actively participating in the session.
The user continues in this state as long as they're playing the game.

When a title is first launched, it should check to see if the user is already a member of any sessions, typically by checking the session state.
If the user is a session member, the title can go straight into the game and set any participating local members to the Active user state.

A user should remain in the Active state while playing in the session.
If a user leaves the session by using the in-game UI, they should be removed from the session by calling [XblMultiplayerSessionLeave](../../../../../reference/live/xsapi-c/multiplayer_c/functions/xblmultiplayersessionleave.md).
If the user is only temporarily away from the game, as when the title is constrained, it should keep the user in the Active state for a reasonable amount of time.

It's appropriate to change the user state to Inactive if the user hasn't returned after a title-specified time period.


### Inactive user state

In the Inactive state, the user isn't currently engaged with the game but still has a saved slot in the session.
In other words, the user is "not active."

It's the user's own console that's responsible for setting them to the Inactive user state in the session.
The arbiter can't do this.

Example scenarios where a user is put into the Inactive state include the following:

-   The title receives a Suspending event.

-   The user has been inactive (no input or controller response) for a title-defined time period. We recommend two minutes for a competitive multiplayer game.

-   The title has been in constrained mode for more than two minutes or for a title-defined time period. This constrained mode time-out period is the expected amount of time that a user might be away from the title for by using a related app or other experience related to the title.

-   The user has been disconnected ungracefully from the session. For more information, see the [MPSD change notification handling and disconnect detection](../live-mpsd-overview.md#mpsd-change-notification-handling-and-disconnect-detection) section in the Multiplayer Session Directory overview topic.

If the title starts and the user state for a particular session member is set to Inactive, the title has been suspended or the user has been inactive for too long in the session.
Because the title is launching again, the indication is that the user wants to continue with the game session that they belong to.

If the user's state is Active when the title launches, this situation is probably because of a network disconnect or another scenario where the title was unable to set the user to Inactive before being interrupted.
In both of these cases, your title should attempt to reconnect the user with the game and allow the other users to continue playing or remove the user from the session.


### User state when the session is over

When the session is over, gameplay is discontinued.
The title must allow all users to remove themselves by using [XblMultiplayerSessionLeave](../../../../../reference/live/xsapi-c/multiplayer_c/functions/xblmultiplayersessionleave.md).
The session activities that were associated with the users are automatically cleared when they leave the session.

 [Return to the top of this topic.](#top)

<a id="visibility-and-joinability"></a>

## Visibility and joinability

Session access is controlled at the MPSD level by two settings: session visibility and session joinability.
The visibility and joinability recommendations that we make in this topic apply to the most common title scenarios.
Titles should follow these settings, if possible. They should use in-title logic to make the final, authoritative determination as to whether a new player is admitted into a session.


### Session visibility

*Session visibility* is represented by a constant that's set at session creation.
It's typically defined in the session template and determines which types of users have read and write access to a session.

The possible values for session visibility are defined by [XblMultiplayerSearchHandleGetVisibility](../../../../../reference/live/xsapi-c/multiplayer_c/functions/xblmultiplayersearchhandlegetvisibility.md).
The settings that are permitted for the visibility constant in a JSON file are `open`, `visible`, and `private`.


#### Recommended game session visibility: open

Open game sessions don't require player reservations, which simplifies the invite process.

The arbiter doesn't reserve players in MPSD after an invite has been sent, but only tracks invited players locally.
As a result, players can immediately connect to the arbiter and determine whether they should join a session, are rejected, or should wait (if waiting players are supported).

The arbiter is the ultimate authority. They respond and instruct the new member to either stay in or leave the session.

Using open game session visibility requires the invited player to launch a title and connect to the arbiter before the final decision has been made.
You can display an error message to the user if a session is full or if an invite has been rejected.

To establish a connection to the arbiter, a secure device address is required.
The [XblMultiplayerSessionProperties](../../../../../reference/live/xsapi-c/multiplayer_c/structs/xblmultiplayersessionproperties.md)`::HostDeviceToken` property is used to find out which session member is the current arbiter of a session and which secure device address an invited player should use for connection.


### Session joinability

*Session joinability* determines which types of users can join a session.
It can be set dynamically during a session.

The possible values for session joinability are as follows.
-   **None (default):** There are no restrictions on who can join the session.
-   **Local:** Only local users can join the session.
-   **Followed:** Only local users and users who are followed by other session members can join the session without a reservation.

A session arbiter can create a private session through the joinability setting.
Making joinability either local or followed restricts access to the session and makes it private.

The arbiter should also keep track of session joinability so that older session invites can be rejected at the host level if needed.
For example, if any invited players haven't arrived to join a session until the session is already full, the arbiter can instruct the joining players that the session has been locked and they need to leave the session automatically.

 [Return to the top of this topic.](#top)

<a id="session-timeouts"></a>

## Session time-outs

Sessions can be changed by timers and other external events.
*Session time-outs* define the periods for which session members can remain in specific states before they're automatically made inactive or removed from the session.
MPSD also supports time-outs to manage session lifetime.
> [!NOTE]
> Time-out settings are made in `/constants/system/timeouts`, or within the managed initialization object, for template contract version 104 or 105. For version 107 or later, the settings are made individually in `/constants/system` or within the managed initialization object.

When a timer expires, MPSD doesn't automatically update the session and notify the arbiter at that instant of any changes.
The session and time-out states are only updated immediately before a read or write request is sent.
Immediate update ensures that the data returned is the most up to date.
> [!NOTE]
> Session time-outs aren't stacked. Only one is applied for a state transition against each session member on an update.


### Currently defined time-outs

This section describes the time-outs that are currently defined by MPSD.

-   All time-outs are specified in milliseconds.
-   A value of 0 is allowed and indicates an immediate time-out.
-   A time-out with no value is considered infinite.

Because the time-outs have defaults, you should explicitly specify `null` for an infinite time-out.


#### evaluationTimeout

This time-out indicates the amount of time for a session member to make and upload the evaluation decision.
If no decision is received, the decision counts as a failure.
This time-out is placed in the managed initialization object.


#### inactiveRemovalTimeout

This time-out is set for a session member who has joined a session but isn't currently engaged in the game.
By default, the member is removed from the session after two hours.
> [!NOTE]
> This time-out is designated the inactive time-out for template contract version 104 or 105.

In many cases, we recommend setting the inactive time-out to 0. This causes any user who's set to the Inactive state to be removed immediately from the session and the corresponding slot to be cleared.
This behavior is desirable for most competitive multiplayer games so that, if a user has gone inactive or reached an Inactive state, a new player can be added quickly.

For co-op or other multiplayer designs, you might want your title to allow users more time to reconnect if they're disconnected or not engaged in the title for periods of time.
Note that no single solution fits all design scenarios.


#### joinTimeout

This time-out indicates the number of milliseconds that a user has to join the session.
Reservations are removed for users who fail to join the session.
This time-out is placed in the managed initialization object.


#### measurementTimeout

This time-out indicates the amount of time that a session member has to upload measurements.
A member who fails to upload measurements is marked with a failure reason of "timeout".
This time-out is placed in the managed initialization object.
> [!NOTE]
> During matchmaking, a 45-second time-out for QoS measurements is enforced. As a result, we recommend that you use a measurement time-out that's less than or equal to 30 seconds during matchmaking.


#### readyRemovalTimeout

This time-out is set for a session member who has joined the session and is trying to get into the game.
This usually means that the shell has joined the user on behalf of the title and it's being launched.
By default, the member is removed from the session and placed in the Inactive state after three minutes.
> [!NOTE]
> This time-out is designated the ready time-out for contract version 104 or 105.


#### reservedRemovalTimeout

This time-out is set for a session member who has been added to the session by someone else but hasn't yet joined the session.
The reservation is deleted, and the member is considered inactive when the time-out expires.
The default value is 30 seconds.
> [!NOTE]
> This time-out is designated the reserved time-out for contract version 104 or 105.


#### sessionEmptyTimeout

This time-out indicates the number of milliseconds after a session becomes empty when it's deleted.
The default value is 0.
> [!NOTE]
> This time-out is designated the `sessionEmpty` time-out for contract version 104 or 105.


### Session time-out example

1.  A session is started with four players.

2.  Two players, A and B, are disconnected because of a power failure. Their status in the game remains Active.

3.  The other two players, C and D, quit properly by using [XblMultiplayerSessionLeave](../../../../../reference/live/xsapi-c/multiplayer_c/functions/xblmultiplayersessionleave.md).

4.  The session remains open. Players A and B are disconnected but are still in the Active state.

5.  A few days later, Player A returns and starts the game.

6.  Player A's game checks for sessions that Player A is a member of (performs a read) and finds the orphaned session from a few days ago.

7.  The session does a presence check against the two players who are still in the session (A and B).
    1.  Because Player A is running the title, the presence check against Player A succeeds. The player's Active state in the match stays the same.
    2.  Player B isn't running the title. As a result, the presence check for Player B fails. The service sets Player B's state to Inactive. At this point, the inactive time-out starts for Player B.

8.  Player A exits the session properly by using the [XblMultiplayerSessionLeave](../../../../../reference/live/xsapi-c/multiplayer_c/functions/xblmultiplayersessionleave.md) method.

9.  The inactive time-out expires for Player B, who is removed from the session on the next read or write that's done by anyone.

10. The session now has zero members and is removed from the service.

If the inactive time-out for the example session is set to 0, Player B times out immediately after the presence check in step 7.1 and is probably removed by the session write.
In this case, the session closes without the need of an additional read from or write to the session.

 [Return to the top of this topic.](#top)

<a id="multiple-signed-in-users-on-a-single-console"></a>

## Multiple signed-in users on a single console

When multiple users are signed in on the same console, it's possible for some users to be in a game session while other users aren't in the session or aren't active in the current title.
Game invites can also be received and accepted for multiple users, having an effect on game session membership.
Consider this information for your title so that it can correctly handle all session membership scenarios.

In a common scenario, a new player signs in, becomes active in the game, and needs to be added to an existing game session.
As with creating a new game session, a title should only add a user when it's appropriate during gameplay.

With multiple signed-in users, one or more users can also receive invites to another game session.
Titles don't need to handle these scenarios in any specific way.
Session state and member events notify the title of any updates to the game session and user membership.

To handle multiple signed-in users for an online session, the title subscribes for shoulder taps for all users, using a separate `XboxLiveContext Class` object for each user.
The title uses the [XblMultiplayerSessionInfo](../../../../../reference/live/xsapi-c/multiplayer_c/structs/xblmultiplayersessioninfo.md)`::ChangeNumber` property to determine particular changes in the session and ignore duplicate shoulder taps.

 [Return to the top of this topic.](#top)

<a id="process-lifecycle-management"></a>

## Process lifecycle management

Just like a non-multiplayer title, a title in a multiplayer session can encounter title suspension and termination of process lifecycle events.
As a result, the session arbiter should periodically save session state.

In case the arbiter is suspended, the title should attempt arbiter migration and save the game state as appropriate. A new arbiter can then restore session state.
It's then possible for a full multiplayer session to be suspended and resumed later if the session is still valid in MPSD.

Only one designated peer, typically the game host, should update the global game state.


### Storage of game metadata

A title stores game metadata in the MPSD session.
Game metadata is the information that's needed to display session data and enable the title to find and join the game session.

The title stores player-specific metadata in the custom properties section for the session member. For example, player color and preferred player weapon for the session.
Session-wide metadata, like current map, is stored in the global custom properties section of the MPSD session.


### Storage of game state

Game state is stored in TMS by using the Title Storage service.
Storage using this location allows a title to migrate the arbiter without permission concerns.
For more information, see [Migrating an arbiter](../../concepts/live-migrating-an-arbiter.md).
> [!NOTE]
> The title shouldn't attempt to save game state to TMS more frequently than once every five minutes unless it's being suspended.

 [Return to the top of this topic.](#top)

<a id="cleanup-of-inactive-sessions"></a>

## Cleanup of inactive sessions

If `sessionEmptyTimeout` is set to 0, an MPSD session is automatically deleted when the last player leaves the session.
To learn how to prevent an unused session from containing players after a crash or disconnection, see the  [MPSD change notification handling and disconnect detection](../live-mpsd-overview.md#mpsd-change-notification-handling-and-disconnect-detection) section in the Multiplayer Session Directory overview topic.
Improper handling of unused sessions after a crash or disconnection can cause issues when a title is querying sessions for a player.

We recommend that you clean up inactive sessions by having the title query all sessions for a particular user by calling [XblMultiplayerGetSessionAsync](../../../../../reference/live/xsapi-c/multiplayer_c/functions/xblmultiplayergetsessionasync.md) and then evaluating the sessions.
When the title encounters a stale session, the title calls [XblMultiplayerSessionLeave](../../../../../reference/live/xsapi-c/multiplayer_c/functions/xblmultiplayersessionleave.md) for all local players in the session.
This call eventually drops the member count to 0 and cleans up the sessions.

 [Return to the top of this topic.](#top)

<a id="session-arbiter"></a>

## Session arbiter

Some multiplayer methods should only be called by one client within a game session.
This client is one of the consoles that's participating in the session, called the *arbiter*, or the host.
If at least one session member is in a game, the session should have an arbiter to monitor joins in progress.


### Setting the arbiter

When a session is created by the client, it designates one console as the arbiter.
For more information, see the [Set an arbiter for an MPSD session](../how-to/live-mpsd-how-tos.md#set-an-arbiter-for-an-mpsd-session) section in the Multiplayer tasks topic.


### Saving session state

As described in the [Process lifecycle management](#process-lifecycle-management) section, the arbiter should periodically save session state.
A new arbiter must be able to restore session state in the case of arbiter migration by the title.
For more information, see [Migrating an arbiter](../../concepts/live-migrating-an-arbiter.md).


### Managing game session members and joins in progress

The most important role of the session arbiter is to manage users coming into the game session to play.
This includes handling game invites, notifying waiting players, and working with players who quit the game.


#### Receiving notifications

The arbiter must listen for new players who want to join the game session by using [XblMultiplayerSessionChangedHandler](../../../../../reference/live/xsapi-c/multiplayer_c/functions/xblmultiplayersessionchangedhandler.md).


#### Finding players to fill empty game session slots

The arbiter finds players to fill empty game session slots by using one of the following operations.
* If your title uses a lobby session or another mechanism to allow delayed joins, find new session members by using that mechanism.
* Create another match ticket session.

For more information, see the [Fill open session slots during matchmaking](../how-to/live-mpsd-how-tos.md#fossdm) section in the Multiplayer tasks topic.


#### Handling invited session members

The arbiter must monitor invited session members and apply a minimum interval between invites to a single user.
For more information, see the [Send game invites](../how-to/live-mpsd-how-tos.md#sgi) section in the Multiplayer tasks topic.
