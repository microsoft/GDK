---
author: M-Stahl
title: GameInputRumbleMotors
description: Enumerates the API supported rumble motors for an input device.
kindex: GameInputRumbleMotors
ms.author: angillie
ms.topic: reference
edited: 00/00/0000
quality: good
security: public
---

# GameInputRumbleMotors  

Enumerates the API supported rumble motors for an input device.

## Syntax  
  
```cpp
typedef enum GameInputRumbleMotors  
{  
    GameInputRumbleNone = 0x00000000,  
    GameInputRumbleLowFrequency = 0x00000001,  
    GameInputRumbleHighFrequency = 0x00000002,  
    GameInputRumbleLeftTrigger = 0x00000004,  
    GameInputRumbleRightTrigger = 0x00000008  
} GameInputRumbleMotors  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| GameInputRumbleNone | Not a rumble motor. |  
| GameInputRumbleLowFrequency | Low frequency rumble motor. |  
| GameInputRumbleHighFrequency | High frequency rumble motor. |  
| GameInputRumbleLeftTrigger | Left trigger rumble motor. |  
| GameInputRumbleRightTrigger | Right trigger rumble motor. |  
  
## Remarks  
  
Rumble enumeration is based on the Xbox game pad but other devices are supported.  
Member of [GameInputDeviceInfo](../structs/gameinputdeviceinfo.md).  
Member of [GameInputHapticFeedbackMotorInfo](../structs/gameinputhapticfeedbackmotorinfo.md).  
  
## Requirements  
  
**Header:** GameInput.h
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
## See also  

[Input API Overview](../../../../input/overviews/input-overview.md)  
[GameInput](../gameinput_members.md)  
[GameInputDeviceInfo](../structs/gameinputdeviceinfo.md).  
[GameInputHapticFeedbackMotorInfo](../structs/gameinputhapticfeedbackmotorinfo.md).  
  