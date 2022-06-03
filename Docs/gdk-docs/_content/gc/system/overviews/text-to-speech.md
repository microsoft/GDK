---
author: M-Stahl
title: Text-to-speech
description: >-
  Provides support for initializing and configuring a speech synthesis engine (or voice) to convert a text string to an audio stream, also known as text-to-speech (TTS). For example, voice characteristics, pronunciation, volume, pitch, rate or speed, and emphasis are customized through [Speech Synthesis Markup Language (SSML)
  Version 1.1](https://www.w3.org/TR/speech-synthesis/).
kindex:
- Text-to-speech
- TTS
- XSpeechSynthesizer Overview
ms.author: jgup
ms.topic: conceptual
edited: 11/01/2019
security: public
---

# Text-to-speech

The [XSpeechSynthesizer](../../reference/system/xspeechsynthesizer/xspeechsynthesizer_members.md) API provides support for initializing and configuring a speech 
synthesis engine (or voice) to convert a text string to an audio stream, also known as text-to-speech (TTS). For example, voice 
characteristics, pronunciation, volume, pitch, rate or speed, and emphasis are customized through 
[Speech Synthesis Markup Language (SSML) Version 1.0](https://www.w3.org/TR/speech-synthesis/).
> [!NOTE]
> This API requires callers to user version 1.0 of SSML.

The following steps show how to use the API.

1. Create the speech synthesizer by calling [XSpeechSynthesizerCreate](../../reference/system/xspeechsynthesizer/functions/xspeechsynthesizercreate.md). Make sure to hold on to the handle.
1. You can also choose the voice you want by calling either [XSpeechSynthesizerSetCustomVoice](../../reference/system/xspeechsynthesizer/functions/xspeechsynthesizersetcustomvoice.md) or 
   [XSpeechSynthesizerSetDefaultVoice](../../reference/system/xspeechsynthesizer/functions/xspeechsynthesizersetdefaultvoice.md).
1. For each bit of text you want to convert from text to speech, use the following steps.
    1. Create a new stream by calling [XSpeechSynthesizerCreateStreamFromText](../../reference/system/xspeechsynthesizer/functions/xspeechsynthesizercreatestreamfromtext.md). By the time that 
	   this function completes, the conversion of the text to a .wav file is complete. This conversion can take some time and shouldn't 
	   done on any time-critical threads.
	1. Determine the size of the buffer you need to get the audio data from by calling 
	   [XSpeechSynthesizerGetStreamDataSize](../../reference/system/xspeechsynthesizer/functions/xspeechsynthesizergetstreamdatasize.md).
    1. Get the audio data (.wav file) from that stream by calling [XSpeechSynthesizerGetStreamData](../../reference/system/xspeechsynthesizer/functions/xspeechsynthesizergetstreamdata.md).
    1. Pass the audio data to an audio renderer.
    1. Close the stream handle by calling [XSpeechSynthesizerCloseStreamHandle](../../reference/system/xspeechsynthesizer/functions/xspeechsynthesizerclosestreamhandle.md).
2. When you're completely done with speech synthesis, close the handle by calling [SpeechSynthesizerCloseHandle](../../reference/system/xspeechsynthesizer/functions/xspeechsynthesizerclosehandle.md).

## See also

[XSpeechSynthesizer API reference](../../reference/system/xspeechsynthesizer/xspeechsynthesizer_members.md)