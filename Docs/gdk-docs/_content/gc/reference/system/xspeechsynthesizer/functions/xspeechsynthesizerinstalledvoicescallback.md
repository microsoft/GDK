---
author: M-Stahl
title: XSpeechSynthesizerInstalledVoicesCallback
description: The client-implemented callback function that receives information about a voice when [XSpeechSynthesizerEnumerateInstalledVoices](xspeechsynthesizerenumerateinstalledvoices.md) is called.
kindex: XSpeechSynthesizerInstalledVoicesCallback
ms.author: v-denken
ms.topic: reference
edited: 07/09/2019
quality: good
security: public
applies-to: pc-gdk
---

# XSpeechSynthesizerInstalledVoicesCallback  

The client-implemented callback function that receives information about a voice when [XSpeechSynthesizerEnumerateInstalledVoices](xspeechsynthesizerenumerateinstalledvoices.md) is called.  

## Syntax  
  
```cpp
bool XSpeechSynthesizerInstalledVoicesCallback(  
         const XSpeechSynthesizerVoiceInformation* information,  
         void* context  
)  
```  
  
### Parameters  
  
*information* &nbsp;&nbsp;\_In\_  
Type: [XSpeechSynthesizerVoiceInformation*](../structs/xspeechsynthesizervoiceinformation.md)  

  
A pointer to an [XSpeechSynthesizerVoiceInformation](../structs/xspeechsynthesizervoiceinformation.md) structure that contains the details of the currently enumerated voice.


*context* &nbsp;&nbsp;\_In\_  
Type: void*  
  
The context pointer that was provided in the initial call to [XSpeechSynthesizerEnumerateInstalledVoices](xspeechsynthesizerenumerateinstalledvoices.md).  
  
### Return value  
Type: bool  

Returns **true** if [XSpeechSynthesizerEnumerateInstalledVoices](xspeechsynthesizerenumerateinstalledvoices.md) is to continue enumerating, and **false** if [XSpeechSynthesizerEnumerateInstalledVoices](xspeechsynthesizerenumerateinstalledvoices.md) is to stop enumerating.  
  
## Remarks
  
* while the **XSpeechSynthesizerInstalledVoicesCallback** function returns **true**, the **XSpeechSynthesizerInstalledVoicesCallback** callback function is called by [XSpeechSynthesizerEnumerateInstalledVoices](xspeechsynthesizerenumerateinstalledvoices.md) once for each installed speech synthesis engine, or *voice*. If the **XSpeechSynthesizerInstalledVoicesCallback** function returns **false**, **XSpeechSynthesizerEnumerateInstalledVoices** stops enumerating over any remaining installed voices.  
  
* To identify and display information about each voice installed on the current device, use the data provided by the [XSpeechSynthesizerVoiceInformation](../structs/xspeechsynthesizervoiceinformation.md) structure in *information*. 
  
* For an example that demonstrates how to use the **XSpeechSynthesizerInstalledVoicesCallback** callback function, see [XSpeechSynthesizerEnumerateInstalledVoices](xspeechsynthesizerenumerateinstalledvoices.md).  
  
## Requirements  
  
**Header:** XSpeechSynthesizer.h
  
**Library:** xgameruntime.lib  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[XAccessibility](../../xaccessibility/xaccessibility_members.md)  
[XSpeechSynthesizerSetCustomVoice](xspeechsynthesizersetcustomvoice.md)  
[XSpeechSynthesizer](../xspeechsynthesizer_members.md)  
  