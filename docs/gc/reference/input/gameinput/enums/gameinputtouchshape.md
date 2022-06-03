---
author: M-Stahl
title: GameInputTouchShape
description: Enumerates shapes of a touch sensor.
kindex: GameInputTouchShape
ms.author: angillie
ms.topic: reference
edited: '08/07/2020'
security: public
---

# GameInputTouchShape  

Enumerates shapes of a touch sensor.  

<a id="syntaxSection"></a>

## Syntax  
  
```cpp
typedef enum GameInputTouchShape  
{  
    GameInputTouchShapeUnknown = -1,  
    GameInputTouchShapePoint = 0,  
    GameInputTouchShape1DLinear = 1,  
    GameInputTouchShape1DRadial = 2,  
    GameInputTouchShape1DIrregular = 3,  
    GameInputTouchShape2DRectangular = 4,  
    GameInputTouchShape2DElliptical = 5,  
    GameInputTouchShape2DIrregular = 6  
} GameInputTouchShape  
```  
  
<a id="constantsSection"></a>

## Constants  
  
| Constant | Description |
| --- | --- |
| GameInputTouchShapeUnknown | Shape of the touch sensor is unknown. |  
| GameInputTouchShapePoint | Touch sensor is a single point that can be represented as pressed or not pressed. |  
| GameInputTouchShape1DLinear | Touch sensor is one-dimensional and has a linear shape. |  
| GameInputTouchShape1DRadial | Touch sensor is one-dimensional and has a radial or curved shape. |  
| GameInputTouchShape1DIrregular | Touch sensor is one-dimensional and has an irregular shape. |  
| GameInputTouchShape2DRectangular | Touch sensor is two-dimensional and has a rectangular shape. |  
| GameInputTouchShape2DElliptical | Touch sensor is two-dimensional and has an elliptical shape. |  
| GameInputTouchShape2DIrregular | Touch sensor is two-dimensional and has an irregular shape. |  
  
<a id="remarksSection"></a>

## Remarks  

This enumeration categorizes touch sensors by number of dimensions and physical shape. 

This enumeration is used in the [GameInputTouchSensorInfo](../structs/gameinputtouchsensorinfo.md) structure. `GameInputTouchSensorInfo` is used in the [GameInputDeviceInfo](../structs/gameinputdeviceinfo.md) structure. 

For more information, see [GameInput devices](../../../../input/overviews/input-devices.md). 
  
<a id="requirementsSection"></a>

## Requirements  
  
**Header:** GameInput.h
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
<a id="seealsoSection"></a>

## See also  

[Overview of GameInput](../../../../input/overviews/input-overview.md)  
[GameInput](../gameinput_members.md)  
  