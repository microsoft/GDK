---
author: M-Stahl
title: finish_processing_state_changes
description: Returns an array of Game Chat state changes that were being processed.
kindex: finish_processing_state_changes
ms.author: jkepner
ms.topic: reference
ms.date: '09/12/2019'
edited: 00/00/0000
quality: good
security: public
applies-to: pc-gdk
---

# chat_manager::finish_processing_state_changes  

Returns an array of Game Chat state changes that were being processed.  

## Syntax  
  
```cpp
void finish_processing_state_changes(  
    game_chat_state_change_array stateChanges  
)  
```  
  
### Parameters  
  
*stateChanges* &nbsp;&nbsp;\_In\_  
Type: game_chat_state_change_array  
  
The pointer to the array of changes previously returned by chat_manager::start_processing_state_changes() that have now been handled by the app.  
  
  
### Return value  
Type: void
    
  
## Remarks  
  
This method informs the Game Chat library that all state changes reported by a previous call to chat_manager\::start_processing_state_changes() have now been handled by the app, so their associated resources can be reclaimed. You must call chat_manager\::finish_processing_state_changes() with the same pointer returned by chat_manager\::start_processing_state_changes() before you're permitted to call chat_manager\::start_processing_state_changes() again. You must do so even if 0 state change entries had been returned.

For best results, you should minimize the time you spend handling state changes before calling chat_manager\::finish_processing_state_changes().
  
## Requirements  
  
**Header:** GameChat2.h
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[chat_manager](../chat_manager.md)  
[game_chat_state_change](../../../structs/game_chat_state_change.md)  
[game_chat_state_change_array](../../../structs/game_chat_state_change.md#game_chat_state_change_array)  
[chat_manager::start_processing_state_changes](chat_manager_start_processing_state_changes.md)
  
  