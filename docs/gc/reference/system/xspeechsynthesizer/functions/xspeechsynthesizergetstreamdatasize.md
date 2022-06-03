---
author: M-Stahl
title: XSpeechSynthesizerGetStreamDataSize
description: Gets the size of the data buffer from a speech synthesis stream.
kindex: XSpeechSynthesizerGetStreamDataSize
ms.author: v-denken
ms.topic: reference
edited: 07/09/2019
quality: good
security: public
applies-to: pc-gdk
---

# XSpeechSynthesizerGetStreamDataSize  

Gets the size of the data buffer from a speech synthesis stream.  

## Syntax  
  
```cpp
HRESULT XSpeechSynthesizerGetStreamDataSize(  
         XSpeechSynthesizerStreamHandle speechSynthesisStream,  
         size_t* bufferSize  
)  
```  
  
### Parameters  
  
*speechSynthesisStream* &nbsp;&nbsp;\_In\_  
Type: XSpeechSynthesizerStreamHandle  
  
The speech synthesizer stream that contains the stream data.  

*bufferSize* &nbsp;&nbsp;\_Out\_  
Type: size_t*  
  
The size of the stream data buffer, in bytes.  
  
### Return value
Type: [HRESULT](/openspecs/windows_protocols/ms-erref/0642cb2f-2075-4469-918c-4441e69c548a)  
  
Returns **S_OK** if successful; otherwise, returns an error code. For a list of error codes, see [Error Codes](../../../errorcodes.md).  
  
## Remarks  
  > [!NOTE]
> This function isn't safe to call on a time-sensitive thread. For more information, see [Time-sensitive threads](../../../../system/overviews/time-sensitive-threads.md).  
  
* Use this function to determine the size of the buffer needed to retrieve the audio data for synthesized speech, from the data buffer of a speech synthesizer stream created by calling the [XSpeechSynthesizerCreateStreamFromText](xspeechsynthesizercreatestreamfromtext.md) function. The maximum data size of the buffer is 0xffffffff bytes: four gigabytes minus one byte.  
  
* To retrieve the audio data from a speech synthesizer stream, use the value of this function to set the value of the *bufferSize* parameter for the [XSpeechSynthesizerGetStreamData](xspeechsynthesizergetstreamdata.md) function.
  
* For an example that demonstrates how to use the **XSpeechSynthesizerGetStreamDataSize** function, see [XSpeechSynthesizerCreate](xspeechsynthesizercreate.md).  
  
## Requirements  
  
**Header:** XSpeechSynthesizer.h
  
**Library:** xgameruntime.lib  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
  
[XSpeechSynthesizerCreateStreamFromText](xspeechsynthesizercreatestreamfromtext.md)  
[XSpeechSynthesizerGetStreamData](xspeechsynthesizergetstreamdata.md)  
[XSpeechSynthesizer](../xspeechsynthesizer_members.md)  
  