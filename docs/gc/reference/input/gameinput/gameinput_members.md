---
author: M-Stahl
title: GameInput API members
description: GameInput API members
kindex: GameInput
ms.author: angillie
ms.topic: navigation
edited: '08/08/2019'
security: public
---

# GameInput

GameInput APIs are used to capture human input from a wide range of devices, such as game controllers, flight sticks, racing wheels, and touch input. Devices not explicitly supported by these APIs can be read as raw device input.  

  
## Interfaces  
  
| Interface | Description |  
| --- | --- |  
| [IGameInput](interfaces/igameinput/igameinput.md) | A per-process singleton used to access the device input stream. |  
| [IGameInputDevice](interfaces/igameinputdevice/igameinputdevice.md) | Represents an Input device. |  
| [IGameInputDispatcher](interfaces/IGameInputDispatcher/igameinputdispatcher.md) | llows you to take manual control of scheduling the background work run by the GameInput API. |  
| [IGameInputForceFeedbackEffect](interfaces/igameinputforcefeedbackeffect/igameinputforcefeedbackeffect.md) | Describes and tracks a force feedback effect on a supporting input device. |  
| [IGameInputRawDeviceReport](interfaces/igameinputrawdevicereport/igameinputrawdevicereport.md) | Represents a raw byte buffer passed to or from an input device. |  
| [IGameInputReading](interfaces/igameinputreading/igameinputreading.md) | Encapsulates the data for a single input update. |  
  
## Functions  
  
| Function | Description |  
| --- | --- |  
| [GameInputCreate](functions/gameinputcreate.md) | Gets an instance of the IGameInput interface. |  
| [GameInputDeviceCallback](functions/gameinputdevicecallback.md) | Title defined call back for device connected and disconnected events. |  
| [GameInputGuideButtonCallback](functions/gameinputguidebuttoncallback.md) | Title-defined callback for the guide-button (pressed or released) event. |  
| [GameInputReadingCallback](functions/gameinputreadingcallback.md) | Title defined callback for the new reading arrived event. |  
  
## Structures  
  
| Structure | Description |  
| --- | --- |  
| [GameInputArcadeStickInfo](structs/gameinputarcadestickinfo.md) | Describes the properties of an arcade stick. |  
| [GameInputArcadeStickState](structs/gameinputarcadestickstate.md) | Describes the state of an arcade stick. |  
| [GameInputBatteryState](structs/gameinputbatterystate.md) | Describes the battery state of an input device. |  
| [GameInputControllerAxisInfo](structs/gameinputcontrolleraxisinfo.md) | Describes an axis on an input device. |  
| [GameInputControllerButtonInfo](structs/gameinputcontrollerbuttoninfo.md) | Describes a button on an input device. |  
| [GameInputControllerSwitchInfo](structs/gameinputcontrollerswitchinfo.md) | Describes a switch on an input device. |  
| [GameInputDeviceInfo](structs/gameinputdeviceinfo.md) | Describes all the information about an input device. |  
| [GameInputFlightStickInfo](structs/gameinputflightstickinfo.md) | Describes the properties of a flight stick. |  
| [GameInputFlightStickState](structs/gameinputflightstickstate.md) | Describes the state of a flight stick. |  
| [GameInputForceFeedbackConditionParams](structs/gameinputforcefeedbackconditionparams.md) | Defines some physical aspect of a force-feedback effect. |  
| [GameInputForceFeedbackConstantParams](structs/gameinputforcefeedbackconstantparams.md) | Defines a constant physical aspect of a force-feedback effect. |  
| [GameInputForceFeedbackEnvelope](structs/gameinputforcefeedbackenvelope.md) | Defines an envelope that modifies a force-feedback effect. |  
| [GameInputForceFeedbackMagnitude](structs/gameinputforcefeedbackmagnitude.md) | Defines the magnitude of the force exhibited by a force-feedback effect. |  
| [GameInputForceFeedbackMotorInfo](structs/gameinputforcefeedbackmotorinfo.md) | Defines the force-feedback motor information. |  
| [GameInputForceFeedbackParams](structs/gameinputforcefeedbackparams.md) | Defines the API-supported attributes of a force-feedback effect. |  
| [GameInputForceFeedbackPeriodicParams](structs/gameinputforcefeedbackperiodicparams.md) | The parameters that define periodic force-feedback effect. |  
| [GameInputForceFeedbackRampParams](structs/gameinputforcefeedbackrampparams.md) | Defines the parameters for a ramp force-feedback effect. |  
| [GameInputGamepadInfo](structs/gameinputgamepadinfo.md) | Describes the properties of a gamepad. |  
| [GameInputGamepadState](structs/gameinputgamepadstate.md) | Describes the state of a gamepad input device. |  
| [GameInputHapticFeedbackMotorInfo](structs/gameinputhapticfeedbackmotorinfo.md) | Describes a haptic feedback motor in an input device. |  
| [GameInputHapticFeedbackParams](structs/gameinputhapticfeedbackparams.md) | Describes a haptic feedback effect for an input device. |  
| [GameInputHapticWaveformInfo](structs/gameinputhapticwaveforminfo.md) | Describes characteristics of a haptic feedback effect. |  
| [GameInputKeyboardInfo](structs/gameinputkeyboardinfo.md) | Describes the properties of a keyboard. |  
| [GameInputKeyState](structs/gameinputkeystate.md) | Describes the state of an active key on a game controller. |  
| [GameInputMotionInfo](structs/gameinputmotioninfo.md) | Describes measurable properties for a motion-enabled input device. |  
| [GameInputMotionState](structs/gameinputmotionstate.md) | Describes the state of motion input from a motion-enabled input device. |  
| [GameInputMouseInfo](structs/gameinputmouseinfo.md) | Describes the properties of a mouse. |  
| [GameInputMouseState](structs/gameinputmousestate.md) | Describes the state of a mouse. |  
| [GameInputRacingWheelInfo](structs/gameinputracingwheelinfo.md) | Describes the properties of a racing wheel. |  
| [GameInputRacingWheelState](structs/gameinputracingwheelstate.md) | Describes the state of a racing wheel. |  
| [GameInputRawDeviceItemCollectionInfo](structs/gameinputrawdeviceitemcollectioninfo.md) | Describes a collection of raw device items. |  
| [GameInputRawDeviceReportInfo](structs/gameinputrawdevicereportinfo.md) | Describes a report of the raw stream from an input device. |  
| [GameInputRawDeviceReportItemInfo](structs/gameinputrawdevicereportiteminfo.md) | Information describing a Raw Device Report Item. |  
| [GameInputRumbleParams](structs/gameinputrumbleparams.md) | Describes a rumble effect produced by a standard controller. |  
| [GameInputString](structs/gameinputstring.md) | Describes a string that contains information about an input device. |  
| [GameInputTouchSensorInfo](structs/gameinputtouchsensorinfo.md) | Describes a touch sensor for an input device. |  
| [GameInputTouchState](structs/gameinputtouchstate.md) | Describes the state of a touch input device. |  
| [GameInputUiNavigationInfo](structs/gameinputuinavigationinfo.md) | Describes the labels of navigation buttons in the UI. |  
| [GameInputUiNavigationState](structs/gameinputuinavigationstate.md) | Describes the state of UI navigation input. |  
| [GameInputUsage](structs/gameinputusage.md) | Describes a specific HID usage. |  
| [GameInputVersion](structs/gameinputversion.md) | Describes a four-part version number. |  
  
