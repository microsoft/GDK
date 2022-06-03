---
title: Service-to-service multiplayer session management
description: Describes how to use service-to-service (S2S) calling patterns with Multiplayer Session Directory (MPSD).
kindex: Service-to-service multiplayer session management
author: joannaleecy
ms.author: migreen
ms.topic: conceptual
ms.date: 05/21/2019
keywords: xbox live, xbox, games, multiplayer, service-to-service, s2s
ms.localizationpriority: medium
edited: 00/00/0000
security: public
---

# Service-to-service multiplayer session management

This topic describes how to use service-to-service (S2S) calling patterns with Multiplayer Session Directory (MPSD).

Like other services, MPSD supports S2S calling patterns. They extend the client calling patterns and allow title services to efficiently manage multiple users through single service calls.

Management of multiplayer sessions through a title service, instead of clients, can simplify error-handling logic and avoid race conditions for session write operations. This specifically applies to large session types with large session membership. Therefore, it's best practice for massively multiplayer online games (MMOs) and titles with many players in a session to manage MPSD sessions through the title server.

For general information about RESTful MPSD calling patterns, see [Xbox Live Services RESTful Reference](/gaming/xbox-live/api-ref/xbox-live-rest/atoc-xboxlivews-reference).


## MPSD S2S authentication

Authentication for S2S calls to the Xbox Live Multiplayer service varies from other Xbox Live services. Calls with a `Delegation` token aren't supported, and only calls with service authentication are functional. This authentication type enables the additional MPSD S2S functionality.

As for other S2S calls, a Business Partner Certificate is required. A full-access `Multiplayer.Manage` policy must be in place. This is required so that the web service that the Business Partner Certificate was created under can provide the correct access level for S2S calls.

The following authentication flow is used for service authentication.

1. Call Xbox Authorization Service for Services with the Business Partner Certificate to retrieve an `S` token.

1. Call Xbox Secure Token Service (XSTS) with this `S` token and a `SandboxId` to receive an `X` token. A `Delegation` token or `User` token must not be used in this step. The `SandboxId`, specified through this flow, must also be in the set of sandboxes that you specified during the creation of the Business Partner Certificate. Business Partner Certificates without a specific sandbox aren't supported and cause authentication errors that indicate a missing sandbox.

1. Call the MPSD service with the `X` token and headers (as specified in the next section).



## MPSD S2S headers


### Title header

To act as the correct title, the `X-Xbl-OnBehalfOf-Title` header is required in the following format.

```json
X-Xbl-OnBehalfOf-Title:[titleid in decimal]
```

#### Example

```json
Request.Headers["X-Xbl-OnBehalfOf-Title"] = "484921321";
```

This header must be specified to make calls for a particular title.


### User header

To act as a specific user or set of users, the `X-Xbl-OnBehalfOf-Users` header is required in the following format.

```json
X-Xbl-OnBehalfOf-Users:[xuid][;privilege][,xuid[;privilege]]...
```

#### Example

```json
Request.Headers["X-Xbl-OnBehalfOf-Users"] = "741837829132;priv=multiplayer","8922333146718;priv=multiplayer"
```

The only privilege that's currently supported is `priv=multiplayer`. It indicates that the user has the multiplayer privilege.

When using the `X-Xbl-OnBehalfOf-Users` header, it's as though the user who's identified in the header is making the call directly from their console. As a result, the calling service is required to maintain the user's security.

* Only real XUIDs can be used.
* The privileges declared for the user must be correct.
* The user must have consented to any action that was taken on their behalf.

The last requirement means that the service is permitted to take actions that only the console title itself could have taken.

For example, a service can set a user as active in a title only if the user is, in fact, running and interacting with that title on the console. The service must then set the user to inactive when they're no longer interacting with the title on the console. Similarly, a service can send an invite on behalf of a user only if they've taken an explicit action to send the invite.


### Deny-Scope header

The `Multiplayer.Manage` access policy overrides user access permissions for S2S calls to the MPSD service. Any session access is therefore not restricted based on user permissions. To reenable user permission checks, you can use the `X-Xbl-Deny-Scope` header, shown as follows.

```json
    X-Xbl-Deny-Scope: Multiplayer.Manage
```

