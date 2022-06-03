---
author: M-Stahl
title: XSpeechSynthesizerCloseStreamHandle
description: Closes the speech synthesizer stream and releases allocated system resources.
kindex: XSpeechSynthesizerCloseStreamHandle
ms.author: v-denken
ms.topic: reference
edited: 07/09/2019
quality: good
security: public
applies-to: pc-gdk
---

# XSpeechSynthesizerCloseStreamHandle  

Closes the speech synthesizer stream and releases allocated system resources.  

## Syntax  
  
```cpp
HRESULT XSpeechSynthesizerCloseStreamHandle(  
         XSpeechSynthesizerStreamHandle speechSynthesisStream  
)  
```  
  
### Parameters  
  
*speechSynthesisStream* &nbsp;&nbsp;\_In\_  
Type: XSpeechSynthesizerStreamHandle  
  
The speech synthesis stream to close.  
  
### Return value
Type: [HRESULT](/openspecs/windows_protocols/ms-erref/0642cb2f-2075-4469-918c-4441e69c548a)  
  
Returns **S_OK** if successful; otherwise, returns an error code. For a list of error codes, see [Error Codes](../../../errorcodes.md).  
  
## Remarks  
  > [!NOTE]
> This function isn't safe to call on a time-sensitive thread. For more information, see [Time-sensitive threads](../../../../system/overviews/time-sensitive-threads.md).  
  
Use this function to close a speech synthesizer stream created by calling the [XSpeechSynthesizerCreateStreamFromText](xspeechsynthesizercreatestreamfromtext.md) function.  
  
To prevent memory leaks, call this function to close a speech synthesizer stream handle after you've completed all operations that are using the handle. All outstanding asynchronous operations must be completed before this function is called.  
  
For an example that demonstrates how to use the **XSpeechSynthesizerCloseStreamHandle** function, see [XSpeechSynthesizerCreate](xspeechsynthesizercreate.md).  
  
## Requirements  
  
**Header:** XSpeechSynthesizer.h
  
**Library:** xgameruntime.lib  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[XAccessibility](../../xaccessibility/xaccessibility_members.md)  
[XSpeechSynthesizerCloseHandle](xspeechsynthesizerclosehandle.md)  
[XSpeechSynthesizer](../xspeechsynthesizer_members.md)  
  