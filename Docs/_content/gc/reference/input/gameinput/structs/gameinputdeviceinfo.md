---
author: M-Stahl
title: GameInputDeviceInfo
description: Describes all the information about an input device.
kindex: GameInputDeviceInfo
ms.author: angillie
ms.topic: reference
edited: 07/02/2019
quality: good
security: public
---

# GameInputDeviceInfo  

Describes all the information about an input device.  

## Syntax  
  
```cpp
typedef struct GameInputDeviceInfo {  
    uint32_t infoSize;  
    uint16_t vendorId;  
    uint16_t productId;  
    uint16_t revisionNumber;  
    uint8_t interfaceNumber;  
    uint8_t collectionNumber;  
    GameInputUsage usage;  
    GameInputVersion hardwareVersion;  
    GameInputVersion firmwareVersion;  
    APP_LOCAL_DEVICE_ID deviceId;  
    APP_LOCAL_DEVICE_ID deviceRootId;  
    GameInputDeviceFamily deviceFamily;  
    GameInputDeviceCapabilities capabilities;  
    GameInputKind supportedInput;  
    GameInputRumbleMotors supportedRumbleMotors;  
    uint32_t inputReportCount;  
    uint32_t outputReportCount;  
    uint32_t featureReportCount;  
    uint32_t controllerAxisCount;  
    uint32_t controllerButtonCount;  
    uint32_t controllerSwitchCount;  
    uint32_t touchPointCount;  
    uint32_t touchSensorCount;  
    uint32_t forceFeedbackMotorCount;  
    uint32_t hapticFeedbackMotorCount;  
    uint32_t deviceStringCount;  
    uint32_t deviceDescriptorSize;  
    GameInputRawDeviceReportInfo const * inputReportInfo;  
    GameInputRawDeviceReportInfo const * outputReportInfo;  
    GameInputRawDeviceReportInfo const * featureReportInfo;  
    GameInputControllerAxisInfo const * controllerAxisInfo;  
    GameInputControllerButtonInfo const * controllerButtonInfo;  
    GameInputControllerSwitchInfo const * controllerSwitchInfo;  
    GameInputKeyboardInfo const * keyboardInfo;  
    GameInputMouseInfo const * mouseInfo;  
    GameInputTouchSensorInfo const * touchSensorInfo;  
    GameInputMotionInfo const * motionInfo;  
    GameInputArcadeStickInfo const * arcadeStickInfo;  
    GameInputFlightStickInfo const * flightStickInfo;  
    GameInputGamepadInfo const * gamepadInfo;  
    GameInputRacingWheelInfo const * racingWheelInfo;  
    GameInputUiNavigationInfo const * uiNavigationInfo;  
    GameInputForceFeedbackMotorInfo const * forceFeedbackMotorInfo;  
    GameInputHapticFeedbackMotorInfo const * hapticFeedbackMotorInfo;  
    GameInputString const * displayName;  
    GameInputString const * deviceStrings;  
    void const * deviceDescriptorData;  
} GameInputDeviceInfo  
```
  
### Members  
  
*infoSize*  
Type: uint32_t  
  
Size of the device info.
  
*vendorId*  
Type: uint16_t  
  
Identifies the vendor of the input device.  
  
*productId*  
Type: uint16_t  
  
Identifies the input device as a product.  
  
*revisionNumber*  
Type: uint16_t  
  
Device revision number.  
  
*interfaceNumber*  
Type: uint8_t  
  
Device interface number.  
  
*collectionNumber*  
Type: uint8_t  
  
Device collection number.  
  
*usage*  
Type: [GameInputUsage](gameinputusage.md)  
  
Two part index describing the input used.  
  
*hardwareVersion*  
Type: [GameInputVersion](gameinputversion.md)  
  
Designates what version of the hardware is being used.  
  
*firmwareVersion*  
Type: [GameInputVersion](gameinputversion.md)  
  
Designates what version of firmware is being used.  
  
*deviceId*  
Type: APP_LOCAL_DEVICE_ID  
  
Device ID of the input device.  
  
*deviceRootId*  
Type: APP_LOCAL_DEVICE_ID  
  
Root ID of the input device.  
  
*deviceFamily*  
Type: [GameInputDeviceFamily](../enums/gameinputdevicefamily.md)  
  
Designates the family of input device the input device belongs to.    
  
*capabilities*  
Type: [GameInputDeviceCapabilities](../enums/gameinputdevicecapabilities.md)  
  
Describe features and abilities available for  game controller.

*supportedInput*  
Type: [GameInputKind](../enums/gameinputkind.md)  
  
Describes the type or types of input the device supports.  
  
*supportedRumbleMotors*  
Type: [GameInputRumbleMotors](../enums/gameinputrumblemotors.md)  
  
Describes the accessible rumble motors on the device if there are any.  
  
*inputReportCount*  
Type: uint32_t  
  
Number of input reports for the device.  
  
*outputReportCount*  
Type: uint32_t  
  
Number of output reports for the device.  
  
*featureReportCount*  
Type: uint32_t  
  
Number of feature reports for the device.  
  
*controllerAxisCount*  
Type: uint32_t  
  
The number of Axis on the input device.  
  
*controllerButtonCount*  
Type: uint32_t  
  
The number of buttons on the input device.  
  
*controllerSwitchCount*  
Type: uint32_t  
  
The number of switches on the inputdevice  
  
*touchPointCount*  
Type: uint32_t  
  
The number of touch inputs that can be simultaneously be read at the same time for a touch input on the device.  
  
*touchSensorCount*  
Type: uint32_t  
  
The number of touch sensors on the device.  
  
*forceFeedbackMotorCount*  
Type: uint32_t  
  
The number of force feedback motors on the input device.  
  
