---
author: M-Stahl
title: GameInputLocation
description: Enumerates the parts of an input device.
kindex: GameInputLocation
ms.author: angillie
ms.topic: reference
edited: 00/00/0000
quality: good
security: public
---

# GameInputLocation  

Enumerates the parts of an input device.  

## Syntax  
  
```cpp
typedef enum GameInputLocation  
{  
    GameInputLocationUnknown = -1,  
    GameInputLocationChassis = 0,  
    GameInputLocationDisplay = 1,  
    GameInputLocationAxis = 2,  
    GameInputLocationButton = 3,  
    GameInputLocationSwitch = 4,  
    GameInputLocationKey = 5,  
    GameInputLocationTouchPad = 6  
} GameInputLocation  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| GameInputLocationUnknown | Location description is unknown. |  
| GameInputLocationChassis | Device feature is located in the Chassis. |  
| GameInputLocationDisplay | Device feature is located in the display.   |  
| GameInputLocationAxis | Device feature is located in a device Axis. |  
| GameInputLocationButton | Device feature is located in an input device button. |  
| GameInputLocationSwitch | Device feature is located in a device switch. |  
| GameInputLocationKey | Device feature is located in a device key. |  
| GameInputLocationTouchPad | Device feature is located in a device touch sensor. |  
  
## Remarks  
  
This function can be used to indicate the location of some part of the device such as a rumble motor, haptic feedback motor, or touch sensor.
Not all devices provide this information natively, so this will often be “unknown” unless additional device-specific data has been added to the registry.  
Member of [GameInputForceFeedbackMotorInfo](../structs/gameinputforcefeedbackmotorinfo.md).  
Member of [GameInputHapticFeedbackMotorInfo](../structs/gameinputhapticfeedbackmotorinfo.md).  
Member of [GameInputTouchSensorInfo](../structs/gameinputtouchsensorinfo.md).  
  
## Requirements  
  
**Header:** GameInput.h
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
## See also  

[Input API Overview](../../../../input/overviews/input-overview.md)  
[GameInput](../gameinput_members.md)  
[GameInputForceFeedbackMotorInfo](../structs/gameinputforcefeedbackmotorinfo.md)  
[GameInputHapticFeedbackMotorInfo](../structs/gameinputhapticfeedbackmotorinfo.md)  
[GameInputTouchSensorInfo](../structs/gameinputtouchsensorinfo.md)  