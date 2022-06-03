---
author: M-Stahl
title: game_chat_free_memory_callback
description: Represents a callback invoked every time a previously-allocated memory buffer is no longer needed by the Game Chat 2 library and can be freed.
kindex: game_chat_free_memory_callback
ms.author: jkepner
ms.topic: reference
ms.date: '09/12/2019'
edited: 10/08/2020
security: public
applies-to: pc-gdk
---

# game_chat_free_memory_callback
  
Represents a callback invoked every time a previously-allocated memory buffer is no longer needed by the Game Chat 2 library and can be freed.  
  
<a id="syntaxSection"></a>
  
## Syntax
  
```cpp
typedef  
void  
(game_chat_callback * game_chat_free_memory_callback)(  
    _In_ _Post_invalid_ void * pointer,  
    _In_ uint32_t memoryTypeId  
    );  
```
  
<a id="parametersSection"></a>
  
### Parameters
  
*pointer* &nbsp;&nbsp;\_In\_ \_Post\_invalid\_  
Type: void\*  
  
The pointer to the memory buffer previously allocated. This value will never be a null pointer.  
  
*memoryTypeId* &nbsp;&nbsp;\_In\_  
Type: uint32_t  
  
An opaque identifier that represents the Game Chat 2 internal category for the memory being freed.  
  
<a id="remarksSection"></a>
  
## Remarks
  
This function represents a custom callback that, if available, is invoked every time a previously-allocated memory buffer is no longer needed by the Game Chat 2 library and can be freed. This callback is optional, and can be installed by calling the [chat_manager::set_memory_callbacks](../classes/chat_manager/methods/chat_manager_set_memory_callbacks.md) method. If custom callbacks are not installed, Game Chat 2 uses its own default functions to allocate and free memory. You can use the [chat_manager::get_memory_callbacks](../classes/chat_manager/methods/chat_manager_get_memory_callbacks.md) method to determine whether your app is using default or custom functions to allocate and free memory.  
  > [!NOTE]
> If you want to use custom functions to allocate and free memory, you must implement a corresponding set of [game_chat_allocate_memory_callback](game_chat_allocate_memory_callback.md) and `game_chat_free_memory_callback` functions. You cannot mix custom and default functions to allocate and free memory.  
  
This callback is invoked whenever the Game Chat 2 library has finished using a memory buffer previously returned by the app's corresponding [game_chat_allocate_memory_callback](game_chat_allocate_memory_callback.md), and indicates that the app can free the memory buffer.  
  
<a id="requirementsSection"></a>
  
## Requirements
  
**Header:** GameChat2.h  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
<a id="seealsoSection"></a>
  
## See also
  
[Intro to Game Chat 2](../../../../chat/overviews/game-chat2/game-chat-2-intro.md)  
[chat_manager](../classes/chat_manager/chat_manager.md)  
[GameChat2 members](../gamechat2_members.md)  
  