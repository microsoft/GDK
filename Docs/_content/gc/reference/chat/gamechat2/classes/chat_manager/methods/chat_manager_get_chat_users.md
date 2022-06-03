---
author: M-Stahl
title: get_chat_users
description: Retrieves the collection of users that have been added to the chat instance.
kindex: get_chat_users
ms.author: jkepner
ms.topic: reference
ms.date: '09/12/2019'
edited: '09/10/2020'
security: public
applies-to: pc-gdk
---

# chat_manager::get_chat_users
  
Retrieves the collection of local and remote users that have been added to the chat instance.  
  
<a id="syntaxSection"></a>
  
## Syntax
  
```cpp
void get_chat_users(  
    uint32_t* chatUserCount,  
    chat_user_array* chatUsers  
)  
```  
  
<a id="syntaxSection"></a>
  
### Parameters
  
*chatUserCount* &nbsp;&nbsp;\_Out\_  
Type: uint32_t\*  
  
The total number of local and remote users that have been added to the chat instance.  
  
*chatUsers* &nbsp;&nbsp;\_Outptr\_result\_buffer\_(\*chatUserCount)  
Type: [chat_user_array](../../chat_user/chat_user.md#chat_user_array)\*  
  
An array of [chat_user](../../chat_user/chat_user.md) pointers that represents the local and remote users that have been added to the chat instance.  
  
<a id="retvalSection"></a>
  
### Return value
  
Type: void  
  
None.  
  
<a id="remarksSection"></a>
  
## Remarks  
  
This method retrieves the collection of local and remote users that have been added to the chat instance, returning the total number of users in `chatUserCount` and an array of [chat_user](../../chat_user/chat_user.md) pointers, each of which represents a local or remote user, in `chatUsers`. The array pointer returned in `chatUsers` is valid until the next call to any of the following methods:
  
- [chat_manager::add_local_user](chat_manager_add_local_user.md)  
- [chat_manager::add_remote_user](chat_manager_add_remote_user.md)  
- [chat_manager::cleanup](chat_manager_cleanup.md)  
- [chat_manager::remove_user](chat_manager_remove_user.md)  
  
The individual `chat_user` objects remain valid until the user has been removed by a call to `chat_manager::remove_user`. For more information about initializing and cleaning up a chat instance, see [Using the Game Chat 2 C++ API](../../../../../../chat/overviews/game-chat2/using-game-chat-2.md).  
  
<a id="requirementsSection"></a>
  
## Requirements
  
**Header:** GameChat2.h  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
<a id="seealsoSection"></a>
  
## See also
  
[Intro to Game Chat 2](../../../../../../chat/overviews/game-chat2/game-chat-2-intro.md)  
[chat_user](../../chat_user/chat_user.md)  
[chat_manager](../chat_manager.md)  
  