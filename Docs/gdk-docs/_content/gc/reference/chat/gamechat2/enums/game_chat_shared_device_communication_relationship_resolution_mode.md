---
author: M-Stahl
title: game_chat_shared_device_communication_relationship_resolution_mode
description: Defines how Game Chat 2 should resolve communication relationship conflicts for users that are on a shared device, such as Kinect.
kindex: game_chat_shared_device_communication_relationship_resolution_mode
ms.author: jkepner
ms.topic: reference
ms.date: '09/12/2019'
edited: 10/08/2020
security: public
applies-to: pc-gdk
---

# game_chat_shared_device_communication_relationship_resolution_mode
  
Defines how Game Chat 2 should resolve communication relationship conflicts for users that are on a shared device, such as Kinect.  
  
<a id="syntaxSection"></a>
  
## Syntax
  
```cpp
enum class game_chat_shared_device_communication_relationship_resolution_mode  
{  
    permissive,  
    restrictive  
}  
```  
  
<a id="constantsSection"></a>
  
## Constants
  
| Constant | Description |  
| --- | --- |  
| permissive | Game Chat 2 should choose the most permissive relationship when determining whether audio from a shared device should be sent to remote users or rendered for local users.<br/><br/>This choice is equivalent to applying a bitwise-OR operation on the relationship flags of the communication relationships for the users on the shared device. |  
| restrictive | Game Chat 2 should choose the most restrictive relationship when determining whether audio from a shared device should be sent to remote users or rendered for local users. |  
  
<a id="remarksSection"></a>
  
## Remarks  
  
This enumeration is used by the [chat_manager::initialize](../classes/chat_manager/methods/chat_manager_initialize.md) method to indicate how Game Chat 2 should resolve communication relationship conflicts for users that are sharing an audio device, such as a Kinect. You can call [chat_user_local::set_communication_relationship](../classes/chat_user/chat_user_local/methods/chat_user_local_set_communication_relationship.md) to set the communication relationship between a local user and a target user, and those relationships are compared when determining if audio from a shared device should be sent to remote users or rendered for local users. You can also call [chat_user_local::get_effective_communication_relationship](../classes/chat_user/chat_user_local/methods/chat_user_local_get_effective_communication_relationship.md) to get the resulting effective communication relationship that Game Chat 2 is enforcing between a local user and a target user. For more information about communication relationships, see [Using the Game Chat 2 C++ API](../../../../chat/overviews/game-chat2/using-game-chat-2.md).  
  
<a id="requirementsSection"></a>
  
## Requirements
  
**Header:** GameChat2.h  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
<a id="seealsoSection"></a>
  
## See also
  
[Intro to Game Chat 2](../../../../chat/overviews/game-chat2/game-chat-2-intro.md)  
[GameChat2 members](../gamechat2_members.md)  
  