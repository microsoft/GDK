---
author: M-Stahl
title: get_available_buffer_count
description: Gets the total number of buffers available to retrieve from this stream.
kindex: get_available_buffer_count
ms.author: jkepner
ms.topic: reference
ms.date: '09/12/2019'
edited: '09/15/2020'
security: public
applies-to: pc-gdk
---

# post_decode_audio_source_stream::get_available_buffer_count
  
Gets the total number of buffers available to retrieve from this stream.  
  
<a id="syntaxSection"></a>
  
## Syntax
  
```cpp
uint32_t get_available_buffer_count(  
)  
```  
  
<a id="parametersSection"></a>
  
### Parameters
  
None.  
  
<a id="retvalSection"></a>
  
### Return value
  
Type: uint32_t  
  
Returns the total number of buffers available to retrieve from this stream.  
  
<a id="remarksSection"></a>
  
## Remarks
  
This method returns the total number of buffers available to retrieve from this stream. You can call the [post_decode_audio_source_stream::get_next_buffer](post_decode_audio_source_stream_get_next_buffer.md) method to retrieve the next available buffer. This method can be useful if you prefer to send audio through your app's audio pipeline in batches of buffers. Because only 10 buffers will be held by the stream at any given time, you should not attempt to collect batches larger than 4 buffers. You should give your app's audio processing pipeline ample time to process the buffers and return them to [post_decode_audio_source_stream::return_buffer](post_decode_audio_source_stream_return_buffer.md), to prevent overflowing your app's audio stream.  
  
For more information about manipulating post-decode chat audio data, see [Real-time audio manipulation](../../../../../../chat/overviews/game-chat2/real-time-audio-manipulation.md).  
  
<a id="requirementsSection"></a>
  
## Requirements
  
**Header:** GameChat2.h  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
<a id="seealsoSection"></a>
  
## See also
  
[Intro to Game Chat 2](../../../../../../chat/overviews/game-chat2/game-chat-2-intro.md)  
[post_decode_audio_source_stream](../post_decode_audio_source_stream.md)  
  