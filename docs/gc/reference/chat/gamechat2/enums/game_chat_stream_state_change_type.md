---
author: M-Stahl
title: game_chat_stream_state_change_type
description: Defines the types of [game_chat_stream_state_change](../structs/game_chat_stream_state_change.md) objects that can be reported by [chat_manager::start_processing_stream_state_changes](../classes/chat_manager/methods/chat_manager_start_processing_stream_state_changes.md).
kindex: game_chat_stream_state_change_type
ms.author: jkepner
ms.topic: reference
ms.date: '09/12/2019'
edited: 10/08/2020
security: public
applies-to: pc-gdk
---

# game_chat_stream_state_change_type  

Defines the types of [game_chat_stream_state_change](../structs/game_chat_stream_state_change.md) objects that can be reported by [chat_manager::start_processing_stream_state_changes](../classes/chat_manager/methods/chat_manager_start_processing_stream_state_changes.md).  

<a id="syntaxSection"></a>
  
## Syntax  
  
```cpp
enum class game_chat_stream_state_change_type  : int64_t  
{  
    pre_encode_audio_stream_created,  
    pre_encode_audio_stream_closed,  
    pre_encode_audio_stream_destroyed,  
    post_decode_audio_source_stream_created,  
    post_decode_audio_source_stream_closed,  
    post_decode_audio_source_stream_destroyed,  
    post_decode_audio_sink_stream_created,  
    post_decode_audio_sink_stream_closed,  
    post_decode_audio_sink_stream_destroyed,  
}  
```  
  
<a id="constantsSection"></a>
  
## Constants
  
