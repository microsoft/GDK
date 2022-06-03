---
author: joannaleecy
title: XblMultiplayerSessionMember
description: Represents a read only reference to member in a multiplayer session.
kindex: XblMultiplayerSessionMember
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
quality: good
applies-to: pc-gdk
---

# XblMultiplayerSessionMember  

Represents a read only reference to member in a multiplayer session.  

## Syntax  
  
```cpp
typedef struct XblMultiplayerSessionMember {  
    uint32_t MemberId;  
    const char* TeamId;  
    const char* InitialTeam;  
    XblTournamentArbitrationStatus ArbitrationStatus;  
    uint64_t Xuid;  
    const char* CustomConstantsJson;  
    const char* SecureDeviceBaseAddress64;  
    const XblMultiplayerSessionMemberRole* Roles;  
    size_t RolesCount;  
    const char* CustomPropertiesJson;  
    char Gamertag[XBL_GAMERTAG_CHAR_SIZE];  
    XblMultiplayerSessionMemberStatus Status;  
    bool IsTurnAvailable;  
    bool IsCurrentUser;  
    bool InitializeRequested;  
    const char* MatchmakingResultServerMeasurementsJson;  
    const char* ServerMeasurementsJson;  
    const uint32_t* MembersInGroupIds;  
    size_t MembersInGroupCount;  
    const char* QosMeasurementsJson;  
    XblDeviceToken DeviceToken;  
    XblNetworkAddressTranslationSetting Nat;  
    uint32_t ActiveTitleId;  
    uint32_t InitializationEpisode;  
    time_t JoinTime;  
    XblMultiplayerMeasurementFailure InitializationFailureCause;  
    const char** Groups;  
    size_t GroupsCount;  
    const char** Encounters;  
    size_t EncountersCount;  
    XblMultiplayerSessionReference TournamentTeamSessionReference;  
    void* Internal;  
} XblMultiplayerSessionMember  
```
  
### Members  
  
*MemberId*  
Type: uint32_t  
  
Id for this member. Unique within the context of the session which this member is part of.
  
*TeamId*  
Type: const char*  
  
Id of this members' team in a tournament. DEPRECATED. It will be removed in a future release
  
*InitialTeam*  
Type: const char*  
  
Initial team assignment from SmartMatch.
  
*ArbitrationStatus*  
Type: [XblTournamentArbitrationStatus](../enums/xbltournamentarbitrationstatus.md)  
  
Arbitration Status of a member in a tournament. DEPRECATED. It will be removed in a future release
  
*Xuid*  
Type: uint64_t  
  
Xbox User ID of the member. Only known if the member has accepted.
  
*CustomConstantsJson*  
Type: const char*  
  
JSON string that specify the custom constants for the member.
  
*SecureDeviceBaseAddress64*  
Type: const char*  
  
The base64 encoded secure device address of the member. (Optional)
  
*Roles*  
Type: const [XblMultiplayerSessionMemberRole*](xblmultiplayersessionmemberrole.md)  
  
An array of roles for this member. (Optional)
  
*RolesCount*  
Type: size_t  
  
Number of entries in the Roles array.
  
*CustomPropertiesJson*  
Type: const char*  
  
JSON string that specify the custom properties for the member.
  
*Gamertag*  
Type: char[XBL_GAMERTAG_CHAR_SIZE]  
  
The Gamertag of the member. (Optional) Only known if the member has accepted.
  
*Status*  
Type: [XblMultiplayerSessionMemberStatus](../enums/xblmultiplayersessionmemberstatus.md)  
  
The status of this member.
  
*IsTurnAvailable*  
Type: bool  
  
Only true if this member is ready for turn.
  
*IsCurrentUser*  
Type: bool  
  
Indicates if this MultiplayerSessionMember is for the current user.
  
*InitializeRequested*  
Type: bool  
  
Indicates to run QoS initialization for this user. Defaults to false. Ignored if there is not a "memberInitialization" section for the session.
  
*MatchmakingResultServerMeasurementsJson*  
Type: const char*  
  
When match adds a user to a session, it can provide some context around how and why they were matched into the session. This is a copy of the user's serverMeasurements from the matchmaking session.
  
*ServerMeasurementsJson*  
Type: const char*  
  
QoS measurements by game-server connection string. Like all fields, "serverMeasurements" must be updated as a whole, so it should be set once when measurement is complete. If empty, it means that none of the measurements completed within the "serverMeasurementTimeout".
  
*MembersInGroupIds*  
Type: const uint32_t*  
  
A collection of memberIds in my group. If a "initializationGroup" list is set, the member's own index will always be added if it isn't already present. During managed initialization, if any members in the list fail, this member will also fail.
  
*MembersInGroupCount*  
Type: size_t  
  
The number of entries in the MembersInGroupIds array.
  
*QosMeasurementsJson*  
Type: const char*  
  
QoS measurements by secure device address. Like all fields, "measurements" must be updated as a whole. It should be set once when measurement is complete, not incrementally. If a "measurements" object is set, it can't contain an entry for the member's own address.
  
*DeviceToken*  
Type: [XblDeviceToken](xbldevicetoken.md)  
  
This is set when the member uploads a secure device address. It's a case-insensitive string that can be used for equality comparisons.
  
*Nat*  
Type: [XblNetworkAddressTranslationSetting](../enums/xblnetworkaddresstranslationsetting.md)  
  
This is the device's NAT setting when the member uploads a secure device address.
  
*ActiveTitleId*  
Type: uint32_t  
  
If the member is active, this is the title ID in which they are active.
  
*InitializationEpisode*  
Type: uint32_t  
  
This value is only useful to read when the title is manually managing their own QoS. If the "memberInitialization" section is set and the member was added with "initialize":true, this is set to the initialization episode that the member will participate in otherwise it is 0. Users join sessions in batches. The initialization episode number indicates a set of users that QoS needs to be performed against. Initialization episode 1 is a special value used for the members added to a new session at create time.
  
*JoinTime*  
Type: time_t  
  
The time the user joined the session. If "reserved" is true, this is the time the reservation was made.
  
*InitializationFailureCause*  
Type: [XblMultiplayerMeasurementFailure](../enums/xblmultiplayermeasurementfailure.md)  
  
The cause of why the initialization failed, or XblMultiplayerMeasurementFailure::None if there was no failure. Set when transitioning out of the "joining" or "measuring" stage if this member doesn't pass.
  
*Groups*  
Type: const char**  
  
An array of group names for the current user indicating which groups that user was part of during a multiplayer session.
  
*GroupsCount*  
Type: size_t  
  
The number of items in the Groups array.
  
*Encounters*  
Type: const char**  
  
Gets a list of group names for the current user indicating which groups that user encountered during a multiplayer session.
  
*EncountersCount*  
Type: size_t  
  
The number of items in the Groups array.
  
*TournamentTeamSessionReference*  
Type: [XblMultiplayerSessionReference](xblmultiplayersessionreference.md)  
  
The tournament team session reference. DEPRECATED. It will be removed in a future release
  
*Internal*  
Type: void*  
  
Internal use only.
  
## Requirements  
  
**Header:** multiplayer_c.h
  
## See also  
[multiplayer_c](../multiplayer_c_members.md)  
  
  