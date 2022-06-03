---
author: M-Stahl
title: RegisterDeviceCallback
description: IGameInput::RegisterDeviceCallback API reference
kindex: IGameInput::RegisterDeviceCallback
ms.author: angillie
ms.topic: reference
edited: 07/02/2019
quality: good
security: public
---

# IGameInput::RegisterDeviceCallback  

Registers a GameInputDeviceCallback function to be called whenever a device is connected or disconnected from the system. Also allows the function to be called when the properties of a device change.  

## Syntax  
  
```cpp
HRESULT RegisterDeviceCallback(  
         IGameInputDevice* device,  
         GameInputKind inputKind,  
         GameInputDeviceStatus statusFilter,  
         GameInputEnumerationKind enumerationKind,  
         void* context,  
         GameInputDeviceCallback callbackFunc,  
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


*statusFilter* &nbsp;&nbsp;\_In\_  
Type: [GameInputDeviceStatus](../../../enums/gameinputdevicestatus.md)  

  
Limits registered callback to only trigger for specific types of device status changes.  


*enumerationKind* &nbsp;&nbsp;\_In\_  
Type: [GameInputEnumerationKind](../../../enums/gameinputenumerationkind.md)  
  
Determines whether devices will be enumerated and if the function will wait for enumeration to complete.  


*context* &nbsp;&nbsp;\_In\_opt\_  
Type: void*  

  
Some object which provides relevant information for the callback function. Typically the calling object.  


*callbackFunc* &nbsp;&nbsp;\_In\_  
Type: [GameInputDeviceCallback](../../../functions/gameinputdevicecallback.md)

  
The title-defined callback to register for the device connected or disconnected event.  


*callbackToken* &nbsp;&nbsp;\_Result\_zeroonfailure\_  
Type: GameInputCallbackToken*  

Token identifying the registered callback function. This token is used to identify the registered function in the event that you need to cancel or unregister the callback function.  

### Return value  
Type: HRESULT
  
Function result.  
  

## Remarks  

The function registered by **IGameInput::RegisterDeviceCallback** can be used to react to changes of state in the device, for something as common as a connect or disconnect, to something more specialized like a switch between wired and connected input.
The types of recognizable state changes are listed in [GameInputDeviceStatus](../../../enums/gameinputdevicestatus.md).  

The *enumerationKind* parameter can be used to cause an initial salvo of callbacks to be generated - one for each device that is connected to the system. This initial enumeration can be set to an asynchronous or synchronous enumeration. A synchronous enumeration will call all initial callbacks before **IGameInput::RegisterDeviceCallback** returns.
  
The following C++ sample demonstrates how to explicitly enumerate connected devices.  

```cpp
Microsoft::WRL::ComPtr<IGameInput> gameInput; 

void CALLBACK OnDeviceEnumerated( 
    _In_ GameInputCallbackToken callbackToken, 
    _In_ void * context, 
    _In_ IGameInputDevice * device,
    _In_ uint64_t timestamp, 
    _In_ GameInputDeviceStatus currentStatus, 
    _In_ GameInputDeviceStatus previousStatus) 
{ 
    // Application-specific code to handle the enumerated device 
} 
 
void EnumerateDevicesWorker() noexcept 
{ 
    GameInputCallbackToken token; 
    if (SUCCEEDED(gameInput->RegisterDeviceCallback( 
        nullptr,                        // Don't filter to events from a specific device 
        GameInputKindAny,               // Any device type 
        GameInputDeviceAnyStatus,       // Any device status 
        GameInputBlockingEnumeration,   // Enumerate synchronously 
        nullptr,                        // No callback context parameter 
        OnDeviceEnumerated,             // Callback function 
        &token)))                       // Generated token 
    { 
        gameInput->UnregisterCallback(token, 5000); 
    }
} 
```
  
The following C++ sample demonstrates how to be notified when a device is connected or disconnected.  
  
```cpp
Microsoft::WRL::ComPtr<IGameInput> gameInput; 
 
void CALLBACK OnDeviceConnectionChanged( 
    _In_ GameInputCallbackToken callbackToken, 
    _In_ void * context, 
    _In_ IGameInputDevice * device, 
    _In_ uint64_t timestamp, 
    _In_ GameInputDeviceStatus currentStatus, 
    _In_ GameInputDeviceStatus previousStatus, 
    ) 
{ 
    if (currentStatus & GameInputDeviceConnected)
    {
        // Application-specific code to handle the device connection 
    }
    else
    {
        // Application-specific code to handle the device disconnection 
    }
} 
 
void MonitorDeviceConnectionChanges( 
    _In_ volatile bool & cancelMonitoring) noexcept 
{ 
    GameInputCallbackToken token; 
    if (SUCCEEDED(gameInput->RegisterDeviceCallback( 
        nullptr,                    // Don't filter to events from a specific device 
        GameInputKindAny,           // Any device type 
        GameInputDeviceConnected,   // Notify on changes to GameInputDeviceConnected status 
        GameInputAsyncEnumeration,  // Enumerate initial devices asynchronously
        nullptr,                    // No callback context parameter 
        OnDeviceConnectionChanged,  // Callback function 
        &token)))                   // Generated token 
    { 
        while (!cancelMonitoring) 
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
[IGameInput::UnregisterCallback](igameinput_unregistercallback.md)  
[IGameInput::StopCallback](igameinput_stopcallback.md)