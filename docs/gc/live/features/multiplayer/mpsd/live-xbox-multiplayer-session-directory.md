---
title: Multiplayer Session Directory
description: Creating multiplayer sessions by using the Xbox Live Multiplayer Session Directory (MPSD) service.
kindex: Multiplayer Session Directory
author: joannaleecy
ms.author: migreen
ms.topic: conceptual
ms.assetid: 70da1be3-5f39-4eed-b62d-9cdd47e413d2
ms.localizationpriority: medium
ms.date: 04/04/2017
edited: 00/00/0000
security: public
---



# Multiplayer Session Directory

This article provides an overview of multiplayer session creation using the Xbox Live Multiplayer Session Directory (MPSD) service, on platforms later than Xbox 360.

This article is directed primarily toward Xbox Live title developers who submit their session templates directly to Partner Center.

This article covers MPSD configuration, usage, and troubleshooting of multiplayer sessions.

**Contents:**
* [Revision summary](#rs)
* [Introduction](#intro)
* [Terminology used in this document](#tuitd)
* [The Multiplayer Session Directory](#tmsd)
* [MPSD sessions](#mpsds)
* [Session template attributes](#sta)
* [Contract schema update](#csu)
* [Member initialization in session documents](#miisd)
* [Match ticket session](#mts)
* [Quality of Service (QoS) templates](#qost)
* [QoS phase and session initialization details](#qospasid)
* [Xbox Cloud Compute session](#xccs)
* [Raw session and custom title properties](#rsactp)
* Active member decay
* [FAQ and troubleshooting](#fat)


<a id="rs"></a>

## Revision summary

The client-side XSAPI (Xbox Services API) libraries currently use contract version 104 when communicating to the MPSD services.
This version of the document updates the session template schema to contract version 107, which is the latest contract version supported by the MPSD services.
The changes between version 104 and 107 are summarized in the section [Contract schema update](#_Contract_schema_update) below.

Note that templates that were written for contract version 104 will need to be updated if they are republished as 107.
However, the services are backward-compatible so you can continue to use the current libraries, which will be updated in a future release.

The previous revision of this document updated information regarding server sessions and added a new section about Xbox Live Service APIs and RESTful service calls.
In addition, the table found in the Query for Session State Information section was updated and the Quality of Service (QoS) Templates section was revised.


<a id="intro"></a>

## Introduction

A multiplayer session is a secure document that lives in the cloud on the Multiplayer Session Directory (MPSD), and this document represents a group of people playing a game.
Specifically, multiplayer sessions have the following qualities:

-   Each session has a unique URI.

-   The session document contains the current members, game settings, bootstrapping data, and game server information.

-   Titles create and manage their own sessions.

-   A session enables connectivity between its members.

The Multiplayer Session Directory (MPSD) centralizes game session metadata across all the clients.
MPSD provides the basic information needed about a session to help set up the secure device associations between clients.

MPSD also provides basic first-boot metadata for a client to connect to the game before it starts passing around more specific game data.

With Process Lifetime Management (PLM) and the task-switching nature of applications on Xbox One and later, MPSD ensures that clients have the correct information for contacting peers and servers that are identified as part of the active game session, and coordinates with the shell and console operating system to reserve, activate, and manage player lifetime for a game session.


<a id="tuitd"></a>

## Terminology used in this document

| Term                 | Definition                                                                                                                                                                                                                                                                                  |
|----------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Multiplayer session  | A secure document that resides in the Xbox Live cloud and represents a group of users who are (or will be) connected together while playing a title on Xbox One or later (including PC). All the aspects of multiplayer—such as matchmaking, parties, join-in-progress, and so on—leverage the multiplayer session. |
| Game session         | This is the actual game session, exposed in the MPSD, in which users are playing together. All multiplayer scenarios ultimately end up in a game session.                                                                                                                               |
| Match ticket session | This is a session used to track match ticket submission during matchmaking.                                                                                                                                                                                                                 |
| Inactive player      | A player who has been set to the Inactive state within the session. The title sets a user to the Inactive state when the game is constrained, suspended, or otherwise inactive as defined by the title.                                                                                     |


<a id="tmsd"></a>

## The Multiplayer Session Directory

The MPSD facilitates and helps titles coordinate session information between online players.
There can be different types of sessions created to accomplish different tasks of multiplayer play.

The following table lays out the differences in how such tasks were done on Xbox 360 versus how they are accomplished on Xbox One or later (including PC).

| Function or task                     | Xbox 360                                                                                                        | Xbox One or later                                                                                                   |
|--------------------------------------|-----------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------|
| **Get game session information**     | **XSessionGetDetails**, **XSessionSearchByID**, or track yourself.                                              | Request the session information from the service.                                                          |
| **Migrate host**                     | When needed, the title calls **XSessionMigrateHost.**                                                           | Don't need to create a new session, just assign a new host for SessionID.                                  |
| **Manage multiple player sessions**  | Tricky to handle more than one session at a time. For example, **XNetReplaceKey** versus **XNetUnregisterKey**. | Service-based session makes managing one session cleaner and makes it easy to handle multiple sessions.    |
| **Handle sign-outs and disconnects** | Have to handle disconnects and sign-out differently, with **XCloseHandle** or **XSessionDelete**, respectively. | Centralized service simplifies sign-outs and disconnect handling, and timeouts are set in the game config. |


### Session patterns

-   Game sessions

    -   Session with players' XUIDs, secure device address data, and property states. This is thought of as the actual gameplay session.

    -   Can be peer-to-peer, peer-to-host, peer-to-server, or hybrid.

-   Match ticket sessions

    -   A session that is submitted to matchmaking to find other players to play with. Note that a game session can also be a ticket session, if the game is looking for more players.

-   Server sessions

    -   Game sessions created and used through Xbox Live Compute processing.

Figure 1 illustrates usages of MPSD sessions, where the blue boxes represent MPSD sessions and the red boxes are the services that are using them.

**Figure 1. MPSD session use:** (figure missing)


<a id="mpsds"></a>

## MPSD sessions

Sessions maintain two lists of related entities:

1.  Members (users) that have joined or been invited into a session.

2.  Servers (cloud servers or dedicated servers) that have joined the session.

Each entity has:

1.  Constant values set at creation time.

2.  Mutable properties.

3.  Read-only metadata.


### Xbox Live Service APIs and RESTful service calls

There are two ways to interface with the Xbox Live Sessions and Matchmaking services.

* Standard HTTPs calls
* Xbox Live Service API wrappers


#### Using standard HTTPS calls to the RESTful services

For Xbox One and later, the first way to interface with the Xbox Live Sessions and Matchmaking services is to use standard HTTPS calls to the RESTful Xbox Live Services URIs.
This allows titles flexibility in calling and interfacing with these services depending on their server and game configurations.

For a list of these URIs, see [Xbox Live Services RESTful Reference](/gaming/xbox-live/api-ref/xbox-live-rest/atoc-xboxlivews-reference).


#### Using the Xbox Live Service API wrappers for RESTful services

The second way to interface with the Sessions and Matchmaking services is to use the Xbox Live Service APIs, which act as wrappers for the RESTful service URIs.
These allow for a more traditional approach to using APIs in code without having to handle HTTPS traffic for each call.




More information about the Xbox Live Services APIs can be found in:
* Xbox Live Services API Reference [(Xbox Developer Downloads->Xbox One->All Xbox One XDK CHMs)](https://www.microsoft.com/software-download/devcenter)


That Reference documentation includes:
* JSON Parsing API Reference - Reference material for the JSON parsing APIs.
* Windows.Web Namespace - Windows.Web namespace members.
* Xbox Live Compute SDK Reference - APIs for creating game server instances for Xbox Live Compute.


### MPSD sessions and templates

MPSD sessions are created with templates ingested through Partner Center.
The templates are JSON documents that define the framework for the session being created.
The template provides constants for the new session.


The following excerpt is a template config example.

```json
// Used for creating the session that you then pass into your match ticket request. This *should* not have any QoS requirements.
MatchTicketSession (Contract Version: 107)
{
    "constants": {
        "system": {
            "version": 1,
            "maxMembersCount": 10,
            "visibility": "private",
            "capabilities": {},
            "memberInitialization": {
                "joinTimeout": 20000,
                "externalEvaluation": false,
                "membersNeededToStart": 1
            }
        },
        "custom": {}
    }
}

// This is the new game session that is returned after you've been matched.
// Note: This is used for in-game QoS. For out-of-game QoS, you will need P2P/HTP requirements.
GameSession (Contract Version:107)
{
    "constants": {
        "system": {
            "maxMembersCount": 12,
            "capabilities": {"connectivity": true }
        },
        "memberInitialization": {
         "joinTimeout": 20000,
         "measurementTimeout": 15000,
         "externalEvaluation": false,
         "membersNeededToStart": 4
         },

   "custom": {}
  }
}
```

The match ticket session should be used with a game session template set up with QoS timeout values in its **memberInitialization** object.

**Figure 2. Sample hopper:**

![Hopper edit dialog box](../../../../../../resources/gamecore/secure/images/en-us/live/whitepapers/mpsd_image1.png)

The code excerpt that follows is an example of a peer-to-peer game session template (title-managed QoS).

```json
{
    "constants": {
        "system": {
            "version": 1,
            "maxMembersCount": 10,
            "visibility": "private",
            "capabilities": {
                "connectivity": true
            },
            "memberInitialization": {
                "joinTimeout": 20000,
                "externalEvaluation": false,
                "membersNeededToStart": 2
            }
        },
        "custom": {}
    }
}

```

This is an example of a peer-to-server session and RAW template.

```json
{
    "constants": {
        "system": {
            "version": 1,
            "maxMembersCount": 10,
            "visibility": "private",
            "capabilities": {}
        },
        "custom": {}
    }
}
```

The following code shows an example of a match ticket session template, which is used for Smart Match.

```json
{
    "constants": {
        "system": {
            "version": 1,
            "maxMembersCount": 10,
            "visibility": "private",
            "capabilities": {},
            "memberInitialization": {
                "joinTimeout": 20000,
                "externalEvaluation": false,
                "membersNeededToStart": 1
            }
        },
        "custom": {}
    }
}

```


### Checking which templates are configured for your SCID


#### Session templates

The list of session templates that exist within a SCID, as well as the details of a specific session template, can be retrieved from MPSD:

```uri
GET /serviceconfigs/{scid}/sessiontemplates

GET /serviceconfigs/{scid}/sessiontemplates/{session-template-name}
```


#### Query for session state information

Sessions can be queried at the service config and session template levels:

```uri
GET /serviceconfigs/{scid}/sessions

GET /serviceconfigs/{scid}/sessiontemplates/{session-template-name}/sessions
```

By default, this will return up to 100 non-private sessions.
The query can be modified using these query-string parameters:

| Query string             | Effect                                                                                                         | Description                                                                                         |
|--------------------------|----------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------|
| keyword=foo              | Only include sessions that have the keyword "foo."                                                             |                                                                                                     |
| XUID=123                 | Only include sessions that the user "123" is in.                                                               | By default, the user must be active in the session to be included.                                  |
| *reservations*=**true** | Include sessions for which the user is set as a reserved player but has not joined to become an active player. | Only when querying your own sessions, or when querying a specific user's sessions server-to-server. |
| *inactive*=**true**      | Include sessions that the user has accepted but isn't actively playing in.                                     | Sessions in which the user is "ready" but not "active" count as inactive.                           |
| *private*=**true**       | Include private sessions.                                                                                      | Only when querying your own sessions, or when querying server-to-server.                            |
| *visibility*=open        | Only include sessions that are "open."                                                                         | If set to "private," the "private=true" directive must also be set.                                 |
| *take*=5                 | Return up to five sessions.                                                                                    | Must be between 0 and 100.                                                                          |

The result is a JSON array of session references.
Some session data is included inline.

**Note** Every query must include either a keyword filter, a XUID filter, or both.

Setting either *private* (which returns private sessions) or *reservations* (which returns sessions the user hasn't joined) to **true** requires the caller to have server-level access to the session, or for the caller's XUID claim to match the XUID filter in the URI.
Otherwise, 403 Forbidden is returned (whether or not any such sessions actually exist).

The following code excerpt shows an example of a query response.

```json
{
"results": [ {
"xuid": "9876",  // If the session was found from a xuid, that xuid.
"startTime": "2009-06-15T13:45:30.0900000Z",
"sessionRef": {
  "scid": "foo",
  "templateName": "bar",
  "name": "session-seven"
},
"accepted": 4,        // Approximate number of non-reserved members.
"status": "active",   // or "reserved" or "inactive". This is the state of the user in the session, not the session itself. Only present if the session was found using a xuid.
"visibility": "open", // or "private", "visible", or "full"
"myTurn": true,       // Not present is the same as 'false'. Only present if the session was found using a xuid.
"keywords": [ "one", "two" ]
} ]
}

```


<a id="sta"></a>

## Session template attributes


<a id="csu"></a>

<div id="_Contract_schema_update"/>

## Contract schema update

As was mentioned in the beginning of this document, the latest session template contract version is 107, which introduces some changes to the schema from the prior version of 104.
Templates that were written for contract version 104 will need to be updated if they are republished as 107.

The following is a summary of the changes.

-   **/constants/system/managedInitialization** is renamed to **/constants/system/memberInitialization**.

    -   The **autoEvaluate** field is renamed to **externalEvaluation** and its polarity changes, except that **false** remains the default.

    -   The default value of **membersNeededToStart** changes from 2 to 1.

    -   The default value of **joinTimeout** changes from 5 seconds to 10 seconds.

    -   The **measurementTimeout** default changes from 5 seconds to 30 seconds.

-   **/constants/system/timeouts** is removed, and the timeouts are renamed and relocated under **/constants/system**.

    -   The **reserved** timeout becomes **reservedRemovalTimeout**.

    -   The **inactive** timeout becomes **inactiveRemovalTimeout** and its new default is 0 instead of 2 hours.

    -   The **ready** timeout becomes **readyRemovalTimeout**.

    -   The **sessionEmpty** timeout becomes **sessionEmptyTimeout**.

-   **/constants/system/capabilities/gameplay** must be specified as **true** on sessions that represent actual gameplay (as opposed to helper sessions such as match and lobby sessions) in order to enable recent players and reputation reporting.


### System objects

Each of the system objects in the session document has a fixed schema that is enforced and interpreted by MPSD.

Within the body of PUT requests, the system objects are validated and merged just like the custom objects.
But unlike custom objects, after they are merged the system objects are further validated and acted upon based on these schemas.

**/constants/system**

```json
{
"version": 1,  //Document Version (FAL release version 1, service contract 107)
"maxMembersCount": 100,  // Defaults to 100 if not set on creation. Must be between 1 and 100.
"visibility": "private",  // Or "visible" or "open", defaults to "open" if not set on creation.

"initiators": [ "1234" ],  // If specified on a new session, the creators xuid must be in the list (or the creator must be a server).
"inviteProtocol": "party",  // Optional URI scheme of the launch URI for invite toasts.

"reservedRemovalTimeout": 10000, // Default is 30 seconds. Member is removed from the session.
"inactiveRemovalTimeout": 0, // Default is zero. Member is removed from the session.
"readyRemovalTimeout": 60000, // Default is three minutes. Member is removed from the session.
"sessionEmptyTimeout": 0, // Default is zero. Session is deleted.

// Capabilities are boolean values that are optionally set in the session template. If no capabilities are needed, an empty "capabilities" object should be in the template in order to prevent capabilities from being specified on session creation, unless the title desires dynamic session capabilities.
"capabilities": {
"clientMatchmaking": true,
"connectivity": true, // Cannot be set if 'large' is specified.
     "suppressPresenceActivityCheck": false,
     "gameplay": false,
     "large": false
},
/* If a "memberInitialization" object is set, the session expects the client system or title to perform initialization following session creation and/or as new members join the session. The timeouts and initialization stages are automatically tracked by the session, including QoS measurements if any metrics are set. These timeouts override the session's reservation and ready timeouts for members that have 'initializationEpisode' set. */
"memberInitialization": {
"joinTimeout": 20000,  // Milliseconds. Unspecified counts as 10 seconds.
"externalEvaluation": false,
"membersNeededToStart": 2  // Unspecified counts as 1. Must be between 0 and maxMembersCount. Only applies to episode 1. If 00 and the session is created with no members to initialize, episode 1 is skipped..
},
```

**/properties/system**

```json
{
// Optional array of case-insensitive strings. Cannot be set if the session's visibility is "private".
"keywords": [ "hello" ],

// Array of integer indices of members whose turn it is. Defaults to empty. Can't be set (and doesn't appear) on large sessions.
"turn": [ 0 ],

/* Restricts who can join "open" sessions. (Has no effect on reservations, which means it has no impact on "private" and "visible" sessions.) Defaults to "none". On large sessions, "none" is the only valid value.
If "local", only users whose token's DeviceId matches someone else already in the session and "active": true.
If "followed", only local users (as defined above) and users who are followed by an existing (not reserved) member of the session can join without a reservation. */
"joinRestriction": "none",

// Device token of the host. Must match the "deviceToken" of at least one member, otherwise this field is deleted.
// If "peerToHostRequirements" is set and "host" is set, the measurement stage assumes the given host is the correct host and only measures metrics to that host.
// Can't be set on large sessions.
"host": "99e4c701",

// Can only be set while "initializing/stage" is "evaluating". True indicates success, and false indicates failure. Once set, "initializing/stage" is immediately updated, and this field is removed.
"initializationSucceeded": true,

/* The ordered list of case-insensitive connection strings that the session could use to connect to a game server. Generally titles should use the first on the list, but sophisticated titles could use a custom mechanism (e.g. Thunderhead) for choosing one of the others (e.g. based on load). */
"serverConnectionStringCandidates": [ "datacenter b", "serverfarm a" ],

"matchmaking": {
    "targetSessionConstants": { },
    // Force a specific connection string to be used (useful in preserveSession=always cases).
    "serverConnectionString": "datacenter b",
},

// True if the match that was found didn't work out and needs to be resubmitted. Set to false to signal that the match did work, and the matchmaking service can release the session.
"matchmakingResubmit": true
}

```


### Timeouts

Sessions can be changed by timers and other external events.
The **Timeouts** object in MPSD provides a basic mechanism to manage session lifetime and members.

The **nextTimer** field of the session gives the time of the next timer.
Clients can use this information to pick a good interval for the next poll.
This value is also returned in the **Expires** HTTP header.

Timeouts are specified in milliseconds.
Zero is allowed and signifies that the timeout should be immediate.

If a given timeout isn't specified, it's considered infinite.
Because the timeouts have defaults, the session template should explicitly specify "null" for an infinite timeout.


#### SessionEmptyTimeout

The **/constants/system/sessionEmptyTimeout** value configures the number of milliseconds after a session becomes empty that it will be deleted.
The default is zero, meaning that the session will be deleted immediately.
If the value is unspecified, empty sessions will live on indefinitely.


#### Member timeouts

The three other timeouts within **/constants/system** control the amount of time a member can remain in a particular state:

-   **reservedRemovalTimeout**

    -   The reservation is deleted when the timeout expires. The default is 30 seconds.

-   **inactiveRemovalTimeout**

    -   An inactive member is removed from the session after two hours by default.

-   **readyRemovalTimeout**

    -   Members who are "ready" revert to the inactive state after three minutes by default.


<div id="_Member_initialization_in"/>

<a id="miisd"></a>

## Member initialization in session documents


### Member initialization

The **memberInitialization** object controls the initialization stages following session creation and/or as new members join the session.
The timeouts and initialization stages are automatically tracked by the session, including QoS measurements if any metrics are set.

These timeouts override the session's reservation and ready timeouts for members that have the **initializationEpisode** property set.

Example:

```json
"memberInitialization": {
        "joinTimeout": 5000,
        "measurementTimeout": 5000,
        "evaluationTimeout": 5000,    // only specify for external evaluation
        "externalEvaluation": true,
         "membersNeededToStart": 2
    },
```

**Figure 3. Member initialization flow:**

![Member initialization flowchart](../../../../../../resources/gamecore/secure/images/en-us/live/whitepapers/mpsd_image2.png)

Each of the three stages of member initialization can time out:

1.  **joiningTimeout**

    -   The amount of time, in milliseconds, that users have to join the session. Reservations of members that fail to join are removed.

2.  **measuringTimeout**

    -   The amount of time that members have to upload their measurements. Members that fail to upload measurements are marked with a *failureReason* of "timeout".

3.  **evaluationTimeout**

    -   The amount of time for a member to make and upload the evaluation decision. If no decision is received, it counts as a failure.

**externalEvaluation**

-   MPSD can do an automatic QoS evaluation based on requirements provided in the session template. The evaluation is performed when externalEvaluation is set to false. **externalEvaluation** needs to be **true** when an **evaluationTimeout** is set. If there are two peer-to-peer or peer-to-host requirements, you should still set **externalEvaluation** to **false** in order to have the session automatically finish initialization.

**membersNeededToStart**

-   This is the minimum number of member reservations that need to exist with "initialize":"true" and pass QoS for automatic evaluation to succeed.


### Initialization episodes

When the **memberInitialization** object is set, MPSD will progress the initialization phases by episode.
The first episode is started when the session is created and will include all the phases defined in the template.

Any new members invited or joined while an episode is already running will be marked for the next episode.
The status of an episode or **memberInitialization** in general can be retrieving from the **initializing** object of the session.

**Note** Be aware, this object is removed after initialization is complete.

Example:

```json
"initializing": {
    "stage": "measuring",
    "stageStartTime": "2009-06-15T13:45:30.0900000Z",
    "episode": 1
},

```

The stage goes from joining to measuring to evaluating.
If an episode fails, then stage is set to *failed* and the session cannot be initialized.
Otherwise, when an initialization episode completes, the **initializing** object is removed.

Initialization failures can also be tracked for each member.
They are set when transitioning out of the joining or measuring stage if this member doesn't pass.

Example:
```json
"initializationFailure": "latency",
```

In order of precedence, the value for this attribute could be set to *timeout, latency, bandwidthdown, bandwidthup, network, group*, or *episode*.
The network value means the network configuration and/or conditions (such as conflicting network address translation \[NAT\]) prevented the QoS metrics from being measured.

The only possible value at the end of joining is *group*.
(On timeout from joining, the reservation is removed.)

If **memberInitialization** is set and the member was added with "initialize": true, this is set to the initialization episode that the member will participate in. A value of 1 is used for the members added to a new session at the time it is created, and it is removed when the initialization episode ends.
```json
"initializationEpisode": 1,
```


<a id="mts"></a>

## Match ticket session

When an MPSD session is being used as a match ticket session, some special session properties and constants are used.

**/members/{index}/constants/system**

```json
{

  {
  "xuid": "12345678",

  "initialize": "false", // Run initialization for this user (if "memberInitialization" is set). Defaults to false.

```

When the Matchmaking service adds users to a session, it provides some context around how and why they were matched into the session, in the **matchmakingResult** field.

```json
"matchmakingResult": {
```

This is a copy of a user's **serverMeasurements** from the matchmaking session.

```json
"serverMeasurements": {
    "east.thunderhead.azure.com": {
        "latency": 233  // Milliseconds
      }
    }
  }
}

```


<a id="qost"></a>

## Quality of Service (QoS) templates

For game session templates, values can be added that inform MPSD to coordinate with the network layer and console Social features.
The purpose of this coordination is to validate the quality of the connection state before a session is created and before a user is informed that the game is ready to join.

The following code excerpt is an example of a peer-to-host game session template with QoS:

```json
{
    "constants": {
        "system": {
            "version": 1,
            "maxMembersCount": 20,
            "visibility": "private",
            "capabilities": {
                "connectivity": true
            },
            "memberInitialization": {
                "joinTimeout": 20000,
                "externalEvaluation": false,
                "membersNeededToStart": 1
            },
            "peerToHostRequirements": {
                "latencyMaximum": 350,
                "bandwidthDownMinimum": 1000,
                "bandwidthUpMinimum": 100,
                "hostSelectionMetric": "latency"
            }
        },
        "custom": {}
    }
}
```

This code excerpt is an example of a peer-to-peer game session template with QoS:

```json
{
    "constants": {
        "system": {
            "version": 1,
            "maxMembersCount": 20,
            "visibility": "private",
            "capabilities": {
                "connectivity": true
            },
            "memberInitialization": {
                "joinTimeout": 20000,
                "externalEvaluation": false,
                "membersNeededToStart": 1
            },
            "peerToPeerRequirements": {
                "latencyMaximum": 250,
                "bandwidthMinimum": 10000
            }
        },
        "custom": {}
    }
}

```


### QoS session template attributes

If a **memberInitialization** object is set, the session expects the client system or title to perform initialization following session creation and/or as new members join the session.

The timeouts and initialization stages are automatically tracked by the session, including QoS measurements if any metrics are set.

These timeouts override the session's reservation and ready timeouts for members that have the **initializationEpisode** property set.

```json
"memberInitialization": {
"joinTimeout": 5000,  // Milliseconds. Unspecified counts as 10 seconds.
"measurementTimeout": 5000,  // Milliseconds. Unspecified counts as 30 seconds.
"evaluationTimeout": 5000,  // Milliseconds. Can only be set if 'externalEvaluation' is true. Unspecified counts as 5 seconds.
"externalEvaluation": true,
"membersNeededToStart": 2  // Unspecified counts as 1. Must be between 0 and maxMembersCount. Only applies to episode 1. If 0 and the session is created with no members to initialize, episode 1 is skipped.
},

```

A game session with QoS requires connectivity capability.
If no metrics are specified, they default to what would be needed to satisfy the QoS requirements.
If they are specified, they must be sufficient to satisfy the QoS requirements.

```json
"metrics": {
    "latency": true,
    "bandwidthDown": true,
    "bandwidthUp": true,
    "custom": true

```

The following thresholds apply to each pairwise connection for all members in a session:

```json
"peerToPeerRequirements": {
    "latencyMaximum": 250,  // Milliseconds
    "bandwidthMinimum": 10000  // Kilobits per second
},

```

The following thresholds apply to each connection from a host candidate:

```json
"peerToHostRequirements": {
    "latencyMaximum": 250,  // Milliseconds
    "bandwidthDownMinimum": 100000,  // Kilobits per second
    "bandwidthUpMinimum": 1000,  // Kilobits per second
    "hostSelectionMetric": "bandwidthup"  // Or "bandwidthdown" or "latency". Not specified is the same as "latency".
},

```

The following potential server connection strings should be evaluated (note that the connection strings must be lowercase):

```json
"measurementServerAddresses": {
        "east.thunderhead.azure.com": {
            "secureDeviceAddress": "r5Y="  // Base-64 encoded secure-device-address
        },
        "west.thunderhead.azure.com": {
            "secureDeviceAddress": "rwY="
        }
    }
}

```

**members/{index}/properties/system**

These flags control the member status and **activeTitle**, and they are mutually exclusive (it's an error to set both to **true**).
For each, **false** is the same as "not present." The default status is "inactive," that is, neither is present.

```json
"ready": true,
"active": false,

// Base-64 blob, or not present. Empty-string is the same as not present.
// 'capabilities/connectivity' must be enabled in order for this to be set.
"secureDeviceAddress": "ryY=",

// List of members in my group, by index. Each element must be an integer 0 <= n < 'membersInfo/next'.  
// During member initialization, if any members in the list fail, this member will also fail.
"group": [ 5 ],

// QoS measurements by lower-case device token.
// Like all fields, "measurements" must be updated as a whole. It should be set once when measurement is complete, not incrementally.
// Metrics can me omitted if they weren't successfully measured, i.e. the peer is unreachable.
// If a "measurements" object is set, it can't contain an entry for the member's own address.
"measurements": {
"e69c43a8": {
"latency": 5953,  // Milliseconds
"bandwidthDown": 19342,  // Kilobits per second
"bandwidthUp": 944,  // Kilobits per second
"custom": { }
     }
},

// QoS measurements by game-server connection string. Like all fields, "serverMeasurements" must be updated as a whole, so it should be set once when measurement is complete.
// If empty, it means that none of the measurements completed within the "serverMeasurementTimeout".
    "serverMeasurements": {
        "east.thunderhead.azure.com": {
            "latency": 233  // Milliseconds
        }
    },

// Subscriptions for shoulder taps on session changes. The 'profile' indicates which session changes to tap as well as other properties of the registration like the min time between taps.
// The subscription is named with a client-generated GUID that is also sent back with the tap as a context ID.
// Subscriptions can be added and removed individually, without affecting other subscriptions in the "subscriptions" object.
// To remove a subscription, set its context ID to null.
// (Like the "ready" and "active" flags, the "subscriptions" data is copied out and maintained internally, so the normal replace-all rule on system fields doesn't apply to "subscriptions".)
"subscriptions": {
"961dc162-3a8c-4982-b58b-0347ed086bc9": {
"profile": "party",  // Or "matchmaking", "initialization", "roster", "queueHost", or "queue"
"onBehalfOfTitleId": "3948320593",  // Optional decimal title ID of the registered channel.  If not set the title ID is taken from the token.
},
"709fef70-4638-4b94-905b-24cb02706eb5": null
}
}

```


<a id="qospasid"></a>

## QoS phase and session initialization details

MPSD will track and report QoS results for game creation after the template has completed member initialization.
The progress of this operation will be represented by an *initializing* object in the session document as described in the [Member initialization](#_Member_initialization_in) section above.

The *initializing* object has a *stage* attribute, which represents the current stage of initialization.
The stage progresses from *joining* to *measuring* to *evaluating*.

-   If initializing episode \#1 fails, then stage is set to *failed* and the session cannot be initialized. Otherwise, when an initialization episode completes, the "initializing" object is removed. If **externalEvaluation** is set to **false**, the evaluating stage is skipped. If neither **metrics** nor **measurementServerAddresses** is set, the measuring stage is skipped.

```json
"initializing": {
    "stage": "measuring",
    "stageStartTime": "2009-06-15T13:45:30.0900000Z",
    "episode": 1
},

```

-   Host candidates are device tokens listed in order of preference. They are set after the *measuring* stage of initialization episode \#1 if **peerToHostRequirements** is set and **/properties/system/host** is not set. They are cleared after a **/properties/system/host** object is set.

```json
"hostCandidates": [ "ab90a362", "99582e67" ],

"constants": { /* Property Bag */ },
"properties": { /* Property Bag */ },
"members": {
    "1": {
        "constants": { /* Property Bag */ },
        "properties": { /* Property Bag */ },

```

-   The *gamertag* attribute will only be set if the member has accepted and if a gamertag claim was found for that member.

```json
"gamertag": "stacy",
```

-   The *deviceToken* attribute is set when the member uploads a secure device address. It's a case-insensitive string that can be used for equality comparisons.

```json
"deviceToken": "9f4032ba7",
```

-   The *reserved* value is removed after the user executes his or her first PUT request to the session document. When players are reserved, that means that they have been invited to the game session but have neither accepted nor had their connections evaluated.

```json
"reserved": true,
```

-   If the member is active, *activeTitleId* is the title in which the member is active, in decimal.

```json
"activeTitleId": "8397267",
```

-   This attribute refers to the time that the user joined the session. If *reserved* is **true**, then *joinTime* will be the time at which the reservation was made.

```json
"joinTime": "2009-06-15T13:45:30.0900000Z",
```

-   Present if this member is in the properties/system/turn array, otherwise not.

```json
"turn": true,
```

-   The *initializationFailure* attribute is set on the member object when transitioning out of the joining or measuring stage if the member hasn't successfully passed the stage. In order of precedence, it could be set to *timeout*, *latency*, *bandwidthdown*, *bandwidthup*, *network*, *group*, or *episode*.
    The *network* value means that the network configuration and/or conditions (such as conflicting network address translations \[NATs\]) prevented the QoS metrics from being measured. The only possible value at the end of joining is *group*. (On timeout from joining, the reservation is removed.) The *episode* value is set after a failed "evaluation" stage on all members of the initialization episode that didn't fail during joining or measuring.

```json
"initializationFailure": "latency",
```

-   If **memberInitialization** is set and the member was added with "initialize": true, this is set to the initialization episode that the member will participate in. A value of 1 is used for the members added to a new session at create time. Removed when the initialization episode ends.

```json
"initializationEpisode": 1,
```

-   The *next* attribute represents the index value of the next member in the session. It will be the same value as the *next* attribute in the **membersInfo** object below if there are no more members to add.

```json
            "next": 4
        },
        "4": { "next": 5 /* etc */ }
    },
    "membersInfo": {
        "first": 1,  // The first member's index.
        "next": 5,  // The index that the next member added will get.
        "count": 2,  // The number of members.
        "accepted": 1  // The number of members that are no longer 'pending'.
    },
    "servers": {
        "name": {
            "constants": { /* Property Bag */ },
            "properties": { /* Property Bag */ }
        }
    }
}

```


<a id="xccs"></a>

## Xbox Cloud Compute session (deprecated)


An Xbox Cloud Compute session contains the ordered list of case-insensitive connection strings that the session could use to connect to a game server.
Generally, titles should use the first string on the list, but sophisticated titles could use a custom mechanism for choosing one of the others (for instance, based on load).

```json
    "serverConnectionStringCandidates": [ "west.thunderhead.azure.com", "east.thunderhead.azure.com" ],

    "matchmaking": {
        "clientResult": {  // Requires the clientMatchmaking property.
            "status": "searching",  // Or "expired", "found", "failed", or "canceled".
            "statusDetails": "Description",  // Default is empty string.
            "typicalWait": 30,  // The expected number of seconds waiting as a non-negative integer.
            "targetSessionRef": {
                "scid": "1ECFDB89-36EB-4E59-8901-11F7393689AE",
                "templateName": "capture-the-flag",
                "name": "2D58F65F-0E3C-4F1F-8277-2BC9873FDB23"
            }
        },

        "targetSessionConstants": { },

        // Force a specific connection string to be used (useful in preserveSession=always cases).
        "serverConnectionString": "west.thunderhead.azure.com",

        // True if the match that was found didn't work out and needs to be resubmitted. Set to false
        // to signal that the match did work, and the matchmaking service can release the session.
        "resubmit": true
    }
}

```

**/servers/{server-name}/properties/system **

```json
{
    "lockId": "opaque56789",  // If set, a matchmaking service is servicing this session.
    "status": "searching",  // Or "expired", "found", "failed", or "canceled". Optional.
    "statusDetails": "Description",  // Optional free-form text. Default is empty string.
    "typicalWait": 30,  // Optional. The expected number of seconds waiting as a non-negative integer.
    "targetSessionRef": {  // Optional.
        "scid": "1ECFDB89-36EB-4E59-8901-11F7393689AE",
        "templateName": "capture-the-flag",
        "name": "2D58F65F-0E3C-4F1F-8277-2BC9873FDB23"
    }
}

```


<a id="rsactp"></a>

## Raw session and custom title properties

A session can be used to store custom housekeeping information (metadata) around a multiplayer game.
Game data or saved information should be stored in TMS++.


### Property bags

Each of the above objects marked as a property bag consists of two optional inner objects, system and custom.

The custom objects can contain any JSON.

```json
"custom": {
    "myField1": true,
    "myField2": "string",
    "myField3": 5.5,
    "myField4": { "myObject": null },
    "myField5": [ "my", "array" ]
}

```


<a id="actmemdec"></a>

## Active member decay

Active members are automatically marked inactive when MPSD detects that the user is no longer engaged in the title.
This can happen, for example, if the Presence times out the user record.

This mechanism is just a backstop; that is,titles are still required to proactively mark members as inactive (or remove them from the session) when the members leave or switch away from the title, sign out, or otherwise become disengaged.


<a id="fat"></a>

## FAQ and troubleshooting


### How do I call MPSD?

Using certificate authentication: client-sessiondirectory.xboxlive.com

Example:

``` uri
PUT https://client-sessiondirectory-stress.xboxlive.com/serviceconfigs/8cvda84-2606-4bab-8eda-d12313e65143/sessiontemplates/teamDeathmatch/sessions/3baafc35-816d-49cd-9656-5772506c988a
```

Using XToken authentication: sessiondirectory.xboxlive.com

Example:

``` uri
PUT https://sessiondirectory-stress.xboxlive.com/serviceconfigs/8cvda84-2606-4bab-8eda-d12313e65143/sessiontemplates/teamDeathmatch/sessions/3baafc35-816d-49cd-9656-5772506c988a
```


### How do I find out what SCID, session template, and sandbox to use?

This information can be found on Partner Center for your title.
If you do not yet have access to Partner Center, contact your developer account manager, who can assist in getting the information for you.


### Is there an example of a request body that I can compare my own to?


### I am getting a 404 error when calling MPSD.

Collect Fiddler traces to help get more information and then do the following:

1.  Check the message returned as part of the HttpResponse body for common 404 messages:

    -   *The requested service config is either invalid or not configured for sessions*. Verify that the SCID being used is correct.

    -   *The requested session wasn't found*. Verify that the session is created and the session template is correct before retrieving it. You can create a session with a PUT call.

2.  Check the URI you are using.

3.  Reboot the console and/or try again with a new user.




### I am getting a 403 error when calling MPSD.

This is usually a permissions or scope issue.
Collect Fiddler traces to help get more information and then do the following:

1.  Check messages returned as part of the HttpResponse body for common 403 messages:

-   *The requested service config cannot be accessed. *

    -   Verify that you are using an account that has access to the sandbox.

    -   Verify that you are within the correct sandbox.

    -   If you are using certificate authentication and getting this error, contact your DAM.

-   *The requested session cannot be accessed. Private Sessions can only be read by members of the session.*

    -   You are trying to access a session that has a visibility of "private." Only members within the session can read the session document.

-   *The request body can't contain existing member references unless the authentication principal includes a server.*

    -   You cannot join another user to a session on behalf of a user. You can only invite. Set the index to "reserve\_&lt;number&gt;" to invite a player.


### I am getting a 412 Precondition Failed error.

This will return 412 Precondition Failed if the session already exists:

```http
> PUT /serviceconfigs/00000000-0000-0000-0000-000000000000/sessiontemplates/quick/sessions/foo HTTP/1.1
> Content-Type: application/json
> If-None-Match: \*
```


This will return 412 Precondition Failed if the session etag doesn't match the If-Match header:

```http
> PUT /serviceconfigs/00000000-0000-0000-0000-000000000000/sessiontemplates/quick/sessions/foo HTTP/1.1
> Content-Type: application/json
> If--Match: 9555A7DE-8B91-40E4-8CFB-0629312C9C7D
```


### I am getting errors such as 405, 409, 503, and 400 when calling MPSD.

Collect Fiddler traces to help get more information and then check the messages returned as part of the HttpResponse body.


You can also get the response body if you are using the Xbox Live Service APIs by setting the [HCSettingsSetTraceLevel](../../../../reference/live/httpclient/trace/functions/hcsettingssettracelevel.md) property to [HCTraceLevel](../../../../reference/live/httpclient/trace/enums/hctracelevel.md)::Information, which will output the information in the debug output if [HCTraceSetTraceToDebugger](../../../../reference/live/httpclient/trace/functions/hctracesettracetodebugger.md) is set, or you can use [HCTraceSetClientCallback](../../../../reference/live/httpclient/trace/functions/hctracesetclientcallback.md) to get an callback where you can add the trace log to your game's own trace logging.  You can also use [XblAddServiceCallRoutedHandler](../../../../reference/live/xsapi-c/xbox_live_global_c/functions/xbladdservicecallroutedhandler.md) to get called for each service call which you can route to your own logging.


### What can or should I change in the templates for my title?

Session templates are not defaults, but are more of a mold.
However, you cannot override the constants already set in the templates, although you can add to them.


### I'm getting an error that is saying my session isn't initialized.

When member initialization is present in your template (game, party, and match ticket scenarios, usually), you need to make sure that "initialize=true" is set for enough of the member reservations (members needed to start) to pass QoS to fix this issue.


### My session is not being created and I'm getting an HTTP 204 error.

This indicates that there were no users added to the session when you created it.
If there are no users for a session at the time of creation, the session will not be created.

Make sure that you add at least one player to a session on creation.

For dedicated server scenarios, obtain a player who is trying to create a match, or who needs to create a match, and make that user the initial player in that match.
Alternatively you can change or remove the **sessionEmptyTimeout**.


### When should I poll the MPSD?

You should avoid polling MPSD sessions.
At a high level, you can do this by designing your code in a way that utilizes the MPSD session only for initial establishment of network connectivity for each client, and for reestablishing network state for a client or clients that have lost connectivity.

It's also important to take advantage of MPSD's etag-based synchronization primitives to eliminate the need to refresh session state to resolve race conditions.

A common application of these principles is when you have a set of N clients that all need to connect together and play in a peer-to-peer mesh.
Rather than regularly querying the session for new members, each member can join the session, connect to the members already in the session, and assume that any later joiners will do the same.
See the Chat and Player Rendezvous samples for examples of how to implement this.

There are some rare cases where polling may be necessary for brief periods; contact your developer account manager if you believe you need to do this.