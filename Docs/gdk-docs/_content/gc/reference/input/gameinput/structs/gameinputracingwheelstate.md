---
author: M-Stahl
title: GameInputRacingWheelState
description: Describes the state of a racing wheel.
kindex: GameInputRacingWheelState
ms.author: angillie
ms.topic: reference
edited: '08/08/2019'
security: public
---

# GameInputRacingWheelState  

Describes the state of a racing wheel. 

<a id="syntaxSection"></a>

## Syntax  
  
```cpp
typedef struct GameInputRacingWheelState {  
    GameInputRacingWheelButtons buttons;  
    int32_t patternShifterGear;  
    float wheel;  
    float throttle;  
    float brake;  
    float clutch;  
    float handbrake;  
} GameInputRacingWheelState  
```
  
<a id="membersSection"></a>

### Members  
  
*buttons*  
Type: [GameInputRacingWheelButtons](../enums/gameinputracingwheelbuttons.md)  
  
State of the buttons on a racing wheel. 
  
*patternShifterGear*  
Type: int32_t  
  
Current gear selected on the pattern shifter. 
  
*wheel*  
Type: float  
  
Position of the wheel, normalized as a value in the range [–1.0, 1.0]. 
  
*throttle*  
Type: float  
  
Position of the throttle, normalized as a value in the range [0.0, 1.0]. 
  
*brake*  
Type: float  
  
Position of the brake, normalized as a value in the range [0.0, 1.0]. 
  
*clutch*  
Type: float  
  
Position of the clutch, normalized as a value in the range [0.0, 1.0]. 
  
*handbrake*  
Type: float  
  
Position of the handbrake, normalized as a value in the range [0.0, 1.0]. 
  
<a id="remarksSection"></a>

## Remarks  

This structure is used by the [IGameInputReading::GetRacingWheelState](../interfaces/igameinputreading/methods/igameinputreading_getracingwheelstate.md) method. 

To determine whether a racing wheel has a clutch, handbrake, or pattern shifter, examine the [GameInputRacingWheelInfo](gameinputracingwheelinfo.md) structure. 

For more information, see [GameInput readings](../../../../input/overviews/input-readings.md). 
  
<a id="requirementsSection"></a>

## Requirements  
  
**Header:** GameInput.h
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
<a id="seealsoSection"></a>

## See also  

[Overview of GameInput](../../../../input/overviews/input-overview.md)  
[GameInput](../gameinput_members.md)  
  