---
author: M-Stahl
title: get_effective_communication_relationship
description: Gets the communication relationship that Game Chat is enforcing between the local user and a target user.
kindex: get_effective_communication_relationship
ms.author: jkepner
ms.topic: reference
ms.date: '09/13/2019'
edited: 00/00/0000
quality: good
security: public
applies-to: pc-gdk
---

# chat_user_local::get_effective_communication_relationship  

Gets the communication relationship that Game Chat is enforcing between the local user and a target user.  

## Syntax  
  
```cpp
void get_effective_communication_relationship(  
    chat_user* targetUser,  
    game_chat_communication_relationship_flags* effectiveCommunicationRelationship,  
    game_chat_communication_relationship_adjuster* communicationRelationshipAdjuster  
)  
```  
  
### Parameters  
  
*targetUser* &nbsp;&nbsp;\_In\_  
Type: [chat_user*](../../chat_user.md)  
  
The target user.  
  
*effectiveCommunicationRelationship* &nbsp;&nbsp;\_Out\_  
Type: [game_chat_communication_relationship_flags*](../../../../enums/game_chat_communication_relationship_flags.md)  
  
The communication relationship that Game Chat is enforcing.  
  
*communicationRelationshipAdjuster* &nbsp;&nbsp;\_Out\_  
Type: [game_chat_communication_relationship_adjuster*](../../../../enums/game_chat_communication_relationship_adjuster.md)  
  
The adjuster being applied to the communication relationship set by the title. If effectiveCommunicationRelationship is different from what was set, this indicates why.  
  
  
### Return value  
Type: void

  
## Remarks  
  
The direction of the relationship is such that it can be described as \"the local user can perform actions defined by communicationRelationship in relation to targetUser.\" E.g. if communicationRelationship is receive_only that means \"this local user can receive communications from targetUser, but the local user cannot send communications to targetUser\". The communication relationship that Game Chat enforces for a pair of users can be different from what was set by the title because Game Chat performs extra adjustments based on privilege, privacy, and reputation.
  
## Requirements  
  
**Header:** GameChat2.h
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[chat_user_local](../chat_user_local.md)  
[game_chat_communication_relationship_flags](../../../../enums/game_chat_communication_relationship_flags.md)  
[chat_user\::chat_user_local\::set_communication_relationship](chat_user_local_set_communication_relationship.md)
  
  