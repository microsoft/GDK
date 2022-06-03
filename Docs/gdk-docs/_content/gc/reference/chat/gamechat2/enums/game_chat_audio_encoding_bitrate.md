---
author: M-Stahl
title: game_chat_audio_encoding_bitrate
description: Defines the audio encoding bit rate that Game Chat 2 uses for generating outgoing audio packets.
kindex: game_chat_audio_encoding_bitrate
ms.author: jkepner
ms.topic: reference
ms.date: '09/12/2019'
edited: '09/16/2020'
security: public
applies-to: pc-gdk
---

# game_chat_audio_encoding_bitrate
  
Defines the audio encoding bit rate that Game Chat 2 uses for generating outgoing audio packets.  
  
<a id="syntaxSection"></a>
  
## Syntax
  
```cpp
enum class game_chat_audio_encoding_bitrate  
{  
    kilobits_per_second_12,  
    kilobits_per_second_16,  
    kilobits_per_second_24,  
}  
```  
  
<a id="constantsSection"></a>
  
## Constants
  
| Constant | Description |  
| --- | --- |  
| kilobits_per_second_12 | Represents encoding with a bit rate of 12 kilobits per second. |  
| kilobits_per_second_16 | Represents encoding with a bit rate of 16 kilobits per second. |  
| kilobits_per_second_24 | Represents encoding with a bit rate of 24 kilobits per second. |  
  
<a id="remarksSection"></a>
  
## Remarks
  
This enumeration describes the audio encoding bit rate used by Game Chat 2 to encode audio packets for transmission to remote endpoints. You can retrieve the current audio encoding bit rate for the chat instance by calling the [chat_manager\::audio_encoding_bitrate](../classes/chat_manager/methods/chat_manager_audio_encoding_bitrate.md) method. You can change the audio encoding bit rate by calling the [chat_manager\::set_audio_encoding_bitrate](../classes/chat_manager/methods/chat_manager_set_audio_encoding_bitrate.md) method.  
  
You can change the audio encoding bit rate as needed to respond to network usage. Lower bit rates result in less data transmission but lower audio quality. Higher bit rates result in better audio quality but more data transmission. For more information about audio encoding, see [Using the Game Chat 2 C++ API](../../../../chat/overviews/game-chat2/using-game-chat-2.md).  
  
<a id="requirementsSection"></a>
  
## Requirements
  
**Header:** GameChat2.h  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
<a id="seealsoSection"></a>
  
## See also
  
[Intro to Game Chat 2](../../../../chat/overviews/game-chat2/game-chat-2-intro.md)  
[GameChat2 members](../gamechat2_members.md)  
  