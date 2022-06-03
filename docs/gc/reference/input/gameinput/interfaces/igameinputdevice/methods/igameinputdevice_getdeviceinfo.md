---
author: M-Stahl
title: GetDeviceInfo
description: Accesses static information about the full properties and capabilities of an input device.
kindex: GetDeviceInfo
ms.author: angillie
ms.topic: reference
edited: 00/00/0000
quality: good
security: public
---

# GetDeviceInfo  

Accesses static information about the full properties and capabilities of an input device.  

## Syntax  
  
```cpp
GameInputDeviceInfo* GetDeviceInfo(  
)  
```  
  
### Parameters  

This method has no parameters.
  
### Return value  

Type: GameInputDeviceInfo*
  
Information about the device.  
  
## Remarks  
  
The ``GetDeviceInfo`` method memory is not owned by the application. The memory will remain accessible if the ``IGameInput`` instance is kept alive by the application. Once the reference to the ``IGameInput`` object is released, the memory goes away.  





  
The following code example demonstrates how to identify extra buttons on a gamepad.  
   
```cpp 
bool IsGamepadButton(IGameInputDevice * gamepad, uint32_t buttonIndex) noexcept 
{ 
    auto gamepadInfo = gamepad->GetDeviceInfo(); 
    assert(buttonIndex < gamepadInfo->controllerButtonCount); 
 
    auto buttonInfo = &gamepadInfo->controllerButtonInfo[buttonIndex]; 
    bool isGamepadButton = (buttonInfo->mappedInput & GameInputKindGamepad); 
 
    return isGamepadButton; 
} 
```
  
The following code example demonstrates how to determine whether a racing wheel has a clutch.  

```cpp  
bool HasClutch(IGameInputDevice * wheel) noexcept 
{ 
    auto wheelInfo = wheel->GetDeviceInfo(); 
    assert(wheelInfo->racingWheelInfo); 
 
    bool hasClutch = wheelInfo->racingWheelInfo->hasClutch; 
 
    return hasClutch; 
} 
```
  
## Requirements  
  
**Header:** GameInput.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
## See also  

[Overview of GameInput](../../../../../../input/overviews/input-overview.md)  
[GameInputDeviceInfo](../../../structs/gameinputdeviceinfo.md)    
[IGameInputDevice](../igameinputdevice.md)  