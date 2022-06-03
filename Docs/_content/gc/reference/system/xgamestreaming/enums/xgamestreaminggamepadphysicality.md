---
author: M-Stahl
title: XGameStreamingGamepadPhysicality
description: Physicality mapping for every button, stick, and trigger on a standard Xbox Wireless Controller.
kindex: XGameStreamingGamepadPhysicality
ms.author: arikcohen
ms.topic: reference
edited: 00/00/0000
security: public
applies-to: pc-gdk
---

# XGameStreamingGamepadPhysicality  

Physicality mapping for every button, stick, and trigger on a standard Xbox Wireless Controller. For any given button/stick/trigger, physicality can be unknown, physical, virtual, or both.
    

## Syntax  
  
```cpp
enum class XGameStreamingGamepadPhysicality  : uint64_t  
{  
    None = 0x0000000000000000,  
    DPadUpPhysical = 0x0000000000000001,  
    DPadDownPhysical = 0x0000000000000002,  
    DPadLeftPhysical = 0x0000000000000004,  
    DPadRightPhysical = 0x0000000000000008,  
    MenuPhysical = 0x0000000000000010,  
    ViewPhysical = 0x0000000000000020,  
    LeftThumbstickPhysical = 0x0000000000000040,  
    RightThumbstickPhysical = 0x0000000000000080,  
    LeftShoulderPhysical = 0x0000000000000100,  
    RightShoulderPhysical = 0x0000000000000200,  
    APhysical = 0x0000000000001000,  
    BPhysical = 0x0000000000002000,  
    XPhysical = 0x0000000000004000,  
    YPhysical = 0x0000000000008000,  
    LeftTriggerPhysical = 0x0000000000010000,  
    RightTriggerPhysical = 0x0000000000020000,  
    LeftThumbstickXPhysical = 0x0000000000040000,  
    LeftThumbstickYPhysical = 0x0000000000080000,  
    RightThumbstickXPhysical = 0x0000000000100000,  
    RightThumbstickYPhysical = 0x0000000000200000,  
    ButtonsPhysical = 0x000000000000F3FF,  
    AnalogsPhysical = 0x00000000003F0000,  
    AllPhysical = 0x00000000003FF3FF,  
    DPadUpVirtual = 0x0000000100000000,  
    DPadDownVirtual = 0x0000000200000000,  
    DPadLeftVirtual = 0x0000000400000000,  
    DPadRightVirtual = 0x0000000800000000,  
    MenuVirtual = 0x0000001000000000,  
    ViewVirtual = 0x0000002000000000,  
    LeftThumbstickVirtual = 0x0000004000000000,  
    RightThumbstickVirtual = 0x0000008000000000,  
    LeftShoulderVirtual = 0x0000010000000000,  
    RightShoulderVirtual = 0x0000020000000000,  
    AVirtual = 0x0000100000000000,  
    BVirtual = 0x0000200000000000,  
    XVirtual = 0x0000400000000000,  
    YVirtual = 0x0000800000000000,  
    LeftTriggerVirtual = 0x0001000000000000,  
    RightTriggerVirtual = 0x0002000000000000,  
    LeftThumbstickXVirtual = 0x0004000000000000,  
    LeftThumbstickYVirtual = 0x0008000000000000,  
    RightThumbstickXVirtual = 0x0010000000000000,  
    RightThumbstickYVirtual = 0x0020000000000000,  
    ButtonsVirtual = 0x0000F3FF00000000,  
    AnalogsVirtual = 0x003F000000000000,  
    AllVirtual = 0x003FF3FF00000000,  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| None | No Gamepad button   |  
| DPadUpPhysical | Physical gamepad directional pad up button |  
| DPadDownPhysical | Physical gamepad directional pad down button   |  
| DPadLeftPhysical | Physical gamepad directional pad left button  |  
| DPadRightPhysical | Physical gamepad directional pad right button   |  
| MenuPhysical | Physical gamepad Menu button   |  
| ViewPhysical | Physical gamepad View button   |  
| LeftThumbstickPhysical | Physical gamepad left thumbstick depression button  |  
| RightThumbstickPhysical | Physical gamepad right thumbstick depression button |  
| LeftShoulderPhysical | Physical gamepad left shoulder button   |  
| RightShoulderPhysical | Physical gamepad right shoulder button  |  
| APhysical | Physical gamepad A button   |  
| BPhysical | Physical gamepad B button  |  
| XPhysical | Physical gamepad X button   |  
| YPhysical | Physical gamepad Y button   |  
| LeftTriggerPhysical | Physical gamepad left trigger  |  
| RightTriggerPhysical | Physical gamepad right trigger   |  
| LeftThumbstickXPhysical | Physical gamepad left thumbstick horizontal position    |  
| LeftThumbstickYPhysical |  Physical gamepad left thumbstick vertical position   |  
| RightThumbstickXPhysical |  Physical gamepad right thumbstick horizontal position |  
| RightThumbstickYPhysical |  Physical gamepad right thumbstick vertical position   |  
| ButtonsPhysical | All buttons are physical  |  
| AnalogsPhysical | All analog inputs are physical  |  
| AllPhysical | All input is physical   |  
| DPadUpVirtual | Virtual gamepad directional pad up button |  
| DPadDownVirtual | Virtual gamepad directional pad down button   |  
| DPadLeftVirtual | Virtual gamepad directional pad left button  |  
| DPadRightVirtual | Virtual gamepad directional pad right button   |  
| MenuVirtual | Virtual gamepad Menu button   |  
| ViewVirtual | Virtual gamepad View button   |  
| LeftThumbstickVirtual | Virtual gamepad left thumbstick depression button  |  
| RightThumbstickVirtual | Virtual gamepad right thumbstick depression button |  
| LeftShoulderVirtual | Virtual gamepad left shoulder button   |  
| RightShoulderVirtual | Virtual gamepad right shoulder button  |  
| AVirtual | Virtual gamepad A button   |  
| BVirtual | Virtual gamepad B button  |  
| XVirtual | Virtual gamepad X button   |  
| YVirtual | Virtual gamepad Y button   |  
| LeftTriggerVirtual | Virtual gamepad left trigger  |  
| RightTriggerVirtual | Virtual gamepad right trigger   |  
| LeftThumbstickXVirtual | Virtual gamepad left thumbstick horizontal position    |  
| LeftThumbstickYVirtual |  Virtual gamepad left thumbstick vertical position   |  
| RightThumbstickXVirtual |  Virtual gamepad right thumbstick horizontal position |  
| RightThumbstickYVirtual |  Virtual gamepad right thumbstick vertical position   |  
| ButtonsVirtual | All buttons are virtual  |  
| AnalogsVirtual | All analog inputs are virtual  |  
| AllVirtual | All input is virtual   |  

## Remarks  
  
Games can use [XGameStreamingGamepadPhysicality](xgamestreaminggamepadphysicality.md) to understand if the `IGameInputReading` includes input from a physical controller, a virtual touch controller or both. 

Currently only supported for gamepad readings.

Flags can be combined to represent multiple values.

The values `AllPhysical` or `AllVirtual` may be used to identify if all the input is of a particular type, to be used to make gameplay decisions like which visual hints to provide the player.


  
## Requirements  
  
**Header:** xgamestreaming.h  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[XGameStreamingGetGamepadPhysicality](../functions/xgamestreaminggetgamepadphysicality.md)  
[XGameStreaming](../xgamestreaming_members.md)  

  
  