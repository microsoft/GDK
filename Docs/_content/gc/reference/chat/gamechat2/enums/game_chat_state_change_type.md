---
author: M-Stahl
title: game_chat_state_change_type
description: Defines the types of [game_chat_state_change](../structs/game_chat_state_change.md) objects that can be reported by [chat_manager::start_processing_state_changes](../classes/chat_manager/methods/chat_manager_start_processing_state_changes.md).
kindex: game_chat_state_change_type
ms.author: jkepner
ms.topic: reference
ms.date: '09/12/2019'
edited: 10/08/2020
security: public
applies-to: pc-gdk
---

# game_chat_state_change_type
  
Defines the types of [game_chat_state_change](../structs/game_chat_state_change.md) objects that can be reported by [chat_manager::start_processing_state_changes](../classes/chat_manager/methods/chat_manager_start_processing_state_changes.md).  
  
<a id="syntaxSection"></a>
  
## Syntax
  
```cpp
enum class game_chat_state_change_type  : int64_t  
{  
    text_chat_received,  
    transcribed_chat_received,  
    text_conversion_preference_changed,  
    communication_relationship_adjuster_changed,  
}  
```  
  
<a id="constantsSection"></a>
  
## Constants
  
| Constant | Description |  
| --- | --- |  
| text_chat_received | A player-to-player text communication message has arrived.<br/><br/>Cast the `game_chat_state_change` object to a [game_chat_text_chat_received_state_change](../structs/game_chat_text_chat_received_state_change.md) object for more information. |  
| transcribed_chat_received | A remote player's voice communication has been transcribed and should be displayed to one or more local users.<br/><br/>Cast the `game_chat_state_change` object to a [game_chat_transcribed_chat_received_state_change](../structs/game_chat_transcribed_chat_received_state_change.md) object for more information. |  
| text_conversion_preference_changed | A local user has enabled or disabled speech-to-text or text-to-speech conversion.<br/><br/>Cast the `game_chat_state_change` object to a [game_chat_text_conversion_preference_changed_state_change](../structs/game_chat_text_conversion_preference_changed_state_change.md) object for more information. |  
| communication_relationship_adjuster_changed | A local user's communication relationship adjuster with respect to another user has changed.<br/><br/>Cast the `game_chat_state_change` object to a [game_chat_communication_relationship_adjusters_changed](../structs/game_chat_communication_relationship_adjuster_changed_state_change.md) object for more information. |  
  
<a id="remarksSection"></a>
  
## Remarks
  
This enumeration is used by the `state_change_type` member of a `game_chat_state_change` object to define the type of state change represented by that object. You can cast the `game_chat_state_change` structure to the structure that corresponds to the constant returned by the `state_change_type` member, to get more information about that specific type of state change. For more information about processing state changes, see [Using the Game Chat 2 C++ API](../../../../chat/overviews/game-chat2/using-game-chat-2.md).  
  
<a id="requirementsSection"></a>
  
## Requirements
  
**Header:** GameChat2.h  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
<a id="seealsoSection"></a>
  
## See also
  
[Intro to Game Chat 2](../../../../chat/overviews/game-chat2/game-chat-2-intro.md)  
[game_chat_stream_state_change](../structs/game_chat_stream_state_change.md)  
[GameChat2 members](../gamechat2_members.md)  
  