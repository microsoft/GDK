---
author: M-Stahl
title: GameInputMotionInfo
description: Describes measurable properties for a motion-enabled input device.
kindex: GameInputMotionInfo
ms.author: angillie
ms.topic: reference
edited: '08/08/2019'
security: public
---

# GameInputMotionInfo  

Describes measurable properties for a motion-enabled input device.  

<a id="syntaxSection"></a>

## Syntax  
  
```cpp
typedef struct GameInputMotionInfo {  
    float maxAcceleration;  
    float maxAngularVelocity;  
    float maxMagneticFieldStrength;  
} GameInputMotionInfo  
```
  
<a id="membersSection"></a>

### Members  
  
*maxAcceleration*  
Type: float  
  
Maximum acceleration that can be measured for a motion, expressed in meters per second squared. Zero indicates that acceleration input is not available. 
  
*maxAngularVelocity*  
Type: float  
  
Maximum angular velocity that can be measured for a motion, expressed in radians per second. Zero indicates that angular velocity input is not available.  
  
*maxMagneticFieldStrength*  
Type: float  
  
Maximum magnetic-field strength that can be measured for a motion, expressed in teslas. Zero indicates that magnetic-field strength input is not available.  
  
<a id="remarksSection"></a>
  
## Remarks  

This structure is used in the [GameInputDeviceInfo](gameinputdeviceinfo.md) structure. `GameInputDeviceInfo` is used by the [IGameInputDevice::GetDeviceInfo](../interfaces/igameinputdevice/methods/igameinputdevice_getdeviceinfo.md) method. 

For more information, see [GameInput devices](../../../../input/overviews/input-devices.md). 
  
<a id="requirementsSection"></a>
  
## Requirements  
  
**Header:** GameInput.h
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
<a id="seealsoSection"></a>

## See also  

[Overview of GameInput](../../../../input/overviews/input-overview.md)  
[GameInput](../gameinput_members.md)
  