---
author: M-Stahl
title: GameInputFlightStickInfo
description: Describes the properties of a flight stick.
kindex: GameInputFlightStickInfo
ms.author: angillie
ms.topic: reference
edited: '08/07/2020'
security: public
---

# GameInputFlightStickInfo  

Describes the properties of a flight stick.  

<a id="syntaxSection"></a>

## Syntax  
  
```cpp
typedef struct GameInputFlightStickInfo {  
    GameInputLabel menuButtonLabel;  
    GameInputLabel viewButtonLabel;  
    GameInputLabel firePrimaryButtonLabel;  
    GameInputLabel fireSecondaryButtonLabel;  
    GameInputSwitchKind hatSwitchKind;  
} GameInputFlightStickInfo  
```
  
<a id="membersSection"></a>

### Members  
  
*menuButtonLabel*  
Type: [GameInputLabel](../enums/gameinputlabel.md)  
  
Physical label for Menu button.  
  
*viewButtonLabel*  
Type: [GameInputLabel](../enums/gameinputlabel.md)  
  
Physical label for View button.  
  
*firePrimaryButtonLabel*  
Type: [GameInputLabel](../enums/gameinputlabel.md)  
  
Physical label for primary fire button.  
  
*fireSecondaryButtonLabel*  
Type: [GameInputLabel](../enums/gameinputlabel.md)  
  
Physical label for secondary fire button.  
  
*hatSwitchKind*  
Type: [GameInputSwitchKind](../enums/gameinputswitchkind.md)  
  
Type of hat switch.  
  
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
  