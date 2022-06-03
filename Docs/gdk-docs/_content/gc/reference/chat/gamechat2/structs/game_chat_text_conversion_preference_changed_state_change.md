---
author: M-Stahl
title: game_chat_text_conversion_preference_changed_state_change
description: Represents information specific to the [game_chat_state_change_type::text_conversion_preference_changed](../enums/game_chat_state_change_type.md) state change.
kindex: game_chat_text_conversion_preference_changed_state_change
ms.author: jkepner
ms.topic: reference
ms.date: '09/12/2019'
edited: 10/08/2020
security: public
applies-to: pc-gdk
---

# game_chat_text_conversion_preference_changed_state_change
  
Represents information specific to the [game_chat_state_change_type::text_conversion_preference_changed](../enums/game_chat_state_change_type.md) state change.  
  
<a id="syntaxSection"></a>
  
## Syntax
  
```cpp
typedef struct game_chat_text_conversion_preference_changed_state_change {  
    chat_user* chatUser;  
} game_chat_text_conversion_preference_changed_state_change  
```
  
<a id="membersSection"></a>
  
### Members
  
*chatUser*&nbsp;&nbsp;  
Type: [chat_user](../classes/chat_user/chat_user.md)\*  
  
A pointer to the local user who has enabled or disabled speech-to-text or text-to-speech conversion.  
  
Your app should call [chat_user_local::speech_to_text_conversion_preference_enabled](../classes/chat_user/chat_user_local/methods/chat_user_local_speech_to_text_conversion_preference_enabled.md) and [chat_user_local::text_to_speech_conversion_preference_enabled](../classes/chat_user/chat_user_local/methods/chat_user_local_text_to_speech_conversion_preference_enabled.md) to get the new preference values.  
  
<a id="remarksSection"></a>
  
## Remarks
  
This structure provides additional information for a [game_chat_state_change_type\::text_conversion_preference_changed](../enums/game_chat_state_change_type.md) state change in Game Chat 2. This state change occurs when a local user has enabled or disabled speech-to-text or text-to-speech conversion.  
  
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
  