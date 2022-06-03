---
author: M-Stahl
title: XSpeechToTextType
description: Specifies the source type of the text that the Game renders.
kindex: XSpeechToTextType
ms.author: v-sahain
ms.topic: reference
edited: 00/00/0000
quality: good
security: public
applies-to: pc-gdk
---

# XSpeechToTextType  

Specifies the source type of the text that the Game renders.  

## Syntax  
  
```cpp
enum class XSpeechToTextType  : uint32_t  
{  
    Voice = 0,  
    Text = 1  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| Voice | The source of the text is in-game speech subtitles or transcribed game voice chat. Specifying Voice causes the game title to display a microphone icon beside the rendered text. |  
| Text | The source of the text is in-game text reading or in-game text chat. Specifying Text causes the game title to display a keyboard icon beside the rendered text. |  
  
## Remarks  

You can display text on the Game title screen by calling the [XSpeechToTextSendString](../functions/xspeechtotextsendstring.md) function.

The [XSpeechToTextSendString](../functions/xspeechtotextsendstring.md) function takes an **XSpeechToTextType** enumeration as an argument.

You can also set the position of the speech-to-text window by calling the [XSpeechToTextSetPositionHint](../functions/xspeechtotextsetpositionhint.md) function.
  
## Requirements  
  
**Header:** XAccessibility.h
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also

[XAccessibility](../xaccessibility_members.md)
  
[XSpeechToTextSendString](../functions/xspeechtotextsendstring.md)

[XSpeechToTextSetPositionHint](../functions/xspeechtotextsetpositionhint.md)