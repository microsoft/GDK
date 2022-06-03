---
author: M-Stahl
title: custom_stream_context
description: Retrieves the app's optional, private, custom pointer-sized context value previously associated with this stream object.
kindex: custom_stream_context
ms.author: jkepner
ms.topic: reference
ms.date: '09/12/2019'
edited: '09/15/2020'
security: public
applies-to: pc-gdk
---

# post_decode_audio_sink_stream::custom_stream_context
  
Retrieves the app's optional, private, custom pointer-sized context value previously associated with this stream object.  
  
<a id="syntaxSection"></a>
  
## Syntax
  
```cpp
void* custom_stream_context(  
)  
```  
  
<a id="parametersSection"></a>
  
### Parameters
  
None.  
  
<a id="retvalSection"></a>
  
### Return value
  
Type: void\*
  
The pointer-sized value previously associated with this stream object; otherwise, a null pointer.  
  
<a id="remarksSection"></a>
  
## Remarks
  
This method retrieves the app's optional, private, custom pointer-sized context value previously associated with this [post_decode_audio_sink_stream](../post_decode_audio_sink_stream.md) object. If no custom stream context has been set yet for this `post_decode_audio_sink_stream` object, this method returns a null pointer.  
  
The custom stream context is typically used as a "shortcut" that simplifies accessing local, app-specific memory associated with the stream without requiring a mapping lookup. Use the [post_decode_audio_sink_stream::set_custom_stream_context](post_decode_audio_sink_stream_set_custom_stream_context.md) method to set the custom stream context for a `post_decode_audio_sink_stream` object.  
  
<a id="requirementsSection"></a>
  
## Requirements
  
**Header:** GameChat2.h  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
<a id="seealsoSection"></a>
  
## See also
  
[Intro to Game Chat 2](../../../../../../chat/overviews/game-chat2/game-chat-2-intro.md)  
[post_decode_audio_sink_stream](../post_decode_audio_sink_stream.md)  
  