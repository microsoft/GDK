---
author: M-Stahl
title: GameInputKind
description: Enumeration of valid GameInput device types.
kindex: GameInputKind
ms.author: angillie
ms.topic: reference
edited: 00/00/0000
quality: good
security: public
---

# GameInputKind  

Enumeration of valid GameInput device types.  

## Syntax  
  
```cpp
typedef enum GameInputKind  
{  
    GameInputKindUnknown = 0x00000000,  
    GameInputKindRawDeviceReport = 0x00000001,  
    GameInputKindController = 0x00000002,  
    GameInputKindKeyboard = 0x00000004,  
    GameInputKindMouse = 0x00000008,  
    GameInputKindTouch = 0x00000100,  
    GameInputKindMotion = 0x00001000,  
    GameInputKindArcadeStick = 0x00010000,  
    GameInputKindFlightStick = 0x00020000,  
    GameInputKindGamepad = 0x00040000,  
    GameInputKindRacingWheel = 0x00080000,  
    GameInputKindUiNavigation = 0x01000000,  
    GameInputKindAny = 0x0FFFFFFF  
} GameInputKind  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| GameInputKindUnknown | Unknown Game input type |  
| GameInputKindRawDeviceReport | Raw input Device |  
| GameInputKindController | Controller input |  
| GameInputKindKeyboard | Keyboard input |  
| GameInputKindMouse | Mouse input |  
| GameInputKindTouch | Touch screen input |  
| GameInputKindMotion | Motion capture input |  
| GameInputKindArcadeStick | Arcade stick input |  
| GameInputKindFlightStick | Flight stick input |  
| GameInputKindGamepad | Gamepad Inputs |  
| GameInputKindRacingWheel | Racing wheel input |  
| GameInputKindUiNavigation | UI navigation input |  
| GameInputKindAny | Any input type |  
  
## Remarks  

GameInputKind are flag values and can be combined to filter on multiple devices.  
Parameter for [IGameInput_GetCurrentReading](../interfaces/igameinput/methods/igameinput_getcurrentreading.md).  
Returned by [IGameInputReading_GetInputKind](../interfaces/igameinputreading/methods/igameinputreading_getinputkind.md).  
Member of [GameInputControllerAxisInfo](../structs/gameinputcontrolleraxisinfo.md).  
Member of [GameInputControllerButtonInfo](../structs/gameinputcontrollerbuttoninfo.md).  
Member of [GameInputControllerSwitchInfo](../structs/gameinputcontrollerswitchinfo.md).  
Member of [GameInputDeviceInfo](../structs/gameinputdeviceinfo.md).  
Member of [GameInputTouchSensorInfo](../structs/gameinputtouchsensorinfo.md).  

## Requirements  
  
**Header:** GameInput.h
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
## See also  

[Input API Overview](../../../../input/overviews/input-overview.md)  
[GameInput](../gameinput_members.md)  
[IGameInput_GetCurrentReading](../interfaces/igameinput/methods/igameinput_getcurrentreading.md)  
[IGameInputReading_GetInputKind](../interfaces/igameinputreading/methods/igameinputreading_getinputkind.md)  
[GameInputControllerAxisInfo](../structs/gameinputcontrolleraxisinfo.md)  
[GameInputControllerButtonInfo](../structs/gameinputcontrollerbuttoninfo.md)  
[GameInputControllerSwitchInfo](../structs/gameinputcontrollerswitchinfo.md)  
[GameInputDeviceInfo](../structs/gameinputdeviceinfo.md)  
[GameInputTouchSensorInfo](../structs/gameinputtouchsensorinfo.md)