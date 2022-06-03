---
author: M-Stahl
title: GetControllerSwitchState
description: IGameInputReading GetControllerSwitchState API reference
kindex: GetControllerSwitchState
ms.author: angillie
ms.topic: reference
edited: 07/02/2019
quality: good
security: public
---

# IGameInputReading::GetControllerSwitchState  

Retrieves the switch state from a game controller.  

## Syntax  
  
```cpp
uint32_t GetControllerSwitchState(  
         uint32_t stateArrayCount,  
         GameInputSwitchPosition* stateArray  
)  
```  
  
### Parameters  
  
*stateArrayCount* &nbsp;&nbsp;\_In\_  
Type: uint32_t  

  
The expected number of switches on the game controller.
This value can be retrieved by calling [IGameInputReading::GetControllerSwitchCount](igameinputreading_getcontrollerswitchcount.md).  


*stateArray* &nbsp;&nbsp;\_Out\_writes\_(stateArrayCount)  
Type: [GameInputSwitchPosition*](../../../enums/gameinputswitchposition.md)  

  
Pointer to the array of switch states.  


  
### Return value  
Type: uint32_t

Returns the number of valid buffer entries.  
  
## Remarks  
  
Most analog controls on a game controller (joysticks, triggers, sliders, dials, etc.) are surfaced as axes, which are floating-point values linearly normalized to the range [0.0, 1.0]. Most digital inputs are surfaced as buttons, which are simple Boolean values. Hat switches are surfaced as switch values, and their position is represented by one of the [GameInputSwitchPosition](../../../enums/gameinputswitchposition.md) enumeration values.  
  
## Requirements  
  
**Header:** GameInput.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
## See also  

[Input API Overview](../../../../../../input/overviews/input-overview.md)  
[IGameInputReading](../igameinputreading.md)  
  
  