---
author: M-Stahl
title: GameInputDeviceStatus
description: Enumeration of the states that an input device can be in.
kindex: GameInputDeviceStatus
ms.author: angillie
ms.topic: reference
edited: 07/02/2019
quality: good
security: public
---

# GameInputDeviceStatus  

Enumeration of the states that an input device can be in.  

## Syntax  
  
```cpp
typedef enum GameInputDeviceStatus  
{  
    GameInputDeviceNoStatus = 0x00000000,  
    GameInputDeviceConnected = 0x00000001,  
    GameInputDeviceInputEnabled = 0x00000002,  
    GameInputDeviceOutputEnabled = 0x00000004,  
    GameInputDeviceRawIoEnabled = 0x00000008,  
    GameInputDeviceAudioCapture = 0x00000010,  
    GameInputDeviceAudioRender = 0x00000020,  
    GameInputDeviceSynchronized = 0x00000040,  
    GameInputDeviceWireless = 0x00000080,  
    GameInputDeviceUserIdle = 0x00100000,  
    GameInputDeviceAnyStatus = 0x00FFFFFF  
} GameInputDeviceStatus  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| GameInputDeviceNoStatus | The device has no status.  |  
| GameInputDeviceConnected | The device is connected. |  
| GameInputDeviceInputEnabled | The device is enabled to receive input |  
| GameInputDeviceOutputEnabled | The GameInput device is enabled to transmit output |  
| GameInputDeviceRawIoEnabled | The device is enabled to send raw output to the game |  
| GameInputDeviceAudioCapture | The device is capable of capturing audio   |  
| GameInputDeviceAudioRender | The device is capable of rendering audio   |  
| GameInputDeviceSynchronized | The device is capable of synchronizing input   |  
| GameInputDeviceWireless | The device is wireless, and connected to the device.   |  
| GameInputDeviceUserIdle | The device is idle. |  
| GameInputDeviceAnyStatus | Will read true for any device status |  
  
## Remarks  
  
These flag values may be combined as the user sees fit to filter on more than one device at a time.  
Returned by [iGameInputDevice_GetDeviceStatus](../interfaces/igameinputdevice/methods/igameinputdevice_getdevicestatus.md).  

The *GameInputDeviceInputEnabled* flag indicates whether the calling process is currently receiving input from the device. In certain special cases, overlay UI might steal input from the process temporarily. In that case, the process still has input focus but the “input enabled” flag is not set. When this flag is not set, the most current input reading from the device indicates a neutral or “at rest” state (i.e. no buttons being pressed, no movement, etc.).  

The *GameInputDeviceOutputEnabled* flag indicates whether force, haptic, or rumble feedback is currently being sent to the device. A process can set state for these kinds of feedback at any time (even when it is in the background). However, the output will only be sent to the device if the process has input focus, and no other process is currently performing exclusive raw device I/O (discussed later in this document).  

The *GameInputDeviceRawIoEnabled* flag indicates whether raw device I/O can be sent to the device. This flag is set if the process has input focus, and no other application is currently performing exclusive raw device I/O (discussed later in this document). It is also set if the process has acquired exclusive raw device I/O access.  

The *GameInputDeviceUserIdle* flag indicates that no user-generated input has been received from the device for at least 20 seconds. This can be used by applications for a variety of purposes, e.g. pausing the game, or lowering the framerate to conserve battery power.  

Applications can register to receive a callback when any of these states change, via the [IGameInput::RegisterDeviceCallback](../interfaces/igameinput/methods/igameinput_registerdevicecallback.md) method on the [IGameInput interface](../interfaces/igameinput/igameinput.md).  

## Requirements  
  
**Header:** GameInput.h
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
## See also  

[Input API Overview](../../../../input/overviews/input-overview.md)  
[GameInput](../gameinput_members.md)  
[IGameInput::RegisterDeviceCallback](../interfaces/igameinput/methods/igameinput_registerdevicecallback.md)