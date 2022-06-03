---
author: M-Stahl
title: XSpeechToTextPositionHint
description: Specifies the position on the screen where the game title renders text.
kindex: XSpeechToTextPositionHint
ms.author: v-sahain
ms.topic: reference
edited: 00/00/0000
quality: good
security: public
applies-to: pc-gdk
---

# XSpeechToTextPositionHint  

Specifies the position on the screen where the game title renders text.

## Syntax  
  
```cpp
enum class XSpeechToTextPositionHint  : uint32_t  
{  
    BottomCenter = 0,  
    BottomLeft = 1,  
    BottomRight = 2,  
    MiddleRight = 3,  
    MiddleLeft = 4,  
    TopCenter = 5,  
    TopLeft = 6,  
    TopRight = 7  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| BottomCenter | The Game title renders text at the bottom center of the screen. |  
| BottomLeft | The Game title renders text at the bottom left side of the screen. |  
| BottomRight | The Game title renders text at the bottom right side of the screen. |  
| MiddleRight | The Game title renders text at the middle right side of the screen. |  
| MiddleLeft | The Game title renders text at the middle left side of the screen. |  
| TopCenter | The Game title renders text at the top center of the screen. |  
| TopLeft | The Game title renders text at the top left side of the screen. |  
| TopRight | The Game title renders text at the top right side of the screen. |  
  
## Remarks

You can set the position of the speech-to-text window by calling the [XSpeechToTextSetPositionHint](../functions/xspeechtotextsetpositionhint.md) function.
The [XSpeechToTextSetPositionHint](../functions/xspeechtotextsetpositionhint.md) function takes an **XSpeechToTextPositionHint** enumeration as an argument.
You can also set the text the Game title displays on the screen by calling [XSpeechToTextSendString](../functions/xspeechtotextsendstring.md).

## Requirements  
  
**Header:** XAccessibility.h
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  

[XAccessibility](../xaccessibility_members.md)

[XSpeechToTextSetPositionHint](../functions/xspeechtotextsetpositionhint.md)  

[XSpeechToTextSendString](../functions/xspeechtotextsendstring.md)