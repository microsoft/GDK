---
author: M-Stahl
title: GameInputFeedbackAxes
description: Enumeration of direction types of force feedback motors available on an input device.
kindex: GameInputFeedbackAxes
ms.author: angillie
ms.topic: reference
edited: 00/00/0000
quality: good
security: public
---

# GameInputFeedbackAxes  

Enumeration of direction types of force feedback motors available on an input device.

## Syntax  
  
```cpp
typedef enum GameInputFeedbackAxes  
{  
    GameInputFeedbackAxisNone = 0x00000000,  
    GameInputFeedbackAxisLinearX = 0x00000001,  
    GameInputFeedbackAxisLinearY = 0x00000002,  
    GameInputFeedbackAxisLinearZ = 0x00000004,  
    GameInputFeedbackAxisAngularX = 0x00000008,  
    GameInputFeedbackAxisAngularY = 0x00000010,  
    GameInputFeedbackAxisAngularZ = 0x00000020,  
    GameInputFeedbackAxisNormal = 0x00000040  
} GameInputFeedbackAxes  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| GameInputFeedbackAxisNone | Represents a lack of feedback Axis |  
| GameInputFeedbackAxisLinearX | Represents a linear feedback motor in the X direction. |  
| GameInputFeedbackAxisLinearY | Represents a linear feedback motor in the Y direction. |  
| GameInputFeedbackAxisLinearZ | Represents a linear feedback motor in the Z direction. |  
| GameInputFeedbackAxisAngularX | Represents an angular feedback motor around the X axis. |  
| GameInputFeedbackAxisAngularY | Represents an angular feedback motor around the Y axis. |  
| GameInputFeedbackAxisAngularZ | Represents an angular feedback motor around the Z axis. |  
| GameInputFeedbackAxisNormal | Represents a dimensionless feedback motor |  
  
## Remarks  
  
Force feedback is typically only found on racing wheels, with one single-axis motor connected to the steering wheel itself. However, the GameInput API supports devices with any number of force feedback motors, and assigns a unique index number to each motor on a device. The “normal” axis is used for special cases where the applied force is dimensionless, such as a pressure suit for a flight simulator.  
Member of [GameInputForceFeedbackMotorInfo](../structs/gameinputforcefeedbackmotorinfo.md).  
  
## Requirements  
  
**Header:** GameInput.h
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
## See also  

[Input API Overview](../../../../input/overviews/input-overview.md)  
[GameInput](../gameinput_members.md)  
[GameInputForceFeedbackMotorInfo](../structs/gameinputforcefeedbackmotorinfo.md)  