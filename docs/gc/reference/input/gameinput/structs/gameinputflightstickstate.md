---
author: M-Stahl
title: GameInputFlightStickState
description: Describes the state of a flight stick.
kindex: GameInputFlightStickState
ms.author: angillie
ms.topic: reference
edited: '08/07/2020'
security: public
---

# GameInputFlightStickState  

Describes the state of a flight stick.  

<a id="syntaxSection"></a>

## Syntax  
  
```cpp
typedef struct GameInputFlightStickState {  
    GameInputFlightStickButtons buttons;  
    GameInputSwitchPosition hatSwitch;  
    float roll;  
    float pitch;  
    float yaw;  
    float throttle;  
} GameInputFlightStickState  
```
  
<a id="membersSection"></a>

### Members  
  
*buttons*  
Type: [GameInputFlightStickButtons](../enums/gameinputflightstickbuttons.md)  
  
The flight stick buttons that are pressed. 
  
*hatSwitch*  
Type: [GameInputSwitchPosition](../enums/gameinputswitchposition.md)  
  
Position of the hat switch. 
  
*roll*  
Type: float  
  
Normalized roll value in the range [–1.0, 1.0].  
  
*pitch*  
Type: float  
  
Normalized pitch value in the range [–1.0, 1.0].  
  
*yaw*  
Type: float  
  
Normalized yaw value in the range [–1.0, 1.0].  
  
*throttle*  
Type: float  
  
Normalized throttle value in the range [–1.0, 1.0].  
  
<a id="remarksSection"></a>

## Remarks  

This structure is used by the [IGameInputReading::GetFlightStickState](../interfaces/igameinputreading/methods/igameinputreading_getflightstickstate.md) method.  
  
For more information, see the [Getting data from readings](../../../../input/overviews/input-readings.md#gettingStateSection) section of [GameInput readings](../../../../input/overviews/input-readings.md). For a related code example, see [A simple gamepad input loop](../../../../input/overviews/input-readings.md#sampleSection). 
  
<a id="requirementsSection"></a>

## Requirements  
  
**Header:** GameInput.h
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
<a id="seealsoSection"></a>

## See also  

[Overview of GameInput](../../../../input/overviews/input-overview.md)  
[GameInput](../gameinput_members.md)  
  