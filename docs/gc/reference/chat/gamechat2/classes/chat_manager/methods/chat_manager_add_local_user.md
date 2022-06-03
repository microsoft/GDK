---
author: M-Stahl
title: add_local_user
description: Adds a local user to the local chat_manager instance.
kindex: add_local_user
ms.author: jkepner
ms.topic: reference
ms.date: '09/12/2019'
edited: 00/00/0000
quality: good
security: public
applies-to: pc-gdk
---

# chat_manager::add_local_user  

Adds a local user to the local chat_manager instance.  

## Syntax  
  
```cpp
chat_user* add_local_user(  
    PCWSTR xboxUserId  
)  
```  
  
### Parameters  
  
*xboxUserId* &nbsp;&nbsp;\_In\_  
Type: PCWSTR  
  
The Xbox User ID of the local user to add.  
  
  
### Return value  
Type: chat_user*

  
## Remarks  

All local users added to the Game Chat 2 instance need to be added with [XUserAddAsync](../../../../../system/xuser/functions/xuseraddasync.md) first.

The user will be added unconditionally, unless the total number of local and remote users is equal to the max user count that was indicated in chat_manager\::initialize().

The return value is a pointer to the chat_user object associated with this user. If the Xbox User ID is invalid, the user's chat_indicator value will be game_chat_user_chat_indicator\::platform_restricted.  

A typical pattern would be: 

```cpp
chat_user* newLocalChatUser = chat_manager::singleton_instance().add_local_user(&amp;lt;local_user_xuid&amp;gt;);

size_t chatUserCount; 
chat_user_array chatUsers; 
chat_manager::singleton_instance().get_remote_chat_users(&chatUserCount, &chatUsers); 
for (uint32_t chatUserIndex = 0; chatUserIndex < chatUsercount; ++chatUserIndex) 
{ 
    chat_user* chatUser = chatUsers[chatUserIndex]; 
    game_chat_communication_relationship_flags relationship = game_chat_communication_relationship_flags::none; 
    if (chatUser can send and receive to/from newLocalChatUser) 
    { 
        relationship = c_communicationRelationshipSendAndReceiveAll; 
    } 
    else if (chatUser can send to newLocalChatUser) 
    { 
        relationship = c_communicationRelationshipSendAll; 
    } 
    else if (chatUser can receive from newLocalChatUser) 
    { 
        relationship = c_communicationRelationshipReceiveAll; 
    } 

    newLocalChatUser->set_communication_relationship(chatUser, relationship); 
} 
```
  
## Requirements  
  
**Header:** GameChat2.h
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[chat_manager](../chat_manager.md)  
[chat_user](../../chat_user/chat_user.md)  
[chat_manager::add_remote_user](chat_manager_add_remote_user.md)  
[chat_manager::remove_user](chat_manager_remove_user.md)
  
  