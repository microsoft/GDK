---
author: joannaleecy
title: XblMultiplayerActivityInviteData
description: Describes multiplayer activity invites.
kindex: XblMultiplayerActivityInviteData
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
quality: good
applies-to: pc-gdk
---

# XblMultiplayerActivityInviteData  

Describes multiplayer activity invites.  

## Syntax  
  
```cpp
typedef struct XblMultiplayerActivityInviteData {  
    uint64_t invitedXuid;  
    uint64_t senderXuid;  
    const char* senderImageUrl;  
    char senderGamertag[XBL_GAMERTAG_CHAR_SIZE];  
    char senderModernGamertag[XBL_MODERN_GAMERTAG_CHAR_SIZE];  
    char senderModernGamertagSuffix[XBL_MODERN_GAMERTAG_SUFFIX_CHAR_SIZE];  
    char senderUniqueModernGamertag[XBL_UNIQUE_MODERN_GAMERTAG_CHAR_SIZE];  
    const char* titleName;  
    const char* titleImageUrl;  
    const char* connectionString;  
    time_t expirationTime;  
} XblMultiplayerActivityInviteData  
```
  
### Members  
  
*invitedXuid*  
Type: uint64_t  
  
The Xbox user ID of the invited user.
  
*senderXuid*  
Type: uint64_t  
  
The Xbox user ID of the user sending the invite.
  
*senderImageUrl*  
Type: const char*  
  
URL of the sender's gamerpic.
  
*senderGamertag*  
Type: char[XBL_GAMERTAG_CHAR_SIZE]  
  
The UTF-8 encoded gamertag of the player.
  
*senderModernGamertag*  
Type: char[XBL_MODERN_GAMERTAG_CHAR_SIZE]  
  
The UTF-8 encoded modern gamertag of the player. Not guaranteed to be unique.
  
*senderModernGamertagSuffix*  
Type: char[XBL_MODERN_GAMERTAG_SUFFIX_CHAR_SIZE]  
  
The UTF-8 encoded suffix appended to the modern gamertag to ensure uniqueness. Can be empty in some cases.
  
*senderUniqueModernGamertag*  
Type: char[XBL_UNIQUE_MODERN_GAMERTAG_CHAR_SIZE]  
  
The UTF-8 encoded unique modern gamertag and suffix. Format is "modernGamertag#suffix". Guaranteed to be no more than 16 rendered characters.
  
*titleName*  
Type: const char*  
  
The name of the title for which the invite is being sent.
  
*titleImageUrl*  
Type: const char*  
  
URL of the title image used in the invite.
  
*connectionString*  
Type: const char*  
  
Connection string to pass to the connecting client so that it can join a game. Typically contains information such as the server IP address.
  
*expirationTime*  
Type: time_t  
  
Expiration time.
  
## Remarks  
  
For more information about multiplayer activities, see [Activities](../../../../../live/features/multiplayer/mpa/concepts/live-mpa-activities.md).
  
## Argument of
  
[XblMultiplayerActivityInviteHandler](../functions/xblmultiplayeractivityinvitehandler.md)
  
## Requirements  
  
**Header:** multiplayer_activity_c.h
  
## See also  
[multiplayer_activity_c](../multiplayer_activity_c_members.md)  
  
  