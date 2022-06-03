---
author: M-Stahl
title: XSpeechSynthesizerEnumerateInstalledVoices
description: Enumerates the installed voices, and calls the method pointed to by *callback* for each voice.
kindex: XSpeechSynthesizerEnumerateInstalledVoices
ms.author: v-denken
ms.topic: reference
edited: 07/09/2019
quality: good
security: public
applies-to: pc-gdk
---

# XSpeechSynthesizerEnumerateInstalledVoices  

Enumerates the installed voices, and calls the method pointed to by *callback* for each voice.  

## Syntax  
  
```cpp
HRESULT XSpeechSynthesizerEnumerateInstalledVoices(  
         void* context,  
         XSpeechSynthesizerInstalledVoicesCallback* callback  
)  
```  
  
### Parameters  
  
*context* &nbsp;&nbsp;\_In\_opt\_  
Type: void*  

  
A user-specified variable that will be passed into the callback function to enable the caller to recover caller-specific data.  


*callback* &nbsp;&nbsp;\_In\_  
Type: [XSpeechSynthesizerInstalledVoicesCallback](xspeechsynthesizerinstalledvoicescallback.md)*  
  
A pointer to the method that will be called once per installed voice.  
  
### Return value
Type: [HRESULT](/openspecs/windows_protocols/ms-erref/0642cb2f-2075-4469-918c-4441e69c548a)  
  
Returns **S_OK** if successful; otherwise, returns an error code. For a list of error codes, see [Error Codes](../../../errorcodes.md).  
  
## Remarks  
  > [!NOTE]
> This function isn't safe to call on a time-sensitive thread. For more information, see [Time-sensitive threads](../../../../system/overviews/time-sensitive-threads.md).  
  
This function enumerates over the speech synthesis engines, or *voices*, installed on the device. The function invokes the [XSpeechSynthesizerInstalledVoicesCallback](xspeechsynthesizerinstalledvoicescallback.md) callback function specified in *callback* once for each installed voice, and it passes an [XSpeechSynthesizerVoiceInformation](../structs/xspeechsynthesizervoiceinformation.md) structure that contains information about that voice.  
  
The following example demonstrates how to call the **XSpeechSynthesizerEnumerateInstalledVoices** function to enumerate over the installed voices on the device. The example invokes the **XSpeechSynthesizerInstalledVoicesCallback** callback function to (1) count the number of voices installed on the device and to (2) output information about each installed voice from the **XSpeechSynthesizerVoiceInformation** structure to the debugger.  
  
```cpp
int Game::CountInstalledVoices()
{
    HRESULT hr = S_OK;
    int* voiceCount = new int();
    // Call XSpeechSynthesizerEnumerateInstalledVoices with a callback function
    // defined as a lambda expression that increments the count of installed voices 
    // each time it's invoked, and outputs information about each voice to the 
    // debugger for display.
    hr = XSpeechSynthesizerEnumerateInstalledVoices(voiceCount,
        [](
            _In_ const XSpeechSynthesizerVoiceInformation* information,
            _In_ void* context
            ) -> bool 
        {
        // Increment and update the count of installed voices.
        int* voiceCount = (int*)context;
        *voiceCount = *voiceCount + 1;
        CopyMemory(context, voiceCount, sizeof(int));

        // Output information about the current installed voice
        // to the debugger for display.
        char buffer[1000];
        int bufferLen;
        bufferLen = sprintf(buffer, "(%s) %s - %s, %s\n",
            information->VoiceId,
            information->Description,
            information->Gender == XSpeechSynthesizerVoiceGender::Male ? "Male" : "Female",
            information->Language);
        OutputDebugStringA(buffer);
      
        // Continue iterating through installed voices.
        // If this was set to false, the calling function would stop
        // enumerating installed voices.
        return true;
        }
    );

    // Return the count of installed voices.
    return *voiceCount;
}
```

  
## Requirements  
  
**Header:** XSpeechSynthesizer.h
  
**Library:** xgameruntime.lib  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[XAccessibility](../../xaccessibility/xaccessibility_members.md)  
[XSpeechSynthesizerSetCustomVoice](xspeechsynthesizersetcustomvoice.md)  
[XSpeechSynthesizer](../xspeechsynthesizer_members.md)    
  