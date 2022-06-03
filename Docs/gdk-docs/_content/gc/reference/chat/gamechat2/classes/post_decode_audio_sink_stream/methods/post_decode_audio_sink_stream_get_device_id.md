---
author: M-Stahl
title: get_device_id
description: Retrieves the ID of this stream's render device.
kindex: get_device_id
ms.author: jkepner
ms.topic: reference
ms.date: '09/12/2019'
edited: '09/15/2020'
security: public
applies-to: pc-gdk
---

# post_decode_audio_sink_stream::get_device_id
  
Retrieves the ID of this stream's render device.  
  
<a id="syntaxSection"></a>
  
## Syntax  
  
```cpp
PCWSTR get_device_id(  
)  
```  
  
<a id="parametersSection"></a>
  
### Parameters
  
None.
  
<a id="retvalSection"></a>
  
### Return value
  
Type: PCWSTR  
  
Returns a pointer to a null-terminated string that represents the device ID.  
  
<a id="remarksSection"></a>
  
## Remarks
  
This method retrieves the device ID of the render device for this stream. This method is useful if you want the app to render the audio data directly to a render device, but you would like to use Game Chat 2 for selecting the render device. If your app renders its own audio, you do not need to call the [post_decode_audio_sink_stream::submit_mixed_buffer](post_decode_audio_sink_stream_submit_mixed_buffer.md) method.  
  
For more information about manipulating post-decode chat audio data, see [Real-time audio manipulation](../../../../../../chat/overviews/game-chat2/real-time-audio-manipulation.md).  
  
<a id="requirementsSection"></a>
  
## Requirements
  
**Header:** GameChat2.h  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
<a id="seealsoSection"></a>
  
## See also
  
[Intro to Game Chat 2](../../../../../../chat/overviews/game-chat2/game-chat-2-intro.md)  
[post_decode_audio_sink_stream](../post_decode_audio_sink_stream.md)  
  