| Constant | Description |  
| --- | --- |  
| pre_encode_audio_stream_created | A pre-encode audio stream has been created by Game Chat 2 for a capture device. <br/><br/>Use this state change as an opportunity to take care of any initialization that needs to happen before the stream starts returning buffers via [pre_encode_audio_stream\::get_next_buffer](../classes/pre_encode_audio_stream/methods/pre_encode_audio_stream_get_next_buffer.md) or starts accepting processed audio via [pre_encode_audio_stream\::submit_buffer](../classes/pre_encode_audio_stream/methods/pre_encode_audio_stream_submit_buffer.md). After this state change is returned to [chat_manager\::finish_processing_stream_state_changes](../classes/chat_manager/methods/chat_manager_finish_processing_stream_state_changes.md), the stream becomes available for querying from [chat_manager\::get_pre_encode_audio_streams](../classes/chat_manager/methods/chat_manager_get_pre_encode_audio_streams.md). In addition, the pre-encode audio stream begins queueing audio accessible from [pre_encode_audio_stream\::get_next_buffer](../classes/pre_encode_audio_stream/methods/pre_encode_audio_stream_get_next_buffer.md) and starts accepting processed audio via [pre_encode_audio_stream\::submit_buffer](../classes/pre_encode_audio_stream/methods/pre_encode_audio_stream_submit_buffer.md). The stream is valid until an associated [game_chat_stream_state_change_type\::pre_encode_audio_stream_destroyed](game_chat_stream_state_change_type.md) stream state change is returned to Game Chat 2. This state change can occur only if pre-encode audio stream processing has been enabled. |  
| pre_encode_audio_stream_closed | A pre-encode audio stream for a capture device no longer returns buffers via [pre_encode_audio_stream\::get_next_buffer](../classes/pre_encode_audio_stream/methods/pre_encode_audio_stream_get_next_buffer.md), and no longer accepts more buffers via [pre_encode_audio_stream\::submit_buffer](../classes/pre_encode_audio_stream/methods/pre_encode_audio_stream_submit_buffer.md). <br/><br/>This state change might be due to the capture device becoming unavailable or the users associated with the stream changing, if the stream represented a shared capture device. The stream is still valid, but any buffers submitted to the stream are silently dropped and calls to [pre_encode_audio_stream\::set_processed_format](../classes/pre_encode_audio_stream/methods/pre_encode_audio_stream_set_processed_format.md) fatally fail. After this state change is returned to [chat_manager\::finish_processing_stream_state_changes](../classes/chat_manager/methods/chat_manager_finish_processing_stream_state_changes.md), the stream is no longer available to use for audio manipulation and should be cleaned up so that it can be destroyed and reclaimed by Game Chat 2. This stream is valid until an associated [game_chat_stream_state_change_type\::pre_encode_audio_stream_destroyed](game_chat_stream_state_change_type.md) stream state change is returned to Game Chat 2. This state change can occur only if pre-encode audio stream processing has been enabled. |  
| pre_encode_audio_stream_destroyed | A capture device's corresponding pre-encode audio stream will be destroyed by Game Chat 2. <br/><br/>This state change will occur only when all buffers retrieved from [pre_encode_audio_stream\::get_next_buffer](../classes/pre_encode_audio_stream/methods/pre_encode_audio_stream_get_next_buffer.md) have been returned to [pre_encode_audio_stream\::return_buffer](../classes/pre_encode_audio_stream/methods/pre_encode_audio_stream_return_buffer.md), and no buffers submitted to [pre_encode_audio_stream\::submit_buffer](../classes/pre_encode_audio_stream/methods/pre_encode_audio_stream_submit_buffer.md) are in use by the stream. After returning this state change to [chat_manager\::finish_processing_stream_state_changes](../classes/chat_manager/methods/chat_manager_finish_processing_stream_state_changes.md), the corresponding stream is no longer valid. Any custom stream context assigned to this stream should be cleaned up before this state change is returned. This state change can occur only if pre-encode audio stream processing has been enabled. |  
| post_decode_audio_source_stream_created | A post-decode audio source stream has been created by Game Chat 2. <br/><br/>Use this state change as an opportunity to take care of any initialization that needs to happen before this stream starts queueing audio. After this state change is returned to [chat_manager\::finish_processing_stream_state_changes](../classes/chat_manager/methods/chat_manager_finish_processing_stream_state_changes.md), the source stream becomes available for querying from [chat_manager\::get_post_decode_audio_source_streams](../classes/chat_manager/methods/chat_manager_get_post_decode_audio_source_streams.md), and begins queuing audio accessible from [post_decode_audio_source_stream\::get_next_buffer](../classes/post_decode_audio_source_stream/methods/post_decode_audio_source_stream_get_next_buffer.md). The stream is valid until an associated [game_chat_stream_state_change_type\::post_decode_audio_source_stream_destroyed](game_chat_stream_state_change_type.md) stream state change is returned to Game Chat 2. This state change can occur only if remote audio stream processing has been enabled. |  
| post_decode_audio_source_stream_closed | A post-decode audio source stream for a set of remote users no longer returns buffers through [post_decode_audio_source_stream\::get_next_buffer](../classes/post_decode_audio_source_stream/methods/post_decode_audio_source_stream_get_next_buffer.md). <br/><br/>This state change might be due to the remote capture device becoming unavailable or the users associated with the stream changing if the stream represented a shared remote capture device. The stream is still valid, and should be used for returning buffers to Game Chat 2 through [post_decode_audio_source_stream\::return_buffer](../classes/post_decode_audio_source_stream/methods/post_decode_audio_source_stream_return_buffer.md). After this state change is returned to [chat_manager\::finish_processing_stream_state_changes](../classes/chat_manager/methods/chat_manager_finish_processing_stream_state_changes.md), the stream is no longer available to use for audio manipulation and should be cleaned up so that it can be destroyed and reclaimed by Game Chat 2. The stream is valid until an associated [game_chat_stream_state_change_type\::post_decode_audio_source_stream_destroyed](game_chat_stream_state_change_type.md) stream state change is returned to Game Chat 2. This state change can occur only if remote audio stream processing has been enabled. |  
| post_decode_audio_source_stream_destroyed | A post-decode audio source stream will be destroyed by Game Chat 2. <br/><br/>This state change will occur only when all buffers retrieved from [post_decode_audio_source_stream\::get_next_buffer](../classes/post_decode_audio_source_stream/methods/post_decode_audio_source_stream_get_next_buffer.md) have been returned to [post_decode_audio_source_stream\::return_buffer](../classes/post_decode_audio_source_stream/methods/post_decode_audio_source_stream_return_buffer.md). After returning this state change to [chat_manager\::finish_processing_stream_state_changes](../classes/chat_manager/methods/chat_manager_finish_processing_stream_state_changes.md), the corresponding stream is valid. Any custom context assigned to this stream should be cleaned up before this state change is returned. This state change can occur only if remote audio stream processing has been enabled. |  
| post_decode_audio_sink_stream_created | A post-decode audio sink stream for a local render device has been created by Game Chat 2. <br/><br/>Use this state change as an opportunity to take care of any initialization that needs to happen before this stream starts to accept audio data via [post_decode_audio_sink_stream\::submit_mixed_buffer](../classes/post_decode_audio_sink_stream/methods/post_decode_audio_sink_stream_submit_mixed_buffer.md). After this state change is returned to [chat_manager\::finish_processing_stream_state_changes](../classes/chat_manager/methods/chat_manager_finish_processing_stream_state_changes.md), the sink stream becomes available for querying from [chat_manager\::get_post_decode_audio_sink_streams](../classes/chat_manager/methods/chat_manager_get_post_decode_audio_sink_streams.md) and begins accepting processed audio via [post_decode_audio_sink_stream\::submit_mixed_buffer](../classes/post_decode_audio_sink_stream/methods/post_decode_audio_sink_stream_submit_mixed_buffer.md). The stream is valid until an associated [game_chat_stream_state_change_type\::post_decode_audio_sink_stream_destroyed](game_chat_stream_state_change_type.md) stream state change is returned to Game Chat 2. This state change can occur only if remote audio stream processing has been enabled. |  
| post_decode_audio_sink_stream_closed | A post-decode audio sink stream for a local render device no longer accepts any more buffers through [post_decode_audio_sink_stream\::submit_mixed_buffer](../classes/post_decode_audio_sink_stream/methods/post_decode_audio_sink_stream_submit_mixed_buffer.md). <br/><br/>This state change might be due to the render device becoming unavailable or the users associated with the render device changing if the stream represented a shared render device. The stream is still valid, but any buffers submitted to the stream are silently dropped and calls to [post_decode_audio_sink_stream\::set_processed_format](../classes/post_decode_audio_sink_stream/methods/post_decode_audio_sink_stream_set_processed_format.md) fatally fail. After this state change is returned to [chat_manager\::finish_processing_stream_state_changes](../classes/chat_manager/methods/chat_manager_finish_processing_stream_state_changes.md), the stream is no longer available to use for audio manipulation and should be cleaned up so that it can be destroyed and reclaimed by Game Chat 2. The stream is valid until an associated [game_chat_stream_state_change_type\::post_decode_audio_sink_stream_destroyed](game_chat_stream_state_change_type.md) stream state change is returned to Game Chat 2. This state change can occur only if remote audio stream processing has been enabled. |  
| post_decode_audio_sink_stream_destroyed | A post-decode audio sink stream will be destroyed by Game Chat 2. <br/><br/>This state change will occur only when no buffers submitted to [post_decode_audio_sink_stream\::submit_mixed_buffer](../classes/post_decode_audio_sink_stream/methods/post_decode_audio_sink_stream_submit_mixed_buffer.md) are in use by the stream. After returning this state change to [chat_manager\::finish_processing_stream_state_changes](../classes/chat_manager/methods/chat_manager_finish_processing_stream_state_changes.md), the corresponding stream is no longer valid. Any custom context assigned to this stream should be cleaned up before this state change is returned. This state change can occur only if remote audio stream processing has been enabled. |  
  
<a id="remarksSection"></a>
  
## Remarks
  
This enumeration is used by the `state_change_type` member of a `game_chat_stream_state_change` object to define the type of state change represented by that object. You can cast the `game_chat_stream_state_change` structure to the structure that corresponds to the constant returned by the `state_change_type` member, to get more information about that specific type of state change. For more information about processing stream state changes, see [Real-time audio manipulation](../../../../chat/overviews/game-chat2/real-time-audio-manipulation.md).  
  
<a id="requirementsSection"></a>
  
## Requirements
  
**Header:** GameChat2.h  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
<a id="seealsoSection"></a>
  
## See also
  
[Intro to Game Chat 2](../../../../chat/overviews/game-chat2/game-chat-2-intro.md)  
[GameChat2 members](../gamechat2_members.md)  
  