---
author: M-Stahl
title: IGameInputReading (Interface contents)
description: Encapsulates the data for a single input update.
kindex: IGameInputReading
ms.author: angillie
ms.topic: navigation
edited: 07/02/2019
security: public
---

# IGameInputReading  

Encapsulates the data for a single input update. The methods for this interface allow you to interpret game input through the lens of several devices, as well as gain information about the devices sending the input. This interface will help you translate inputs into actionable information about a game controllers state at some moment in time.

## Syntax  
  
```cpp  
class IGameInputReading : public IUnknown  
```  
  
  
## Methods  
  
| Method | Description |  
| --- | --- |  
| [GetArcadeStickState](methods/igameinputreading_getarcadestickstate.md) | IGameInputReading GetArcadeStickState API reference |  
| [GetControllerAxisCount](methods/igameinputreading_getcontrolleraxiscount.md) | Retrieves the number of axes on a game controller. |  
| [GetControllerAxisState](methods/igameinputreading_getcontrolleraxisstate.md) | IGameInputReading GetControllerAxisState API reference |  
| [GetControllerButtonCount](methods/igameinputreading_getcontrollerbuttoncount.md) | Retrieves the number of buttons on a game controller. |  
| [GetControllerButtonState](methods/igameinputreading_getcontrollerbuttonstate.md) | IGameInputReading GetControllerButtonState API reference |  
| [GetControllerSwitchCount](methods/igameinputreading_getcontrollerswitchcount.md) | Retrieves the number of switches on a game controller. |  
| [GetControllerSwitchState](methods/igameinputreading_getcontrollerswitchstate.md) | IGameInputReading GetControllerSwitchState API reference |  
| [GetDevice](methods/igameinputreading_getdevice.md) | IGameInputReading::GetDevice API |  
| [GetFlightStickState](methods/igameinputreading_getflightstickstate.md) | IGameInputReading GetFlightStickState API reference |  
| [GetGamepadState](methods/igameinputreading_getgamepadstate.md) | IGameInputReading::GetGamepadState API |  
| [GetInputKind](methods/igameinputreading_getinputkind.md) | IGameInputReading::GetInputKind API |  
| [GetKeyCount](methods/igameinputreading_getkeycount.md) | Retrieves the number of keys active on a game controller. |  
| [GetKeyState](methods/igameinputreading_getkeystate.md) | Retrieves the state of active keys on a game controller input. |  
| [GetMotionState](methods/igameinputreading_getmotionstate.md) | IGameInputReading GetMotionState API reference |  
| [GetMouseState](methods/igameinputreading_getmousestate.md) | IGameInputReading GetMouseState API reference |  
| [GetRacingWheelState](methods/igameinputreading_getracingwheelstate.md) | IGameInputReading GetRacingWheelState API reference |  
| [GetRawReport](methods/igameinputreading_getrawreport.md) | Retrieves the raw data from the device input. |  
| [GetSequenceNumber](methods/igameinputreading_getsequencenumber.md) | IGameInputReading GetSequenceNumber API reference |  
| [GetTimestamp](methods/igameinputreading_gettimestamp.md) | IGameInputReading::GetTimestamp API |  
| [GetTouchCount](methods/igameinputreading_gettouchcount.md) | Retrieves the number of touch points on a game controller. |  
| [GetTouchState](methods/igameinputreading_gettouchstate.md) | Retrieves the state from all touch digitizers on a game controller. |  
| [GetUiNavigationState](methods/igameinputreading_getuinavigationstate.md) | IGameInputReading GetUiNavigationState API reference |  
  

  
## Remarks  

Every input state change received from a device is captured in an IGameInputReading instance. Essentially, this is a snapshot of the device's input state, at a specific moment in time. The IGameInputReading interface provides access to both the raw input report data from the device, as well as various transformations of that data.  

After capturing the raw input data in a new report, the GameInput API examines the data and attempts to transform it into additional (more useful) representations. With very few exceptions, the data is transformed into one or more rudimentary representations – an array of button and axis values, an array of key states, etc. 12  If possible, the data is also transformed into one or more abstract fixed-format representations, such as gamepad state.  

As a result, a single IGameInputReading instance often contains multiple "views" of the same input data. This caters to a broad range of applications of varying sophistication, by giving them access to as little or as much low-level detail about the input data as they need. For each kind of input data defined in the GameInputKind enumeration, a corresponding IGameInputReading method exists to retrieve that kind of data.  

It is important to note that only the raw report data captured in two consecutive IGameInputReading instances (from the same device) is guaranteed to be different. This is because changes in the raw data may not always result in changes to the higher-level transformations of that data. This fact is understood by the polling and event-based APIs on the IGameInput interface and is accounted for as appropriate. For example, an application that provides an input kind filter of GameInputKindGamepad (and nothing else) will only receive readings whose raw data resulted in a change to the previously computed gamepad state.  

Every IGameInputReading retrieved from the input stream is a singleton; retrieving the same reading multiple times simply increments the reference count on the underlying object. As a result, IGameInputReading instances can be compared for reference equality. IGameInputReading instances always remain valid (and state can be retrieved from them) until all references to the reading instance have been released – even if the underlying device has been disconnected from the system, or if the reading is so old it is no longer in the input stream buffer. Because all of the methods on this interface are simply retrieving cached data stored in the reading, they all return extremely quickly and are safe to call from time sensitive contexts.  
  
## Requirements  
  
**Header:** GameInput.h
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
## See also  

[Input API Overview](../../../../../input/overviews/input-overview.md)  
[GameInput](../../gameinput_members.md)  