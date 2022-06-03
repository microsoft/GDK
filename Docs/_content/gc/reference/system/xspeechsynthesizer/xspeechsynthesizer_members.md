---
author: M-Stahl
title: XSpeechSynthesizer (API contents)
description: Provides support for initializing and configuring a speech synthesis engine (voice) for converting a text string into an audio stream. This functionality is also known as text-to-speech (TTS).
kindex: XSpeechSynthesizer
ms.author: michaelk
ms.topic: navigation
edited: 07/15/2019
security: public
applies-to: pc-gdk
---

# XSpeechSynthesizer  
  
Provides support for initializing and configuring a speech synthesis engine, or *voice*, for converting a text string into an audio stream. This functionality is also known as text-to-speech (TTS).  
  
  
## Functions  
  
| Function | Description |  
| --- | --- |  
| [XSpeechSynthesizerCloseHandle](functions/xspeechsynthesizerclosehandle.md) | Closes the speech synthesizer and releases allocated system resources. |  
| [XSpeechSynthesizerCloseStreamHandle](functions/xspeechsynthesizerclosestreamhandle.md) | Closes the speech synthesizer stream and releases allocated system resources. |  
| [XSpeechSynthesizerCreate](functions/xspeechsynthesizercreate.md) | Creates a speech synthesizer. |  
| [XSpeechSynthesizerCreateStreamFromSsml](functions/xspeechsynthesizercreatestreamfromssml.md) | Creates a speech synthesis stream from the specified SSML. |  
| [XSpeechSynthesizerCreateStreamFromText](functions/xspeechsynthesizercreatestreamfromtext.md) | Creates a speech synthesis stream from the specified plain text. |  
| [XSpeechSynthesizerEnumerateInstalledVoices](functions/xspeechsynthesizerenumerateinstalledvoices.md) | Enumerates the installed voices, and calls the method pointed to by *callback* for each voice. |  
| [XSpeechSynthesizerGetStreamData](functions/xspeechsynthesizergetstreamdata.md) | Retrieves the data from a speech synthesis stream. |  
| [XSpeechSynthesizerGetStreamDataSize](functions/xspeechsynthesizergetstreamdatasize.md) | Gets the size of the data buffer from a speech synthesis stream. |  
| [XSpeechSynthesizerInstalledVoicesCallback](functions/xspeechsynthesizerinstalledvoicescallback.md) | The client-implemented callback function that receives information about a voice when [XSpeechSynthesizerEnumerateInstalledVoices](functions/xspeechsynthesizerenumerateinstalledvoices.md) is called. |  
| [XSpeechSynthesizerSetCustomVoice](functions/xspeechsynthesizersetcustomvoice.md) | Specifies that the speech synthesizer is to use the specified custom voice. |  
| [XSpeechSynthesizerSetDefaultVoice](functions/xspeechsynthesizersetdefaultvoice.md) | Specifies that the speech synthesizer is to use the system's default voice. |  
  
## Structures  
  
| Structure | Description |  
| --- | --- |  
| [XSpeechSynthesizerVoiceInformation](structs/xspeechsynthesizervoiceinformation.md) | Provides information about a voice. |  
  
## Enumerations  
  
| Enumeration | Description |  
| --- | --- |  
| [XSpeechSynthesizerVoiceGender](enums/xspeechsynthesizervoicegender.md) | Indicates the gender of a voice. |  
  
  
## See also  
[System API reference](../gc-reference-system-toc.md)  