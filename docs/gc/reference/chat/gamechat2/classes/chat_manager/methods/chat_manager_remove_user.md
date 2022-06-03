---
author: M-Stahl
title: remove_user
description: Removes a user, either local or remote, from the local chat_manager instance.
kindex: remove_user
ms.author: jkepner
ms.topic: reference
ms.date: '09/12/2019'
edited: 00/00/0000
quality: good
security: public
applies-to: pc-gdk
---

# chat_manager::remove_user  

Removes a user, either local or remote, from the local chat_manager instance.  

## Syntax  
  
```cpp
void remove_user(  
    chat_user* chatUser  
)  
```  
  
### Parameters  
  
*chatUser* &nbsp;&nbsp;\_Post\_invalid\_  
Type: [chat_user*](../../chat_user/chat_user.md)  
  
The chat_user to remove.  
  
  
### Return value  
Type: void
  
  
## Remarks  
  
This method allows game chat to reclaim resources associated with this user.

chat_manager\::remove_user() must not be called while processing state changes (i.e. after chat_manager\::start_processing_state_changes() has been called and before the corresponding call to chat_manager\::finish_processing_state_changes()). Calling chat_manager\::remove_user() while state changes are being processed can invalidate the memory associated with the removed user, even if a pointer to the memory associated with that user was returned in a state change. If audio manipulation is enabled, the memory associated with a removed user will remain valid until the audio manipulation streams associated with the user have been destroyed.
  
## Requirements  
  
**Header:** GameChat2.h
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[chat_manager](../chat_manager.md)  
[chat_user](../../chat_user/chat_user.md)  
[chat_manager::add_remote_user](chat_manager_add_remote_user.md)  
[chat_manager::remove_user](chat_manager_remove_user.md)  
[chat_manager::start_processing_state_changes](chat_manager_start_processing_state_changes.md)  
[chat_manager::finish_processing_state_changes](chat_manager_finish_processing_state_changes.md)
  
  