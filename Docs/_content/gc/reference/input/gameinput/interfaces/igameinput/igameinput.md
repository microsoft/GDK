---
author: M-Stahl
title: IGameInput (Interface contents)
description: A per-process singleton used to access the device input stream.
kindex: IGameInput
ms.author: angillie
ms.topic: navigation
edited: 07/02/2019
security: public
---

# IGameInput  

A per-process singleton used to access the device input stream.  

The IGameInput interface is the starting point for using the GameInput API. This interface provides methods for synchronously retrieving cached readings from the input stream (the polling API), and methods for registering asynchronous callbacks for state changes (the event-based API). It also contains utility methods for legacy API interop and special OEM device support.  

## Syntax  
  
```cpp  
class IGameInput : public IUnknown  
```  
  
  
## Methods  
  
| Method | Description |  
| --- | --- |  
| [CreateAggregateDevice](methods/igameinput_createaggregatedevice.md) | CreateAggregateDevice API reference |  
| [CreateDispatcher](methods/igameinput_createdispatcher.md) | CreateDispatcher API reference |  
| [EnableOemDeviceSupport](methods/igameinput_enableoemdevicesupport.md) | Specifies a plug-and-play device that the caller wants like the GameInput API to expose in its input stream. |  
| [FindDeviceFromObject](methods/igameinput_finddevicefromobject.md) | Retrieves a connected IGameInputDevice based on a matching object. |  
| [FindDeviceFromPlatformHandle](methods/igameinput_finddevicefromplatformhandle.md) | Retrieves a connected IGameInputDevice interface based on a matching platform handle. |  
| [FindDeviceFromPlatformString](methods/igameinput_finddevicefromplatformstring.md) | Retrieves an IGameInputDevice interface based on a matching platform string. |  
| [GetCurrentReading](methods/igameinput_getcurrentreading.md) | Retrieves the most recent reading from the input stream that matches a caller-supplied filter. |  
| [GetCurrentTimestamp](methods/igameinput_getcurrenttimestamp.md) | IGameInput::GetCurrentTimestamp API reference |  
| [GetDeviceFromId](methods/igameinput_finddevicefromid.md) | GetDeviceFromId API reference |  
| [GetNextReading](methods/igameinput_getnextreading.md) | Retrieves the next available IGameInputReading interface based on a reference reading from an optionally filtered input stream. |  
| [GetPreviousReading](methods/igameinput_getpreviousreading.md) | Retrieves the previous IGameInputReading based on a reference reading from an optionally filtered input stream. |  
| [GetTemporalReading](methods/igameinput_gettemporalreading.md) | Retrieves a synthesized IGameInputReading interface that simulates a device state at a specific time. |  
| [RegisterDeviceCallback](methods/igameinput_registerdevicecallback.md) | IGameInput::RegisterDeviceCallback API reference |  
| [RegisterGuideButtonCallback](methods/igameinput_registerguidebuttoncallback.md) | Registers a callback function that is called when the Xbox logo button is pressed or released. |  
| [RegisterKeyboardLayoutCallback](methods/igameinput_registerkeyboardlayoutcallback.md) | Registers a callback function when a keyboard layout is changed. |  
| [RegisterReadingCallback](methods/igameinput_registerreadingcallback.md) | RegisterReadingCallback API reference |  
| [SetFocusPolicy](methods/igameinput_setfocuspolicy.md) | Sets the focus policy for a game's input devices. |  
| [StopCallback](methods/igameinput_stopcallback.md) | IGameInput::StopCallback API |  
| [UnregisterCallback](methods/igameinput_unregistercallback.md) | IGameInput::RegisterDeviceCallback API reference |  
  

  
  
## Requirements  
  
**Header:** GameInput.h
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
## See also  

[Input API Overview](../../../../../input/overviews/input-overview.md)  
[GameInput](../../gameinput_members.md)  