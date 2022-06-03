---
author: M-Stahl
title: GameInputLabel
description: Enumeration of supported button labels.
kindex: GameInputLabel
ms.author: angillie
ms.topic: reference
edited: 00/00/0000
quality: good
security: public
---

# GameInputLabel  

Enumeration of supported button labels.  

## Syntax  
  
```cpp
typedef enum GameInputLabel  
{  
    GameInputLabelUnknown = -1,  
    GameInputLabelNone = 0,  
    GameInputLabelXboxGuide = 1,  
    GameInputLabelXboxBack = 2,  
    GameInputLabelXboxStart = 3,  
    GameInputLabelXboxMenu = 4,  
    GameInputLabelXboxView = 5,  
    GameInputLabelXboxA = 7,  
    GameInputLabelXboxB = 8,  
    GameInputLabelXboxX = 9,  
    GameInputLabelXboxY = 10,  
    GameInputLabelXboxDPadUp = 11,  
    GameInputLabelXboxDPadDown = 12,  
    GameInputLabelXboxDPadLeft = 13,  
    GameInputLabelXboxDPadRight = 14,  
    GameInputLabelXboxLeftShoulder = 15,  
    GameInputLabelXboxLeftTrigger = 16,  
    GameInputLabelXboxLeftStickButton = 17,  
    GameInputLabelXboxRightShoulder = 18,  
    GameInputLabelXboxRightTrigger = 19,  
    GameInputLabelXboxRightStickButton = 20,  
    GameInputLabelXboxPaddle1 = 21,  
    GameInputLabelXboxPaddle2 = 22,  
    GameInputLabelXboxPaddle3 = 23,  
    GameInputLabelXboxPaddle4 = 24,  
    GameInputLabelLetterA = 25,  
    GameInputLabelLetterB = 26,  
    GameInputLabelLetterC = 27,  
    GameInputLabelLetterD = 28,  
    GameInputLabelLetterE = 29,  
    GameInputLabelLetterF = 30,  
    GameInputLabelLetterG = 31,  
    GameInputLabelLetterH = 32,  
    GameInputLabelLetterI = 33,  
    GameInputLabelLetterJ = 34,  
    GameInputLabelLetterK = 35,  
    GameInputLabelLetterL = 36,  
    GameInputLabelLetterM = 37,  
    GameInputLabelLetterN = 38,  
    GameInputLabelLetterO = 39,  
    GameInputLabelLetterP = 40,  
    GameInputLabelLetterQ = 41,  
    GameInputLabelLetterR = 42,  
    GameInputLabelLetterS = 43,  
    GameInputLabelLetterT = 44,  
    GameInputLabelLetterU = 45,  
    GameInputLabelLetterV = 46,  
    GameInputLabelLetterW = 47,  
    GameInputLabelLetterX = 48,  
    GameInputLabelLetterY = 49,  
    GameInputLabelLetterZ = 50,  
    GameInputLabelNumber0 = 51,  
    GameInputLabelNumber1 = 52,  
    GameInputLabelNumber2 = 53,  
    GameInputLabelNumber3 = 54,  
    GameInputLabelNumber4 = 55,  
    GameInputLabelNumber5 = 56,  
    GameInputLabelNumber6 = 57,  
    GameInputLabelNumber7 = 58,  
    GameInputLabelNumber8 = 59,  
    GameInputLabelNumber9 = 60,  
    GameInputLabelArrowUp = 61,  
    GameInputLabelArrowUpRight = 62,  
    GameInputLabelArrowRight = 63,  
    GameInputLabelArrowDownRight = 64,  
    GameInputLabelArrowDown = 65,  
    GameInputLabelArrowDownLLeft = 66,  
    GameInputLabelArrowLeft = 67,  
    GameInputLabelArrowUpLeft = 68,  
    GameInputLabelArrowUpDown = 69,  
    GameInputLabelArrowLeftRight = 70,  
    GameInputLabelArrowUpDownLeftRight = 71,  
    GameInputLabelArrowClockwise = 72,  
    GameInputLabelArrowCounterClockwise = 73,  
    GameInputLabelArrowReturn = 74,  
    GameInputLabelIconBranding = 75,  
    GameInputLabelIconHome = 76,  
    GameInputLabelIconMenu = 77,  
    GameInputLabelIconCross = 78,  
    GameInputLabelIconCircle = 79,  
    GameInputLabelIconSquare = 80,  
    GameInputLabelIconTriangle = 81,  
    GameInputLabelIconStar = 82,  
    GameInputLabelIconDPadUp = 83,  
    GameInputLabelIconDPadDown = 84,  
    GameInputLabelIconDPadLeft = 85,  
    GameInputLabelIconDPadRight = 86,  
    GameInputLabelIconDialClockwise = 87,  
    GameInputLabelIconDialCounterClockwise = 88,  
    GameInputLabelIconSliderLeftRight = 89,  
    GameInputLabelIconSliderUpDown = 90,  
    GameInputLabelIconWheelUpDown = 91,  
    GameInputLabelIconPlus = 92,  
    GameInputLabelIconMinus = 93,  
    GameInputLabelIconSuspension = 94,  
    GameInputLabelHome = 95,  
    GameInputLabelGuide = 96,  
    GameInputLabelMode = 97,  
    GameInputLabelSelect = 98,  
    GameInputLabelMenu = 99,  
    GameInputLabelView = 100,  
    GameInputLabelBack = 101,  
    GameInputLabelStart = 102,  
    GameInputLabelOptions = 103,  
    GameInputLabelShare = 104,  
    GameInputLabelUp = 105,  
    GameInputLabelDown = 106,  
    GameInputLabelLeft = 107,  
    GameInputLabelRight = 108,  
    GameInputLabelLB = 109,  
    GameInputLabelLT = 110,  
    GameInputLabelLSB = 111,  
    GameInputLabelL1 = 112,  
    GameInputLabelL2 = 113,  
    GameInputLabelL3 = 114,  
    GameInputLabelRB = 115,  
    GameInputLabelRT = 116,  
    GameInputLabelRSB = 117,  
    GameInputLabelR1 = 118,  
    GameInputLabelR2 = 119,  
    GameInputLabelR3 = 120,  
    GameInputLabelP1 = 121,  
    GameInputLabelP2 = 122,  
    GameInputLabelP3 = 123,  
    GameInputLabelP4 = 124  
} GameInputLabel  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| GameInputLabelUnknown | The label is unknown |  
| GameInputLabelNone | No label |  
| GameInputLabelXboxGuide | Xbox guide button |  
| GameInputLabelXboxBack | Xbox back button |  
| GameInputLabelXboxStart | Xbox start button |  
| GameInputLabelXboxMenu | Xbox menu button |  
| GameInputLabelXboxView | Xbox view button |  
| GameInputLabelXboxA | Xbox A button |  
| GameInputLabelXboxB | Xbox B button |  
| GameInputLabelXboxX | Xbox X button |  
| GameInputLabelXboxY | Xbox Y button |  
| GameInputLabelXboxDPadUp | Xbox DPad Up button |  
| GameInputLabelXboxDPadDown | Xbox Dpad down button |  
| GameInputLabelXboxDPadLeft | Xbox Dpad left button |  
| GameInputLabelXboxDPadRight | Xbox Dpad right button |  
| GameInputLabelXboxLeftShoulder | Xbox left shoulder button |  
| GameInputLabelXboxLeftTrigger | Xbox left trigger |  
| GameInputLabelXboxLeftStickButton | Xbox left stick button |  
| GameInputLabelXboxRightShoulder | Xbox right shoulder button |  
| GameInputLabelXboxRightTrigger | Xbox right trigger button |  
| GameInputLabelXboxRightStickButton | Xbox right stick button |  
| GameInputLabelXboxPaddle1 | Xbox paddle 1 |  
| GameInputLabelXboxPaddle2 | Xbox paddle 2 |  
| GameInputLabelXboxPaddle3 | Xbox paddle 3 |  
| GameInputLabelXboxPaddle4 | Xbox paddle 4 |  
| GameInputLabelLetterA | Alpha Numeric Key A |  
| GameInputLabelLetterB | Alpha Numeric Key B |  
| GameInputLabelLetterC | Alpha Numeric Key C |  
| GameInputLabelLetterD | Alpha Numeric Key D |  
| GameInputLabelLetterE | Alpha Numeric Key E |  
| GameInputLabelLetterF | Alpha Numeric Key F |  
| GameInputLabelLetterG | Alpha Numeric Key G |  
| GameInputLabelLetterH | Alpha Numeric Key H |  
| GameInputLabelLetterI | Alpha Numeric Key I |  
| GameInputLabelLetterJ | Alpha Numeric Key J |  
| GameInputLabelLetterK | Alpha Numeric Key K |  
| GameInputLabelLetterL | Alpha Numeric Key L |  
| GameInputLabelLetterM | Alpha Numeric Key M |  
| GameInputLabelLetterN | Alpha Numeric Key N |  
| GameInputLabelLetterO | Alpha Numeric Key O |  
| GameInputLabelLetterP | Alpha Numeric Key P |  
| GameInputLabelLetterQ | Alpha Numeric Key Q |  
| GameInputLabelLetterR | Alpha Numeric Key R |  
| GameInputLabelLetterS | Alpha Numeric Key S |  
| GameInputLabelLetterT | Alpha Numeric Key T |  
| GameInputLabelLetterU | Alpha Numeric Key U |  
| GameInputLabelLetterV | Alpha Numeric Key V |  
| GameInputLabelLetterW | Alpha Numeric Key W |  
| GameInputLabelLetterX | Alpha Numeric Key X |  
| GameInputLabelLetterY | Alpha Numeric Key Y |  
| GameInputLabelLetterZ | Alpha Numeric Key Z |  
| GameInputLabelNumber0 | Alpha Numeric Key 0 |  
| GameInputLabelNumber1 | Alpha Numeric Key 1 |  
| GameInputLabelNumber2 | Alpha Numeric Key 2 |  
| GameInputLabelNumber3 | Alpha Numeric Key 3 |  
| GameInputLabelNumber4 | Alpha Numeric Key 4 |  
| GameInputLabelNumber5 | Alpha Numeric Key 5 |  
| GameInputLabelNumber6 | Alpha Numeric Key 6 |  
| GameInputLabelNumber7 | Alpha Numeric Key 7 |  
| GameInputLabelNumber8 | Alpha Numeric Key 8 |  
| GameInputLabelNumber9 | Alpha Numeric Key 9 |  
| GameInputLabelArrowUp | Arrow Up |  
| GameInputLabelArrowUpRight | Arrow Up Right |  
| GameInputLabelArrowRight | Arrow Right |  
| GameInputLabelArrowDownRight | Arrow Down Right |  
| GameInputLabelArrowDown | Arrow Down |  
| GameInputLabelArrowDownLLeft | Arrow Down Left|  
| GameInputLabelArrowLeft | Arrow Left|  
| GameInputLabelArrowUpLeft | Arrow Up Left|  
| GameInputLabelArrowUpDown | Arrow Up Down |  
| GameInputLabelArrowLeftRight | Arrow Left Right |  
| GameInputLabelArrowUpDownLeftRight | Arrow Up Down Left Right |  
| GameInputLabelArrowClockwise | Arrow Clockwise |  
| GameInputLabelArrowCounterClockwise | Arrow Counter-Clockwise |  
| GameInputLabelArrowReturn | Arrow Return |  
| GameInputLabelIconBranding | Icon Branding |  
| GameInputLabelIconHome | Icon Home |  
| GameInputLabelIconMenu | Icon Menu   |  
| GameInputLabelIconCross | Icon Cross |  
| GameInputLabelIconCircle | Icon Circle |  
| GameInputLabelIconSquare | Icon Square |  
| GameInputLabelIconTriangle | Icon Triangle |  
| GameInputLabelIconStar | Icon Star |  
| GameInputLabelIconDPadUp | Icon Dpad Up |  
| GameInputLabelIconDPadDown | Icon Dpad Down |  
| GameInputLabelIconDPadLeft | Icon DPad Left |  
| GameInputLabelIconDPadRight | Icon DPad Right |  
| GameInputLabelIconDialClockwise | Icon Dial Clockwise |  
| GameInputLabelIconDialCounterClockwise | Icon Dial Counter-Clockwise |  
| GameInputLabelIconSliderLeftRight | Icon Slider Left Right |  
| GameInputLabelIconSliderUpDown | Icon Slider Up Down |  
| GameInputLabelIconWheelUpDown | Icon Wheel Up Down |  
| GameInputLabelIconPlus | Icon Plus |  
| GameInputLabelIconMinus | Icon Minus |  
| GameInputLabelIconSuspension | Icon Suspension |  
| GameInputLabelHome | Home |  
| GameInputLabelGuide | Guide |  
| GameInputLabelMode | Mode |  
| GameInputLabelSelect | Select |  
| GameInputLabelMenu | Menu |  
| GameInputLabelView | View |  
| GameInputLabelBack | Back |  
| GameInputLabelStart | Start |  
| GameInputLabelOptions | Options |  
| GameInputLabelShare | Share |  
| GameInputLabelUp | Up |  
| GameInputLabelDown | Down |  
| GameInputLabelLeft | Left |  
| GameInputLabelRight | Right |  
| GameInputLabelLB | Left Back button |  
| GameInputLabelLT | Left Trigger button |  
| GameInputLabelLSB | Left Stick button |  
| GameInputLabelL1 | Left button 1 (Playstation) |  
| GameInputLabelL2 | Left Button 2 (Playstation) |  
| GameInputLabelL3 | Left Button 3 (Playstation) |  
| GameInputLabelRB | Right Back button |  
| GameInputLabelRT | Right Trigger button |  
| GameInputLabelRSB | Right Stick button |  
| GameInputLabelR1 | Right button 1 (Playstation) |  
| GameInputLabelR2 | Right button 2 (Playstation) |  
| GameInputLabelR3 | Right button 3 (Playstation) |  
| GameInputLabelP1 | Player 1 |  
| GameInputLabelP2 | Player 2 |  
| GameInputLabelP3 | Player 3 |  
| GameInputLabelP4 | Player 4 |  
  
## Remarks  
  
GameInputLabel accounts for multiple device types including the Xbox gamepad, PlayStationGamepad, and generic gamepads.  
Member of [GameInputArcadeStickInfo](../structs/gameinputarcadestickinfo.md).
Member of [GameInputControllerAxisInfo](../structs/gameinputcontrolleraxisinfo.md).
Member of [GameInputControllerButtonInfo](../structs/gameinputcontrollerbuttoninfo.md).  
Member of [GameInputControllerSwitchInfo](../structs/gameinputcontrollerswitchinfo.md).  
Member of [GameInputFlightStickInfo](../structs/gameinputflightstickinfo.md).  
Member of [GameInputGamePadInfo](../structs/gameinputgamepadinfo.md).  
Member of [GameInputRacingWheelInfo](../structs/gameinputracingwheelinfo.md).  
Member of [GameInputTouchSensorInfo](../structs/gameinputtouchsensorinfo.md).  
Member of [GameInputUINavigationInfo](../structs/gameinputuinavigationinfo.md).  

## Requirements  
  
**Header:** GameInput.h
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
## See also  

[Input API Overview](../../../../input/overviews/input-overview.md)  
[GameInput](../gameinput_members.md)  
[GameInputArcadeStickInfo](../structs/gameinputarcadestickinfo.md)  
[GameInputControllerAxisInfo](../structs/gameinputcontrolleraxisinfo.md)  
[GameInputControllerButtonInfo](../structs/gameinputcontrollerbuttoninfo.md)  
[GameInputControllerSwitchInfo](../structs/gameinputcontrollerswitchinfo.md)  
[GameInputFlightStickInfo](../structs/gameinputflightstickinfo.md)  
[GameInputGamePadInfo](../structs/gameinputgamepadinfo.md)  
[GameInputRacingWheelInfo](../structs/gameinputracingwheelinfo.md)  
[GameInputTouchSensorInfo](../structs/gameinputtouchsensorinfo.md)  
[GameInputUINavigationInfo](../structs/gameinputuinavigationinfo.md)  