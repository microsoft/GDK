---
author: M-Stahl
title: XAccessibility (API contents)
description: Reference material for GameAccessibility APIs.
kindex: XAccessibility
ms.author: v-sahain
ms.topic: navigation
edited: 00/00/0000
security: public
applies-to: pc-gdk
---

# XAccessibility  

The GameAccessibility APIs enable you to design, set, and modify game accessibility features and information.
For example, you can configure closed caption properties, the high contrast mode, and the text edge style.
You can also modify the text that displays on the speech-to-text window, and the position of the speech-to-text window.
  
  
## Functions  
  
| Function | Description |  
| --- | --- |  
| [XClosedCaptionGetProperties](functions/xclosedcaptiongetproperties.md) | Returns the properties of the current closed caption. |  
| [XClosedCaptionSetEnabled](functions/xclosedcaptionsetenabled.md) | Sets a Boolean value that indicates if closed captions are enabled or disabled. |  
| [XHighContrastGetMode](functions/xhighcontrastgetmode.md) | Returns the current high contrast mode. |  
| [XSpeechToTextBeginHypothesisString](functions/xspeechtotextbeginhypothesisstring.md) | Begins a hypothesis and displays its string in a text overlay. |  
| [XSpeechToTextCancelHypothesisString](functions/xspeechtotextcancelhypothesisstring.md) | Cancels a hypothesis and removes its string from a text overlay. |  
| [XSpeechToTextFinalizeHypothesisString](functions/xspeechtotextfinalizehypothesisstring.md) | Finalizes a hypothesis and updates its string in a text overlay. |  
| [XSpeechToTextSendString](functions/xspeechtotextsendstring.md) | Displays text on the Game title screen. |  
| [XSpeechToTextSetPositionHint](functions/xspeechtotextsetpositionhint.md) | Sets the position of the speech-to-text window. |  
| [XSpeechToTextUpdateHypothesisString](functions/xspeechtotextupdatehypothesisstring.md) | Updates a hypothesis string in a text overlay. |  
  
## Structures  
  
| Structure | Description |  
| --- | --- |  
| [XClosedCaptionProperties](structs/xclosedcaptionproperties.md) | Describes the closed caption properties. |  
  
## Enumerations  
  
| Enumeration | Description |  
| --- | --- |  
| [XClosedCaptionFontEdgeAttribute](enums/xclosedcaptionfontedgeattribute.md) | Specifies the edge style of the closed caption text. |  
| [XClosedCaptionFontStyle](enums/xclosedcaptionfontstyle.md) | Specifies the font style of the closed caption text. |  
| [XHighContrastMode](enums/xhighcontrastmode.md) | Specifies the high contrast mode style of the closed caption text. |  
| [XSpeechToTextPositionHint](enums/xspeechtotextpositionhint.md) | Specifies the position on the screen where the game title renders text. |  
| [XSpeechToTextType](enums/xspeechtotexttype.md) | Specifies the source type of the text that the Game renders. |  
  
  
## See also

[System API reference](../gc-reference-system-toc.md)  