#### Example

```json
    Request.Headers["X-Xbl-Deny-Scope"] = "Multiplayer.Manage";
```

This header ensures that the `Multiplayer.Manage` access policy isn't used as an override when checking a user's access (from the user header) to a session. It can be used to ensure that a user has the correct access to a session and that the server access isn't overriding any other blocks because of visibility or join restrictions.
> [!NOTE]
> When you set this header, you must also grant `Multiplayer.Runtime` access for the web service as a fallback. This allows access, even when user permissions are denied. Otherwise, no service access is granted in an error scenario, and a 403 status is returned. `Multiplayer.Runtime` access requires an acting user. The `X-Xbl-Deny-Scope` header only works together with `X-Xbl-OnBehalfOf-Users` or a user claim that was obtained from a `DelegationToken` claim.


### Session member management

You can optimize session member management for S2S calls by addressing multiple users in one call.

When you specify the user header, the standard "me" member in a session document body can't be used. Instead, the following options are available.

```json
{
    "members": {

        // (For example, me_59135345328) Requires a user principal with an xuid claim.
        "me_{xuid}": {
            "constants": { /* Property Bag */ },
            "properties": { /* Property Bag */ },
        },

        // Applies the requested change to each acting user's member.
        "me_all": {
            "constants": { /* Property Bag */ },
            "properties": { /* Property Bag */ },
        },

        // Applies the requested change to each acting user's member if they're 
        // already in the session.
        "me_allInSession": {
            "constants": { /* Property Bag */ },
            "properties": { /* Property Bag */ },

        // Requires a single user principal with an xuid claim.
        "me": {
            "constants": { /* Property Bag */ },
            "properties": { /* Property Bag */ },
        },

        }
    }
}
```

Title services should use these patterns to perform operations on multiple users (for example, adding or removing players) through a single MPSD call.


### Adding session members

You can add or modify session members by using one of the previously mentioned patterns. Generally, the minimum operation to add a player is by setting a property or constant, typically the member's active status property.
> [!NOTE]
> Members that aren't set to active are automatically removed by the service that's dependent on the `InactiveTimeout` value for the MPSD session.

You should set other required properties and constants for the user through the same call (as needed).

```json
{
    "members": {

        "me_{xuid}": {
            "constants": { /* Property Bag */ },
            "properties": { "system": { "active": true } 
                            /* Additional Properties */ },
        }
    }
}
```

#### Example

```json
{
     // Adding two session members with one call.
    "members": {

        "me_1234567890123456": {
            "properties": { "system": { "active": true }},
        },

        "me_2345678901234567": {
            "properties": { "system": { "active": true }},        
        } 
    }
}
```


### Removing session members

You can remove session members by setting the member section to `null`.
```json
{
    "members": {

        "me_{xuid}": {
            null,
        }
    }
}
```

#### Example

```json
{
     // Removing two session members with one call.
    "members": {

        "me_1234567890123456": {
            null,
        },

        "me_2345678901234567": {
            null,
        } 
    }
}
```


### Member reservations

In general, reservations for session members aren't needed if all session management is performed by the title service. In this scenario, you can add and remove session members directly without needing reservations. Reservations for session members should only be used if created sessions are then also managed by the client.

You can add reservations to the session for multiple users in the user order that's specified in the `on-behalf-of-user` header. The following pattern is only valid when you create a new session.

```json
{
    "members": {

        // Reservation requests must start with zero.
        "reserve_0": {
            "constants": { "system": {"xuid": "{xuid}" }
                           /* additional constants */ }
        },

        "reserve_1": {
            "constants": { "system": {"xuid": "{xuid}" }
                           /* additional constants */ }
        },

        //...//

    }
}
```

#### Example

```json
{
     // Adding reservations for two session members with one call.
    "members": {

        "reserve_0": {
            "constants": { "system": {"xuid": "1234567890123456" }}
        },

        "reserve_1": {
            "constants": { "system": {"xuid": "2345678901234567" }}
        },
    }
}
```
> [!NOTE]
> Reservations aren't supported by large sessions. Mixing reservations and adding or removing session members isn't supported.


### Session member state

A title service can track and set the state of a session member through system properties. This allows full control of member state and information.


