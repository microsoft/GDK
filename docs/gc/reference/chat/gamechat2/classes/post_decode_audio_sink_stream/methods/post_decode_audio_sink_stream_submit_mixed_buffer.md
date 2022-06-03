---
author: M-Stahl
title: submit_mixed_buffer
description: Submits audio to the render device represented by this sink.
kindex: submit_mixed_buffer
ms.author: jkepner
ms.topic: reference
ms.date: '09/12/2019'
edited: 00/00/0000
quality: good
security: public
applies-to: pc-gdk
---

# post_decode_audio_sink_stream::submit_mixed_buffer  

Submits audio to the render device represented by this sink.  

## Syntax  
  
```cpp
void submit_mixed_buffer(  
    uint32_t byteCount,  
    void* mixedBuffer  
)  
```  
  
### Parameters  
  
*byteCount* &nbsp;&nbsp;\_In\_  
Type: uint32_t  
  
The number of bytes in the buffer.  
  
*mixedBuffer* &nbsp;&nbsp;\_In\_reads\_bytes\_(byteCount)  
Type: void*  
  
The buffer of processed and mixed audio data. Every audio buffer that is expected to play in unison for this sink's set of users must be mixed as one buffer and submitted in one call to this method. Any buffers submitted in sequential calls, will be played back sequentially. Callers are responsible for enforcing privacy and privilege between the source and sink users when mixing. Privacy and privilege relationships can be determined with [post_decode_audio_sink_stream::can_receive_audio_from_source_stream](post_decode_audio_sink_stream_can_receive_audio_from_source_stream.md). This buffer must comply with the format specified in [post_decode_audio_sink_stream::set_processed_format](post_decode_audio_sink_stream_set_processed_format.md).  
  
  
### Return value  
Type: void
  
  
## Remarks  
  
Every 40ms the next mixed buffer from this stream will be sent to render. To prevent audio hiccups, buffers for audio that should be heard continuously should be submitted to this stream at a constant rate. After this stream has been closed, calls to submit buffers will silently fail. The app can check whether a stream is open or closed by calling [post_decode_audio_sink_stream::is_open](post_decode_audio_sink_stream_is_open.md).
  
## Requirements  
  
**Header:** GameChat2.h
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[post_decode_audio_sink_stream](../post_decode_audio_sink_stream.md)  
[post_decode_audio_sink_stream::set_processed_format](post_decode_audio_sink_stream_set_processed_format.md)  
[post_decode_audio_sink_stream::is_open](post_decode_audio_sink_stream_is_open.md)
  
  