---
author: M-Stahl
title: UnregisterCallback
description: IGameInput::RegisterDeviceCallback API reference
kindex: IGameInput::UnregisterCallback
ms.author: angillie
ms.topic: reference
edited: 07/02/2019
quality: good
security: public
---

# IGameInput::UnregisterCallback  

Removes a callback method. The method will no longer be called, and you may remove resources from the callback function after UnregisterCallback completes.  

## Syntax  
  
```cpp
bool UnregisterCallback(  
         GameInputCallbackToken callbackToken,  
         uint64_t timeoutInMicroseconds  
)  
```  
  
### Parameters  
  
*callbackToken* &nbsp;&nbsp;\_In\_  
Type: GameInputCallbackToken  

  
Token for the callback function to be unregistered. Generated when the function was initially registered with [IGameInput::RegisterDeviceCallback](igameinput_registerdevicecallback.md).  


*timeoutInMicroseconds* &nbsp;&nbsp;\_In\_  
Type: uint64_t  

  
Amount of time to wait for a callback to finish so it may be unregistered.  


  
### Return value  
Type: bool
  
True if callback was unregistered successfully. False indicates a time out while waiting for an in progress callback to return. A false return will still ensure no new callback will be dispatched, callbacks already in progress will still be executed.  
  
## Remarks  
  
The [IGameInput::StopCallback](igameinput_stopcallback.md) method and **IGameInput::UnregisterCallback** methods differ slightly. Calling either method ensures that the associated callback will not be dispatched again. However, it is not safe to free any resources associated with the callback (for example, unloading the DLL the hosts the callback function) until the UnregisterCallback function successfully returns.   Therefore, it is not possible to unregister a callback from within its registered callback function, and attempting to do so causes an error to be returned. However, it is safe to cancel a callback from within the callback function.
  
The following C++ sample demonstrates how to get notified when a device is disconnected. 

```cpp
Microsoft::WRL::ComPtr<IGameInput> gameInput; 
 
void CALLBACK OnDeviceDisconnected( 
    _In_ GameInputCallbackToken callbackToken, 
    _In_ void * context, 
    _In_ IGameInputDevice * device, 
    _In_ uint64_t timestamp, 
    _In_ GameInputDeviceStatus currentStatus, 
    _In_ GameInputDeviceStatus previousStatus, 
    ) 
{ 
    if (!(currentStatus & GameInputDeviceConnected)) 
    { 
        // Application-specific code to handle the device disconnection 
    } 
} 
 
void WaitForDisconnectWorker( 
    _In_ IGameInputDevice * device, 
    _In_ volatile bool & cancelWait) noexcept 
{ 
    GameInputCallbackToken token; 
    if (SUCCEEDED(gameInput->RegisterDeviceCallback( 
        device,                     // Watch for the specific input device 
        GameInputKindAny,           // Any device type 
        GameInputDeviceConnected,   // Notify on changes to GameInputDeviceConnected status 
        GameInputNoEnumeration,     // No initial enumeration needed 
        nullptr,                    // No callback context parameter 
        OnDeviceDisconnected,       // Callback function 
        &token)))                   // Generated token 
    { 
        while (!cancelWait) 
        { 
            Sleep(100); 
        } 
 
        gameInput->UnregisterCallback(token, 5000); 
    } 
} 
```
  
## Requirements  
  
**Header:** GameInput.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
## See also  

[Input API Overview](../../../../../../input/overviews/input-overview.md)  
[IGameInput](../igameinput.md)  
[IGameInput::RegisterDeviceCallback](igameinput_registerdevicecallback.md)  
[IGameInput::RegisterReadingCallback](igameinput_registerreadingcallback.md)  
[IGameInput::RegisterGuideButtonCallback](igameinput_registerguidebuttoncallback.md)