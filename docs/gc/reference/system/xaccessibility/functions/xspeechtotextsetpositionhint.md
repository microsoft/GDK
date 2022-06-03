---
author: M-Stahl
title: XSpeechToTextSetPositionHint
description: Sets the position of the speech-to-text window.
kindex: XSpeechToTextSetPositionHint
ms.author: v-sahain
ms.topic: reference
edited: 02/10/2020
quality: good
security: public
applies-to: pc-gdk
---

# XSpeechToTextSetPositionHint  

Sets the position of the speech-to-text window.  

## Syntax  
  
```cpp
HRESULT XSpeechToTextSetPositionHint(  
         XSpeechToTextPositionHint position  
)  
```  
  
### Parameters  
  
*position* &nbsp;&nbsp;\_In\_  
Type: [XSpeechToTextPositionHint](../enums/xspeechtotextpositionhint.md)  

An enumeration specifying the position of the speech-to-text window.

### Return value

Type: HRESULT
  
HRESULT if successful. Otherwise, returns an error code.  
For a list of error codes, see [Error Codes](../../../errorcodes.md).

## Remarks
  > [!NOTE]
> This function isn't safe to call on a time-sensitive thread. For more information, see [Time-sensitive threads](../../../../system/overviews/time-sensitive-threads.md).  
  
For this function to be successful, closed captions must be enabled.
The user must enable the closed captions feature in the UI of the Game title.
If the user enabled closed captions, your Game title can flag the status of closed captions by calling [XClosedCaptionSetEnabled](xclosedcaptionsetenabled.md).

The following example demonstrates how to position the speech-to-text window at the bottom center of the screen.

```cpp
auto hr = XSpeechToTextSetPositionHint(XSpeechToTextPositionHint::BottomCenter);
)  
```  

## Requirements  
  
**Header:** XAccessibility.h
  
**Library:** xgameruntime.lib  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also
  
[XAccessibility](../xaccessibility_members.md)

[XSpeechToTextPositionHint](../enums/xspeechtotextpositionhint.md)

[XClosedCaptionSetEnabled](xclosedcaptionsetenabled.md)  