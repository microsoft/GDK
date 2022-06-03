---
author: M-Stahl
title: RegisterReadingCallback
description: RegisterReadingCallback API reference
kindex: RegisterReadingCallback
ms.author: angillie
ms.topic: reference
edited: 07/02/2019
quality: good
security: public
---

# IGameInput::RegisterReadingCallback  
> [!NOTE]
> This function is not yet implemented.

Registers a function to be called when a new reading arrives in the input stream.  

## Syntax  
  
```cpp
HRESULT RegisterReadingCallback(  
         IGameInputDevice* device,  
         GameInputKind inputKind,  
         float analogThreshold,  
         void* context,  
         GameInputReadingCallback callbackFunc,  
         GameInputCallbackToken* callbackToken  
)  
```  
  
### Parameters  
  
*device* &nbsp;&nbsp;\_In\_opt\_  
Type: IGameInputDevice*  


Limits registered callback to only trigger for a specific device.  

 
*inputKind* &nbsp;&nbsp;\_In\_  
Type: [GameInputKind](../../../enums/gameinputkind.md)  

  
Limits registered callback to only trigger for devices that support at least one of the specified types of input.  


*analogThreshold* &nbsp;&nbsp;\_In\_  
Type: float  

  
 Specifies a minimum delta that is required, in at least one analog value within the reading, in order to trigger a callback.  


*context* &nbsp;&nbsp;\_In\_opt\_  
Type: void*  

  
Some object which provides relevant information for the callback function. Typically the calling object.  


*callbackFunc* &nbsp;&nbsp;\_In\_  
Type: GameInputReadingCallback  

  
Title defined callback function.  


*callbackToken* &nbsp;&nbsp;\_Result\_zeroonfailure\_  
Type: GameInputCallbackToken*  

  
Token identifying the registered callback function. This token will be used to identify the registered function in the event that you would like to cancel or unregister the callback function.    


  
### Return value  
Type: HRESULT
  
This function is not yet implemented.
Returns E_NOTIMPL.  
  
## Remarks  
  
Registering a callback does not cause an initial callback to be dispatched with the most current reading that matches the supplied input filter. It only causes callbacks to be dispatched for subsequent state changes.  
  
The following C++ sample demonstrates how to get event-based gamepad states from a specific device.

```cpp
Microsoft::WRL::ComPtr<IGameInput> gameInput; 
Microsoft::WRL::ComPtr<IGameInputReading> prevReading; 
 
void CALLBACK OnGamepadReading( 
    _In_ GameInputCallbackToken callbackToken, 
    _In_ void * context, 
    _In_ uint64_t timestamp, 
    _In_ IGameInputDevice * device, 
    _In_ IGameInputReading * reading, 
    _In_ bool hasOverrunOccurred) 
{ 
    if (prevReading && !hasOverrunOccurred) 
    { 
        // Application-specific code to process the 
        // deltas between 'reading' and 'prevReading' 
    } 
 
    else 
    { 
        // Application-specific code to process the 
        // reading as an initial (standalone) reading 
    } 
 
    prevReading = reading; 
} 
 
void WaitForReadingsWorker( 
    _In_ AsyncQueueHandleT queue, 
    _In_ IGameInputDevice * gamepad, 
    _In_ volatile bool & cancelWait) noexcept 
{ 
    bool enumerationComplete = false; 
    GameInputCallbackToken token; 
    if (SUCCEEDED(gameInput->RegisterReadingCallback( 
        queue, 
        GameInputKindGamepad, 
        gamepad, 
        0.0, 
        nullptr, 
        OnGamepadReading, 
        &token))) 
    { 
        while (!cancelWait) 
        { 
            DispatchAsyncQueue(queue, AsyncQueueCallbackType_Completion, 100); 
        } 
 
        gameInput->UnregisterCallback(token, 5000); 
    } 
} 
```

The following C++ sample demonstrates how to use events to monitor input for an action mapping UI. 

```cpp
Microsoft::WRL::ComPtr<IGameInput> gameInput; 
Microsoft::WRL::ComPtr<IGameInputReading> initialReading; 
Microsoft::WRL::ComPtr<IGameInputReading> changedReading; 
Microsoft::WRL::ComPtr<IGameInputDevice> changedDevice; 
 
void CALLBACK OnReading( 
    _In_ GameInputCallbackToken callbackToken, 
    _In_ void * context, 
    _In_ uint64_t timestamp, 
    _In_ IGameInputDevice * device, 
    _In_ IGameInputReading * reading, 
    _In_ bool hasOverrunOccurred) 
{ 
    if (SUCCEEDED(gameInput->GetPreviousReading( 
        reading, 
        GameInputKindAny, 
        device, 
        &initialReading))) 
    { 
        changedDevice = device; 
        changedReading = reading; 
    } 
} 
 
bool WaitForAnyInput( 
    _In_ AsyncQueueHandleT queue, 
    _In_ uint32_t timeout, 
    _In_ float analogThreshold) noexcept 
{ 
    bool inputFound = false; 
 
    GameInputCallbackToken token; 
    if (SUCCEEDED(gameInput->RegisterReadingCallback( 
        queue, 
        GameInputKindAny, 
        nullptr, 
        analogThreshold, 
        nullptr, 
        OnReading, 
        &token))) 
    { 
        inputFound = DispatchAsyncQueue( 
            queue, 
            AsyncQueueCallbackType_Completion, 
            timeout); 
 
        gameInput->UnregisterCallback(token, 5000); 
    } 
 
    return inputFound; 
} 
```

## Requirements  
  
**Header:** GameInput.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
## See also  

[Input API Overview](../../../../../../input/overviews/input-overview.md)  
[IGameInput](../igameinput.md)  
[IGameInput::UnregisterCallback](igameinput_unregistercallback.md)  
[IGameInput::StopCallback](igameinput_stopcallback.md)  