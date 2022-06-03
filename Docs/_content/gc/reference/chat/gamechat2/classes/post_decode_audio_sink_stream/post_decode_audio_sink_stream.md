---
author: M-Stahl
title: Class contents
description: Represents the outbound-data side of the remote audio manipulation pipeline.
kindex: post_decode_audio_sink_stream
ms.author: jkepner
ms.topic: reference
ms.date: '09/12/2019'
edited: '09/15/2020'
security: public
applies-to: pc-gdk
---

# post_decode_audio_sink_stream
  
Represents the outbound-data side of the remote audio manipulation pipeline.  
  
<a id="syntaxSection"></a>
  
## Syntax
  
```cpp  
class post_decode_audio_sink_stream  
```  
  
  
## Methods  
  
| Method | Description |  
| --- | --- |  
| [can_receive_audio_from_source_stream](methods/post_decode_audio_sink_stream_can_receive_audio_from_source_stream.md) | Determine whether Game Chat will allow audio communication from the users associated with a post-decode source stream to the users associated with this post-decode sink stream based on communication relationships and platform requirements such as system-level mutes. |  
| [custom_stream_context](methods/post_decode_audio_sink_stream_custom_stream_context.md) | Retrieves the app's optional, private, custom pointer-sized context value previously associated with this stream object. |  
| [get_device_id](methods/post_decode_audio_sink_stream_get_device_id.md) | Retrieves the ID of this stream's render device. |  
| [get_users](methods/post_decode_audio_sink_stream_get_users.md) | Retrieves the users associated with this stream's render device. |  
| [is_open](methods/post_decode_audio_sink_stream_is_open.md) | Indicates whether the stream is open. |  
| [set_custom_stream_context](methods/post_decode_audio_sink_stream_set_custom_stream_context.md) | Configures an optional, custom pointer-sized context value with this stream object. |  
| [set_processed_format](methods/post_decode_audio_sink_stream_set_processed_format.md) | Specifies the format of the processed audio that is submitted to Game Chat 2 for rendering through [post_decode_audio_sink_stream::submit_mixed_buffer](methods/post_decode_audio_sink_stream_submit_mixed_buffer.md). |  
| [submit_mixed_buffer](methods/post_decode_audio_sink_stream_submit_mixed_buffer.md) | Submits audio to the render device represented by this sink. |  

  
<a id="remarksSection"></a>
  
## Remarks  
  
The `post_decode_audio_sink_stream` class represents the stream to which decoded audio from remote users, retrieved from a [post_decode_audio_source_stream](../post_decode_audio_source_stream/post_decode_audio_source_stream.md) object and optionally manipulated by audio middleware, is sent for rendering to the stream's users.  
  
Only audio from a [post_decode_audio_source_stream](../post_decode_audio_source_stream/post_decode_audio_source_stream.md) with a set of users who have the appropriate privileges to talk with this stream's users should submit audio to this stream. For more information about submitting audio, see [post_decode_audio_sink_stream::submit_mixed_buffer](methods/post_decode_audio_sink_stream_submit_mixed_buffer.md).  
  
For more information about manipulating audio, see [Real-time audio manipulation](../../../../../chat/overviews/game-chat2/real-time-audio-manipulation.md).  
  
<a id="array">
  
### post_decode_audio_sink_stream_array
  
The `post_decode_audio_sink_stream_array` type is a constant array of `post_decode_audio_sink_stream` pointers. This type is provided for convenience, and is used with [chat_manager::get_post_decode_audio_sink_streams](../chat_manager/methods/chat_manager_get_post_decode_audio_sink_streams.md).  
  
```cpp
typedef class post_decode_audio_sink_stream * const * post_decode_audio_sink_stream_array;
```  
  
<a id="requirementsSection"></a>
  
## Requirements
  
**Header:** GameChat2.h  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
<a id="seealsoSection"></a>
  
## See also
  
[Intro to Game Chat 2](../../../../../chat/overviews/game-chat2/game-chat-2-intro.md)  
[pre_encode_audio_stream](../pre_encode_audio_stream/pre_encode_audio_stream.md)  
[GameChat2 members](../../gamechat2_members.md)  
  