### Member active status

The active status of a member is marking the player active in the session. This prevents removal through the system as defined in the `inactiveRemovalTimeout` session configuration, shown as follows.

```json
{
    "members": {

        // Member access through XUID.
        "me_{xuid}": {
            "properties": { "system": {"active": [true|false] }
                           /* additional constants */ }
        }
    }
}
```

In general, you should always set session members to `active` when they're added to the session. You should only use inactive members in flows where session members should temporarily remain in the session, even if they're disconnected. For S2S flows, this can also be managed directly in the title server.


### Member reserve status

You can determine the reservation status of a session member through the `reserved member` property. If this property is set to `true`, the session member is in a reserved state and not yet active in the session.

The following is an example session document.

```json
{
    /.../

    "members": {

        // First session member as an example.
        "1": {
            "constants": { /* Property Bag */ },
            "properties": { /* Property Bag */ },

            /.../

            "reserved": true,
            /.../
        }
    }
}
```

These members are removed from the session by MPSD after `reservedRemovalTimeout` expires.


## Large session limitations

MPSD sessions with the large capability enabled support more than 100 players. These sessions function differently than regular sessions. For more information, see [Enable large sessions for Multiplayer](../../../multiplayer/mpsd/concepts/live-large-sessions.md).

Operations to large sessions are always carried out as a single user. As a result, S2S calls to large sessions must only include a single user in the `X-Xbl-OnBehalfOf-Users` header. Multiple user operations aren't supported. You must add or remove users through individual calls for each user. Sequentially perform these S2S calls to avoid lock congestion on the underlying session document. Parallel operations to the same document result in longer call times and don't speed up the total operation time.

S2S call results also don't provide access to the full member list of a large session. Only the member data is returned for the user who's specified in the call.

As a result, title services should track the user information for members of large sessions in their own logic and use the MPSD membership to correctly support Xbox Requirements (XRs).


### Encounters and Groups

Sessions with the large capabilities don't automatically update the recent player list. Instead, other players are added directly to the recent player list through Encounters and Groups. For more details, see [Enable large sessions for Multiplayer](../../../multiplayer/mpsd/concepts/live-large-sessions.md).

Use the following pattern for flagging session members as part of an encounter.

```json
{
    "members": {

        "me_{xuid}": {
            "properties": { 
                "system": { 
                    "encounters": [ "{uniqueEncounterID1}", 
                                    "{uniqueEncounterID2}",
                                    // ... //
                                  ] },
        }
    }
}
```

#### Example

```json
{
     // Marking two members as part of the same encounter.
    "members": {

        "me_1234567890123456": {
            "properties": {
                "system": {
                    "encounters": [ "757093D8-E41F-49D0-BB13-17A49B20C6B9" ] }},
        },

        "me_2345678901234567": {
            "properties": {
                "system": {
                    "encounters": [ "757093D8-E41F-49D0-BB13-17A49B20C6B9" ] }},
        },
    }
}
```
> [!NOTE]
> To correctly capture an encounter, the `encounters` property must be written to all participating session members in under 30 seconds. The set of encounters is a point-in-time property. It's immediately consumed and isn't visible in a response.

Use the following pattern for flagging session members as part of a group.

```json
{
    "members": {

        "me_{xuid}": {
            "properties": { 
                "system": { 
                    "groups": [ "{uniqueGroupID1}", 
                                "{uniqueGroupID2}",
                                // ... //
                              ] },
        }
    }
}
```

#### Example

```json
{
     // Marking two members as part of the same group.
    "members": {

        "me_1234567890123456": {
            "properties": { 
                "system": { 
                    "groups": [ "group-ADFB431" ] }},
        },

        "me_2345678901234567": {
            "properties": { 
                "system": { 
                    "groups": [ "group-ADFB431" ] }},
        },
    }
}
```

The list of groups is replaced with every write operation. To remove a member from a group, remove the group from the `groups` property list. A write operation with an empty list removes all group memberships.
> [!NOTE]
> The `groups` property is persistent and is visible in responses for a member.


### Activity session management

The MPSD activity handle of a user determines which session is used for platform invites and join-in-progress. This handle can't be set through S2S calls and is only available through client APIs. A title server can share the session name with a client to enable activity handle creation for an S2S session.

