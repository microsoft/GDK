---
author: M-Stahl
title: GameInputBatteryStatus
description: Enumerates battery states for an input device.
kindex: GameInputBatteryStatus
ms.author: angillie
ms.topic: reference
edited: '08/07/2020'
security: public
---

# GameInputBatteryStatus  

Enumerates battery states for an input device.  

<a id="syntaxSection"></a>

## Syntax  
  
```cpp
typedef enum GameInputBatteryStatus  
{  
    GameInputBatteryUnknown = -1,  
    GameInputBatteryNotPresent = 0,  
    GameInputBatteryDischarging = 1,  
    GameInputBatteryIdle = 2,  
    GameInputBatteryCharging = 3  
} GameInputBatteryStatus  
```  
  
<a id="constantsSection"></a>

## Constants  
  
| Constant | Description |
| --- | --- |
| GameInputBatteryUnknown | The state of the battery is unknown. |  
| GameInputBatteryNotPresent | The device does not have a battery. |  
| GameInputBatteryDischarging | The battery is discharging.  |  
| GameInputBatteryIdle | The battery is not charging. |  
| GameInputBatteryCharging | The battery is charging. |  
  
<a id="remarksSection"></a>

## Remarks  

This enumeration is used in the [GameInputBatteryState](../structs/gameinputbatterystate.md) structure. The structure is used by the [IGameInputDevice::GetBatteryState](../interfaces/igameinputdevice/methods/igameinputdevice_getbatterystate.md) method. 

For more information, see [GameInput devices](../../../../input/overviews/input-devices.md). 
  
<a id="requirementsSection"></a>

## Requirements  
  
**Header:** GameInput.h
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
<a id="seealsoSection"></a>

## See also  

[Overview of GameInput](../../../../input/overviews/input-overview.md)  
[GameInput](../gameinput_members.md)  
  