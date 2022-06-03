---
author: M-Stahl
title: game_chat_allocate_memory_callback
description: A callback invoked every time a new memory buffer must be dynamically allocated by the Game Chat library.
kindex: game_chat_allocate_memory_callback
ms.author: jkepner
ms.topic: reference
ms.date: '09/12/2019'
edited: 00/00/0000
quality: good
security: public
applies-to: pc-gdk
---

# game_chat_allocate_memory_callback  

A callback invoked every time a new memory buffer must be dynamically allocated by the Game Chat library.

## Syntax

```cpp
typedef
_Ret_maybenull_
_Post_writable_byte_size_(size) void *
(game_chat_callback * game_chat_allocate_memory_callback)(
    _In_ size_t size,
    _In_ uint32_t memoryTypeId
    );
```

### Parameters  
  
*size* &nbsp;&nbsp;\_In\_  
Type: size_t 
  
The size of the allocation to be made. This value will never be zero.

*memoryTypeId* &nbsp;&nbsp;\_In\_  
Type: uint32_t 
  
A pointer to an allocated block of memory of the specified size, or a null pointer if allocation failed.

## Remarks  
  
This callback is optionally installed using the chat_manager\::set_memory_callbacks() method.

The callback must allocate and return a pointer to a contiguous block of memory of the specified size that will
remain valid until the app's corresponding [game_chat_free_memory_callback](game_chat_free_memory_callback.md) is invoked to release it.
If this is not possible, the callback must return a null pointer to fail the allocation. Memory allocation failures
are sometimes considered benign but will usually cause current Game Chat library operation(s) to fail.

## Requirements  
  
**Header:** GameChat2.h
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[GameChat2 members](../gamechat2_members.md)  
[chat_manager\::get_memory_callbacks](../classes/chat_manager/methods/chat_manager_get_memory_callbacks.md)  
[chat_manager\::set_memory_callbacks](../classes/chat_manager/methods/chat_manager_set_memory_callbacks.md)
  
  