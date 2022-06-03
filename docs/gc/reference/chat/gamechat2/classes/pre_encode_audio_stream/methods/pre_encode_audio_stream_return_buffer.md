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

# pre_encode_audio_stream::return_buffer  

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
  
This is *not* for submitting processed buffers. Use [pre_encode_audio_stream::submit_buffer](pre_encode_audio_stream_submit_buffer.md). Buffers do not need to be returned in the order they were retrieved from [pre_encode_audio_stream::get_next_buffer](pre_encode_audio_stream_get_next_buffer.md). A maximum of 10 unreturned buffers can exist for any stream. When this limit is reached, the audio stream will drop any new buffers until more buffers are returned to this method.
  
## Requirements  
  
**Header:** GameChat2.h
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[pre_encode_audio_stream](../pre_encode_audio_stream.md)  
[pre_encode_audio_stream::get_next_buffer](pre_encode_audio_stream_get_next_buffer.md)
  
  