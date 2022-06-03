---
author: M-Stahl
title: GameInputTouchState
description: Describes the state of a touch input device.
kindex: GameInputTouchState
ms.author: angillie
ms.topic: reference
edited: '08/08/2019'
security: public
quality: good
---

# GameInputTouchState  

Describes the state of a touch input device.  

<a id="syntaxSection"></a>

## Syntax  
  
```cpp
typedef struct GameInputTouchState {  
    uint64_t touchId;
    uint32_t sensorIndex;
    float positionX;  
    float positionY;  
    float pressure;  
    float proximity;  
    float contactRectTop;
    float contactRectLeft;
    float contactRectRight;
    float contactRectBottom;
} GameInputTouchState  
```
  
<a id="membersSection"></a>

### Members  
  
*touchId*  
Type: uint64_t  

ID of the touch input. This is a monotonically increasing value. The first touch point has an ID of 1. The second touch point (regardless of location) has an ID of 2. This behavior enables an application to unambiguously determine whether a set of touch coordinates is a continuation of an existing touch or part of a different one.  

*sensorIndex*  
Type: uint32_t  

Index of the touch input sensor.  

*positionX*  
Type: float  
  
Position on the x-axis as a normalized value in the range [–1.0, 1.0].  
  
*positionY*  
Type: float  
  
Position on the y-axis as a normalized value in the range [–1.0, 1.0].  
  
*pressure*  
Type: float  
  
Amount of pressure exerted on the touch sensor. The value is normalized in the range [–1.0, 1.0]; 1.0 equals the maximum pressure that can be sensed according to the *maxPressure* member of [GameInputTouchSensorInfo](gameinputtouchsensorinfo.md). 
  
*proximity*  
Type: float  
  
Distance between the touch sensor and the touching implement, such as a finger or stylus. The value is normalized in the range [0.0, 1.0]. A value of 1.0 means direct contact. A value of 0.0 means that the touching implement is out of range; that is, beyond the distance specified in the *maxProximity* member of [GameInputTouchSensorInfo](gameinputtouchsensorinfo.md). If proximity sensing is not supported, the only values reported are 0.0 and 1.0. 
  
*contactRectTop*  
Type: float  

Position of the top of the contact rectangle on the y-axis.

*contactRectLeft*  
Type: float  

Position of the left side of the contact rectangle on the x-axis.  

*contactRectRight*  
Type: float  

Position of the right side of the contact rectangle on the x-axis.    

*contactRectBottom*  
Type: float  

Position of the bottom of the contact rectangle on the y-axis.  

<a id="remarksSection"></a>

## Remarks  

This structure is used by the [IGameInputReading::GetTouchState](../interfaces/igameinputreading/methods/igameinputreading_gettouchstate.md) method. Coordinates from a touch sensor do not correlate with screen coordinates. 

The values for the *proximity* member might seem counterintuitive. A smaller value means a greater distance from the touch sensor. 

For more information, see [GameInput readings](../../../../input/overviews/input-readings.md). 
  
<a id="requirementsSection"></a>

## Requirements  
  
**Header:** GameInput.h
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
<a id="seealsoSection"></a>

## See also  

[Overview of GameInput](../../../../input/overviews/input-overview.md)  
[GameInput](../gameinput_members.md)  
  