---
author: M-Stahl
title: get_memory_callbacks
description: Retrieves the current memory allocation and freeing callbacks currently used by the Game Chat library.
kindex: get_memory_callbacks
ms.author: jkepner
ms.topic: reference
ms.date: '09/12/2019'
edited: '09/10/2020'
security: public
applies-to: pc-gdk
---

# chat_manager::get_memory_callbacks
  
Retrieves the current memory allocation and freeing callbacks used by the Game Chat 2 library.  
  
<a id="syntaxSection"></a>
  
## Syntax
  
```cpp
void get_memory_callbacks(  
    game_chat_allocate_memory_callback* allocateMemoryCallback,  
    game_chat_free_memory_callback* freeMemoryCallback  
)  
```  
  
<a id="parametersSection"></a>
  
### Parameters
  
*allocateMemoryCallback* &nbsp;&nbsp;\_Out\_  
Type: [game_chat_allocate_memory_callback](../../../functions/game_chat_allocate_memory_callback.md)\*  
  
A pointer to the memory allocation callback currently used by the Game Chat 2 library.  
  
*freeMemoryCallback* &nbsp;&nbsp;\_Out\_  
Type: [game_chat_free_memory_callback](../../../functions/game_chat_free_memory_callback.md)\*  
  
A pointer to the memory freeing callback currently used by the Game Chat 2 library.  
  
<a id="retvalSection"></a>
  
### Return value
  
Type: void  
  
None.  
  
<a id="remarksSection"></a>
  
## Remarks
  
This method retrieves the pointers to the current memory allocation & freeing callbacks that service requests to dynamically allocate and free memory by the Game Chat 2 library.  You can call the [chat_manager::set_memory_callbacks](chat_manager_set_memory_callbacks.md) method to set the memory allocation and freeing callbacks used by the Game Chat 2 library when a memory buffer must be dynamically allocated and freed.  
  
As with the `chat_manager::set_memory_callbacks` method, this method does not require the [chat_manager::initialize](chat_manager_initialize.md) method to have been called first.  
  
<a id="requirementsSection"></a>
  
## Requirements
  
**Header:** GameChat2.h  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
<a id="seealsoSection"></a>
  
## See also
  
[Intro to Game Chat 2](../../../../../../chat/overviews/game-chat2/game-chat-2-intro.md)  
[chat_manager](../chat_manager.md)  
  