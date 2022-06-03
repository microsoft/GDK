---
author: M-Stahl
title: synthesize_text_to_speech
description: Synthesizes the text message as audio and generates audio packets as if the audio came from the local user's microphone.
kindex: synthesize_text_to_speech
ms.author: jkepner
ms.topic: reference
ms.date: '09/13/2019'
edited: '09/11/2020'
security: public
applies-to: pc-gdk
---

# chat_user_local::synthesize_text_to_speech
  
Synthesizes the text message as audio and generates audio packets as if the audio came from the local user's microphone.  
  
<a id="syntaxSection"></a>
  
## Syntax
  
```cpp
void synthesize_text_to_speech(  
    PCWSTR message  
)  
```  
  
<a id="parametersSection"></a>
  
### Parameters
  
*message* &nbsp;&nbsp;\_In\_  
Type: PCWSTR  
  
The message for which audio should be synthesized.  
  
<a id="retvalSection"></a>
  
### Return value
  
Type: void  
  
None.  
  
<a id="remarksSection"></a>
  
## Remarks
  
This method synthesizes the text message specified in `message` as audio, generating packets as if the audio came from the local user's microphone. For more information about text-to-speech, see [Using the Game Chat 2 C++ API](../../../../../../../chat/overviews/game-chat2/using-game-chat-2.md).  
  > [!NOTE]
> This method should be called only if the local user has enabled text-to-speech. If the local user has not enabled text-to-speech, this call has no effect. Use the [chat_user_local::speech_to_text_conversion_preference_enabled](chat_user_local_text_to_speech_conversion_preference_enabled.md) method to confirm that text-to-speech is enabled.  
  
<a id="requirementsSection"></a>
  
## Requirements
  
**Header:** GameChat2.h  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
<a id="seealsoSection"></a>
  
## See also
  
[Intro to Game Chat 2](../../../../../../../chat/overviews/game-chat2/game-chat-2-intro.md)  
[chat_user_local](../chat_user_local.md)  
  