---
author: M-Stahl
title: GameInputDeviceCapabilities
description: Enumerates certain capabilities of an input device.
kindex: GameInputDeviceCapabilities
ms.author: angillie
ms.topic: reference
edited: '08/07/2020'
security: public
---

# GameInputDeviceCapabilities  

Enumerates certain capabilities of an input device. 

<a id="syntaxSection"></a>

## Syntax  
  
```cpp
typedef enum GameInputDeviceCapabilities    
{  
    GameInputDeviceCapabilityNone = 0x00000000,  
    GameInputDeviceCapabilityAudio = 0x00000001,  
    GameInputDeviceCapabilityPluginModule = 0x00000002,  
    GameInputDeviceCapabilityPowerOff = 0x00000004,  
    GameInputDeviceCapabilitySynchronization = 0x00000008,  
    GameInputDeviceCapabilityWireless = 0x00000010 
} GameInputDeviceCapabilities  
```  
  
<a id="constantsSection"></a>

## Constants  
  
| Constant | Description |
| --- | --- |
| GameInputDeviceCapabilityNone | The device has no special capabilities. |  
| GameInputDeviceCapabilityAudio | The device has audio capabilities, such as a microphone or speaker. |  
| GameInputDeviceCapabilityPluginModule | The device can use plug-in module devices, such as chatpads or external audio volume controls. |  
| GameInputDeviceCapabilityPowerOff | The device can be turned off by calling [IGameInputDevice::PowerOff](../interfaces/igameinputdevice/methods/igameinputdevice_poweroff.md). |  
| GameInputDeviceCapabilitySynchronization | The device supports Dynamic Latency Input (DLI) synchronization. |  
| GameInputDeviceCapabilityWireless | The device can connect wirelessly. |  
  
<a id="remarksSection"></a>

## Remarks  

This enumeration is used in the [GameInputDeviceInfo](../structs/gameinputkeyboardinfo.md) structure. You can combine values to target multiple capabilities. 

For more information, see [GameInput devices](../../../../input/overviews/input-devices.md). 
  
<a id="requirementsSection"></a>

## Requirements  
  
**Header:** GameInput.h
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
<a id="seealsoSection"></a>

## See also  

[IGameInputDevice::PowerOff](../interfaces/igameinputdevice/methods/igameinputdevice_poweroff.md)  
[Overview of GameInput](../../../../input/overviews/input-overview.md)  
[GameInput](../gameinput_members.md)  
  