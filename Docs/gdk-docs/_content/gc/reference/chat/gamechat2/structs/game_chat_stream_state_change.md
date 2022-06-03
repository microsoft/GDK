---
author: M-Stahl
title: game_chat_stream_state_change
description: A generic, base structure representation of an event for audio manipulation streams.
kindex: game_chat_stream_state_change
ms.author: jkepner
ms.topic: reference
ms.date: '09/12/2019'
edited: '09/11/2020'
quality: good
security: public
applies-to: pc-gdk
---

# game_chat_stream_state_change
  
A generic, base structure representation of an event for audio manipulation streams.  
  
<a id="syntaxSection"></a>
  
## Syntax
  
```cpp
typedef struct game_chat_stream_state_change {  
    game_chat_stream_state_change_type state_change_type;  
    union  
    {  
        pre_encode_audio_stream* pre_encode_audio_stream;  
        post_decode_audio_source_stream* post_decode_audio_source_stream;  
        post_decode_audio_sink_stream* post_decode_audio_sink_stream;  
    };  
} game_chat_stream_state_change  
```
  
<a id="membersSection"></a>
  
### Members
  
*state_change_type*  
Type: [game_chat_stream_state_change_type](../enums/game_chat_stream_state_change_type.md)  
  
The specific type of the stream state change represented. Use this field to determine which type of stream field to read from the stream union.  
  
*pre_encode_audio_stream*  
Type: [pre_encode_audio_stream](../classes/pre_encode_audio_stream/pre_encode_audio_stream.md)\*  
  
A pointer to the pre-encode audio stream that the stream state change applies to.  
  
*post_decode_audio_source_stream*  
Type: [post_decode_audio_source_stream](../classes/post_decode_audio_source_stream/post_decode_audio_source_stream.md)\*  
  
A pointer to the post-decode audio stream that the stream state change applies to.  
  
*post_decode_audio_sink_stream*  
Type: [post_decode_audio_sink_stream](../classes/post_decode_audio_sink_stream/post_decode_audio_sink_stream.md)\*  
  
A pointer to the post-decode audio sink stream that the stream state change applies to.  
  
<a id="remarksSection"></a>
  
## Remarks
  
This structure represents a stream state change, such as the creation of a pre-encode audio stream. `game_chat_stream_state_change` structures are reported by the [chat_manager::start_processing_stream_state_changes](../classes/chat_manager/methods/chat_manager_start_processing_stream_state_changes.md) method. The app handles the represented stream state changes, and then promptly passes them back by calling the [chat_manager::finish_processing_stream_state_changes](../classes/chat_manager/methods/chat_manager_finish_processing_stream_state_changes.md) method.  
  
The *state_change_type* field indicates what kind of state change occurred. Your app should use the value of this field to determine the type of stream to which the stream state change applies, and then retrieve the corresponding pointer for that stream from the union in this structure.  
  > [!NOTE]
> Stream state changes occur only if local or remote audio manipulation is enabled when [chat_manager::initialize](../classes/chat_manager/methods/chat_manager_initialize.md) was called. For more information about enabling audio manipulation, see [Real-time audio manipulation](../../../../chat/overviews/game-chat2/real-time-audio-manipulation.md).  
  
<a id="array"></a>
  
### game_chat_stream_state_change_array  

The `game_chat_stream_state_change_array` type is a constant array of `game_chat_stream_state_change` pointers. This type is provided for convenience, and is used with the `chat_manager::start_processing_stream_state_changes` and `chat_manager::finish_processing_stream_state_changes` methods.  

```cpp
typedef class game_chat_stream_state_change * const * game_chat_stream_state_change_array;
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
  