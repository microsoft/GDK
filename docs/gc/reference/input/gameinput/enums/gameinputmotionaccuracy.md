---
author: M-Stahl
title: GameInputMotionAccuracy
description: Enumerates levels of accuracy for motion sensors in an input device.
kindex: GameInputMotionAccuracy
ms.author: angillie
ms.topic: reference
edited: '08/28/2020'
security: public
---

# GameInputMotionAccuracy  

Enumerates levels of accuracy for motion sensors in an input device.  

<a id="syntaxSection"></a>

## Syntax  
  
```cpp
typedef enum GameInputMotionAccuracy  
{  
    GameInputMotionAccuracyUnknown = -1,  
    GameInputMotionUnavailable = 0,  
    GameInputMotionUnreliable = 1,  
    GameInputMotionApproximate = 2,  
    GameInputMotionAccurate = 3  
} GameInputMotionAccuracy  
```  
  
<a id="constantsSection"></a>

## Constants  
  
| Constant | Description |
| --- | --- |
| GameInputMotionAccuracyUnknown | Motion accuracy is not known. |  
| GameInputMotionUnavailable | Motion accuracy is currently not available. |  
| GameInputMotionUnreliable | Motion accuracy is unreliable; that is, actual and reported values might differ significantly. |  
| GameInputMotionApproximate | Motion accuracy is approximate. For some titles, this level might be sufficient. |  
| GameInputMotionAccurate | Motion accuracy is accurate. |  
  
<a id="remarksSection"></a>

## Remarks  

This enumeration is used in the [GameInputMotionState](../structs/gameinputmotionstate.md) structure to describe motion-sensor accuracy. `GameInputMotionState` is used by the [IGameInputReading::GetMotionState](../interfaces/igameinputreading/methods/igameinputreading_getmotionstate.md) method. 

A title can use these values to decide whether to accept motion input from the device.  
  
<a id="requirementsSection"></a>

## Requirements  
  
**Header:** GameInput.h
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
<a id="seealsoSection"></a>

## See also  

[Overview of GameInput](../../../../input/overviews/input-overview.md)  
[GameInput](../gameinput_members.md)
  