*hapticFeedbackMotorCount*  
Type: uint32_t  
  
The number of haptic feedback motors on the input device.  
  
*deviceStringCount*  
Type: uint32_t  
  
The number of strings contained in the device info.  
  
*deviceDescriptorSize*  
Type: uint32_t  
  
Size of the device description.  
  
*inputReportInfo*  
Type: [GameInputRawDeviceReportInfo](gameinputrawdevicereportinfo.md) const *  
  
Input report info object.  
  
*outputReportInfo*  
Type: [GameInputRawDeviceReportInfo](gameinputrawdevicereportinfo.md) const *  
  
Output report.  
  
*featureReportInfo*  
Type: [GameInputRawDeviceReportInfo](gameinputrawdevicereportinfo.md) const *  
  
Feature report.  
  
*controllerAxisInfo*  
Type: [GameInputControllerAxisInfo](gameinputcontrolleraxisinfo.md) const *  
  
Information about all of the axis for an input device.  
  
*controllerButtonInfo*  
Type: [GameInputControllerButtonInfo](gameinputcontrollerbuttoninfo.md) const *  
  
Information about all of the buttons on an input device.  
  
*controllerSwitchInfo*  
Type: [GameInputControllerSwitchInfo](gameinputcontrollerswitchinfo.md) const *  
  
Information about all of the switches on an input device.  
  
*keyboardInfo*  
Type: [GameInputKeyboardInfo](gameinputkeyboardinfo.md) const *  
  
Information about a keyboard input device.
  
*mouseInfo*  
Type: [GameInputMouseInfo](gameinputmouseinfo.md) const *  
  
Information about a mouse input device.  
  
*touchSensorInfo*  
Type: [GameInputTouchSensorInfo](gameinputtouchsensorinfo.md) const *  
  
Information about all of the touch sensors on an input device.  
  
*motionInfo*  
Type: [GameInputMotionInfo](gameinputmotioninfo.md) const *  
  
Information about motion information. 
  
*arcadeStickInfo*  
Type: [GameInputArcadeStickInfo](gameinputarcadestickinfo.md) const *  
  
Information about an arcade stick input device.  
  
*flightStickInfo*  
Type: [GameInputFlightStickInfo](gameinputflightstickinfo.md) const *  
  
Information about a flight stick input device.  
  
*gamepadInfo*  
Type: [GameInputGamepadInfo](gameinputgamepadinfo.md) const *  
  
Information about a gamepad input device.  
  
*racingWheelInfo*  
Type: [GameInputRacingWheelInfo](gameinputracingwheelinfo.md) const *  
  
Information about a racing wheel input device.  
  
*uiNavigationInfo*  
Type: [GameInputUiNavigationInfo](gameinputuinavigationinfo.md) const *  
  
Information about the navigation mapping for an input device.  
  
*forceFeedbackMotorInfo*  
Type: [GameInputForceFeedbackMotorInfo](gameinputforcefeedbackmotorinfo.md) const *  
  
Information about all of the force feedback motors on a device.  
  
*hapticFeedbackMotorInfo*  
Type: [GameInputHapticFeedbackMotorInfo](gameinputhapticfeedbackmotorinfo.md) const *  
  
Information about all of the haptic feedback motors on a device  
  
*displayName*  
Type: [GameInputString](gameinputstring.md) const *  
Display name of the device.  
*deviceStrings*  
Type: [GameInputString](gameinputstring.md) const *  
  
List of game input strings for the device.  
*deviceDescriptorData*  
Type: void const *  
  
Object which describes the device.  

## Remarks  

The deviceId is an application-local ID – a 256-bit hash value which uniquely identifies the device. This ID is always the same for a given device, even across runs of an application or reboots of the system, provided it is connected to the same USB port. Application-local ID hashes are, in part, generated with information specific to the calling application and system. Therefore, while the application-local ID is the same every time a given application is run, it will be different across different applications, or in the same application across different systems. This is done to protect user privacy, so users cannot be tracked across applications/systems via their devices. The application-local ID is used by applications to create stable input mappings when several identical devices are connected to the system.  

The deviceRootId is another application-local ID which identifies the root device node for composite devices. This allows applications to reason about the relationship of individual devices. For example, some gaming keyboards work around the legacy USB limit of 8 simultaneous keypresses by exposing themselves as a composite device with multiple keyboard nodes. These are merged together into the “system” keyboard, so this is usually transparent to the user. But when processing per-keyboard input via the GameInput API, understanding this allows applications to avoid improper assumptions (e.g. that a keypress will always come from a specific device) when mapping functions to keypresses. The deviceId and deviceRootId are the same if the device is not one of many interfaces on a composite device.  

The displayName string contains a “friendly” name for the device. This string is suitable for display in an application’s UI, however there is no guarantee that it is localized. This is because the GameInput API searches several locations for this string, and one of the final fallbacks comes from the device’s firmware.  

The final fields in the GameInputDeviceInfo structure are pointers to variable-sized arrays of information about the device, such as detailed properties of individual controller buttons, or information about force feedback and haptic feedback support. NULL pointers indicate that the corresponding feature is not available or supported by the device. The number of elements in each array is indicated by a corresponding field in the structure (as noted in the SAL annotations).  
  
No one input device will have readable values for all attributes. Some input device will only have values for relevant attributes.  
Returned by [IGameInputDevice::GetDeviceInfo](../interfaces/igameinputdevice/methods/igameinputdevice_getdeviceinfo.md).
  
## Requirements  
  
**Header:** GameInput.h
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
## See also  

[Input API Overview](../../../../input/overviews/input-overview.md)  
[GameInput](../gameinput_members.md)  
[IGameInputDevice::GetDeviceInfo](../interfaces/igameinputdevice/methods/igameinputdevice_getdeviceinfo.md)