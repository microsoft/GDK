---
author: M-Stahl
title: submit_buffer
description: Submits audio to be associated with this stream's users and encoded for transmission to remote endpoints.
kindex: submit_buffer
ms.author: jkepner
ms.topic: reference
ms.date: '09/12/2019'
edited: 00/00/0000
quality: good
security: public
applies-to: pc-gdk
---

# pre_encode_audio_stream::submit_buffer  

Submits audio to be associated with this stream's users and encoded for transmission to remote endpoints.  

## Syntax  
  
```cpp
void submit_buffer(  
    uint32_t byteCount,  
    void* buffer  
)  
```  
  
### Parameters  
  
*byteCount* &nbsp;&nbsp;\_In\_  
Type: uint32_t  
  
The number of bytes in the buffer.  
  
*buffer* &nbsp;&nbsp;\_In\_reads\_bytes\_(byteCount)  
Type: void*  
  
The buffer of processed audio data. This buffer must comply with the format specified in [pre_encode_audio_stream::set_processed_format](pre_encode_audio_stream_set_processed_format.md).  
  
  
### Return value  
Type: void
  
  
## Remarks  
  
Because this stream is associated with a set of users, those users' privacy and privilege restrictions will be applied to this audio. As well, submitting audio for the wrong user will cause erroneous chat indicator behavior. Every 40ms, the next 40ms of audio from this stream will be encoded and transmitted. To prevent audio hiccups, buffers for audio that should be heard continuously should be submitted to this stream at a constant rate. After this stream has been closed, calls to submit buffers will silently fail. The app can check whether a stream is open or closed by calling [pre_encode_audio_stream::is_open](pre_encode_audio_stream_is_open.md).
  
## Requirements  
  
**Header:** GameChat2.h
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[pre_encode_audio_stream](../pre_encode_audio_stream.md)  
[pre_encode_audio_stream::set_processed_format](pre_encode_audio_stream_set_processed_format.md)  
[pre_encode_audio_stream::is_open](pre_encode_audio_stream_is_open.md)
  
  