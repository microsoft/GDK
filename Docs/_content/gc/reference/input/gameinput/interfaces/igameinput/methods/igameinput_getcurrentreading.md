---
author: M-Stahl
title: GetCurrentReading
description: Retrieves the most recent reading from the input stream that matches a caller-supplied filter.
kindex: IGameInput::GetCurrentReading
ms.author: angillie
ms.topic: reference
edited: 00/00/0000
quality: good
security: public
---

# GetCurrentReading  

Retrieves the most recent reading from the input stream that matches a caller-supplied filter.  

## Syntax  
  
```cpp
HRESULT GetCurrentReading(  
         GameInputKind inputKind,  
         IGameInputDevice* device,  
         IGameInputReading** reading  
)  
```  
  
### Parameters  
  
*inputKind* &nbsp;&nbsp;\_In\_  
Type: [GameInputKind](../../../enums/gameinputkind.md)  

  
One of the enumeration values that designates the type of input device being used such as a controller, keyboard, mouse, or gamepad. Enumeration values can be combined to designate multiple types of input. When multiple input kinds are specified, any readings that contain at least one of the input kinds will be matched and returned.


*device* &nbsp;&nbsp;\_In\_opt\_  
Type: IGameInputDevice*  

  
An optional filter that returns readings from a specific device.  


*reading* &nbsp;&nbsp;\_COM\_Outptr\_  
Type: IGameInputReading**  


The input reading to be returned. Returns NULL on failure.


### Return value  

Type: HRESULT
  
Function result.  
  
## Remarks  
  
This function is used to initially access the input stream. You may use this function with the ``GetNextReading`` and ``GetPreviousReading`` methods to walk the input stream without missing inputs. Alternatively, you may continue to call ``GetCurrentReading`` to keep getting the most current reading if your game can permit some missing input.  
  
The following code example demonstrates how to poll for the current gamepad state.
  
```cpp
Microsoft::WRL::ComPtr<IGameInput> gameInput; 
 
void PollGamepadInput() noexcept 
{ 
    Microsoft::WRL::ComPtr<IGameInputReading> reading; 
 
    if (SUCCEEDED(gameInput->GetCurrentReading( 
        GameInputKindGamepad, 
        nullptr, 
        &reading))) 
    { 
        // Application-specific code to process the reading. 
    } 
}
```
  
The following code example demonstrates how to poll for the current gamepad state from a specific device.

```cpp
Microsoft::WRL::ComPtr<IGameInput> gameInput; 
Microsoft::WRL::ComPtr<IGameInputDevice> gamepad; 
 
void PollGamepadInput() noexcept 
{ 
    Microsoft::WRL::ComPtr<IGameInputReading> reading; 
 
    if (SUCCEEDED(gameInput->GetCurrentReading( 
        GameInputKindGamepad, 
        gamepad.Get(), 
        &reading))) 
    { 
        // Lock onto the first device we find input from, since this 
        // must be the one the player is using (if it’s generating input). 
        if (!gamepad) 
        { 
            gamepad.Attach(reading->GetDevice()); 
        } 
 
        // Application-specific code to process the reading. 
    } 
 
    else 
    { 
        // Go back to looking for a device to lock onto, if the previous one is gone. 
        gamepad = nullptr; 
    } 
}
```
  
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
 
            // Application-specific code to process the initial reading. 
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
            // Application-specific code to process the next reading. 
 
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

[Input API Overview](../../../../../../input/overviews/input-overview.md)  
 [IGameInput_GetNextReading](igameinput_getnextreading.md)  
[IGameInput_GetPreviousReading](igameinput_getpreviousreading.md)  
[IGameInput](../igameinput.md) 
  