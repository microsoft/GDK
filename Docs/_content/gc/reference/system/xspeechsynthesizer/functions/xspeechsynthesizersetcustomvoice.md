---
author: M-Stahl
title: XSpeechSynthesizerSetCustomVoice
description: Specifies that the speech synthesizer is to use the specified custom voice.
kindex: XSpeechSynthesizerSetCustomVoice
ms.author: v-denken
ms.topic: reference
edited: 07/09/2019
quality: good
security: public
applies-to: pc-gdk
---

# XSpeechSynthesizerSetCustomVoice  

Specifies that the speech synthesizer is to use the specified custom voice.
  

## Syntax  
  
```cpp
HRESULT XSpeechSynthesizerSetCustomVoice(  
         XSpeechSynthesizerHandle speechSynthesizer,  
         const char* voiceId  
)  
```  
  
### Parameters  
  
*speechSynthesizer* &nbsp;&nbsp;\_In\_  
Type: XSpeechSynthesizerHandle  
  
Specifies the speech synthesizer that will be using the custom voice.  
  
*voiceId* &nbsp;&nbsp;\_In\_z\_  
Type: char*  
  
A voice ID in an [XSpeechSynthesizerVoiceInformation](../structs/xspeechsynthesizervoiceinformation.md) structure, returned in the [XSpeechSynthesizerInstalledVoicesCallback](xspeechsynthesizerinstalledvoicescallback.md) function.  
  
### Return value
Type: [HRESULT](/openspecs/windows_protocols/ms-erref/0642cb2f-2075-4469-918c-4441e69c548a)  
  
Returns **S_OK** if successful; otherwise, returns an error code. For a list of error codes, see [Error Codes](../../../errorcodes.md).  
  
## Remarks  
  > [!NOTE]
> This function isn't safe to call on a time-sensitive thread. For more information, see [Time-sensitive threads](../../../../system/overviews/time-sensitive-threads.md).  
  
* For each installed voice, the [XSpeechSynthesizerVoiceInformation](../structs/xspeechsynthesizervoiceinformation.md) structure provides the voice ID, description, display text, gender, language, and other information. 

* To enumerate over and get information about the voices installed on the current device, use the [XSpeechSynthesizerEnumerateInstalledVoices](xspeechsynthesizerenumerateinstalledvoices.md) function along with the [XSpeechSynthesizerInstalledVoicesCallback](xspeechsynthesizerinstalledvoicescallback.md) callback function. 
  
* To use the current system voice for the specified speech synthesizer, call [XSpeechSynthesizerSetDefaultVoice](xspeechsynthesizersetdefaultvoice.md).  
  
* For an example that demonstrates how to use the **XSpeechSynthesizerSetCustomVoice** function, see [XSpeechSynthesizerCreate](xspeechsynthesizercreate.md).  
  
## Requirements  
  
**Header:** XSpeechSynthesizer.h
  
**Library:** xgameruntime.lib  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[XAccessibility](../../xaccessibility/xaccessibility_members.md)  
[XSpeechSynthesizerCreateStreamFromText](xspeechsynthesizercreatestreamfromtext.md)  
[XSpeechSynthesizer](../xspeechsynthesizer_members.md)  
  
  