---
author: M-Stahl
title: set_custom_stream_context
description: Configures an optional, custom pointer-sized context value with this stream object.
kindex: set_custom_stream_context
ms.author: jkepner
ms.topic: reference
ms.date: '09/12/2019'
edited: 00/00/0000
quality: good
security: public
applies-to: pc-gdk
---

# post_decode_audio_sink_stream::set_custom_stream_context  

Configures an optional, custom pointer-sized context value with this stream object.  

## Syntax  
  
```cpp
void set_custom_stream_context(  
    void* customStreamContext  
)  
```  
  
### Parameters  
  
*customStreamContext* &nbsp;&nbsp;\_In\_  
Type: void*  
  
An arbitrary, pointer-sized value to store with the stream object.  
  
  
### Return value  
Type: void
  
  
## Remarks  
  
The custom stream context is typically used as a "shortcut" that simplifies accessing local, app-specific memory associated with the stream without requiring a mapping lookup. The value is retrieved using the [post_decode_audio_sink_stream::custom_stream_context](post_decode_audio_sink_stream_custom_stream_context.md).

Any configured value is treated as opaque by the library, and is only valid on the local device; it is not transmitted over the network.
  
## Requirements  
  
**Header:** GameChat2.h
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[post_decode_audio_sink_stream](../post_decode_audio_sink_stream.md)  
[post_decode_audio_sink_stream::custom_stream_context](post_decode_audio_sink_stream_custom_stream_context.md)
  
  