---
author: M-Stahl
title: GetDeviceStatus
description: Retrieves the current status of an input device.
kindex: GetDeviceStatus
ms.author: angillie
ms.topic: reference
edited: 00/00/0000
quality: good
security: public
---

# GetDeviceStatus  

Retrieves the current status of an input device.  

## Syntax  
  
```cpp
GameInputDeviceStatus GetDeviceStatus(  
)  
```  
  
### Parameters 

This method has no parameters.
  
### Return value  

Type: [GameInputDeviceStatus](../../../enums/gameinputdevicestatus.md)  
  
The value returned is the enumeration type ``GameInputDeviceStatus``.  
The value returned may be a combination of the enumerated flag values from [GameInputDeviceStatus](../../../enums/gameinputdevicestatus.md).
  
## Remarks  

The returned [GameInputDeviceStatus](../../../enums/gameinputdevicestatus.md) enumeration defines whether the device is connected, and the types of input and output that may be transmitted between the game and the device. If the ``GetDeviceStatus`` method is called when the device has been disconnected from the system, the ``GameInputDeviceNoStatus`` value is returned. You can use the ``GameInputDeviceStatus`` enumeration as a filter for the [RegisterDeviceCallback](../../igameinput/methods/igameinput_registerdevicecallback.md) method to react to specific changes in a device's state.

## Requirements  
  
**Header:** GameInput.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
## See also  

[Overview of GameInput](../../../../../../input/overviews/input-overview.md)    
[GameInputDeviceStatus](../../../enums/gameinputdevicestatus.md)  
[RegisterDeviceCallback](../../igameinput/methods/igameinput_registerdevicecallback.md)    
[IGameInputDevice](../igameinputdevice.md)