---
title: Session template constants
description: Describes system constants that are defined in multiplayer session templates, defining settings for a multiplayer session.
kindex: Session template constants
author: joannaleecy
ms.author: migreen
ms.topic: conceptual
ms.assetid: d51b2f12-1c56-4261-8692-8f73459dc462
ms.localizationpriority: medium
ms.date: 04/04/2017
edited: 00/00/0000
security: public
---

<a id="top"></a>

# Session template constants

This topic describes the predefined elements of a multiplayer session template, based on the session template version 107. These elements define settings for a multiplayer session.

**Contents**

* [system](#system)
* [capabilities](#capabilities)
* [metrics](#metrics)
* [memberInitialization](#memberinitialization)
* [peerToPeerRequirements](#peertopeerrequirements)
* [peerToHostRequirements](#peertohostrequirements)
* [measurementServerAddresses](#measurementserveraddresses)
* [cloudComputePackage (deprecated)](#cloudcomputepackage)
* [arbitration (deprecated)](#arbitration)
* [broadcastViewerTitleIds](#broadcastviewertitleids)
* [ownershipPolicies](#ownershippolicies)

<a id="system"></a>

## system

System constant | Description | Valid values | Default value
-- | -- | -- | --
`version` | The version of the session template. | 1 - n | none
`maxMembersCount` | The number of total session member slots supported for the multiplayer activity. | 1 - 100 for a normal session, 101+ for a large session | 100
`visibility` | The visibility state of the session, which indicates if other users can see or join the session. | "private", "visible", "open" | "open"
`inviteProtocol` | Setting this constant to "game" enables invitees to receive notification when they're invited to the session. | "game", "tournamentgame", "chat", "gameparty" | none
`reservedRemovalTimeout`  | The time-out for a member reservation, in milliseconds. A value of 0 indicates an immediate time-out. A value of `null` is considered infinite. | 0 - n, `null` | 30000
`inactiveRemovalTimeout`  | The time-out for a member to be considered inactive, in milliseconds. A value of 0 indicates an immediate time-out. A value of `null` is considered infinite. | 0 - n, `null` | 0
`readyRemovalTimeout` | The time-out for a member to be considered ready, in milliseconds. A value of 0 indicates an immediate time-out. A value of `null` is considered infinite. | 0 - n, `null` | 180000
`sessionEmptyTimeout` | The time-out for an empty session, in milliseconds. A value of 0 indicates an immediate time-out. A value of `null` is considered infinite. | 0 - n, `null` | 0
`capabilities` | Specifies the capabilities of the session. For more information, see the [capabilities](#capabilities) section later in this topic. | Not applicable | Not applicable
`metrics` | Specifies a set of title-defined Quality of Service (QoS) requirements, such as latency and bandwidth speed, that members in the session must satisfy. For more information, see the [metrics](#metrics) section later in this topic. | Not applicable | Not applicable
`memberInitialization` | Specifies the time-outs and initialization requirements that are enforced when new members join the session. For more information, see the [`memberInitialization`](#memberinitialization) section later in this topic. | Not applicable | Not applicable
`peerToPeerRequirements` | Specifies the network QoS requirements for peer-to-peer mesh connections. For more information, see the [peerToPeerRequirements](#peertopeerrequirements) section later in this topic. |Not applicable | Not applicable
`peerToHostRequirements` | Specifies the network QoS requirements for peer-to-host connections. For more information, see the [peerToHostRequirements](#peertohostrequirements) section later in this topic. | Not applicable | Not applicable
`measurementServerAddresses` | Specifies a collection of potential datacenters that are used to determine QoS measurements. For more information, see the [measurementServerAddresses](#measurementserveraddresses) section later in this topic. | Not applicable | Not applicable
`cloudComputePackage` (deprecated)| Specifies the properties of the Xbox Live Compute cloud package to allocate. For more information, see the [cloudComputePackage](#cloudcomputepackage) section later in this topic. | Not applicable | Not applicable
`arbitration` (deprecated) | Specifies the time-outs for members to submit arbitration results in tournaments. For more information, see the [arbitration (deprecated)](#arbitration) section later in this topic. | Not applicable | Not applicable
`broadcastViewerTitleIds` | Specifies a list of title IDs that should always have read access to the session. For more information, see the [broadcastViewerTitleIds](#broadcastviewertitleids) section later in this topic. | Not applicable | Not applicable
`ownershipPolicies` | Specifies the policies relating to session ownership. For more information, see the [ownershipPolicies](#ownershippolicies) section later in this topic. | Not applicable | Not applicable

 [Return to the top of this topic.](#top)
<a id="capabilities"></a>

## capabilities

Capabilities are Boolean values that are optionally set in the session template.
If no capabilities are needed, an empty `capabilities` property should be set in the template to prevent capabilities from being specified on session creation, unless the title needs dynamic session capabilities.

Capability |  Description | Valid values | Default value
-- | -- | -- | -- |
`connectivity` | Indicates if the session supports peer connectivity. If this value is `false`, the session can't enable any metrics and the session members can't set `secureDeviceAddress`. This capability can't be set on large sessions. | `true`, `false` | `false`
`suppressPresenceActivityCheck` | If `true`, turns off presence checks. | `true`, `false` | `false`
`gameplay` | Indicates whether the session represents actual gameplay, as opposed to setup or menu time such as a lobby or matchmaking. If `true`, the session is in gameplay mode. | `true`, `false` | `false`
`large` | Indicates if the session is a large session (more than 100 members). Large sessions aren't supported for use with Multiplayer Manager. | `true`, `false` | `false`
`connectionRequiredForActiveMembers` | Indicates if a connection is required for a member to be active. | `true`, `false` | `false`
`cloudCompute` (deprecated) | Enables clients to request that a cloud compute instance be allocated on behalf of the session. Deprecated because Xbox Live Compute is no longer available as a service. | `true`, `false` | `false`
`autoPopulateServerCandidates` | Automatically calculate and set `serverConnectionStringCandidates` from `serverMeasurements`. This capability can't be set on large sessions. | `true`, `false` | `false`
`userAuthorizationStyle` | Indicates if the session supports calls from platforms without strong title identity. This capability can't be set on large sessions.<br>Setting the `userAuthorizationStyle` capability to `true` causes the session defaults for `readRestriction` and `joinRestriction` to `local` instead of `none`. This means that titles must use search handles or transfer handles to join a game session. | `true`, `false` | `false`
`crossPlay` | Indicates that the session supports crossplay between Windows PC and Xbox One (or later) devices. | `true`, `false` | `false`
`broadcast` | Indicates that the session represents a broadcast. The name of the session must be the xuid of the broadcaster. Requires the `large` capability. | `true`, `false` | `false`
`team` | Indicates that the session represents a tournament team. This capability can't be set on `large` or `gameplay` sessions. | `true`, `false` | `false`
`arbitration` | Indicates that the session must be created by a service principal that adds the `arbitration` server entry. Requires `gameplay` but can't be set on `large` sessions. | `true`, `false` | `false`
`hasOwners` | Indicates that the session has a security policy based on certain members being owners. | `true`, `false` | `false`
`searchable` | Indicates that the session can be a target session of a search handle. If the `userAuthorizationStyle` and `searchable` capabilities are set, `hasOwners` must also be set. | `true`, `false` | `false`

#### Example: capabilities

```json
"capabilities": {
    "connectivity": true,  
    "suppressPresenceActivityCheck": true,
    "gameplay": true,
    "large": true,
    "connectionRequiredForActiveMembers": true,
    "cloudCompute": true,
    "autoPopulateServerCandidates": true,
    "userAuthorizationStyle": true,
    "crossPlay": true,  
    "broadcast": true,  
    "team": true,
    "arbitration": true,
    "hasOwners": true,
    "searchable": true  
},
```
 [Return to the top of this topic.](#top)
<a id="metrics"></a>

## metrics

If the `metrics` properties aren't specified, they default to the values that are needed to satisfy the QoS requirements.

If the `metrics` properties are specified, the values must be sufficient to satisfy the QoS requirements.

This element is only valid if the session has the `connectivity` capability set.

Metric | Description | Valid values | Default value
-- | -- | -- | --
`latency` | Indicates if `latencyMaximum` is specified in the session template | `true`, `false` | See this description.
`bandwidthDown` | Indicates if `bandwidthDownMinimum` is specified in the session template | `true`, `false` | See this description.
`bandwidthUp` | Indicates if `bandwidthUpMinimum` is specified in the session template | `true`, `false` | See this description.
`custom` | Indicates if custom metrics are specified in the session template | `true`, `false` | See this description.

#### Example: metrics

```json
"metrics": {
    "latency": true,
    "bandwidthDown": true,
    "bandwidthUp": true,
    "custom": true
},
```
 [Return to the top of this topic.](#top)
<a id="memberinitialization"></a>

## memberInitialization

If the `memberInitialization` property is set, the session expects the client system or title to perform initialization following session creation or as new members join the session.

The time-outs and initialization stages are automatically tracked by the session, including QoS measurements if any metrics are set.
These time-outs override the session's reservation and ready time-outs for members that have `initializationEpisode` set.

`memberInitialization` can't be specified on large sessions.

Element | Description | Valid values | Default value
-- | -- | -- | --
`joinTimeout` | Indicates the number of milliseconds that a member has to join the session. Reservations of users who fail to join are removed.<br>**NOTE:** The default duration is sufficient for normal title execution, but it might lead to join time-outs if a title is being debugged during the Multiplayer Session Directory (MPSD) flow. While debugging, override and increase this default value for the session.| 0 - n | 10000
`measurementTimeout` | Indicates the number of milliseconds that a session member has to upload measurements. A member that fails to upload measurements is marked with a failure reason of "timeout".  | 0 - n | 30000
`evaluationTimeout` | Indicates the number of milliseconds that an external evaluation has to upload measurements. | 0 - n | 5000
`externalEvaluation` | If `true`, indicates that the title code performs the evaluation of who can join based on QoS measurements. The multiplayer service doesn't perform any QoS logic, and the title is responsible for advancing the initialization stage. Titles don't typically need this. | `true`, `false` | `false`
`membersNeededToStart` | The number of members needed to start the session only for initialization episode zero. | 1 - `maxMembersCount` | 1

#### Example: memberInitialization
```json
"memberInitialization": {
    "joinTimeout": 10000,
    "measurementTimeout": 30000,
    "evaluationTimeout": 5000,
    "externalEvaluation": false,
    "membersNeededToStart": 1
},
```
 [Return to the top of this topic.](#top)
<a id="peertopeerrequirements"></a>

## peerToPeerRequirements

Peer-to-peer network requirements | Description | Default value
-- | -- |--
`latencyMaximum` | The maximum latency, in milliseconds, between any two clients | 250
`bandwidthMinimum` | The minimum bandwidth, in kilobits per second, between any two clients | 10000

#### Example: peerToPeerRequirements

```json
"peerToPeerRequirements": {
    "latencyMaximum": 250,
    "bandwidthMinimum": 10000
},
```
 [Return to the top of this topic.](#top)
<a id="peertohostrequirements"></a>

## peerToHostRequirements

Peer-to-host network requirements | Description | Valid values | Default value
-- | -- | -- | --
`latencyMaximum` | The maximum latency, in milliseconds, for the peer to host connection | | 250
`bandwidthDownMinimum` | The minimum bandwidth, in kilobits per second, for information sent from the host to the peer | | 100000
`bandwidthUpMinimum` | The minimum bandwidth, in kilobits per second, for information sent from the peer to the host | | 1000
`hostSelectionMetric` | Indicates which metric is used to select the host | "bandwidthup", "bandwidthdown", "bandwidth", and "latency" | "latency"

#### Example: peerToHostRequirements
```json
"peerToHostRequirements": {
    "latencyMaximum": 250,
    "bandwidthDownMinimum": 100000,
    "bandwidthUpMinimum": 1000,
    "hostSelectionMetric": "bandwidthup"
},
```
[Return to the top of this topic.](#top)
 <a id="measurementserveraddresses"></a>

## measurementServerAddresses

The set of potential server connection strings that should be evaluated.
The connection strings must be lowercase.
`measurementServerAddresses` can't be specified on large sessions.

The connection strings are defined in the following format.

`"<server name>": { "secureDeviceAddress": <device address> }`

where the device address is the base-64&ndash;encoded secure device address of the server.

#### Example: measurementServerAddresses
```json
"measurementServerAddresses": {
    "server farm a": {
        "secureDeviceAddress": "r5Y="
    },
    "datacenter b": {
        "secureDeviceAddress": "rwY="
    }
},
```
 [Return to the top of this topic.](#top)
<a id="cloudcomputepackage"></a>

## cloudComputePackage (deprecated)

This property is deprecated because the Xbox Live Compute service is no longer available and has been discontinued.
Specifies the properties of the cloud compute package to allocate.

Requires that the `cloudCompute` capability is set.

Property | Description
-- | --
`titleId` | Indicates the title ID of the cloud compute package to allocate
`gsiSet` | Indicates the Global Security Infrastructure (GSI) set of the cloud compute package to allocate
`variant` | Indicates the variant of the cloud compute package to allocate

#### Example: cloudComputePackage
```json
"cloudComputePackage": {
    "titleId": "4567",
    "gsiSet": "128ce92a-45d0-4319-8a7e-bd8e940114ec",
    "variant": "30ebca60-d96e-4629-930b-6957aa6bfbfa"
},
```
 [Return to the top of this topic.](#top)
<a id="arbitration"></a>

## arbitration (deprecated)

This property is deprecated because the Xbox Live Compute service is no longer available and has been discontinued.
Specifies the time-outs for the arbitration process.

Requires that the `arbitration` capability is set.

The arbitration start time is defined in a session in the */servers/arbitration/constants/system/startTime* element.

Time-out | Description | Valid values | Default value
-- | -- | -- | --
`forfeitTimeout` | Indicates the time, in milliseconds, from the arbitration start time. | 0 - n | 60000
`arbitrationTimeout` | Indicates the time, in milliseconds, from the arbitration start time, that the arbitration result times out. This value can't be less than the `forfeitTimeout` value. | 0 - n | 300000

#### Example: arbitration
```json
"arbitration": {
    "forfeitTimeout": 60000,
    "arbitrationTimeout": 300000
},
```
 [Return to the top of this topic.](#top)
<a id="broadcastviewertitleids"></a>

## broadcastViewerTitleIds

Specifies an array of the title IDs of the titles that should always have read access to the broadcast session.

#### Example: broadcastViewerTitleIds
```json
"broadcastViewerTitleIds" : ["34567", "8910"],
```
 [Return to the top of this topic.](#top)
<a id="ownershippolicies"></a>

## ownershipPolicies

Specifies how to handle a session when the last owner leaves the session.
Requires that the `hasOwners` capability is set.

Ownership policy | Description | Valid values | Default value
-- | -- | -- | --
`migration` | Indicates what happens when the last owner leaves the session. If the migration policy is set to "endsession", expire the session. If the migration policy is set to "oldest", select the member with the oldest join time to become the new owner of the session. | "oldest", "endsession" | "endsession"
`allowNonOwnerInviteHandles` | Indicates invite behavior for session members that aren't the owner. By default, non-owners can't send invites for a session. | `true`, `false` | `false` 
`nonOwnerModifiableSystemProperties` | A list of system property names that non-owners can modify on sessions with capability `hasOwners` set to `true`. | List of system property names | Not applicable

#### Example: ownershipPolicies
```json
"ownershipPolicies": {
     "migration": "oldest",
     "allowNonOwnerInviteHandles": true,
     "nonOwnerModifiableSystemProperties": ["joinRestriction", "closed"] 
}
```
 [Return to the top of this topic.](#top)