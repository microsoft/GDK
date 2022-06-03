---
author: M-Stahl
title: start_processing_state_changes
description: Retrieves an array of all Game Chat state changes to process since the last such call.
kindex: start_processing_state_changes
ms.author: jkepner
ms.topic: reference
ms.date: '09/12/2019'
edited: 00/00/0000
quality: good
security: public
applies-to: pc-gdk
---

# chat_manager::start_processing_state_changes  

Retrieves an array of all Game Chat state changes to process since the last such call.  

## Syntax  
  
```cpp
void start_processing_state_changes(  
    uint32_t* stateChangeCount,  
    game_chat_state_change_array* stateChanges  
)  
```  
  
### Parameters  
  
*stateChangeCount* &nbsp;&nbsp;\_Out\_  
Type: uint32_t*  
  
A place to write the number of game_chat_state_change entries for the app to handle in the *stateChanges* array.  
  
*stateChanges* &nbsp;&nbsp;\_Outptr\_result\_buffer\_(\*stateChangeCount)  
Type: game_chat_state_change_array\*  
  
A place to store a pointer to the array of all game_chat_state_change entries for the app to handle and then pass to chat_manager\::finish_processing_state_changes().  
  
  
### Return value  
Type: void
  
  
## Remarks  
  
This method provides a list of all changes currently available for the app since the last call to this method. The app should use the provided array of 0 or more changes to update its own state or UI, and then call chat_manager\::finish_processing_state_changes() with them in a timely manner.

If you call chat_manager\::start_processing_state_changes() again without having called chat_manager\::finish_processing_state_changes() on the list of state change objects returned by a previous call, this method will throw an exception. You must always call chat_manager::finish_processing_state_changes() with the values returned by chat_manager\::start_processing_state_changes(), even if it returns 0 state change entries.  

Once chat_manager\::start_processing_state_changes() has been called, chat_manager\::remove_user() must not be called until after the corresponding call to chat_manager\::finish_processing_state_changes(). Calling chat_manager\::remove_user() while state changes are being processed will invalidate the memory associated with the removed user, even if a pointer to the memory associated with that user was returned in a state change.
  
## Requirements  
  
**Header:** GameChat2.h
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[chat_manager](../chat_manager.md)  
[game_chat_state_change](../../../structs/game_chat_state_change.md)  
[game_chat_state_change_array](../../../structs/game_chat_state_change.md#game_chat_state_change_array)  
[chat_manager::finish_processing_state_changes](chat_manager_finish_processing_state_changes.md)  
[chat_manager::remove_user](chat_manager_remove_user.md)
  
  