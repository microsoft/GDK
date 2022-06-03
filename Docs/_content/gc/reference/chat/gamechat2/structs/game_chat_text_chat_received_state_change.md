---
author: M-Stahl
title: game_chat_text_chat_received_state_change
description: Represents information specific to the [game_chat_state_change_type::text_chat_received](../enums/game_chat_state_change_type.md) state change.
kindex: game_chat_text_chat_received_state_change
ms.author: jkepner
ms.topic: reference
ms.date: '09/12/2019'
edited: 10/08/2020
security: public
applies-to: pc-gdk
---

# game_chat_text_chat_received_state_change
  
Represents information specific to the [game_chat_state_change_type::text_chat_received](../enums/game_chat_state_change_type.md) state change.  
  
<a id="syntaxSection"></a>
  
## Syntax
  
```cpp
typedef struct game_chat_text_chat_received_state_change {  
    chat_user* sender;  
    uint32_t receiver_count;  
    chat_user_array receivers;  
    PCWSTR message;  
} game_chat_text_chat_received_state_change  
```
  
<a id="membersSection"></a>
  
### Members
  
*sender*&nbsp;&nbsp;  
Type: [chat_user](../classes/chat_user/chat_user.md)\*  
  
A pointer to the `chat_user` object that originated the text message.  
  
Pointers for `chat_user` objects remain valid until the user has been removed from the local [chat_manager](../classes/chat_manager/chat_manager.md) instance via the [chat_manager\::remove_user](../classes/chat_manager/methods/chat_manager_remove_user.md) method.  
  
*receiver_count*&nbsp;&nbsp;  
Type: uint32_t  
  
The number of array elements in *receivers*.  
  
*receivers*&nbsp;&nbsp;\_Field\_size\_(receiver\_count)  
Type: [chat_user_array](../classes/chat_user/chat_user.md#array)  
  
An array of `chat_user` pointers to one or more local destination players to whom the text message is addressed.  
  
The memory for the `chat_user_array` object remains valid until this object has been returned by calling  [chat_manager\::finish_processing_state_changes](../classes/chat_manager/methods/chat_manager_finish_processing_state_changes.md). Individual `chat_user` object pointers remain valid until the user has been removed from the local `chat_manager` instance via the `chat_manager::remove_user` method.  
  
*message*&nbsp;&nbsp;  
Type: PCWSTR  
  
A pointer to the text string that was sent by calling [chat_user_local::send_chat_text](../classes/chat_user/chat_user_local/methods/chat_user_local_send_chat_text.md). The string may be up to `c_maxChatTextMessageLength` characters long, not including the null terminator.  
  > [!NOTE]
> `c_maxChatTextMessageLength` is a `constexpr uint16_t` with a value of 1023.  
  
The string remains valid until this object has been returned by calling `chat_manager::finish_processing_state_changes`. The app should make a copy of the text to display in a manner and duration described in the Game Chat communication policy guide document.  
  
<a id="remarksSection"></a>
  
## Remarks
  
This structure provides additional information for a [game_chat_state_change_type\::text_chat_received](../enums/game_chat_state_change_type.md) state change in Game Chat 2. This state change occurs when a player-to-player text communication has arrived.  
  
If this state change occurs, this structure is returned as a [game_chat_state_change](game_chat_state_change.md) element in the [game_chat_state_change_array](game_chat_state_change.md#array) array retrieved when [chat_manager\::start_processing_state_changes](../classes/chat_manager/methods/chat_manager_start_processing_state_changes.md) is called by your app. After confirming the state change type by checking the value of the `state_change_type` member for that `game_chat_state_change` element, you can then cast that element to this structure. You can then use this structure to obtain more information about and process the state change before the array is passed back to Game Chat 2 from your app, by calling [chat_manager\::finish_processing_state_changes](../classes/chat_manager/methods/chat_manager_finish_processing_state_changes.md).  
  
For more information about processing state changes, see [Using the Game Chat 2 C++ API](../../../../chat/overviews/game-chat2/using-game-chat-2.md).  
  
<a id="requirementsSection"></a>
  
## Requirements
  
**Header:** GameChat2.h  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
<a id="seealsoSection"></a>
  
## See also
  
[Intro to Game Chat 2](../../../../chat/overviews/game-chat2/game-chat-2-intro.md)  
[chat_manager](../classes/chat_manager/chat_manager.md)  
[GameChat2 members](../gamechat2_members.md)  
  