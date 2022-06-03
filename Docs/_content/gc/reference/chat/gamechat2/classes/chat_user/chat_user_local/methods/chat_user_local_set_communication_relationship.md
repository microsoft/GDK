---
author: M-Stahl
title: set_communication_relationship
description: Sets the communication relationship between the local user and a target user.
kindex: set_communication_relationship
ms.author: jkepner
ms.topic: reference
ms.date: '09/13/2019'
edited: 00/00/0000
quality: good
security: public
applies-to: pc-gdk
---

# chat_user_local::set_communication_relationship  

Sets the communication relationship between the local user and a target user.  

## Syntax  
  
```cpp
void set_communication_relationship(  
    chat_user* targetUser,  
    game_chat_communication_relationship_flags communicationRelationship  
)  
```  
  
### Parameters  
  
*targetUser* &nbsp;&nbsp;\_In\_  
Type: [chat_user*](../../chat_user.md)  
  
The target user. The relationship is such that it can described as \"the local user is allowed to send to and/or receive from \p targetUser\".  
  
*communicationRelationship* &nbsp;&nbsp;\_In\_  
Type: [game_chat_communication_relationship_flags](../../../../enums/game_chat_communication_relationship_flags.md)  
  
The communication relationship between the local user and the target user.  
  
  
### Return value  
Type: void
  
  
## Remarks  
  
Sets the communication relationship between the local user and a target user. The target user can be either remote or local. The default relationship between the local and a remote target user will be the default relationship specified in chat_manager::initialize(). The default relationship between the local user and a local target user will always be None.
  
## Requirements  
  
**Header:** GameChat2.h
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[chat_user_local](../chat_user_local.md)  
[game_chat_communication_relationship_flags](../../../../enums/game_chat_communication_relationship_flags.md)  
[chat_user\::chat_user_local\::get_effective_communication_relationship](chat_user_local_get_effective_communication_relationship.md)
  
  