For more information about handles, see the following:
* The [Session handles](../../../multiplayer/concepts/live-multiplayer-concepts.md#session-handles) section in the Multiplayer concepts overview topic
* The [MPSD handles to sessions](../../../multiplayer/mpsd/live-mpsd-overview.md#mpsd-handles-to-sessions) section in the Multiplayer Session Directory overview topic

For direct control of player activity, see [Multiplayer Activity Service (MPA)](../../../multiplayer/mpa/live-mpa-overview.md). Note that MPA and MPSD can't be used at the same time.
## Best practices

When performing MPSD S2S calls, titles should adhere to the following best practices to avoid issues and improve performance.

* **Merge operations for multiple users**  
  Whenever possible, S2S calls to MPSD should be performed as batch operations for multiple users. This improves performance and reduces network traffic. An efficient approach to reduce calls is to queue MPSD operations on the title server and merge all requests in five-second intervals. This provides a balance between efficiency and latency.

* **Merge multiple session and member operations**  
  Titles should be sure to merge user operations as much as possible. Adding session members should always be combined with setting all relevant member properties at the same time.

* **Sequentially perform S2S calls to the same document**  
  All calls to the same MPSD document should always be sequentially performed. Performing parallel operations can cause lock congestion of the underling MPSD document and result in slower performance and failed requests.

* **Respond to handle activity operations on the client**  
  MPSD activity handles are only supported through client APIs. A title service must use a client to create these handles by sharing the session name and using the relevant client APIs.

* **Client session subscriptions and connectivity aren't required**  
  For all MPSD sessions that are fully managed through S2S calls, the connectivity capability isn't required. For S2S call flows, WebSocket connections with the client aren't needed. Instead, the title service should fully handle directly adding or removing session members.

* **Large session operations**  
  S2S logic for large sessions must be handled differently than for small sessions because operations with multiple members aren't available. Title services should sequentially perform all operations to the same session document, including adding or removing members. For large numbers of members, this can result in delays of the member operation. Such delays are acceptable and don't violate platform requirements.

  To simplify member logic for large sessions, a title can use the MPSD session to only track player membership and internally handle all other player data.  

  It's simplest to create the large MPSD session for a title server upon server startup, even without any players in it. This requires the configuration of `sessionEmptyTimeout` in the MPSD session constants as shown in the following examples.

* **Large session join-in-progress or invites**  
  Large sessions support join-in-progress and invites through Xbox Live. For most scenarios, it's simpler to use a regular session to support this functionality. This session can be controlled either by the title server or by the client and should contain information to join the relevant large session.

* **Large session encounters**  
  To ensure that encounters in large sessions are captured correctly, all `encounters` member properties should be written in under 30 seconds. A title service should always attempt to batch updates to the `encounters` property for all participating members into a single service call. Encounters must use a unique identifier. We recommend using a GUID.


## Example S2S session template

The following session template is a starting point for a session that's controlled through S2S calls.

```json
{
   "constants": {
        "system": {
            "version": 1,
            // Should be set to the maximum supported player number on the server.
            "maxMembersCount": 50,
            "visibility": "open",
            "inviteProtocol": "game",
            "capabilities": {
                "gameplay": true
            },
            // Optional: allows the session to linger for 60 minutes when it's empty.
            "sessionEmptyTimeout": 3600
        },
        "custom": {}
    }
}
```


## Example S2S large session template

The following session template is a starting point for a large session with S2S call flow.

```json
{
   "constants": {
        "system": {
            "version": 1,
            // Should be set to the maximum supported player number on the server.
            "maxMembersCount": 5000,
            "visibility": "open",
            "capabilities": {
                "large": true,
                "gameplay": true
            },
            // Optional: allows the session to linger for 60 minutes when it's empty.
            "sessionEmptyTimeout": 3600
        },
        "custom": {}
    }
}
```

## See also

[Xbox Live Services RESTful Reference](/gaming/xbox-live/api-ref/xbox-live-rest/atoc-xboxlivews-reference)  

[Title service calls to Xbox Live services (NDA topic)](../live-title-service-calls-xbox-live.md)  
