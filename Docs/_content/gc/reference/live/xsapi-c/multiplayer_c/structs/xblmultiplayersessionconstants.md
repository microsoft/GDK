---
author: joannaleecy
title: XblMultiplayerSessionConstants
description: Represents constants for a multiplayer session.
kindex: XblMultiplayerSessionConstants
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
quality: good
applies-to: pc-gdk
---

# XblMultiplayerSessionConstants  

Represents constants for a multiplayer session.  

## Syntax  
  
```cpp
typedef struct XblMultiplayerSessionConstants {  
    uint32_t MaxMembersInSession;  
    XblMultiplayerSessionVisibility Visibility;  
    uint64_t* InitiatorXuids;  
    size_t InitiatorXuidsCount;  
    const char* CustomJson;  
    const char* SessionCloudComputePackageConstantsJson;  
    uint64_t MemberReservedTimeout;  
    uint64_t MemberInactiveTimeout;  
    uint64_t MemberReadyTimeout;  
    uint64_t SessionEmptyTimeout;  
    uint64_t ArbitrationTimeout;  
    uint64_t ForfeitTimeout;  
    bool EnableMetricsLatency;  
    bool EnableMetricsBandwidthDown;  
    bool EnableMetricsBandwidthUp;  
    bool EnableMetricsCustom;  
    XblMultiplayerMemberInitialization* MemberInitialization;  
    XblMultiplayerPeerToPeerRequirements PeerToPeerRequirements;  
    XblMultiplayerPeerToHostRequirements PeerToHostRequirements;  
    const char* MeasurementServerAddressesJson;  
    bool ClientMatchmakingCapable;  
    XblMultiplayerSessionCapabilities SessionCapabilities;  
} XblMultiplayerSessionConstants  
```
  
### Members  
  
*MaxMembersInSession*  
Type: uint32_t  
  
The maximum number of members in the session.
  
*Visibility*  
Type: [XblMultiplayerSessionVisibility](../enums/xblmultiplayersessionvisibility.md)  
  
The visibility of the session.
  
*InitiatorXuids*  
Type: uint64_t*  
  
A collection of Xbox user IDs indicating who initiated the session. (Optional)
  
*InitiatorXuidsCount*  
Type: size_t  
  
The number of entries in the `InitiatorXuids` array.
  
*CustomJson*  
Type: const char*  
  
Any custom constants for the session, specified in a JSON string. These constants can't be changed after the session is created. (Optional)
  
*SessionCloudComputePackageConstantsJson*  
Type: const char*  
  
The Cloud Compute package constants for the session, specified in a JSON string. These constants can't be changed after the session is created. (Optional)
  
*MemberReservedTimeout*  
Type: uint64_t  
  
Maximum time, in milliseconds, for a member with a reservation to join the session. If the member doesn't join within this time, the reservation is removed.
  
*MemberInactiveTimeout*  
Type: uint64_t  
  
Maximum time, in milliseconds, for an inactive member to become active. If an inactive member doesn't become active within this time, the member is removed from the session.
  
*MemberReadyTimeout*  
Type: uint64_t  
  
Maximum time, in milliseconds, for a member who is marked as ready to become active. When the shell launches the title to start a multiplayer game, the member is marked as ready. If a member who is marked as ready doesn't become active within this time, the member becomes inactive.
  
*SessionEmptyTimeout*  
Type: uint64_t  
  
Maximum time, in milliseconds, that the session can remain empty. If no members join the session within this time, the session is deleted.
  
*ArbitrationTimeout*  
Type: uint64_t  
  
Delta, in milliseconds, from start time that represents the time at which results are finalized. If no one (client or server) has reported at this time, we declare the match results incomplete. DEPRECATED. This member will be removed in a future release.
  
*ForfeitTimeout*  
Type: uint64_t  
  
Delta, in milliseconds, from start time that represents the time at which, if the session has no active users, the match is canceled. DEPRECATED. This member will be removed in a future release.
  
*EnableMetricsLatency*  
Type: bool  
  
If true, indicates that the title wants latency measured to help determine connectivity. Requires `capabilities.connectivity` to be true.
  
*EnableMetricsBandwidthDown*  
Type: bool  
  
If true, indicates that the title wants downstream (host-to-peer) bandwidth measured to help determine connectivity. Requires `capabilities.connectivity` to be true.
  
*EnableMetricsBandwidthUp*  
Type: bool  
  
If true, indicates that the title wants upstream (peer-to-host) bandwidth measured to help determine connectivity. Requires `capabilities.connectivity` to be true.
  
*EnableMetricsCustom*  
Type: bool  
  
If true, indicates that the title wants a custom measurement to help determine connectivity. Requires `capabilities.connectivity` to be true.
  
*MemberInitialization*  
Type: [XblMultiplayerMemberInitialization*](xblmultiplayermemberinitialization.md)  
  
If set, the session expects the client system or title to perform initialization after session creation. Timeouts and initialization stages are automatically tracked by the session, including initial Quality of Service (QoS) measurements if any metrics are set.
  
*PeerToPeerRequirements*  
Type: [XblMultiplayerPeerToPeerRequirements](xblmultiplayerpeertopeerrequirements.md)  
  
QoS requirements for a connection between session members.
  
*PeerToHostRequirements*  
Type: [XblMultiplayerPeerToHostRequirements](xblmultiplayerpeertohostrequirements.md)  
  
QoS requirements for a connection between a host candidate and session members.
  
*MeasurementServerAddressesJson*  
Type: const char*  
  
The set of potential server connection strings that should be evaluated.
  
*ClientMatchmakingCapable*  
Type: bool  
  
Indicates whether the matchmaking status fields can be written to.
  
*SessionCapabilities*  
Type: [XblMultiplayerSessionCapabilities](xblmultiplayersessioncapabilities.md)  
  
The capabilities of the session.
  
## Remarks  
  
Session constants are set by the creator or by the session template only when a session is created.
  
## Requirements  
  
**Header:** multiplayer_c.h
  
## See also  
[multiplayer_c](../multiplayer_c_members.md)  
  
  