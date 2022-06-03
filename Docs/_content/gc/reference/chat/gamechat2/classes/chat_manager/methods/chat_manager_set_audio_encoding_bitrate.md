---
author: M-Stahl
title: set_audio_encoding_bitrate
description: Sets the audio encoding bit rate for the chat instance.
kindex: set_audio_encoding_bitrate
ms.author: jkepner
ms.topic: reference
ms.date: '09/12/2019'
edited: '09/10/2020'
security: public
applies-to: pc-gdk
---

# chat_manager::set_audio_encoding_bitrate
  
Sets the audio encoding bit rate for the chat instance.  
  
<a id="syntaxSection"></a>
  
## Syntax
  
```cpp
void set_audio_encoding_bitrate(  
    game_chat_audio_encoding_bitrate audioEncodingBitrate  
)  
```  
  
<a id="parametersSection"></a>
  
### Parameters
  
*audioEncodingBitrate* &nbsp;&nbsp;\_In\_  
Type: [game_chat_audio_encoding_bitrate](../../../enums/game_chat_audio_encoding_bitrate.md)  
  
The audio encoding bit rate currently used by the chat instance.  
  
<a id="retvalSection"></a>
  
### Return value
  
Type: void  
  
<a id="remarksSection"></a>
  
## Remarks
  
This method specifies the current audio encoding bit rate used by the chat instance. If this method is not called, the audio encoding bit rate is set to `game_chat_audio_encoding_bitrate::kilobits_per_second_24`. You can change the audio encoding bit rate as needed to respond to network usage. Lower bit rates result in less data transmission but lower audio quality. Higher bit rates result in better audio quality but more data transmission. For more information about audio encoding, see [Using the Game Chat 2 C++ API](../../../../../../chat/overviews/game-chat2/using-game-chat-2.md).  
  
<a id="requirementsSection"></a>
  
## Requirements
  
**Header:** GameChat2.h  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
<a id="seealsoSection"></a>
  
## See also
  
[Intro to Game Chat 2](../../../../../../chat/overviews/game-chat2/game-chat-2-intro.md)  
[chat_manager::audio_encoding_bitrate](chat_manager_audio_encoding_bitrate.md)  
[chat_manager](../chat_manager.md)  
  