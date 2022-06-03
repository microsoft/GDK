---
author: M-Stahl
title: GameInputDeviceFamily
description: Enumerates families of input devices.
kindex: GameInputDeviceFamily
ms.author: angillie
ms.topic: reference
edited: '08/07/2020'
security: public
---

# GameInputDeviceFamily  

Enumerates families of input devices. 

<a id="syntaxSection"></a>

## Syntax  
  
```cpp
typedef enum GameInputDeviceFamily  
{  
    GameInputFamilyVirtual = -1,  
    GameInputFamilyAggregate = 0,  
    GameInputFamilyXboxOne = 1,  
    GameInputFamilyXbox360 = 2,  
    GameInputFamilyHid = 3,  
    GameInputFamilyI8042 = 4  
} GameInputDeviceFamily  
```  
  
<a id="constantsSection"></a>

## Constants  
  
| Constant | Description |
| --- | --- |
| GameInputFamilyVirtual | A virtualized input device on the platform. |  
| GameInputFamilyAggregate | An aggregate input device. (See [Aggregate devices](../../../../input/overviews/input-devices.md#aggregateDevicesSection).) |  
| GameInputFamilyXboxOne | An Xbox One input device. |  
| GameInputFamilyXbox360 | An Xbox 360 input device. |  
| GameInputFamilyHid | A generic Human Interface Device (HID). |  
| GameInputFamilyI8042 | An input device connected via an i8042 bus. |  
  
<a id="remarksSection"></a>

## Remarks  

This enumeration is used in the [GameInputDeviceInfo](../structs/gameinputkeyboardinfo.md) structure. `GameInputDeviceInfo` is used by the [GetDeviceInfo](../interfaces/igameinputdevice/methods/igameinputdevice_getdeviceinfo.md) function. 

For more information, see [GameInput devices](../../../../input/overviews/input-devices.md). 
  
<a id="requirementsSection"></a>

## Requirements  
  
**Header:** GameInput.h
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
<a id="seealsoSection"></a>

## See also  

[Overview of GameInput](../../../../input/overviews/input-overview.md)  
[GameInput](../gameinput_members.md)  
  