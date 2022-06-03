---
author: M-Stahl
title: GameInput callbacks
description: Describes how to register callbacks for event-driven notifications.
kindex: GameInput callbacks
ms.author: chrism
ms.topic: conceptual
edited: 07/29/2020
security: public
---

# GameInput callbacks


<a id="introductionSection"></a>

While `GameInput` is primarily designed around a polling model, cases exist where it's best to notify applications asynchronously. To support this, the [IGameInput](../../reference/input/gameinput/interfaces/igameinput/igameinput.md) interface exposes a few methods for registering callback functions that are invoked when certain events of interest occur.

Internally, `GameInput` serializes the dispatching of callbacks so that only one callback is executed at a time. `GameInput` guarantees that callbacks are dispatched in chronological order. These guarantees simplify the code that an application needs to write in its callback functions.

`GameInput` allows a maximum of 64 callbacks, regardless of type, to be registered at any time. Callbacks are dispatched from an internal worker thread in `GameInput`. For more information about how this works, along with options for manually scheduling this work, see [GameInput work queues](input-work-queues.md).


<a id="deviceCallbacksSection"></a>

## Device callbacks

Device callbacks provide a way for applications to know when the status of input devices changes as shown in the following syntax. Most commonly, this is used to detect when devices connect and disconnect, but other status changes can also be of interest. 

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

Device callbacks can be registered with several optional filters. This includes filtering to devices that produce specific kinds of input, filtering to specific status state changes, filtering to a specific device, or any combination of those filters. For example, an application can set up a callback to notify it when a device has disconnected from the system.

In addition to device status changes, the [RegisterDeviceCallback](../../reference/input/gameinput/interfaces/igameinput/methods/igameinput_registerdevicecallback.md) method can be used for device enumeration. The `enumerationKind` parameter takes a value from the [GameInputEnumerationKind](../../reference/input/gameinput/enums/gameinputenumerationkind.md) enumeration, indicating whether enumeration should be performed as part of the callback registration, and if so, whether enumeration should be performed in a blocking or an asynchronous way. Combining device enumeration with subsequent status changes into a single atomic operation avoids race conditions that many applications unintentionally suffer from in their input code.


<a id="readingCallbacksSection"></a>

## Reading callbacks

By reading callbacks, applications can be notified whenever new readings arrive in the input stream as shown in the following syntax. Although many applications will find that polling for input is better, situations exist where event-driven input might be preferable. For example, the main menu UI of a game might be better suited to event-based input. Another example is an input mapping UI that must wait for input after prompting the user for their selection.

```c++
HRESULT RegisterReadingCallback(
    _In_opt_ IGameInputDevice * device,
    _In_ GameInputKind inputKind,
    _In_ float analogThreshold,
    _In_opt_ void * context,
    _In_ GameInputReadingCallback callbackFunc,
    _Out_opt_ _Result_zeroonfailure_ GameInputCallbackToken * callbackToken);
```

Like device callbacks, reading callbacks can be registered with several optional filters. This is especially useful for reading callbacks, because applications might be interested in a specific subset of readings from the input stream. The [RegisterReadingCallback](../../reference/input/gameinput/interfaces/igameinput/methods/igameinput_registerreadingcallback.md) method allows filtering to devices that produce specific kinds of input and/or filtering to a specific device's input.

Applications can also specify a filter for analog input values (such as the thumbsticks of a gamepad) that require some minimum amount of movement before the callback fires. This can drastically reduce the callback frequency when high-resolution analog state changes aren't required. A good example of this is the implementation of an input mapping UI when waiting for an input change after prompting the user for their selection.


<a id="unregisteringSection"></a>

## Unregistering callbacks

After a callback is successfully registered, the application must guarantee that any resources that are required to execute the callback remain valid. This includes both resources that are consumed by the callback's code, as well as the callback function itself, for example, if the callback function is hosted in a DLL that the application loads and unloads on demand.

To safely reclaim these resources, an application must first unregister the callback by passing the token that was received from the `Register*Callback` method into the [UnregisterCallback](../../reference/input/gameinput/interfaces/igameinput/methods/igameinput_unregistercallback.md) method. If the callback is being executed when this method is called, it blocks until the callback finishes executing. As a result, a callback can't unregister itself from within its own callback function.

Callbacks can also be stopped by calling the [StopCallback](../../reference/input/gameinput/interfaces/igameinput/methods/igameinput_stopcallback.md) method. This doesn't unregister the callback, but it does ensure that the callback isn't called again. Because the callback isn't unregistered, this method is safe to call from within a callback's own callback function. It finishes executing the current callback but doesn't call it again. Callbacks must be unregistered eventually because only 64 callbacks are allowed at any time.


<a id="seeAlsoSection"></a>

## See also

[GameInput fundamentals](../overviews/input-fundamentals.md)

[Advanced GameInput topics](input-advanced-topics.md)

[Input API reference](../../reference/input/gc-reference-input-toc.md)