---
author: M-Stahl
title: GameInputVersion
description: Describes a four-part version number.
kindex: GameInputVersion
ms.author: angillie
ms.topic: reference
edited: '08/08/2019'
security: public
---

# GameInputVersion  

Describes a four-part version number.  

<a id="syntaxSection"></a>

## Syntax  
  
```cpp
typedef struct GameInputVersion {  
    uint16_t major;  
    uint16_t minor;  
    uint16_t build;  
    uint16_t revision;  
} GameInputVersion  
```
  
<a id="membersSection"></a>

### Members  
  
*major*  
Type: uint16_t  
  
Major version number.  
  
*minor*  
Type: uint16_t  
  
Minor version number.  
  
*build*  
Type: uint16_t  
  
Build number.  
  
*revision*  
Type: uint16_t  
  
Revision number.  

<a id="remarksSection"></a>

## Remarks

This structure is used in the [GameInputDeviceInfo](gameinputdeviceinfo.md) structure. `GameInputDeviceInfo` is used by the [IGameInputDevice::GetDeviceInfo](../interfaces/igameinputdevice/methods/igameinputdevice_getdeviceinfo.md) method. 

The structure can support versioning of hardware, firmware, or software. 
  
<a id="requirementsSection"></a>

## Requirements  
  
**Header:** GameInput.h
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
<a id="seealsoSection"></a>

## See also  

[Overview of GameInput](../../../../input/overviews/input-overview.md)  
[GameInput](../gameinput_members.md)  
  