---
author: M-Stahl
title: XSpeechSynthesizerVoiceGender
description: Indicates the gender of a voice.
kindex: XSpeechSynthesizerVoiceGender
ms.author: v-denken
ms.topic: reference
edited: 07/09/2019
quality: good
security: public
applies-to: pc-gdk
---

# XSpeechSynthesizerVoiceGender  

Indicates the gender of a voice.  

## Syntax  
  
```cpp
enum class XSpeechSynthesizerVoiceGender  : uint32_t  
{  
    Female = 0,  
    Male = 1,  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| Female | The gender of the voice is female. |  
| Male | The gender of the voice is male. |  
  
## Remarks  
  
The gender of an installed speech synthesis engine, or *voice*, is indicated in the [XSpeechSynthesizerVoiceInformation](../structs/xspeechsynthesizervoiceinformation.md) structure by a constant from this enumeration. To enumerate and retrieve information about the voices installed on the current device, call the [XSpeechSynthesizerEnumerateInstalledVoices](../functions/xspeechsynthesizerenumerateinstalledvoices.md) function along with the [XSpeechSynthesizerInstalledVoicesCallback](../functions/xspeechsynthesizerinstalledvoicescallback.md) callback function. The latter receives an **XSpeechSynthesizerVoiceInformation** structure for an installed voice and is called once for each voice installed on the current device.  
  
For an example that demonstrates how to use the **XSpeechSynthesizerVoiceGender** enumeration, see [XSpeechSynthesizerEnumerateInstalledVoices](../functions/xspeechsynthesizerenumerateinstalledvoices.md).  
  
## Requirements  
  
**Header:** XSpeechSynthesizer.h
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[XAccessibility](../../xaccessibility/xaccessibility_members.md)  
[XSpeechSynthesizerInstalledVoicesCallback](../functions/xspeechsynthesizerinstalledvoicescallback.md)  
[XSpeechSynthesizerVoiceInformation](../structs/xspeechsynthesizervoiceinformation.md)  
[XSpeechSynthesizer](../xspeechsynthesizer_members.md)  
  