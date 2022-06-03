---
author: M-Stahl
title: GameInputRacingWheelInfo
description: Describes the properties of a racing wheel.
kindex: GameInputRacingWheelInfo
ms.author: angillie
ms.topic: reference
edited: '08/08/2019'
security: public
---

# GameInputRacingWheelInfo  

Describes the properties of a racing wheel. 

<a id="syntaxSection"></a>

## Syntax  
  
```cpp
typedef struct GameInputRacingWheelInfo {  
    GameInputLabel menuButtonLabel;  
    GameInputLabel viewButtonLabel;  
    GameInputLabel previousGearButtonLabel;  
    GameInputLabel nextGearButtonLabel;  
    GameInputLabel dpadUpLabel;  
    GameInputLabel dpadDownLabel;  
    GameInputLabel dpadLeftLabel;  
    GameInputLabel dpadRightLabel;  
    bool hasClutch;  
    bool hasHandbrake;  
    bool hasPatternShifter;  
    int32_t minPatternShifterGear;  
    int32_t maxPatternShifterGear;  
    float maxWheelAngle;  
} GameInputRacingWheelInfo  
```
  
<a id="membersSection"></a>

### Members  

*menuButtonLabel*  
Type: [GameInputLabel](../enums/gameinputlabel.md)  
  
Physical label for Menu button. 
  
*viewButtonLabel*  
Type: [GameInputLabel](../enums/gameinputlabel.md)  
  
Physical label for View button.  
  
*previousGearButtonLabel*  
Type: [GameInputLabel](../enums/gameinputlabel.md)  
  
Physical label for previous-gear selector (button). 
  
*nextGearButtonLabel*  
Type: [GameInputLabel](../enums/gameinputlabel.md)  
  
Physical label for next-gear selector (button). 
  
*dpadUpLabel*  
Type: [GameInputLabel](../enums/gameinputlabel.md)  
  
Physical label for D-pad up. 
  
*dpadDownLabel*  
Type: [GameInputLabel](../enums/gameinputlabel.md)  
  
Physical label for D-pad down.  
  
*dpadLeftLabel*  
Type: [GameInputLabel](../enums/gameinputlabel.md)  
  
Physical label for D-pad left.  
  
*dpadRightLabel*  
Type: [GameInputLabel](../enums/gameinputlabel.md)  
  
Physical label for D-pad right.  
  
*hasClutch*  
Type: bool  
  
Indicates whether the racing wheel has a clutch input. 
  
*hasHandbrake*  
Type: bool  
  
Indicates whether the racing wheel has a handbrake input. 
  
*hasPatternShifter*  
Type: bool  
  
Indicates whether the racing wheel has a pattern shifter. 
  
*minPatternShifterGear*  
Type: int32_t  
  
The lowest gear of the pattern shifter. 
  
*maxPatternShifterGear*  
Type: int32_t  
  
The highest gear of the pattern shifter.  
  
*maxWheelAngle*  
Type: float  
  
The maximum angle of the racing wheel. 
  
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
  