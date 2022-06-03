---
author: M-Stahl
title: XSpeechSynthesizerCreate
description: Creates a speech synthesizer.
kindex: XSpeechSynthesizerCreate
ms.author: v-denken
ms.topic: reference
edited: 07/09/2019
quality: good
security: public
applies-to: pc-gdk
---

# XSpeechSynthesizerCreate  

Creates a speech synthesizer.  

## Syntax  
  
```cpp
HRESULT XSpeechSynthesizerCreate(  
         XSpeechSynthesizerHandle* speechSynthesizer  
)  
```  
  
### Parameters  
  
*speechSynthesizer* &nbsp;&nbsp;\_Out\_  
Type: XSpeechSynthesizerHandle*  
  
The handle to the created speech synthesizer.  
  
### Return value
Type: [HRESULT](/openspecs/windows_protocols/ms-erref/0642cb2f-2075-4469-918c-4441e69c548a)  
  
Returns **S_OK** if successful; otherwise, returns an error code. For a list of error codes, see [Error Codes](../../../errorcodes.md).  
  
## Remarks  
  > [!NOTE]
> This function isn't safe to call on a time-sensitive thread. For more information, see [Time-sensitive threads](../../../../system/overviews/time-sensitive-threads.md).  
  
Use this function to create and receive the handle to a new speech synthesizer instance, which provides access to the functionality of an installed speech synthesis engine, or *voice*.  
  
By default, a new speech synthesizer instance uses the current system voice. To enumerate and get information about the voices installed on the current device, use the [XSpeechSynthesizerEnumerateInstalledVoices](xspeechsynthesizerenumerateinstalledvoices.md) function along with the [XSpeechSynthesizerInstalledVoicesCallback](xspeechsynthesizerinstalledvoicescallback.md) callback function. For each installed voice, the [XSpeechSynthesizerVoiceInformation](../structs/xspeechsynthesizervoiceinformation.md) structure provides the voice ID, description, display text, gender, language, and other information. Invoke [XSpeechSynthesizerSetCustomVoice](xspeechsynthesizersetcustomvoice.md) to use a different installed voice, or invoke [XSpeechSynthesizerSetDefaultVoice](xspeechsynthesizersetdefaultvoice.md) to use the current system voice again.  
  
After creating a speech synthesizer handle and specifying a voice, use the [XSpeechSynthesizerCreateStreamFromText](xspeechsynthesizercreatestreamfromtext.md) function to create a speech synthesizer stream and to synthesize speech from plain text. Use the [XSpeechSynthesizerGetStreamDataSize](xspeechsynthesizergetstreamdatasize.md) and [XSpeechSynthesizerGetStreamData](xspeechsynthesizergetstreamdata.md) functions to get the audio data for the synthesized speech from the speech synthesizer stream, then use the [XSpeechSynthesizerCloseStreamHandle](xspeechsynthesizerclosestreamhandle.md) function to close the speech synthesizer stream after all outstanding asynchronous operations are completed.
  
Use the [XSpeechSynthesizerCloseHandle](xspeechsynthesizerclosehandle.md) function to close the speech synthesizer and to release system resources after you're done using the speech synthesizer.
  
To prevent memory leaks, call the [XSpeechSynthesizerCloseHandle](xspeechsynthesizerclosehandle.md) function to close a speech synthesizer handle after you've completed all operations that are using the handle.  
  
The following example demonstrates how to synthesize speech from plain text by using a speech synthesizer and an installed voice, and how to synthesize audio data with a speech synthesizer stream. The **XSpeechSynthesizerCreate** and **XSpeechSynthesizerSetCustomVoice** functions create a speech synthesizer instance and, optionally, assign a custom voice to it if a voice ID is specified in *voiceId*. Then, the **XSpeechSynthesizerCreateStreamFromText** function creates a speech synthesizer stream and synthesizes speech from the plain text specified in *textToSpeak*. After the stream is created, the **XSpeechSynthesizerGetStreamDataSize** and **XSpeechSynthesizerGetStreamData** functions retrieve the audio data for the synthesized speech to be played from the stream. Finally, after the playing of audio data is completed, the **XSpeechSynthesizerCloseStreamHandle** and **XSpeechSynthesizerCloseHandle** functions close the speech synthesizer stream and speech synthesizer.  
  
```cpp
HRESULT Game::SynthesizeSpeech(
    const char* textToSpeak,
    const char* voiceId)
{
    // Create a new speech synthesizer.
    XSpeechSynthesizerHandle ssHandle = nullptr;
    if (FAILED(XSpeechSynthesizerCreate(&ssHandle))) { return E_FAIL; }

    // If a voice ID was specified, attempt to set the speech synthesizer to
    // use the specified voice. Note that voiceId has a default value of nullptr, 
    // as specified in its function declaration.
    if (voiceId != nullptr) 
    {
        if (FAILED(XSpeechSynthesizerSetCustomVoice(ssHandle, voiceId))) { return E_FAIL; }
    }

    // Create a new speech synthesizer stream from the specified text.
    XSpeechSynthesizerStreamHandle ssStreamHandle = nullptr;
    if (FAILED(XSpeechSynthesizerCreateStreamFromText(ssHandle, textToSpeak, &ssStreamHandle))) { return E_FAIL; }

    // Get the size of the buffer needed for the audio data from our stream.
    size_t bufferSize;
    if (FAILED(XSpeechSynthesizerGetStreamDataSize(ssStreamHandle, &bufferSize))) { return E_FAIL; }

    // Define the buffer, then retrieve the audio data from our stream.
    std::vector<char> streamData;
    streamData.resize(bufferSize);
    if (FAILED(XSpeechSynthesizerGetStreamData(ssStreamHandle, bufferSize, streamData.data(), &bufferSize))) { return E_FAIL; }

    // We now have audio data from the speech synthesizer stream, so let's play it. 
    // For the purposes of this example, the sound is played synchronously, so that we don't
    // risk having an outstanding asynchronous operation when we close the stream.
    PlaySoundW(reinterpret_cast<LPCWSTR>(streamData.data()), nullptr, SND_MEMORY);

    // We're done with the speech synthesizer stream, so let's close it.
    if (FAILED(XSpeechSynthesizerCloseStreamHandle(ssStreamHandle))) { return E_FAIL; }

    // We're done with the speech synthesizer, so let's close that, too.
    if (FAILED(XSpeechSynthesizerCloseHandle(ssHandle))) { return E_FAIL; }

    return S_OK;
}
```

  
## Requirements  
  
**Header:** XSpeechSynthesizer.h
  
**Library:** xgameruntime.lib  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[XAccessibility](../../xaccessibility/xaccessibility_members.md)  
[XSpeechSynthesizerCloseHandle](xspeechsynthesizerclosehandle.md)  
[XSpeechSynthesizer](../xspeechsynthesizer_members.md)   
  