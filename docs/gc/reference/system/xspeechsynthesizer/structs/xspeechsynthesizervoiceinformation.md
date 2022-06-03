---
author: M-Stahl
title: XSpeechSynthesizerVoiceInformation
description: Provides information about a voice.
kindex: XSpeechSynthesizerVoiceInformation
ms.author: v-denken
ms.topic: reference
edited: 07/09/2019
quality: good
security: public
applies-to: pc-gdk
---

# XSpeechSynthesizerVoiceInformation  

Provides information about a *voice*: an installed speech synthesis engine.  

## Syntax  
  
```cpp
typedef struct XSpeechSynthesizerVoiceInformation {  
    const char* Description;  
    const char* DisplayName;  
    XSpeechSynthesizerVoiceGender Gender;  
    const char* VoiceId;  
    const char* Language;  
} XSpeechSynthesizerVoiceInformation  
```
  
### Members  
  
*Description*  
Type: const char*  
  
The voice's description that's based on a combination of *DisplayName* and *Language*.  
  
*DisplayName*  
Type: const char*  
  
The display name of the voice.  
  
*Gender*  
Type: [XSpeechSynthesizerVoiceGender](../enums/xspeechsynthesizervoicegender.md)  
  
The gender of the voice.  
  
*VoiceId*  
Type: const char*  
  
The unique ID of the voice.  
  
*Language*  
Type: const char*  
  
The voice's language, represented by a normalized [BCP-47 language tag](https://tools.ietf.org/html/bcp47).  
  
## Remarks  
  
The **XSpeechSynthesierVoiceInformation** structure represents information about an installed speech synthesis engine, or *voice*; the information includes the voice's gender and language. Use the value of *VoiceId* to identify an installed voice when calling the [XSpeechSynthesizerSetCustomVoice](../functions/xspeechsynthesizersetcustomvoice.md) function.  
  
For an example that demonstrates how to use the **XSpeechSynthesizerVoiceInformation** structure, see [XSpeechSynthesizerEnumerateInstalledVoices](../functions/xspeechsynthesizerenumerateinstalledvoices.md).  
  
## Requirements  
  
**Header:** XSpeechSynthesizer.h
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[XAccessibility](../../xaccessibility/xaccessibility_members.md)  
[XSpeechSynthesizerCreateStreamFromText](../functions/xspeechsynthesizercreatestreamfromtext.md)  
[XSpeechSynthesizer](../xspeechsynthesizer_members.md)    
  