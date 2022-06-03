---
author: M-Stahl
title: game_chat_state_change
description: Represents a generic, base structure for an event, change in state, or outgoing data.
kindex: game_chat_state_change
ms.author: jkepner
ms.topic: reference
ms.date: '09/12/2019'
edited: '09/11/2020'
security: public
applies-to: pc-gdk
---

# game_chat_state_change
  
Represents a generic, base structure for an event, change in state, or outgoing data.  
  
<a id="syntaxSection"></a>
  
## Syntax
  
```cpp
typedef struct game_chat_state_change {  
    game_chat_state_change_type state_change_type;  
} game_chat_state_change  
```
  
<a id="membersSection"></a>
  
### Members  
  
*state_change_type*  
Type: [game_chat_state_change_type](../enums/game_chat_state_change_type.md)  
  
The specific type of the state change represented. Use this field to determine which corresponding derived structure is represented by this *game_chat_state_change* structure header.  
  
<a id="remarksSection"></a>
  
## Remarks
  
This base structure represents a state change, such as the receipt of a text chat. `game_chat_state_change` structures are reported by the [chat_manager::start_processing_state_changes](../classes/chat_manager/methods/chat_manager_start_processing_state_changes.md) method. The app handles the represented state changes, and then promptly passes them back by calling the [chat_manager::finish_processing_state_changes](../classes/chat_manager/methods/chat_manager_finish_processing_state_changes.md) method.

The *state_change_type* field indicates what kind of state change occurred. Your app should cast this base structure to the indicated derived structure to retrieve additional, event-specific information. The following structures are derived from this base structure:  
  
- [game_chat_communication_relationship_adjuster_changed_state_change](game_chat_communication_relationship_adjuster_changed_state_change.md)  
- [game_chat_text_chat_received_state_change](game_chat_text_chat_received_state_change.md)  
- [game_chat_text_conversion_preference_changed_state_change](game_chat_text_conversion_preference_changed_state_change.md)  
- [game_chat_transcribed_chat_received_state_change](game_chat_transcribed_chat_received_state_change.md)  
  
<a id="array"></a>
  
### game_chat_state_change_array  

The `game_chat_state_change_array` type is a constant array of `game_chat_state_change` pointers. This type is provided for convenience, and is used with the `chat_manager::start_processing_state_changes` and `chat_manager::finish_processing_state_changes` methods.  
  
```cpp
typedef const game_chat_state_change * const * game_chat_state_change_array;
```
  
<a id="requirementsSection"></a>
  
## Requirements
  
**Header:** GameChat2.h  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
<a id="seealsoSection"></a>
  
## See also
  
[Intro to Game Chat 2](../../../../chat/overviews/game-chat2/game-chat-2-intro.md)  
[chat_manager](../classes/chat_manager/chat_manager.md)  
[GameChat2 members](../gamechat2_members.md)  
  