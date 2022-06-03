---
author: M-Stahl
title: XInputGetAudioDeviceIds
description: Retrieves the IDs of the audio render and capture devices of the headset connected to the specified controller.
kindex: XInputGetAudioDeviceIds
ms.author: angillie
ms.topic: reference
edited: '08/08/2019'
security: public
---

# XInputGetAudioDeviceIds  
> [!NOTE]
> This function is not yet implemented. 

Retrieves the IDs of the audio render and capture devices of the headset connected to the specified controller.  

<a id="syntaxSection"></a>

## Syntax  

```cpp
DWORD XInputGetAudioDeviceIds( 
         DWORD dwUserIndex,​
         LPWSTR pRenderDeviceId,​
         UINT * pRenderCount,​
         LPWSTR pCaptureDeviceId,​
         UINT * pCaptureCount
)​ 
```
  
<a id="parametersSection"></a>

### Parameters  
  
*dwUserIndex* &nbsp;&nbsp;\_In\_  
Type: DWORD  
  
Index of the gamer associated with the headset; a value in the range of 0 to `XUSER_MAX_COUNT – 1`.  
  
*pRenderDeviceId* &nbsp;&nbsp; \_Out\_writes\_opt\_z\_(*pRenderCount)  
Type: LPWSTR 
  
ID of the audio render device; that is, the device that plays audio output, such as headphones. 
  
*pRenderCount* &nbsp;&nbsp;  \_Inout\_opt\_  
Type: UINT\* 
  
Size, in wide characters, of the string buffer for the ID of the render device.  
  
*pCaptureDeviceId* &nbsp;&nbsp; \_Out\_writes\_opt\_z\_(*pCaptureCount)  
Type: LPWSTR 
  
ID of the audio capture device; that is, the device that captures audio input, such as a microphone. 
  
*pCaptureCount* &nbsp;&nbsp; \_Inout\_opt\_  
Type: UINT\* 
  
Size, in wide characters, of the string buffer for the ID of the capture device.  
  
<a id="retvalSection"></a>

### Return value

Type: DWORD
  
If the function successfully retrieves the device IDs for render and capture, the return code is `ERROR_SUCCESS`.  

If no headset is connected to the controller, the function also returns `ERROR_SUCCESS`, with `NULL` as the value for *pRenderDeviceId* and *pCaptureDeviceId*.  

If the controller port device is not physically connected, the function returns `ERROR_DEVICE_NOT_CONNECTED`.  

If the function fails, it returns a Win32 error code.  
  
<a id="remarksSection"></a>

## Remarks

Callers must allocate the memory for the buffers passed to this function. The resulting strings can be of arbitrary length. 

For more information, see [The XInputOnGameInput wrapper](../../../../input/porting/input-porting-xinput.md#xinputWrapperSection). 

<a id="requirementsSection"></a>

## Requirements  
  
**Header:** XInputOnGameInput.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
<a id="seealsoSection"></a>

## See also 

[Porting from XInput to GameInput](../../../../input/porting/input-porting-xinput.md)  
[XInputOnGameInput](../xinputongameinput_members.md)  
  