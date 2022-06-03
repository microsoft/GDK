---
author: M-Stahl
title: XSpeechSynthesizerSetDefaultVoice
description: Specifies that the speech synthesizer is to use the system's default voice.
kindex: XSpeechSynthesizerSetDefaultVoice
ms.author: michaelk
ms.topic: reference
edited: 07/09/2019
quality: good
security: public
applies-to: pc-gdk
---

# XSpeechSynthesizerSetDefaultVoice  

Specifies that the speech synthesizer is to use the system's default voice.

## Syntax  
  
```cpp
HRESULT XSpeechSynthesizerSetDefaultVoice(  
         XSpeechSynthesizerHandle speechSynthesizer  
)  
```  
  
### Parameters  
  
*speechSynthesizer* &nbsp;&nbsp;\_In\_  
Type: XSpeechSynthesizerHandle  
  
Specifies the speech synthesizer that will be using the default voice.  
  
### Return value
Type: [HRESULT](/openspecs/windows_protocols/ms-erref/0642cb2f-2075-4469-918c-4441e69c548a)  
  
Returns **S_OK** if successful; otherwise, returns an error code. For a list of error codes, see [Error Codes](../../../errorcodes.md).  
  
## Remarks  
  > [!NOTE]
> This function isn't safe to call on a time-sensitive thread. For more information, see [Time-sensitive threads](../../../../system/overviews/time-sensitive-threads.md).  
  
* To use a different installed voice for the specified speech synthesizer, call [XSpeechSynthesizerSetCustomVoice](xspeechsynthesizersetcustomvoice.md). 

* To enumerate over and get information about the voices installed on the current device, use the [XSpeechSynthesizerEnumerateInstalledVoices](xspeechsynthesizerenumerateinstalledvoices.md) function along with the [XSpeechSynthesizerInstalledVoicesCallback](xspeechsynthesizerinstalledvoicescallback.md) callback function. 

* For each installed voice, the [XSpeechSynthesizerVoiceInformation](../structs/xspeechsynthesizervoiceinformation.md) structure provides the voice ID, description, display text, gender, language, and other information. 
  
## Requirements  
  
**Header:** XSpeechSynthesizer.h
  
**Library:** xgameruntime.lib  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[XAccessibility](../../xaccessibility/xaccessibility_members.md)  
[XSpeechSynthesizerCreateStreamFromText](xspeechsynthesizercreatestreamfromtext.md)  
[XSpeechSynthesizer](../xspeechsynthesizer_members.md)
  
  