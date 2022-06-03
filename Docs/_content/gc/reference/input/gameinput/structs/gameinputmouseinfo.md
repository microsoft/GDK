---
author: M-Stahl
title: GameInputMouseInfo
description: Describes the properties of a mouse.
kindex: GameInputMouseInfo
ms.author: angillie
ms.topic: reference
edited: '08/07/2020'
security: public
---

# GameInputMouseInfo  

Describes the properties of a mouse. 

<a id="syntaxSection"></a>

## Syntax  
  
```cpp
typedef struct GameInputMouseInfo {  
    GameInputMouseButtons supportedButtons;  
    uint32_t sampleRate;  
    uint32_t sensorDpi;  
    bool hasWheelX;  
    bool hasWheelY;  
} GameInputMouseInfo  
```
  
<a id="membersSection"></a>

### Members  
  
*supportedButtons*  
Type: [GameInputMouseButtons](../enums/gameinputmousebuttons.md)  
  
Buttons supported by the mouse.  
  
*sampleRate*  
Type: uint32_t  
  
Number of times per second that mouse movement is sampled.  
  
*sensorDpi*  
Type: uint32_t  
  
Granularity of mouse movement.  
  
*hasWheelX*  
Type: bool  
  
Indicates whether the mouse has a scroll wheel for the x-axis. 
  
*hasWheelY*  
Type: bool  
  
Indicates whether the mouse has a scroll wheel for the y-axis. 
  
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
  