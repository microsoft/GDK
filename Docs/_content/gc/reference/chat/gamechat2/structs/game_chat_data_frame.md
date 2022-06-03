---
author: M-Stahl
title: game_chat_data_frame
description: Represents information about outgoing Game Chat 2 data that must be delivered to remote Game Chat 2 endpoints.
kindex: game_chat_data_frame
ms.author: jkepner
ms.topic: reference
ms.date: '09/12/2019'
edited: '09/11/2020'
security: public
applies-to: pc-gdk
---

# game_chat_data_frame
  
Represents information about outgoing Game Chat 2 data that must be delivered to remote Game Chat 2 endpoints.  
  
<a id="syntaxSection"></a>
  
## Syntax
  
```cpp
typedef struct game_chat_data_frame {  
    uint32_t target_endpoint_identifier_count;  
    uint64_t* target_endpoint_identifiers;  
    game_chat_data_transport_requirement transport_requirement;  
    uint32_t packet_byte_count;  
    uint8_t* packet_buffer;  
} game_chat_data_frame  
```
  
<a id="membersSection"></a>
  
### Members  
  
*target_endpoint_identifier_count*  
Type: uint32_t  
  
The number of remote endpoint identifiers specified in *target_endpoint_identifiers*.  
  
*target_endpoint_identifiers*&nbsp;&nbsp;\_Field\_size\_(target\_endpoint\_identifier\_count)  
Type: uint64_t*  
  
An array of one or more remote endpoint identifiers to which this data must be transmitted. The array has the number of members specified in *target_endpoint_identifier_count*.  
  
*transport_requirement*  
Type: [game_chat_data_transport_requirement](../enums/game_chat_data_transport_requirement.md)  
  
The transport requirements for the data.  
  
*packet_byte_count*  
Type: uint32_t  
  
The size of the data buffer that must be transmitted to the remote endpoints specified by *target_endpoint_identifiers*.
  
*packet_buffer*&nbsp;&nbsp;\_Field\_size\_(packet\_byte\_count)  
Type: uint8_t*  
  
A pointer to the data buffer that must be transmitted to the remote endpoints specified by *target_endpoint_identifiers*.  
  
<a id="remarksSection"></a>
  
## Remarks
  
This structure represents information about outgoing Game Chat 2 data, such as audio data, that must be delivered to remote Game Chat 2 endpoints. `game_chat_data_frame` structures are reported by the [chat_manager::start_processing_data_frames](../classes/chat_manager/methods/chat_manager_start_processing_data_frames.md) method. The app processes the data frames, and then promptly passes them back by calling the [chat_manager::finish_processing_data_frames](../classes/chat_manager/methods/chat_manager_finish_processing_data_frames.md) method.
  
The memory for the `target_endpoint_identifiers` array remains valid until this object has been returned by calling `chat_manager::finish_processing_data_frames`. The possible endpoint identifier values in that array are those that have been previously specified by calls to the [chat_manager::add_remote_user](../classes/chat_manager/methods/chat_manager_add_remote_user.md) method.  
  
<a id="array"></a>
  
### game_chat_data_frame_array  
  
The `game_chat_data_frame_array` type is a constant array of `game_chat_data_frame` pointers. This type is provided for convenience, and is used with the `chat_manager::start_processing_data_frames` and `chat_manager::finish_processing_data_frames` methods.  
  
```cpp
typedef class game_chat_data_frame * const * game_chat_data_frame_array;
```  
  
<a id="requirementsSection"></a>
  
## Requirements
  
**Header:** GameChat2.h  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
<a id="seealsoSection"></a>
  
## See also
  
[Intro to Game Chat 2](../../../../chat/overviews/game-chat2/game-chat-2-intro.md)  
[chat_manager](../classes/chat_manager/chat_manager.md)  
[GameChat2 members](../gamechat2_members.md)  
  