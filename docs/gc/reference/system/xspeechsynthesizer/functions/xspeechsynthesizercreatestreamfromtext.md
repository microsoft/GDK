---
author: M-Stahl
title: XSpeechSynthesizerCreateStreamFromText
description: Creates a speech synthesis stream from the specified plain text.
kindex: XSpeechSynthesizerCreateStreamFromText
ms.author: v-denken
ms.topic: reference
edited: 07/09/2019
quality: good
security: public
applies-to: pc-gdk
---

# XSpeechSynthesizerCreateStreamFromText  

Creates a speech synthesis stream from the specified plain text.  

## Syntax  
  
```cpp
HRESULT XSpeechSynthesizerCreateStreamFromText(  
         XSpeechSynthesizerHandle speechSynthesizer,  
         const char* text,  
         XSpeechSynthesizerStreamHandle* speechSynthesisStream  
)  
```  
  
### Parameters  
  
*speechSynthesizer* &nbsp;&nbsp;\_In\_  
Type: XSpeechSynthesizerHandle  
  
The speech synthesizer to use.  

*text* &nbsp;&nbsp;\_In\_z\_  
Type: char*  
  
The plain text from which to generate speech.  

*speechSynthesisStream* &nbsp;&nbsp;\_Out\_  
Type: XSpeechSynthesizerStreamHandle*  
  
A speech synthesis stream that represents the speech generated from the plain text specified in *text*.  
  
### Return value
Type: [HRESULT](/openspecs/windows_protocols/ms-erref/0642cb2f-2075-4469-918c-4441e69c548a)  
  
Returns **S_OK** if successful; otherwise, returns an error code. For a list of error codes, see [Error Codes](../../../errorcodes.md). If the function fails because the speech synthesizer stream is larger than the maximum data size, the return value is set to **E_BOUNDS**.  
  
## Remarks
  > [!NOTE]
> This function isn't safe to call on a time-sensitive thread. For more information, see [Time-sensitive threads](../../../../system/overviews/time-sensitive-threads.md).  
  
* Use this function to synthesize speech from plain text and to generate audio data in the WAVE container (`audio/wav` MIME type) format. After using this function to create a speech synthesizer stream and to synthesize speech from plain text, use the [XSpeechSynthesizerGetStreamDataSize](xspeechsynthesizergetstreamdatasize.md) and [XSpeechSynthesizerGetStreamData](xspeechsynthesizergetstreamdata.md) functions to retrieve the audio data from the speech synthesizer stream. Use the [XSpeechSynthesizerCloseStreamHandle](xspeechsynthesizerclosestreamhandle.md) function to close the speech synthesizer stream after you've retrieved the audio data.  
  
* The maximum data size of a speech synthesizer stream is 0xffffffff bytes: four gigabytes minus one byte. An error occurs if you attempt to create a speech synthesizer stream larger than the maximum data size.  
  
* To prevent memory leaks, call the [XSpeechSynthesizerCloseStreamHandle](xspeechsynthesizerclosestreamhandle.md) function to close a speech synthesizer stream handle after you've completed all operations that are using the handle. All outstanding asynchronous operations must be completed before this function is called.  
  
* For an example that demonstrates how to use the **XSpeechSynthesizerCreateStreamFromText** function, see [XSpeechSynthesizerCreate](xspeechsynthesizercreate.md).  
  
## Requirements  
  
**Header:** XSpeechSynthesizer.h
  
**Library:** xgameruntime.lib  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[XAccessibility](../../xaccessibility/xaccessibility_members.md)  
[XSpeechSynthesizerCloseStreamHandle](xspeechsynthesizerclosestreamhandle.md)  
[XSpeechSynthesizer](../xspeechsynthesizer_members.md)  
  