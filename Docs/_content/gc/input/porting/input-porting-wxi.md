---
author: M-Stahl
title: Porting from Windows.Xbox.Input to GameInput
description: Describes porting from `Windows.Xbox.Input` to `GameInput`.
kindex: Porting from Windows.Xbox.Input to GameInput
ms.author: angillie
ms.topic: conceptual
edited: 07/29/2020
security: public
---

# Porting from Windows.Xbox.Input to GameInput


<a id="introductionSection"></a>

`Windows.Xbox.Input` is the input API for pre-GDK Xbox One Software Development Kit development. Conceptually, `GameInput` sees devices and input readings in a different way. This topic describes some key differences between `Windows.Xbox.Input` and `GameInput`.

## Input-centric vs. device-centric

The key difference between `Windows.Xbox.Input` and `GameInput` is that the former requires you to start by gathering devices and input state as a property of a device. In contrast, `GameInput` starts with a filterable stream of input readings that have associated devices.

## Looking for the A button press

When a game first launches, often a user must press **A** to signify that they're ready to continue. Here, an example compares doing this in `Windows.Xbox.Input` and `GameInput`. This example looks only for a gamepad. Note that the examples are simplified for demonstration.

### Windows.Xbox.Input

The following code example begins by enumerating all the gamepads that are connected to the system and storing them in the `gamepads` vector. It then iterates through `gamepads` in a loop, looks at each of their current input readings, and checks each reading for **A**.
> [!NOTE]
> This code refers to a previous API. These calls are nonexistent in `GameInput`.

```c++
void PollGamepadInput()
{
    // Find all gamepads.
    IVectorView<IGamepad^>^ gamepads = Gamepad::GetGamepads();

    // Cycle through each gamepad.
    for ( unsigned int i = 0; i < gamepads->Size; ++i )
    {
        // Get the gamepad's current reading.
        IGamepadReading^ reading = gamepads->GetAt(i)->GetCurrentReading();

        if ( reading->IsAPressed )
        {
            // Logic for the A button being pressed.
        }
    }
}
```

This model could be improved. The game must store copies of the different devices that are connected to the system. You must understand the specifics of each device. Also, by storing a local copy of all the gamepads, the code captures a state in time rather than getting the most up-to-date readings.

### GameInput

In the following code example, the code looks for the most recent gamepad reading from any device. By calling [GetCurrentReading](../../reference/input/gameinput/interfaces/igameinput/methods/igameinput_getcurrentreading.md) with a [GameInputKind](../../reference/input/gameinput/enums/gameinputkind.md) filter set to `GamePad`,  the code asks `m_gameInput` to only return gamepad readings. Next, the code queries the state of the reading and checks for an **A** press.

You might want to keep track of which gamepad you're talking to. For a more complete example, see [GameInput readings](../overviews/input-readings.md).

```c++
IGameInput g_gameInput = nullptr;

HRESULT InitializeInput()
{
    return GameInputCreate(&g_gameInput);
}

void PollGamepadInput()
{
    ComPtr<IGameInputReading> reading;

    // Get the most current gamepad reading, not filtering by a specific device.
    // An error from the GetReading method indicates that no gamepad readings
    // were found.
    if (SUCCEEDED(m_gameInput->GetCurrentReading(GameInputKindGamepad, nullptr, &reading)))
    {
        // Read the gamepad state.
        GAME_INPUT_GAMEPAD_STATE state;
        reading->GetGamepadState(&state);

        if (state.buttons & GameInputGamepadA)
        {
            // Logic for the A button being pressed.
        }
    }
}
```
> [!NOTE]
> `GameInput` doesn't require that you iterate through devices and check each reading. Instead, you can check with one method call for the latest state of input. You can choose how much or how little you want to know about each physical device.


<a id="seeAlsoSection"></a>

## See also

[GameInput overview](../overviews/input-overview.md)

[Input API reference](../../reference/input/gc-reference-input-toc.md)

[Microsoft Game Development Kit](../../GDKIntroduction.md)