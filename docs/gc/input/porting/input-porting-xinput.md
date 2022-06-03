---
author: M-Stahl
title: Porting from XInput to GameInput
description: Porting from XInput to GameInput
kindex: Porting from XInput to GameInput
ms.author: chrism
ms.topic: conceptual
edited: 10/08/2019
security: public
---

# Porting from XInput to GameInput


<a id="introductionSection"></a>

Porting from XInput to GameInput is the least complicated of any of the legacy APIs. This is because GameInput was heavily influenced by XInput's simple (and easy to use) programming model, and therefore, many XInput APIs map 1:1 with equivalent functions in GameInput.


<a id="keyDifferencesSection"></a>
## Key differences

The key differences between XInput and GameInput are discussed in the following sections.


<a id="cVsCppSection"></a>
### C vs. C++

The XInput API is a collection of flat C functions . GameInput, on the other hand, is C++ and uses interfaces (just like the graphics and audio APIs). In practice, this doesn't complicate code that uses the GameInput API, doesn't impact performance, and has some advantages that become apparent once you become more familiar with how GameInput works.

It's important to understand that although these interfaces may look like COM, they aren't. Only a basic understanding of reference counting is required to use these interfaces. For more information, see the [Interfaces section of the GameInput fundamentals](../overviews/input-fundamentals.md#interfacesSection) topic.


<a id="gettingInputSection"></a>
### Getting input

In XInput, most games loop through the user indices until one is found with a connected device, then state is read from that device. Games will often remember the user index so they don't have to loop the next time. For example, the following code is typical for a game prompting the user to "press A" on their controller:

```c++
// This function looks for a gamepad that currently has the "A" button pressed.
void FindActiveGamepad()
{
    for (DWORD index = 0; index < XUSER_MAX_COUNT; index++)
    {
        XINPUT_STATE state;
        if (XInputGetState(index, &state) == ERROR_SUCCESS)
        {
            if (state.Gamepad.wButtons & XINPUT_GAMEPAD_A)
            {
                // Found the user's gamepad at this index.
            }
        }
    }
}
```

In GameInput, you first get the input without specifying a device and you can query which device the input came from if you want. The code looks similar but eliminating the need for explicit device enumeration can lead to simpler algorithms.

```c++
// This function looks for a gamepad that currently has the "A" button pressed.
void FindActiveGamepad(IGameInput * gameInput)
{
    // This checks for input from all gamepads simultaneously.
    IGameInputReading * reading;
    if (SUCCEEDED(gameInput->GetCurrentReading(GameInputKindGamepad, nullptr, &reading)))
    {
        GameInputGamepadState state;
        reading->GetGamepadState(&state);

        if (state.buttons & GameInputGamepadA)
        {
            // Found the user's gamepad.  At this point we can
            // get the device that generated this input, and then
            // pass that into future calls to the GetCurrentReading
            // method to receive input only from that gamepad.
        }

        reading->Release():
    }
}
```

The code isn't quite as simple as XInput, but it's very similar. As you become more familiar with the GameInput API, you'll see how this model provides powerful options to handle input that do not exist in XInput.

It is also worth noting that XInput returns analog values from triggers as type **BYTE**, and analog values from thumbsticks as type **SHORT**. With the GameInput API, these analog values are returned as **float** values from 0 to 1 (triggers) or -1 to 1 (thumbsticks).


<a id="rumbleFeedbackSection"></a>
### Rumble feedback

In XInput, games simply call ```XInputSetState``` to send rumble (vibration) commands to a device. In GameInput, games need to acquire the [IGameInputDevice](../../reference/input/gameinput/interfaces/igameinputdevice/igameinputdevice.md) instance for the device, then call its [SetRumbleState](../../reference/input/gameinput/interfaces/igameinputdevice/methods/igameinputdevice_setrumblestate.md) method. The usage is similar between these two methods. This is an example of when you'll call functions on the device interface, rather than it solely being a device identifier.


<a id="appFocusSection"></a>
### Application Focus

GameInput provides input to an application only when it is in focus. Otherwise, the state returned contains neutral or "rest" values, as if the user isn't touching the device at all. This eliminates the need for extra input code that deals with change in focus (for example, calling ```XInputEnable```).


<a id="xinputWrapperSection"></a>
## The XInputOnGameInput wrapper

The Microsoft Game Development Kit (GDK) ships with a header file called ```XInputOnGameInput.h``` that contains an implementation of the XInput API on top of GameInput. We recommend porting directly to GameInput especially if you want keyboard and mouse or other input devices. However, the XInputOnGameInput wrapper can be used to help bootstrap an initial porting effort without requiring any changes to existing XInput code.

To use the XInputOnGameInput wrapper, simply replace this code:

```c++
#include <XInput.h>
```

with this code:

```c++
#include <XInputOnGameInput.h>
using namespace XInputOnGameInput;
```

and then recompile your code.

The implementation of the XInput wrapper code is entirely in the header file, so it can also be examined as an example of using the GameInput API, and/or modified as needed.


<a id="wrapperDifferencesSection"></a>
### Differences between XInput and XInputOnGameInput

Generally, the XInputOnGameInput wrapper is a direct drop-in replacement for the legacy XInput API. However, there are a few minor differences:

*  For simplicity, only gamepad device support has been coded into the wrapper. If you need to support other devices, such as racing wheels or arcade sticks, use GameInput directly or add support for those devices in the XInputOnGameInput code.

*  The wrapper will return gamepad input only when the game is in focus. When the game is not in focus, any gamepad state returned is set to neutral or "rest" values, as if the user isn't touching the gamepad. This is done regardless of any calls to ```XInputEnable``` (or lack thereof).

*  The value of ```XUSER_MAX_COUNT``` has been increased from 4 to 8 to match the number of supported devices on Xbox One. This should generally be transparent to most legacy XInput code. However, be sure to carefully review any use of the ```XInputGetKeystroke``` function in your code to help ensure that nothing is hard-coded to assume a maximum value of 4 being returned in the ```UserIndex``` member of the ```XINPUT_KEYSTROKE``` structure. Otherwise, a buffer overrun could occur.

*  A few new functions have been added (see the following) which should be of interest only if you intend to continue using the XInput wrapper in production code.



<a id="productionWrapperUseSection"></a>
### Using XInputOnGameInput in production code

The XInputOnGameInput wrapper is written to be high-performance and lock-free, inheriting all the performance optimizations of the GameInput API, and is therefore suitable for use in production code. It also inherits GameInput's broader device support (such as popular HID gamepads), and adds the following new functions to the API:

*  __```XInputSetStateEx```__ is similar to ```XInputSetState``` but adds support for the trigger motors in Xbox One gamepads.

*  __```XInputGetStateWithToken```__ is similar to ```XInputGetState``` but allows the caller to supply a D3DX frame pipeline token to associate a specific input reading with a graphics frame for later analysis in PIX.
   > [!NOTE]
   > In the May Preview release, ```XInputGetStateWithToken``` currently behaves identically to ```XInputGetState```, because the underlying GameInput code isn't fully implemented.

*  __```XInputGetDeviceId```__ returns the ```APP_LOCAL_DEVICE_ID``` for the device at a given user index. Passing this ID to the [FindDeviceFromId](../../reference/input/gameinput/interfaces/igameinput/methods/igameinput_finddevicefromid.md) method on [IGameInput](../../reference/input/gameinput/interfaces/igameinput/igameinput.md) returns the corresponding [IGameInputDevice](../../reference/input/gameinput/interfaces/igameinputdevice/igameinputdevice.md) for that user index. This can then be used to access additional functionality in the GameInput API that's not exposed via the XInput wrapper.


<a id="optimizingSection"></a>
#### Optimizing the wrapper code

By default, the XInputOnGameInput wrapper is configured to be drop-in compatible with the legacy XInput API. Games that don't require 100% compatible behavior can fine-tune the behavior and performance of the wrapper by defining any of the following preprocessor macros:

##### XINPUT_ON_GAMEINPUT_EXPLICIT_INITIALIZATION

By default, the XInput wrapper lazy-initializes the underlying GameInput API automatically the first time any of the wrapper functions are called. This ensures drop-in compatibility with existing XInput code, but has several minor drawbacks:

1.  The execution time of the first XInput wrapper function call will be longer than usual.

2.  Every XInput wrapper function must perform a check to see if the lazy initialization has been performed every time it is called. This is a simple test of a global variable, so the branch predictor should ameliorate the cost, but it is extra overhead.

3.  Although it should never fail, there is no way to tell if the lazy initialization of the underlying GameInput API was successful.

4.  The underlying [IGameInput](../../reference/input/gameinput/interfaces/igameinput/igameinput.md) instance isn't released until the XInput wrapper's global variables are cleaned up (either due to module unload or process termination).

Games can take manual control of the wrapper's initialization and shutdown by defining the ```XINPUT_ON_GAMEINPUT_EXPLICIT_INITIALIZATION``` macro. This adds two new functions ```XInputOnGameInputInitialize``` and ```XInputOnGameInputUninitialize``` which can be called to precisely control when initialization and shut down occur.

##### XINPUT_ON_GAMEINPUT_NO_XINPUTENABLE

The code required to implement the ```XInputEnable``` function adds extra overhead to every call of the ```XInputGetState```, ```XInputGetStateWithToken```, ```XInputSetState```, ```XInputSetStateEx```, and ```XInputGetKeystroke``` functions. If your code doesn't call ```XInputEnable```, or if it can easily be eliminated from your code, defining the ```XINPUT_ON_GAMEINPUT_NO_XINPUTENABLE``` macro will remove support for ```XInputEnable``` and the associated overhead it brings. The underlying GameInput code automatically performs the functionality of ```XInputEnable``` on focus changes anyway, so most games will want to define this macro if they can.

##### XINPUT_ON_GAMEINPUT_NO_XINPUTGETKEYSTROKE

The code required to implement the ```XInputGetKeystroke``` function adds a few extra functions and variables to the wrapper's implementation. It doesn't add overhead to any of the other XInput API functions, but if your code doesn't call ```XInputGetKeystroke``` you can define the ```XINPUT_ON_GAMEINPUT_NO_XINPUTGETKEYSTROKE``` macro to slightly decrease the code/data size of the XInput wrapper.


<a id="seeAlsoSection"></a>

## See also

[Overview of GameInput](../overviews/input-overview.md)

[GameInput API reference](../../reference/input/gc-reference-input-toc.md)

[Microsoft Game Development Kit](../../GDKIntroduction.md)