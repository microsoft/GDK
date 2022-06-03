---
author: M-Stahl
title: GameInputRacingWheelButtons
description: Enumerates buttons on a racing wheel.
kindex: GameInputRacingWheelButtons
ms.author: angillie
ms.topic: reference
edited: '08/07/2020'
security: public
---

# GameInputRacingWheelButtons  

Enumerates buttons on a racing wheel.  

<a id="syntaxSection"></a>

## Syntax  
  
```cpp
typedef enum GameInputRacingWheelButtons  
{  
    GameInputRacingWheelNone = 0x00000000,  
    GameInputRacingWheelMenu = 0x00000001,  
    GameInputRacingWheelView = 0x00000002,  
    GameInputRacingWheelPreviousGear = 0x00000004,  
    GameInputRacingWheelNextGear = 0x00000008,  
    GameInputRacingWheelDpadUp = 0x00000010,  
    GameInputRacingWheelDpadDown = 0x00000020,  
    GameInputRacingWheelDpadLeft = 0x00000040,  
    GameInputRacingWheelDpadRight = 0x00000080  
} GameInputRacingWheelButtons  
```  
  
<a id="constantsSection"></a>

## Constants  
  
| Constant | Description |
| --- | --- |
| GameInputRacingWheelNone | No button pressed. |  
| GameInputRacingWheelMenu | Menu button pressed. |  
| GameInputRacingWheelView | View button pressed. |  
| GameInputRacingWheelPreviousGear | Previous gear selected. |  
| GameInputRacingWheelNextGear | Next gear selected. |  
| GameInputRacingWheelDpadUp | Top portion of D-pad pressed. |  
| GameInputRacingWheelDpadDown | Bottom portion of D-pad pressed. |  
| GameInputRacingWheelDpadLeft | Left portion of D-pad pressed. |  
| GameInputRacingWheelDpadRight | Right portion of D-pad pressed. |  
  
<a id="remarksSection"></a>

## Remarks  

This enumeration is used in the [GameInputRacingWheelState](../structs/gameinputracingwheelstate.md) structure. You can combine values to read multiple buttons simultaneously. 

For more information, see the [Getting data from readings](../../../../input/overviews/input-readings.md#gettingStateSection) section of [GameInput readings](../../../../input/overviews/input-readings.md). 
  
<a id="requirementsSection"></a>

## Requirements  
  
**Header:** GameInput.h
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
<a id="seealsoSection"></a>

## See also  

[Overview of GameInput](../../../../input/overviews/input-overview.md)  
[GameInput](../gameinput_members.md)  
  