---
author: M-Stahl
title: game_chat_user_chat_indicator
description: Defines the current chat status of a user in relationship to the local users.
kindex: game_chat_user_chat_indicator
ms.author: jkepner
ms.topic: reference
ms.date: '09/12/2019'
edited: 10/08/2020
security: public
applies-to: pc-gdk
---

# game_chat_user_chat_indicator
  
Defines the current chat status of a user in relationship to the local users.  
  
<a id="syntaxSection"></a>
  
## Syntax
  
```cpp
enum class game_chat_user_chat_indicator  
{  
    silent,  
    talking,  
    local_microphone_muted,  
    incoming_communications_muted,  
    reputation_restricted,  
    platform_restricted,  
    no_chat_focus,  
    no_microphone,  
}  
```  
  
<a id="constantsSection"></a>
  
## Constants
  
| Constant | Description |  
| --- | --- |  
| silent | The user is not currently talking. <br/><br/>Users that have recently been added to the local [chat_manager](../classes/chat_manager/chat_manager.md) instance are silent until Game Chat has finished performing asynchronous privacy and privilege checks. |  
| talking | The user is currently talking. |  
| local_microphone_muted | The user's local microphone is muted. |  
| incoming_communications_muted | The remote user has been muted by all local users. |  
| reputation_restricted | Chat with this user is limited because the user has an "Avoid Me" reputation designated by the Xbox Live service and Game Chat 2 has applied a [game_chat_communication_relationship_adjuster\::reputation](game_chat_communication_relationship_adjuster.md) relationship adjuster for one or more local users. |  
| platform_restricted | Chat with this user is limited due to platform restrictions involving one or more local users. |  
| no_chat_focus | The user is not able to chat because the app hasn't specified the microphone capability in its AppXManifest, or a user has changed chat audio focus away from the app. |  
| no_microphone | The user does not have a microphone available or configured. <br/><br/>This state appears only for local users. If chat communication with a remote user without a microphone would otherwise be restricted due to, for example, muting or team membership, the remote user appears as having that restriction. Otherwise, a remote user without a microphone appears as `silent`. |  
  
<a id="remarksSection"></a>
  
## Remarks
  
This enumeration is used by [chat_user\::chat_indicator](../classes/chat_user/methods/chat_user_chat_indicator.md) to assist in providing a UI representation of the current chat status of a user, in relation to the local users. The representation is meant to provide local users with information as to what and why they are, or aren't, hearing or seeing in terms of communication with that user. For more information about providing a UI representation of the current chat status of a user, see the [UI](../../../../chat/overviews/game-chat2/using-game-chat-2.md#ui) section of [Using the Game Chat C++ API](../../../../chat/overviews/game-chat2/using-game-chat-2.md).
  
<a id="requirementsSection"></a>
  
## Requirements
  
**Header:** GameChat2.h  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
<a id="seealsoSection"></a>
  
## See also
  
[Intro to Game Chat 2](../../../../chat/overviews/game-chat2/game-chat-2-intro.md)  
[chat_user](../classes/chat_user/chat_user.md)  
[GameChat2 members](../gamechat2_members.md)  
  