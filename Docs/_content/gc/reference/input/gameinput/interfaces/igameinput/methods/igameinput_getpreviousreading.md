---
author: M-Stahl
title: GetPreviousReading
description: Retrieves the previous IGameInputReading based on a reference reading from an optionally filtered input stream.
kindex: GetPreviousReading
ms.author: angillie
ms.topic: reference
edited: 01/06/2020
quality: good
security: public
---

# GetPreviousReading  

Retrieves the previous [IGameInputReading](../../igameinputreading/igameinputreading.md) based on a reference reading from an optionally filtered input stream.  

## Syntax  
  
```cpp
HRESULT GetPreviousReading(  
         IGameInputReading* referenceReading,  
         GameInputKind inputKind,  
         IGameInputDevice* device,  
         IGameInputReading** reading  
)  
```  
  
### Parameters  
  
*referenceReading* &nbsp;&nbsp;\_In\_  
Type: IGameInputReading*  
  
The returned ``IGameInputReading`` interface is read sequentially before this reference reading.  


*inputKind* &nbsp;&nbsp;\_In\_  
Type: [GameInputKind](../../../enums/gameinputkind.md)  

  
Filter for the types of input to pull the previous reading from. The ``GameInputKind`` interface is a flag variable. You may combine multiple values to filter on multiple constants.
When multiple input kinds are specified, any readings that contain at least one of the input kinds will be matched and returned.  


*device* &nbsp;&nbsp;\_In\_opt\_  
Type: IGameInputDevice*  
  
Filter for the specific devices to pull the previous reading from.  


*reading* &nbsp;&nbsp;\_COM\_Outptr\_  
Type: IGameInputReading**  
  
The returned ``IGameInputReading`` interface that comes sequentially before the ``referenceReading`` input.  


  
### Return value 

Type: HRESULT
 
Function result. If a null IGameInputDevice pointer is passed in, it will return E_NOTIMPL.

## Remarks  

The [GetNextReading](igameinput_getnextreading.md) and [GetPreviousReading](igameinput_getpreviousreading.md) methods let apps walk through the input history reading by reading.
  
Returns a ``NULL`` value and failure ``HRESULT`` if there is no reading after the ``referenceReading``, or if a device filter is provided for a disconnected device, or if too much time has elapsed and reference reading and returned reading have left the input-stream history buffer. The elapsed time error is rare for apps that continuously process input as the input stream maintains a half second of readings from each device in its history buffer. 
  
The following code example demonstrates how to poll for all input states.  
  
```cpp
Microsoft::WRL::ComPtr<IGameInput> gameInput; 
Microsoft::WRL::ComPtr<IGameInputReading> prevReading; 
 
void PollAllInput() noexcept 
{ 
    Microsoft::WRL::ComPtr<IGameInputReading> reading; 
 
    if (!prevReading) 
    { 
        if (SUCCEEDED(gameInput->GetCurrentReading( 
            GameInputKindAny, 
            nullptr, 
            &reading))) 
        { 
            // Application-specific code to process the initial reading. 
        } 
    } 
 
    else 
    { 
        HRESULT hr = gameInput->GetNextReading( 
            prevReading.Get(), 
            GameInputKindAny, 
            nullptr, 
            &reading); 
 
        if (SUCCEEDED(hr)) 
        { 
            // Application-specific code to process the next reading. 
 
            prevReading = reading; 
        } 
 
        else if (hr != GAMEINPUT_E_NO_READING) 
        { 
            prevReading = nullptr; 
        } 
    } 
}
```
  
The following code example demonstrates how to poll for all gamepad states from a specific device.  
  
```cpp
Microsoft::WRL::ComPtr<IGameInput> gameInput; 
Microsoft::WRL::ComPtr<IGameInputDevice> gamepad; 
Microsoft::WRL::ComPtr<IGameInputReading> prevReading; 
 
void PollGamepadInput() noexcept 
{ 
    if (!prevReading) 
    { 
        if (SUCCEEDED(gameInput->GetCurrentReading( 
            GameInputKindGamepad, 
            nullptr, 
            &prevReading))) 
        { 
            gamepad.Attach(prevReading->GetDevice()); 
 
            // Application-specific code to process the initial reading 
        } 
    } 
 
    else 
    { 
        Microsoft::WRL::ComPtr<IGameInputReading> nextReading; 
        HRESULT hr = gameInput->GetNextReading( 
            prevReading.Get(), 
            GameInputKindGamepad, 
            gamepad.Get(), 
            &nextReading); 
 
        if (SUCCEEDED(hr)) 
        { 
            // Application-specific code to process the next reading 
 
            prevReading = nextReading; 
        } 
 
        else if (hr != GAMEINPUT_E_NO_READING) 
        { 
            gamepad = nullptr; 
            prevReading = nullptr; 
        } 
    } 
}
```

## Requirements  
  
**Header:** GameInput.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
## See also 

[GameInput](../../../gameinput_members.md)  
[Overview of GameInput](../../../../../../input/overviews/input-overview.md)   
[IGameInput_GetCurrentReading](igameinput_getcurrentreading.md)    
[IGameInput_GetNextReading](igameinput_getnextreading.md)  
[IGameInput](../igameinput.md)   