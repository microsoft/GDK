---
author: M-Stahl
title: XSpeechToTextSendString
description: Displays text on the Game title screen.
kindex: XSpeechToTextSendString
ms.author: v-sahain
ms.topic: reference
edited: 02/10/2020
quality: good
security: public
applies-to: pc-gdk
---

# XSpeechToTextSendString  

Displays text on the Game title screen.

## Syntax  
  
```cpp
HRESULT XSpeechToTextSendString(  
         const char* speakerName,  
         const char* content,  
         XSpeechToTextType type  
)  
```  
  
### Parameters  
  
*speakerName* &nbsp;&nbsp;\_In\_z\_  
Type: char*  

The name of the speaker that is the source of the text.  

*content* &nbsp;&nbsp;\_In\_z\_  
Type: char*  

The text to display on the Game title screen.  

*type* &nbsp;&nbsp;\_In\_  
Type: [XSpeechToTextType](../enums/xspeechtotexttype.md)  

An enumeration value representing the source type of the text: transcribed game voice chat, in-game speech subtitles, in-game text reading, or in-game text chat. The game title uses the value of the *type* parameter to display either a microphone icon or a keyboard next to the text on the game screen.  

### Return value

Type: HRESULT
  
HRESULT if successful.  Otherwise, returns an error code.  
For a list of error codes, see [Error Codes](../../../errorcodes.md).

## Remarks
  > [!NOTE]
> This function isn't safe to call on a time-sensitive thread. For more information, see [Time-sensitive threads](../../../../system/overviews/time-sensitive-threads.md).  
  
For this function to be successful, closed captions must be enabled.
The user must enable the closed captions feature in the UI of the Game title.
If the user enabled closed captions, your Game title can flag the status of closed captions by calling [XClosedCaptionSetEnabled](xclosedcaptionsetenabled.md).

The following example demonstrates how to display text on the speech-to-text window.

```cpp
auto hr = XSpeechToTextSendString("Sandy", "This is my text.", XSpeechToTextType::Text);
)  
```

## Requirements  
  
**Header:** XAccessibility.h
  
**Library:** xgameruntime.lib  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also

[XAccessibility](../xaccessibility_members.md)
  
[XSpeechToTextType](../enums/xspeechtotexttype.md)  

[XClosedCaptionSetEnabled](xclosedcaptionsetenabled.md)  