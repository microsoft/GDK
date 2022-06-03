---
author: M-Stahl
title: IGameInputDevice (Interface contents)
description: Represents an Input device.
kindex: IGameInputDevice
ms.author: angillie
ms.topic: navigation
edited: 07/02/2019
security: public
---

# IGameInputDevice  

Represents an Input device. The methods in this interface allow you to identify and interact with a game input device. You can query for information about the device like its type, abilities, and battery state. You may also activate some device specific hardware like haptic and force feedback. These methods also allows you to gain exclusive access to a device.

## Syntax  
  
```cpp  
class IGameInputDevice : public IUnknown  
```  
  
  
## Methods  
  
| Method | Description |  
| --- | --- |  
| [AcquireExclusiveRawDeviceAccess](methods/igameinputdevice_acquireexclusiverawdeviceaccess.md) | IGameInputDevice AcquireExclusiveRawDeviceAccess API reference |  
| [CreateForceFeedbackEffect](methods/igameinputdevice_createforcefeedbackeffect.md) | Uses the IGameInputForceFeedbackEffect interface to track the force feedback effect acting upon a motor. |  
| [CreateRawDeviceReport](methods/igameinputdevice_createrawdevicereport.md) | Creates a new buffer represented by an IGameInputRawDeviceReport instance. |  
| [ExecuteRawDeviceIoControl](methods/igameinputdevice_executerawdeviceiocontrol.md) | Sends an IOCTL to the underlying device or its driver. |  
| [GetBatteryState](methods/igameinputdevice_getbatterystate.md) | Gets the battery state on a device. |  
| [GetDeviceInfo](methods/igameinputdevice_getdeviceinfo.md) | Accesses static information about the full properties and capabilities of an input device. |  
| [GetDeviceStatus](methods/igameinputdevice_getdevicestatus.md) | Retrieves the current status of an input device. |  
| [GetRawDeviceFeature](methods/igameinputdevice_getrawdevicefeature.md) | Queries a feature report from a HID device. |  
| [IsForceFeedbackMotorPoweredOn](methods/igameinputdevice_isforcefeedbackmotorpoweredon.md) | Indicates whether a specific force feedback motor is powered on. |  
| [PowerOff](methods/igameinputdevice_poweroff.md) | Turns the power off on the input device. |  
| [ReleaseExclusiveRawDeviceAccess](methods/igameinputdevice_releaseexclusiverawdeviceaccess.md) | IGameInputDevice ReleaseExclusiveRawDeviceAccess API reference |  
| [SendInputSynchronizationHint](methods/igameinputdevice_sendinputsynchronizationhint.md) | Analyzes calls made to the GameInput API to determine when the game input device is available. |  
| [SendRawDeviceOutput](methods/igameinputdevice_sendrawdeviceoutput.md) | Sends raw data to the device. |  
| [SetForceFeedbackMotorGain](methods/igameinputdevice_setforcefeedbackmotorgain.md) | Applies a global attenuation factor to all loaded effects on a motor. |  
| [SetHapticMotorState](methods/igameinputdevice_sethapticmotorstate.md) | Sends a waveform to a haptic motor on a device. |  
| [SetInputSynchronizationState](methods/igameinputdevice_setinputsynchronizationstate.md) | IGameInputDevice::SetInputSynchronizationState |  
| [SetRawDeviceFeature](methods/igameinputdevice_setrawdevicefeature.md) | Sends a feature report to a HID device. |  
| [SetRumbleState](methods/igameinputdevice_setrumblestate.md) | Sets the desired intensities of the four rumble motors on the device. |  
  

## Remarks

The IGameInputDevice interface gives applications access to rich information about an input device's properties, capabilities, and current state. It also provides access to advanced functionality, such as force feedback and haptic feedback, as well as the ability to perform low-level I/O with the device (such as IOCTLs). Many applications never need to call the methods on this interface, and only use IGameInputDevice instances as simple device identifiers for filtering readings from the input stream.  

Like IGameInputReading instances, every IGameInputDevice instance is a singleton; retrieving the same device multiple times simply increments the reference count on the underlying object. Therefore, IGameInputDevice instances can be compared for reference equality.  

Applications may continue to hold references to an IGameInputDevice instance (intentionally or unintentionally) after the underlying device has been disconnected from the system. The IGameInputDevice instance remains valid, since the application cannot be forced to release its reference to the interface, but the underlying object enters a zombie state.  

When in a zombie state, any methods on the IGameInputDevice interface that return static configuration information or device state information remain callable (in general, the Get* methods). However, any methods that would modify device state, or in some way require the device to be connected, return a failure HRESULT indicating that the device is no longer connected. If the same physical device is later reconnected to the system, the zombie device object is resurrected and all methods on the IGameInputDevice instance become functional again.  
  
## Requirements  
  
**Header:** GameInput.h
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
## See also  

[Input API Overview](../../../../../input/overviews/input-overview.md)  
[GameInput](../../gameinput_members.md)