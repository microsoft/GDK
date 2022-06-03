---
author: M-Stahl
title: GameInputMotionState
description: Describes the state of motion input from a motion-enabled input device.
kindex: GameInputMotionState
ms.author: angillie
ms.topic: reference
edited: '08/08/2019'
security: public
---

# GameInputMotionState  

Describes the state of motion input from a motion-enabled input device.  

<a id="syntaxSection"></a>

## Syntax  
  
```cpp
typedef struct GameInputMotionState {  
    float accelerationX;  
    float accelerationY;  
    float accelerationZ;  
    float angularVelocityX;  
    float angularVelocityY;  
    float angularVelocityZ;  
    float magneticFieldX;  
    float magneticFieldY;  
    float magneticFieldZ;  
    float orientationW;  
    float orientationX;  
    float orientationY;  
    float orientationZ;  
    GameInputMotionAccuracy magnetometerAccuracy;  
    GameInputMotionAccuracy orientationAccuracy;  
} GameInputMotionState  
```
  
<a id="membersSection"></a>

### Members  
  
*accelerationX*  
Type: float  
  
Acceleration along the x-axis.  
  
*accelerationY*  
Type: float  
  
Acceleration along the y-axis.  
  
*accelerationZ*  
Type: float  
  
Acceleration along the z-axis.  
  
*angularVelocityX*  
Type: float  
  
Angular velocity around the x-axis.  
  
*angularVelocityY*  
Type: float  
  
Angular velocity around the y-axis.  
  
*angularVelocityZ*  
Type: float  
  
Angular velocity around the z-axis.  
  
*magneticFieldX*  
Type: float  
  
Magnetic field along the x-axis.  
  
*magneticFieldY*  
Type: float  
  
Magnetic field along the y-axis.  
  
*magneticFieldZ*  
Type: float  
  
Magnetic field along the z-axis.  
  
*orientationW*  
Type: float  
  
Orientation compared to the w-axis.  
  
*orientationX*  
Type: float  
  
Orientation compared to the x-axis.  
  
*orientationY*  
Type: float  
  
Orientation compared to the y-axis.  
  
*orientationZ*  
Type: float  
  
Orientation compared to the z-axis.  
  
*magnetometerAccuracy*  
Type: [GameInputMotionAccuracy](../enums/gameinputmotionaccuracy.md)  
  
Level of accuracy of the magnetometer values.  
  
*orientationAccuracy*  
Type: [GameInputMotionAccuracy](../enums/gameinputmotionaccuracy.md)  
  
Level of accuracy of the orientation values.  
  
<a id="remarksSection"></a>
  
## Remarks  

The value of each member ranges from 0.0 through 1.0, where 1.0 represents 100 percent of the maximum magnitude specified in the [GameInputMotionInfo](gameinputmotioninfo.md) structure. 

This structure is used by the [IGameInputReading::GetMotionState](../interfaces/igameinputreading/methods/igameinputreading_getmotionstate.md) method. 

For more information, see the [Getting data from readings](../../../../input/overviews/input-readings.md#gettingStateSection) section of [GameInput readings](../../../../input/overviews/input-readings.md). For a related code example, see [A simple gamepad input loop](../../../../input/overviews/input-readings.md#sampleSection). 
  
<a id="requirementsSection"></a>
  
## Requirements  
  
**Header:** GameInput.h
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
<a id="seealsoSection"></a>

## See also  

[Input API Overview](../../../../input/overviews/input-overview.md)  
[GameInput](../gameinput_members.md)  
  