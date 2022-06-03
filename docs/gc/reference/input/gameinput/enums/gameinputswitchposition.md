---
author: M-Stahl
title: GameInputSwitchPosition
description: Enumerates positions of a switch on an input device.
kindex: GameInputSwitchPosition
ms.author: angillie
ms.topic: reference
edited: '08/07/2020'
security: public
---

# GameInputSwitchPosition  

Enumerates positions of a switch on an input device.  

<a id="syntaxSection"></a>

## Syntax  
  
```cpp
typedef enum GameInputSwitchPosition  
{  
    GameInputSwitchCenter = 0,  
    GameInputSwitchUp = 1,  
    GameInputSwitchUpRight = 2,  
    GameInputSwitchRight = 3,  
    GameInputSwitchDownRight = 4,  
    GameInputSwitchDown = 5,  
    GameInputSwitchDownLeft = 6,  
    GameInputSwitchLeft = 7,  
    GameInputSwitchUpLeft = 8  
} GameInputSwitchPosition  
```  
  
<a id="constantsSection"></a>

## Constants  
  
| Constant | Description |
| --- | --- |
| GameInputSwitchCenter | Center position. |  
| GameInputSwitchUp | Up position. |  
| GameInputSwitchUpRight | Up-right position. |  
| GameInputSwitchRight | Right position. |  
| GameInputSwitchDownRight | Down-right position. |  
| GameInputSwitchDown | Down position. |  
| GameInputSwitchDownLeft | Down-left position. |  
| GameInputSwitchLeft | Left position. |  
| GameInputSwitchUpLeft | Up-left position. |
  
<a id="remarksSection"></a>

## Remarks  
  
Not every switch supports each value. 

This enumeration is used in the [GameInputFlightStickState](../structs/gameinputflightstickstate.md) structure and the [IGameInputReading::GetControllerSwitchState](../interfaces/igameinputreading/methods/igameinputreading_getcontrollerswitchstate.md) method. 

For intermediate and advanced use cases of the GameInput API, see [Advanced GameInput](../../../../input/advanced/input-advanced-topics.md) topics. 
  
<a id="requirementsSection"></a>

## Requirements  
  
**Header:** GameInput.h
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
<a id="seealsoSection"></a>

## See also  

[Overview of GameInput](../../../../input/overviews/input-overview.md)  
[GameInput](../gameinput_members.md)  
  