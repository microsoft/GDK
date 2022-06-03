---
author: joannaleecy
title: XblMultiplayerActivityInfo
description: Information about a player's activity while playing a title.
kindex: XblMultiplayerActivityInfo
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
quality: good
applies-to: pc-gdk
---

# XblMultiplayerActivityInfo  

Information about a player's activity while playing a title.  

## Syntax  
  
```cpp
typedef struct XblMultiplayerActivityInfo {  
    uint64_t xuid;  
    const char* connectionString;  
    XblMultiplayerActivityJoinRestriction joinRestriction;  
    size_t maxPlayers;  
    size_t currentPlayers;  
    const char* groupId;  
    XblMultiplayerActivityPlatform platform;  
} XblMultiplayerActivityInfo  
```
  
### Members  
  
*xuid*  
Type: uint64_t  
  
The Xbox user ID to which the activity info belongs.
  
*connectionString*  
Type: const char*  
  
The connection string passed to the connecting client to join a game; typically contains information such as the server IP address. When querying activities, this field is populated only if the activity is public or the player is following the caller.
  
*joinRestriction*  
Type: [XblMultiplayerActivityJoinRestriction](../enums/xblmultiplayeractivityjoinrestriction.md)  
  
Specifies who can join the player's current activity.
  
*maxPlayers*  
Type: size_t  
  
The maximum number of players who can join the player's current activity. A value of 0 indicates that no players can join.
  
*currentPlayers*  
Type: size_t  
  
The number of players already playing with the player in a multiplayer activity. A value of 0 indicates that no other players are currently playing.
  
*groupId*  
Type: const char*  
  
A unique identifier to group all users playing as part of the same activity. The title sets this identifier when it creates the activity.
  
*platform*  
Type: [XblMultiplayerActivityPlatform](../enums/xblmultiplayeractivityplatform.md)  
  
The platform on which the activity is happening. When setting an activity, the platform is automatically inferred; this field is ignored.
  
## Remarks  
  
To see how this enumeration is used, see "Setting an activity" and "Getting activities" in the [Activities](../../../../../live/features/multiplayer/mpa/how-to/live-mpa-client-how-to.md#activities) section of [Example code for Multiplayer Activity](../../../../../live/features/multiplayer/mpa/how-to/live-mpa-client-how-to.md).
  
## Argument of
  
[XblMultiplayerActivityGetActivityResult](../functions/xblmultiplayeractivitygetactivityresult.md)  
[XblMultiplayerActivitySetActivityAsync](../functions/xblmultiplayeractivitysetactivityasync.md)
  
## Requirements  
  
**Header:** multiplayer_activity_c.h
  
## See also  
[multiplayer_activity_c](../multiplayer_activity_c_members.md)  
  
  