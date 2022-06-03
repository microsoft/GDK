---
author: M-Stahl
title: GameInputTouchSensorInfo
description: Describes a touch sensor for an input device.
kindex: GameInputTouchSensorInfo
ms.author: angillie
ms.topic: reference
edited: '08/08/2019'
security: public
---

# GameInputTouchSensorInfo  

Describes a touch sensor for an input device.  

<a id="syntaxSection"></a>

## Syntax  
  
```cpp
typedef struct GameInputTouchSensorInfo {  
    GameInputKind mappedInputKinds;  
    GameInputLabel label;  
    GameInputLocation location;  
    uint32_t locationId;  
    uint64_t resolutionX;  
    uint64_t resolutionY;  
    GameInputTouchShape shape;  
    float aspectRatio;  
    float orientation;  
    float physicalWidth;  
    float physicalHeight;  
    float maxPressure;  
    float maxProximity;  
    uint32_t maxTouchPoints;  
} GameInputTouchSensorInfo  
```
  
<a id="membersSection"></a>

### Members  
  
*mappedInputKinds*  
Type: [GameInputKind](../enums/gameinputkind.md)  
  
Types of input devices for which input from the touch sensor can substitute. For example, a tap on a quadrant of a touchpad might map to a "button press" on a D-pad. 
  
*label*  
Type: [GameInputLabel](../enums/gameinputlabel.md)  
  
Physical label for the touch sensor.  
  
*location*  
Type: [GameInputLocation](../enums/gameinputlocation.md)  
  
Location of the touch sensor.  
  
*locationId*  
Type: uint32_t  
  
ID of the location of the touch sensor.  
  
*resolutionX*  
Type: uint64_t  
  
Number of unique values that can be produced along the x-axis. 
  
*resolutionY*  
Type: uint64_t  

Number of unique values that can be produced along they y-axis. 

*shape*  
Type: [GameInputTouchShape](../enums/gameinputtouchshape.md)  
  
Dimensions and shape of the touch sensor.  
  
*aspectRatio*  
Type: float  
  
Aspect ratio of the touch sensor.  
  
*orientation*  
Type: float  
  
Orientation of the touch sensor.  
  
*physicalWidth*  
Type: float  
  
Width of the touch sensor in meters.  
  
*physicalHeight*  
Type: float  

Height of the touch sensor in meters.  

*maxPressure*  
Type: float  
  
Maximum amount of pressure, in newtons, that can be registered by the touch sensor. If the value is zero, the touch sensor does not have pressure sensitivity. 
  
*maxProximity*  
Type: float  
  
Maximum distance, in meters, at which a touch sensor can be activated. If the value is zero, only direct contact activates the touch sensor.  
  
*maxTouchPoints*  
Type: uint32_t  
  
Maximum number of touch points that can be simultaneously registered by the touch sensor.  
  
<a id="remarksSection"></a>

## Remarks  

This structure is used in the [GameInputDeviceInfo](gameinputdeviceinfo.md) structure. For more information, see [GetDeviceInfo](../interfaces/igameinputdevice/methods/igameinputdevice_getdeviceinfo.md). 

To retrieve state from all touch sensors on an input device, use [IGameInputReading::GetTouchState](../interfaces/igameinputreading/methods/igameinputreading_gettouchstate.md). 
  
<a id="requirementsSection"></a>

## Requirements  
  
**Header:** GameInput.h
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
<a id="seealsoSection"></a>

## See also  

[Overview of GameInput](../../../../input/overviews/input-overview.md)  
[GameInput](../gameinput_members.md)  
  