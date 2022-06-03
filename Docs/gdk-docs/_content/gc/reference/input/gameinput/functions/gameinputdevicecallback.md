---
author: M-Stahl
title: GameInputDeviceCallback
description: Title defined call back for device connected and disconnected events.
kindex: GameInputDeviceCallback
ms.author: angillie
ms.topic: reference
edited: 00/00/0000
quality: good
security: public
---

# GameInputDeviceCallback  

Title defined call back for device connected and disconnected events. This function is registered with [IGameInput::RegisterDeviceCallback](../interfaces/igameinput/methods/igameinput_registerdevicecallback.md). This function is triggered by the conditions set from the registration function.  

## Syntax  
  
```cpp
void GameInputDeviceCallback(  
         GameInputCallbackToken callbackToken,  
         void* context,  
         IGameInputDevice* device,  
         uint64_t timestamp,  
         GameInputDeviceStatus currentStatus,  
         GameInputDeviceStatus previousStatus  
)  
```  
  
### Parameters  
  
*callbackToken* &nbsp;&nbsp;\_In\_  
Type: GameInputCallbackToken  
  
Callback token for the registered function. Token returned by [IGameInput::RegisterDeviceCallback](../interfaces/igameinput/methods/igameinput_registerdevicecallback.md). 

*context* &nbsp;&nbsp;\_In\_  
Type: void*  
  
The context passed to [IGameInput::RegisterDeviceCallback](../interfaces/igameinput/methods/igameinput_registerdevicecallback.md).    

*device* &nbsp;&nbsp;\_In\_  
Type: IGameInputDevice*  
  
Device which triggered the callback.  

*timestamp* &nbsp;&nbsp;\_In\_  
Type: uint64_t  
  
Microsecond timestamp denoting when the status change occurred.  


*currentStatus* &nbsp;&nbsp;\_In\_  
Type: [GameInputDeviceStatus](../enums/gameinputdevicestatus.md)  
  
Current connection and input status of the device.  

*previousStatus* &nbsp;&nbsp;\_In\_  
Type: [GameInputDeviceStatus](../enums/gameinputdevicestatus.md)  
  
Previous connection and input status of the device.  

  
### Return value
Type: void
  
No return type.  
  
## Remarks  
  
This function's definition is determined by the developer, but the parameters of that function must match in order for the callback to occur. This function is used to define the GameInput device callback registered with [IGameInput::RegisterDeviceCallback](../interfaces/igameinput/methods/igameinput_registerdevicecallback.md). It will define the function that is called whenever a desired device state change is detected.  
  
## Requirements  
  
**Header:** GameInput.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
## See also  

[Input API Overview](../../../../input/overviews/input-overview.md)  
[GameInput](../gameinput_members.md)  
[IGameInput::RegisterDeviceCallback](../interfaces/igameinput/methods/igameinput_registerdevicecallback.md)  