---
author: M-Stahl
title: audio_encoding_bitrate
description: Indicates the audio encoding bit rate for the chat instance.
kindex: audio_encoding_bitrate
ms.author: jkepner
ms.topic: reference
ms.date: '09/12/2019'
edited: '09/10/2020'
security: public
applies-to: pc-gdk
---

# chat_manager::audio_encoding_bitrate
  
Indicates the audio encoding bit rate for the chat instance.  
  
<a id="syntaxSection"></a>
  
## Syntax
  
```cpp
game_chat_audio_encoding_bitrate audio_encoding_bitrate(  
)  
```  
  
<a id="parametersSection"></a>
  
### Parameters
  
None.  
  
<a id="retvalSection"></a>
  
### Return value
  
Type: [game_chat_audio_encoding_bitrate](../../../enums/game_chat_audio_encoding_bitrate.md)  
  
The audio encoding bit rate for the chat instance.
  
<a id="remarksSection"></a>
  
## Remarks
  
This method indicates the audio encoding bit rate for the chat instance. You can change the audio encoding bit rate by invoking the [set_audio_encoding_bitrate](chat_manager_set_audio_encoding_bitrate.md) method. For more information about audio encoding, see [Using the Game Chat 2 C++ API](../../../../../../chat/overviews/game-chat2/using-game-chat-2.md).  
  
<a id="requirementsSection"></a>
  
## Requirements  
  
**Header:** GameChat2.h  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
<a id="seealsoSection"></a>
  
## See also
  
[Intro to Game Chat 2](../../../../../../chat/overviews/game-chat2/game-chat-2-intro.md)  
[chat_manager::audio_manipulation_mode](chat_manager_audio_manipulation_mode.md)  
[chat_manager](../chat_manager.md)  
  