---
author: M-Stahl
title: get_next_buffer
description: Gets the next buffer available in the stream.
kindex: get_next_buffer
ms.author: jkepner
ms.topic: reference
ms.date: '09/12/2019'
edited: 00/00/0000
quality: good
security: public
applies-to: pc-gdk
---

# pre_encode_audio_stream::get_next_buffer  

Gets the next buffer available in the stream.  

## Syntax  
  
```cpp
void get_next_buffer(  
    uint32_t* byteCount,  
    _Outptr_result_bytebuffer_maybenull_ *byteCount  
)  
```  
  
### Parameters  
  
*byteCount* &nbsp;&nbsp;\_Out\_  
Type: uint32_t*  
  
A pointer to the number of bytes in the buffer. The number of samples in this buffer can be derived using the bits per sample value in this stream's pre-processed format. If no buffer is available, *byteCount will equal zero.  
  
**byteCount* &nbsp;&nbsp;  
Type: \_Outptr\_result\_bytebuffer\_maybenull\_  
    
  
  
### Return value  
Type: void
  
  
## Remarks  
  
If there are any new audio buffers for this stream, they will be available for processing every 40ms. Buffers returned by this method must be released to [pre_encode_audio_stream::return_buffer](pre_encode_audio_stream_return_buffer.md) when they are done being used. A maximum of 10 buffers will be held on each pre-encode audio stream. Once this limit is reached, new buffers will be dropped, and old buffers must be released with [pre_encode_audio_stream::return_buffer](pre_encode_audio_stream_return_buffer.md) before new buffers will become available. Pre-encode audio streams can be filtered by a minimum amount of available data using [pre_encode_audio_stream::get_available_buffer_count](pre_encode_audio_stream_get_available_buffer_count.md). Buffers delivered through this stream have already been preprocessed with Voice Activity Detection (VAD) and Automatic Gain Control (AGC). To interpret the buffer, the caller should use [pre_encode_audio_stream::get_pre_processed_format](pre_encode_audio_stream_get_pre_processed_format.md) to examine the number of channels in the buffer, how the channels are arranged in the buffer, and the sample size of the buffer.
  
## Requirements  
  
**Header:** GameChat2.h
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[pre_encode_audio_stream](../pre_encode_audio_stream.md)  
[pre_encode_audio_stream::get_pre_processed_format](pre_encode_audio_stream_get_pre_processed_format.md)  
[pre_encode_audio_stream::return_buffer](pre_encode_audio_stream_return_buffer.md)
  
  