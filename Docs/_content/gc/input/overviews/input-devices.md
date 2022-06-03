---
author: M-Stahl
title: GameInput devices
description: GameInput devices
kindex: GameInput devices
ms.author: chrism
ms.topic: conceptual
edited: 06/28/2019
security: public
---

# GameInput devices


<a id="introductionSection"></a>

Every physical input device that's connected to the system is represented by the [IGameInputDevice](../../reference/input/gameinput/interfaces/igameinputdevice/igameinputdevice.md) interface. Like readings, device instances are reference-counted singletons, which means that the interface pointers can be compared for equality. The majority of a typical application's input code only uses device instances in this way, as a sort of device identifier when calling other APIs (for example, as a filter when retrieving readings).

The [IGameInputDevice](../../reference/input/gameinput/interfaces/igameinputdevice/igameinputdevice.md) interface methods are typically only called when an application needs to interact directly with a specific device in some way. The most common reason is to send haptic or force feedback commands to the device. However, this interface also exposes device properties and provides access to low-level device I/O, which might be needed by more advanced code.


<a id="propertiesSection"></a>
## Device properties

Applications that need to know specific details about a device can access the device's [GameInputDeviceInfo](../../reference/input/gameinput/structs/gameinputdeviceinfo.md) structure. This structure contains a wealth of information about the device, but there are a few things to understand about using it.

Device information can be big&mdash;sometimes 10 KB or more. For efficiency reasons, the GameInput API doesn't make a copy of the device data, but instead temporarily grants applications direct access to the data stored internally within GameInput. This approach favors high-performance code by avoiding buffer allocations and large memory transfers, because applications often are interested only in some small portion of the data. This also enables the [GameInputDeviceInfo](../../reference/input/gameinput/structs/gameinputdeviceinfo.md) structure to contain nested pointers to other regions within the device info data block where various supporting arrays of information can be found, without adding the complexity of variable-sized output and deep copies.






<a id="deviceIdsSection"></a>
## Device IDs

One important piece of information available in the device info is the device's _application-local device ID_. This is a special 32-byte value that uniquely identifies the device, even across restarts of the application or reboots of the system. This ID is also stable across disconnects and reconnects of wireless devices, and wired USB devices as long as they are plugged back into the same USB port.

The app-local device ID is most commonly used to identify specific devices beyond the lifetime of the application. For example, a game with an input-mapping UI can use the device ID to ensure the user's input configuration is applied to the same devices each time the app starts. This is especially important for applications that support complex mappings across multiple devices that may otherwise appear identical (for example, a set of homogenous instrument panel devices for a flight simulator).


<a id="enumerationSection"></a>
## Device enumeration

While most applications should never need it, GameInput does support explicit enumeration of connected devices. This can be performed via the [IGameInput](../../reference/input/gameinput/interfaces/igameinput/igameinput.md) interface's [RegisterDeviceCallback](../../reference/input/gameinput/interfaces/igameinput/methods/igameinput_registerdevicecallback.md) method.

```c++
HRESULT RegisterDeviceCallback(
    _In_opt_ IGameInputDevice * device,
    _In_ GameInputKind inputKind,
    _In_ GameInputDeviceStatus statusFilter,
    _In_ GameInputEnumerationKind enumerationKind,
    _In_opt_ void * context,
    _In_ GameInputDeviceCallback callbackFunc,
    _Out_opt_ _Result_zeroonfailure_ GameInputCallbackToken * callbackToken);
```

This method handles both device enumeration and device connect/disconnect notifications by first triggering an initial series of callbacks for every connected device, and then subsequent callbacks whenever new devices are connected or disconnected. Applications can use the [GameInputEnumerationKind](../../reference/input/gameinput/enums/gameinputenumerationkind.md) parameter to control whether the function blocks until all the initial callbacks have been dispatched, or whether it returns immediately and the callbacks are dispatched asynchronously.

Several filters are available to control which kinds of devices are included in the enumeration, and which device status changes will trigger a callback. For more information, see [RegisterDeviceCallback](../../reference/input/gameinput/interfaces/igameinput/methods/igameinput_registerdevicecallback.md). For general information about how callbacks work, see [GameInput callbacks](../advanced/input-callbacks.md).


<a id="aggregateDevicesSection"></a>
## Aggregate devices

When multiple keyboards are connected at the same time, most input APIs present the input to applications in a combined way, as if all the input came from a single virtual _system keyboard_. (The same also applies to mice.) GameInput, however, normally exposes each device and its input individually. This opens up a lot of possibilities&mdash;for example, being able to tell which user's chatpad is generating input in a local multiplayer game&mdash;but it also adds a lot of complexity to applications that don't require this functionality.

To address this, GameInput supports the concept of aggregate devices. The [CreateAggregateDevice](../../reference/input/gameinput/interfaces/igameinput/methods/igameinput_createaggregatedevice.md) method on the [IGameInput](../../reference/input/gameinput/interfaces/igameinput/igameinput.md) interface allows applications to create a virtual [IGameInputDevice](../../reference/input/gameinput/interfaces/igameinputdevice/igameinputdevice.md) instance that exposes the combined input from all devices for a single [GameInputKind](../../reference/input/gameinput/enums/gameinputkind.md). This aggregate device can then be used as a filter to other GameInput API functions to interact with the aggregate device (for example, retrieving readings). While this is most commonly used for keyboard and mouse input, it can also be used with most other types of input.
> [!NOTE]
> In the current release, [```CreateAggregateDevice```](../../reference/input/gameinput/interfaces/igameinput/methods/igameinput_createaggregatedevice.md) isn't yet implemented.


<a id="seeAlsoSection"></a>
## See also

[GameInput fundamentals](input-fundamentals.md)



[Advanced GameInput topics](../advanced/input-advanced-topics.md)

[GameInput API reference](../../reference/input/gc-reference-input-toc.md)