## Enumerations  
  
| Enumeration | Description |  
| --- | --- |  
| [GameInputArcadeStickButtons](enums/gameinputarcadestickbuttons.md) | Enumerates inputs from an arcade stick. |  
| [GameInputBatteryStatus](enums/gameinputbatterystatus.md) | Enumerates battery states for an input device. |  
| [GameInputDeviceCapabilities](enums/gameinputdevicecapabilities.md) | Enumerates certain capabilities of an input device. |  
| [GameInputDeviceFamily](enums/gameinputdevicefamily.md) | Enumerates families of input devices. |  
| [GameInputDeviceStatus](enums/gameinputdevicestatus.md) | Enumeration of the states that an input device can be in. |  
| [GameInputEnumerationKind](enums/gameinputenumerationkind.md) | Enumerates types of behavior for enumerating input devices. |  
| [GameInputFeedbackAxes](enums/gameinputfeedbackaxes.md) | Enumeration of direction types of force feedback motors available on an input device. |  
| [GameInputFeedbackEffectState](enums/gameinputfeedbackeffectstate.md) | Enumerates states of a force feedback effect. |  
| [GameInputFlightStickButtons](enums/gameinputflightstickbuttons.md) | Enumerates flight stick buttons. |  
| [GameInputFocusPolicy](enums/gameinputfocuspolicy.md) | Enumerates focus policies for an input device. |  
| [GameInputForceFeedbackEffectKind](enums/gameinputforcefeedbackeffectkind.md) | numeration of the types of magnitude over time effects that can be applied to a force feedback effect. |  
| [GameInputGamepadButtons](enums/gameinputgamepadbuttons.md) | Enumerates gamepad buttons, including the directional pad (D-pad). |  
| [GameInputKeyboardKind](enums/gameinputkeyboardkind.md) | Enumerates keyboard types by key layout. |  
| [GameInputKeyboardLayout](enums/gameinputkeyboardlayout.md) | Enumerates keyboard layouts by country or region and language. |  
| [GameInputKind](enums/gameinputkind.md) | Enumeration of valid GameInput device types. |  
| [GameInputLabel](enums/gameinputlabel.md) | Enumeration of supported button labels. |  
| [GameInputLocation](enums/gameinputlocation.md) | Enumerates the parts of an input device. |  
| [GameInputMotionAccuracy](enums/gameinputmotionaccuracy.md) | Enumerates levels of accuracy for motion sensors in an input device. |  
| [GameInputMouseButtons](enums/gameinputmousebuttons.md) | Enumerates mouse buttons. |  
| [GameInputRacingWheelButtons](enums/gameinputracingwheelbuttons.md) | Enumerates buttons on a racing wheel. |  
| [GameInputRawDeviceItemCollectionKind](enums/gameinputrawdeviceitemcollectionkind.md) | Enumerates types of collections of raw device items. |  
| [GameInputRawDevicePhysicalUnitKind](enums/gameinputrawdevicephysicalunitkind.md) | Enumerates physical units associated with an input of an input device. |  
| [GameInputRawDeviceReportItemFlags](enums/gameinputrawdevicereportitemflags.md) | Enumerates types of raw device-report items. |  
| [GameInputRawDeviceReportKind](enums/gameinputrawdevicereportkind.md) | Enumerates types of raw device reports. |  
| [GameInputRumbleMotors](enums/gameinputrumblemotors.md) | Enumerates the API supported rumble motors for an input device. |  
| [GameInputSwitchKind](enums/gameinputswitchkind.md) | Enumerates types of switches supported by an input device. |  
| [GameInputSwitchPosition](enums/gameinputswitchposition.md) | Enumerates positions of a switch on an input device. |  
| [GameInputTouchShape](enums/gameinputtouchshape.md) | Enumerates shapes of a touch sensor. |  
| [GameInputUiNavigationButtons](enums/gameinputuinavigationbuttons.md) | Enumerates UI navigation buttons. |  
