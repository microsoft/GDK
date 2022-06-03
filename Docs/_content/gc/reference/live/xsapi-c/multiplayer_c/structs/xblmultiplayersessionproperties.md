---
author: joannaleecy
title: XblMultiplayerSessionProperties
description: A set of properties associated with this session. Any player can modify these properties.
kindex: XblMultiplayerSessionProperties
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# XblMultiplayerSessionProperties  

A set of properties associated with this session. Any player can modify these properties.  

## Syntax  
  
```cpp
typedef struct XblMultiplayerSessionProperties {  
    const char** Keywords;  
    size_t KeywordCount;  
    XblMultiplayerSessionRestriction JoinRestriction;  
    XblMultiplayerSessionRestriction ReadRestriction;  
    uint32_t* TurnCollection;  
    size_t TurnCollectionCount;  
    const char* MatchmakingTargetSessionConstantsJson;  
    const char* SessionCustomPropertiesJson;  
    const char* MatchmakingServerConnectionString;  
    const char** ServerConnectionStringCandidates;  
    size_t ServerConnectionStringCandidatesCount;  
    uint32_t* SessionOwnerMemberIds;  
    size_t SessionOwnerMemberIdsCount;  
    XblDeviceToken HostDeviceToken;  
    bool Closed;  
    bool Locked;  
    bool AllocateCloudCompute;  
    bool MatchmakingResubmit;  
} XblMultiplayerSessionProperties  
```
  
### Members  
  
*Keywords*  
Type: const char**  
  
A collection of keywords associated with the session (Optional, might be empty).
  
*KeywordCount*  
Type: size_t  
  
The number of keywords.
  
*JoinRestriction*  
Type: [XblMultiplayerSessionRestriction](../enums/xblmultiplayersessionrestriction.md)  
  
Restricts who can join "open" sessions. (Has no effect on reservations, which means it has no impact on "private" and "visible" sessions.) Defaults to "none". If "local", only users whose token's DeviceId matches someone else already in the session and "active": true. If "followed", only local users (as defined above) and users who are followed by an existing (not reserved) member of the session can join without a reservation.
  
*ReadRestriction*  
Type: [XblMultiplayerSessionRestriction](../enums/xblmultiplayersessionrestriction.md)  
  
Restricts who can read "open" sessions. (Has no effect on reservations, which means it has no impact on "private" and "visible" sessions.) Defaults to "none". If "local", only users whose token's DeviceId matches someone else already in the session and "active": true. If "followed", only local users (as defined above) and users who are followed by an existing (not reserved) member of the session can read without a reservation. The read restriction applies to sessions with "open" or "visible" visibility and determines who can read the session without an invite. The read restriction must be at least as accessible as the join restriction, i.e. 'joinRestriction' can't be set to "followed" without also setting 'readRestriction'."
  
*TurnCollection*  
Type: uint32_t*  
  
A collection of session MemberIds indicating whose turn it is.
  
*TurnCollectionCount*  
Type: size_t  
  
The number of entries in the TurnCollection array.
  
*MatchmakingTargetSessionConstantsJson*  
Type: const char*  
  
A JSON string representing the target session constants.
  
*SessionCustomPropertiesJson*  
Type: const char*  
  
JSON string that specify the custom properties for the session. These can be changed anytime. When changing, call multiplayer_service::write_session to write the changes to the service.
  
*MatchmakingServerConnectionString*  
Type: const char*  
  
Force a specific connection string to be used. This is useful for session in progress join scenarios.
  
*ServerConnectionStringCandidates*  
Type: const char**  
  
The ordered list of connection strings that the session could use to connect to a game server. Generally titles should use the first on the list, but sophisticated titles could use a custom mechanism for choosing one of the others (e.g. based on load).
  
*ServerConnectionStringCandidatesCount*  
Type: size_t  
  
The number of entries in the ServerConnectionStringCandidates array.
  
*SessionOwnerMemberIds*  
Type: uint32_t*  
  
Session MemberIds of owners of the session.
  
*SessionOwnerMemberIdsCount*  
Type: size_t  
  
The number of entries in the SessionOwnerMemberIds array.
  
*HostDeviceToken*  
Type: [XblDeviceToken](xbldevicetoken.md)  
  
Device token of the host. Must match the "deviceToken" of at least one member, otherwise this field is deleted. If "peerToHostRequirements" is set and "host" is set, the measurement stage assumes the given host is the correct host and only measures metrics to that host.
  
*Closed*  
Type: bool  
  
Controls whether a session is joinable, independent of visibility, join restriction, and available space in the session. Does not affect reservations. Defaults to false.
  
*Locked*  
Type: bool  
  
If true, it would allow the members of the session to be locked, such that if a user leaves they are able to come back into the session but no other user could take that spot. Defaults to false.
  
*AllocateCloudCompute*  
Type: bool  
  
Setting to true by a client triggers a Xbox Live Compute allocation attempt by MPSD. Defaults to false.
  
*MatchmakingResubmit*  
Type: bool  
  
True if the match that was found didn't work out and needs to be resubmitted. Set to false to signal that the match did work, and the matchmaking service can release the session.
  
## Requirements  
  
**Header:** multiplayer_c.h
  
## See also  
[multiplayer_c](../multiplayer_c_members.md)  
  
  