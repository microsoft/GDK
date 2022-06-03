---
author: M-Stahl
title: game_chat_communication_relationship_adjuster_changed_state_change
description: Represents information specific to the [game_chat_state_change_type::communication_relationship_adjuster_changed](../enums/game_chat_state_change_type.md) state change.
kindex: game_chat_communication_relationship_adjuster_changed_state_change
ms.author: jkepner
ms.topic: reference
ms.date: '09/12/2019'
edited: 10/08/2020
quality: good
security: public
applies-to: pc-gdk
---

# game_chat_communication_relationship_adjuster_changed_state_change
  
Represents information specific to the [game_chat_state_change_type::communication_relationship_adjuster_changed](../enums/game_chat_state_change_type.md) state change.  
  
<a id="syntaxSection"></a>
  
## Syntax
  
```cpp
typedef struct game_chat_communication_relationship_adjuster_changed_state_change {  
    chat_user* local_user;  
    chat_user* target_user;  
} game_chat_communication_relationship_adjuster_changed_state_change  
```
  
<a id="membersSection"></a>
  
### Members
  
*local_user*&nbsp;&nbsp;  
Type: [chat_user](../classes/chat_user/chat_user.md)\*  
  
A pointer to the `chat_user` object that represents the local user on which the relationship is based.  
  
Pointers for `chat_user` objects remain valid until the user has been removed from the local [chat_manager](../classes/chat_manager/chat_manager.md) instance via the [chat_manager\::remove_user](../classes/chat_manager/methods/chat_manager_remove_user.md) method.  
  
*target_user*&nbsp;&nbsp;  
Type: [chat_user](../classes/chat_user/chat_user.md)\*  
  
A pointer to the `chat_user` object that represents the target user in the relationship. This user could be either local or remote.
  
<a id="remarksSection"></a>
  
## Remarks
  
This structure provides additional information for a [game_chat_state_change_type\::text_chat_received](../enums/game_chat_state_change_type.md) state change in Game Chat 2. This state change occurs when a local user's communication relationship adjuster with respect to another user has changed. This state change can occur under the following conditions:  
  
- A communication relationship between a particular pair of users has been set for the first time; the adjuster is expected to move into the `initializing` state.  
- The adjuster has finished initializing.  
- The adjuster has changed due to action by the user; for example, a privacy relationship has changed.  
  
To determine the effective communication relationship and the adjuster that is applied, call the [chat_user_local\::get_effective_communication_relationship](../classes/chat_user/chat_user_local/methods/chat_user_local_get_effective_communication_relationship.md) method, as illustrated in the following code example.  
  
```cpp
game_chat_communication_relationship_flags effectiveRelationship;
game_chat_communication_relationship_adjuster adjuster; 
local_user->get_effective_communication_relationship(target_user, &effectiveRelationship, &adjuster);
```
  
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
[chat_user_local\::set_communication_relationship](../classes/chat_user/chat_user_local/methods/chat_user_local_set_communication_relationship.md)  
[game_chat_communication_relationship_adjuster](../enums/game_chat_communication_relationship_adjuster.md)  
[GameChat2 members](../gamechat2_members.md)  
  