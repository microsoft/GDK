---
author: M-Stahl
title: return_buffer
description: Tells Game Chat it can reclaim memory associated with this buffer.
kindex: return_buffer
ms.author: jkepner
ms.topic: reference
ms.date: '09/12/2019'
edited: 00/00/0000
quality: good
security: public
applies-to: pc-gdk
---

# post_decode_audio_source_stream::return_buffer  

Tells Game Chat it can reclaim memory associated with this buffer.  

## Syntax  
  
```cpp
void return_buffer(  
    void* buffer  
)  
```  
  
### Parameters  
  
*buffer* &nbsp;&nbsp;\_In\_  
Type: void*  
     
  
  
### Return value  
Type: void
   
  
## Remarks  
  
This is *not* for submitting processed buffers. Use [post_decode_audio_sink_stream::submit_mixed_buffer](../../post_decode_audio_sink_stream/methods/post_decode_audio_sink_stream_submit_mixed_buffer.md). Buffers do not need to be returned in the order they were retrieved from [post_decode_audio_source_stream::get_next_buffer](post_decode_audio_source_stream_get_next_buffer.md). A maximum of 10 unreturned buffers can exist for any stream. When this limit is reached, the post-decode audio source stream will drop any new buffers until more buffers are returned to this method.
  
## Requirements  
  
**Header:** GameChat2.h
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[post_decode_audio_source_stream](../post_decode_audio_source_stream.md)  
[post_decode_audio_source_stream::get_next_buffer](post_decode_audio_source_stream_get_next_buffer.md)
  
  