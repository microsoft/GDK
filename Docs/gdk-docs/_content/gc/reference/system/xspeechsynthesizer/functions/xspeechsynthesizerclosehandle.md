---
author: M-Stahl
title: XSpeechSynthesizerCloseHandle
description: Closes the speech synthesizer and releases allocated system resources.
kindex: XSpeechSynthesizerCloseHandle
ms.author: v-denken
ms.topic: reference
edited: 07/09/2019
quality: good
security: public
applies-to: pc-gdk
---

# XSpeechSynthesizerCloseHandle  

Closes the speech synthesizer and releases allocated system resources.  

## Syntax  
  
```cpp
HRESULT XSpeechSynthesizerCloseHandle(  
         XSpeechSynthesizerHandle speechSynthesizer  
)  
```  
  
### Parameters  
  
*speechSynthesizer* &nbsp;&nbsp;\_In\_opt\_  
Type: XSpeechSynthesizerHandle  
  
The speech synthesizer to close.  
  
### Return value
Type: [HRESULT](/openspecs/windows_protocols/ms-erref/0642cb2f-2075-4469-918c-4441e69c548a)  
  
Returns **S_OK** if successful; otherwise, returns an error code. For a list of error codes, see [Error Codes](../../../errorcodes.md).  
  
## Remarks  
  > [!NOTE]
> This function isn't safe to call on a time-sensitive thread. For more information, see [Time-sensitive threads](../../../../system/overviews/time-sensitive-threads.md).  
  
* Use this function to close a speech synthesizer created by calling the [XSpeechSynthesizerCreate](xspeechsynthesizercreate.md) function. 

* To prevent memory leaks, call this function to close a speech synthesizer handle after you've completed all operations that are using the handle.  
  
* For an example that demonstrates how to use the **XSpeechSynthesizerCloseHandle** function, see [XSpeechSynthesizerCreate](xspeechsynthesizercreate.md).  
  
## Requirements  
  
**Header:** XSpeechSynthesizer.h
  
**Library:** xgameruntime.lib  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[XAccessibility](../../xaccessibility/xaccessibility_members.md)  
[XSpeechSynthesizerCreate](xspeechsynthesizercreate.md)  
[XSpeechSynthesizerCloseStreamHandle](xspeechsynthesizerclosestreamhandle.md)  
[XSpeechSynthesizer](../xspeechsynthesizer_members.md)  
  
  