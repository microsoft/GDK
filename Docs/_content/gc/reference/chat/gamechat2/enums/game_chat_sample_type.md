---
author: M-Stahl
title: game_chat_sample_type
description: Describes the data type that represents a single Game Chat 2 audio sample.
kindex: game_chat_sample_type
ms.author: jkepner
ms.topic: reference
ms.date: '09/12/2019'
edited: 10/08/2020
security: public
applies-to: pc-gdk
---

# game_chat_sample_type
  
Describes the data type that represents a single Game Chat 2 audio sample.  
  
<a id="syntaxSection"></a>
  
## Syntax
  
```cpp
enum class game_chat_sample_type  
{  
    integer = 0,  
    ieee_float  
}  
```  
  
<a id="constantsSection"></a>
  
## Constants
  
| Constant | Description |  
| --- | --- |  
| integer | Integer PCM format. |  
| ieee_float | IEEE floating-point PCM format. |  
  
<a id="remarksSection"></a>
  
## Remarks
  
This enumeration is used by the [game_chat_audio_format](../structs/game_chat_audio_format.md) structure to indicate whether the audio data represented by the structure uses Pulse Code Modulation (PCM) data represented by either integers or floating-point numbers. The `game_chat_audio_format` structure identifies the audio format of the buffers the app retrieves from and submits to Game Chat 2 when real-time audio manipulation is enabled. For more information about audio formats, see [Real-time audio manipulation](../../../../chat/overviews/game-chat2/real-time-audio-manipulation.md).  
  
<a id="requirementsSection"></a>
  
## Requirements
  
**Header:** GameChat2.h  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
<a id="seealsoSection"></a>
  
## See also
  
[Intro to Game Chat 2](../../../../chat/overviews/game-chat2/game-chat-2-intro.md)  
[GameChat2 members](../gamechat2_members.md)  
  