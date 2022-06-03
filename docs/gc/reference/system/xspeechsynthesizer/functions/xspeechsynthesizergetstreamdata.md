---
author: M-Stahl
title: XSpeechSynthesizerGetStreamData
description: Retrieves the data from a speech synthesis stream.
kindex: XSpeechSynthesizerGetStreamData
ms.author: v-denken
ms.topic: reference
edited: 07/09/2019
quality: good
security: public
applies-to: pc-gdk
---

# XSpeechSynthesizerGetStreamData  

Retrieves the data from a speech synthesis stream.  

## Syntax  
  
```cpp
HRESULT XSpeechSynthesizerGetStreamData(  
         XSpeechSynthesizerStreamHandle speechSynthesisStream,  
         size_t bufferSize,  
         void* buffer,  
         size_t* bufferUsed  
)  
```  
  
### Parameters  
  
*speechSynthesisStream* &nbsp;&nbsp;\_In\_  
Type: XSpeechSynthesizerStreamHandle  

The speech synthesis stream that contains the data buffer.  


*bufferSize* &nbsp;&nbsp;\_In\_  
Type: size_t  

The size of the buffer, in bytes, returned by [XSpeechSynthesizerGetStreamDataSize](xspeechsynthesizergetstreamdatasize.md).  


*buffer* &nbsp;&nbsp;\_Out\_writes\_to\_(bufferSize,*bufferUsed)  
Type: void*  

A pointer to the data buffer that will receive the data.  

*bufferUsed* &nbsp;&nbsp;\_Out\_opt\_  
Type: size_t*  

The size of the data received in *buffer*, in bytes.  

  
### Return value  
Type: [HRESULT](/openspecs/windows_protocols/ms-erref/0642cb2f-2075-4469-918c-4441e69c548a)  
  
Returns **S_OK** if successful; otherwise, returns an error code. For a list of error codes, see [Error Codes](../../../errorcodes.md). If the function fails because *speechSynthesisStream* isn't set to a valid speech synthesizer stream handle, the return value is set to **HRESULT_FROM_WIN32(ERROR_NOT_FOUND)**.  
  
## Remarks  
  > [!NOTE]
> This function isn't safe to call on a time-sensitive thread. For more information, see [Time-sensitive threads](../../../../system/overviews/time-sensitive-threads.md).  
  
Use this function to retrieve the audio data for synthesized speech, from the data buffer of a speech synthesizer stream created by calling the [XSpeechSynthesizerCreateStreamFromText](xspeechsynthesizercreatestreamfromtext.md) function. The audio data is returned in the WAVE container (`audio/wav` MIME type) format.  
  
For an example that demonstrates how to use the **XSpeechSynthesizerGetStreamData** function, see [XSpeechSynthesizerCreate](xspeechsynthesizercreate.md).  
  
## Requirements  
  
**Header:** XSpeechSynthesizer.h
  
**Library:** xgameruntime.lib  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[XAccessibility](../../xaccessibility/xaccessibility_members.md)  
[XSpeechSynthesizerGetStreamDataSize](xspeechsynthesizergetstreamdatasize.md)  
[XSpeechSynthesizer](../xspeechsynthesizer_members.md)  
  