---
author: M-Stahl
title: game_chat_speech_to_text_conversion_mode
description: Defines the speech-to-text conversion modes available to Game Chat 2.
kindex: game_chat_speech_to_text_conversion_mode
ms.author: jkepner
ms.topic: reference
ms.date: '09/12/2019'
edited: 10/08/2020
security: public
applies-to: pc-gdk
---

# game_chat_speech_to_text_conversion_mode
  
Defines the speech-to-text conversion modes available to Game Chat 2.  
  
<a id="syntaxSection"></a>
  
## Syntax
  
```cpp
enum class game_chat_speech_to_text_conversion_mode  
{  
    automatic,  
    title_managed,  
}  
```  
  
<a id="constantsSection"></a>
  
## Constants
  
| Constant | Description |  
| --- | --- |  
| automatic | Represents the 'automatic' speech-to-text conversion mode.<br/><br/> If a local user has requested speech-to-text, Game Chat 2 automatically transcribes outgoing audio associated with the local user and incoming audio associated with users that are allowed to speak to the local user. Each transcription is provided to the app as a [game_chat_transcribed_chat_received_state_change](../structs/game_chat_transcribed_chat_received_state_change.md) state change. The app should display this message on screen for the user that has requested speech-to-text. |  
| title_managed | Represents the 'title managed' speech-to-text conversion mode.<br/><br/> Game Chat 2 does not automatically transcribe audio when a user has requested speech-to-text. The title is responsible for transcribing audio when a user has the speech-to-text setting enabled, as indicated by [chat_user_local\::speech_to_text_conversion_preference_enabled](../classes/chat_user/chat_user_local/methods/chat_user_local_speech_to_text_conversion_preference_enabled.md). |  
  
<a id="remarksSection"></a>
  
## Remarks
  
By default, Game Chat 2 automatically manages most work to support speech-to-text accessibility scenarios. You can allow games to disable this automatic work in favor of an independent speech-to-text solution when initializing Game Chat 2, by specifying `title_managed` in the `speechToTextConversion` parameter of the [chat_manager::initialize](../classes/chat_manager/methods/chat_manager_initialize.md) method. For more information about initializing Game Chat 2, see [Using the Game Chat 2 C++ API](../../../../chat/overviews/game-chat2/using-game-chat-2.md).  
  
<a id="requirementsSection"></a>
  
## Requirements
  
**Header:** GameChat2.h  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
<a id="seealsoSection"></a>
  
## See also
  
[Intro to Game Chat 2](../../../../chat/overviews/game-chat2/game-chat-2-intro.md)  
[GameChat2 members](../gamechat2_members.md)  
  