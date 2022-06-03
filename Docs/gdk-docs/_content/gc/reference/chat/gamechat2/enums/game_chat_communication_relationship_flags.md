---
author: M-Stahl
title: game_chat_communication_relationship_flags
description: Defines the communication relationship between two users.
kindex: game_chat_communication_relationship_flags
ms.author: jkepner
ms.topic: reference
ms.date: '09/12/2019'
edited: '09/16/2020'
security: public
applies-to: pc-gdk
---

# game_chat_communication_relationship_flags
  
Defines the communication relationship between two users.  
  
<a id="syntaxSection"></a>
  
## Syntax
  
```cpp
enum class game_chat_communication_relationship_flags  
{  
    none = 0x0,  
    send_microphone_audio = 0x1,  
    send_text_to_speech_audio = 0x2,  
    send_text = 0x4,  
    receive_audio = 0x8,  
    receive_text = 0x10,  
}  
```  
  
<a id="constantsSection"></a>
  
## Constants
  
| Constant | Description |  
| --- | --- |  
| none | No communication between the local user and the target user is allowed. |  
| send_microphone_audio | Microphone communication from the local user to the target user is allowed. |  
| send_text_to_speech_audio | Text-to-speech communication from the local user to the target user is allowed. |  
| send_text | Text communication from the local user to the target user is allowed. |  
| receive_audio | Audio communication from the target user to the local user is allowed. |  
| receive_text | Text communication from the target user to the local user is allowed. |  
  
<a id="remarksSection"></a>
  
## Remarks
  
This enumeration describes the communication relationship between two users that your app can request from Game Chat 2. You can retrieve the current communication relationship between a local user and a specified target user by calling the [chat_user_local::get_effective_communication_relationship](../classes/chat_user/chat_user_local/methods/chat_user_local_get_effective_communication_relationship.md) method, or set it by calling the [chat_user_local::set_communication_relationship](../classes/chat_user/chat_user_local/methods/chat_user_local_set_communication_relationship.md) method. You can also set the default communication relationship between users when you initialize the chat instance, by calling the [chat_manager::initialize](../classes/chat_manager/methods/chat_manager_initialize.md) method.  
  
For more information about initializing and working with a chat instance, see [Using the Game Chat 2 C++ API](../../../../chat/overviews/game-chat2/using-game-chat-2.md).  
  
<a id="requirementsSection"></a>
  
## Requirements
  
**Header:** GameChat2.h  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
<a id="seealsoSection"></a>
  
## See also
  
[Intro to Game Chat 2](../../../../chat/overviews/game-chat2/game-chat-2-intro.md)  
[GameChat2 members](../gamechat2_members.md)  
[chat_user_local](../classes/chat_user/chat_user_local/chat_user_local.md)  
  