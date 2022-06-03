---
author: joannaleecy
title: XblMultiplayerManagerMember
description: Represents a reference to a member in a multiplayer game.
kindex: XblMultiplayerManagerMember
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
quality: good
applies-to: pc-gdk
---

# XblMultiplayerManagerMember  

Represents a reference to a member in a multiplayer game.  

## Syntax  
  
```cpp
typedef struct XblMultiplayerManagerMember {  
    uint32_t MemberId;  
    const char* TeamId;  
    const char* InitialTeam;  
    uint64_t Xuid;  
    const char* DebugGamertag;  
    bool IsLocal;  
    bool IsInLobby;  
    bool IsInGame;  
    XblMultiplayerSessionMemberStatus Status;  
    const char* ConnectionAddress;  
    const char* PropertiesJson;  
    const char* DeviceToken;  
} XblMultiplayerManagerMember  
```
  
### Members  
  
*MemberId*  
Type: uint32_t  
  
Id for the member.
  
*TeamId*  
Type: const char*  
  
Only applicable if you are using Xbox Live Tournaments. Id of this members' team in a tournament. DEPRECATED. It will be removed in a future release
  
*InitialTeam*  
Type: const char*  
  
Only applicable if you are using Team rules with Smart Match. Initial team assignment suggested by Smart Match.
  
*Xuid*  
Type: uint64_t  
  
Xbox User ID of the member.
  
*DebugGamertag*  
Type: const char*  
  
The Gamertag of the member. This is only to be used for debugging purposes as this gamertag may be out of date. It is recommended you use social manager's XblSocialManagerCreateSocialUserGroupFromList or the profile APIs such as XblProfileGetUserProfileAsync to get this information.
  
*IsLocal*  
Type: bool  
  
Indicates if this member is playing on the local device.
  
*IsInLobby*  
Type: bool  
  
Indicates if this member is part of the lobby.
  
*IsInGame*  
Type: bool  
  
Indicates if this member is part of the game.
  
*Status*  
Type: [XblMultiplayerSessionMemberStatus](../../multiplayer_c/enums/xblmultiplayersessionmemberstatus.md)  
  
The status of this member.
  
*ConnectionAddress*  
Type: const char*  
  
The address used for network connection. This can be used for secure socket connection.
  
*PropertiesJson*  
Type: const char*  
  
JSON value that specify the custom properties of the member.
  
*DeviceToken*  
Type: const char*  
  
Token that uniquely identifies a device. Used for setting host and QoS measurements.
  
## Remarks  
  
The member objects are created and owned by MultiplayerManager. The fields of returned XblMultiplayerManagerMember objects are only valid until XblMultiplayerManagerDoWork is called again.
  
## Requirements  
  
**Header:** multiplayer_manager_c.h
  
## See also  
[multiplayer_manager_c](../multiplayer_manager_c_members.md)  
  
  