---
author: M-Stahl
title: GameInput keyboard and mouse
description: Describes how to use keyboards and mice through `GameInput`.
kindex: GameInput Keyboard and Mouse
ms.author: chrism
ms.topic: conceptual
edited: 11/07/2020
security: public
---

# Keyboards and mice in GameInput
Use this topic to understand usages that are unique to keyboards and mice. Keyboards and mice are native inputs to `GameInput`. 

`GameInput` creates unique devices for keyboard and mouse inputs when multiple devices are connected at the same time. If desired, games can manage unique keyboards and mice. The more common use case is to have all keyboard or mouse inputs combined into one system state. This can be done by using [CreateAggregateDevice](../../reference/input/gameinput/interfaces/igameinput/methods/igameinput_createaggregatedevice.md), which combines inputs so that the game only handles one virtual keyboard and mouse. For more information, see [IGameInputDevice](../../reference/input/gameinput/interfaces/igameinputdevice/igameinputdevice.md). 

For more information about how devices and input readings work in `GameInput`, see [GameInput readings](../overviews/input-readings.md) and [GameInput devices](../overviews/input-devices.md).
> [!NOTE]
> [CreateAggregateDevice](../../reference/input/gameinput/interfaces/igameinput/methods/igameinput_createaggregatedevice.md) isn't supported at this time.

## Keyboard input
The [GetKeyState](../../reference/input/gameinput/interfaces/igameinputreading/methods/igameinputreading_getkeystate.md) method retrieves scan code and virtual key data for each pressed key on a keyboard. This input data is then returned as a variable-length array of [GameInputKeyState](../../reference/input/gameinput/structs/gameinputkeystate.md) structs. A pressed key is one that’s held down at the time that the keyboard reported an input. Keyboards vary in how frequently they report input, typically ranging from 125 Hz to 1,000 Hz. Keyboard state is reported separately for each individual keyboard that’s connected to the system. The [CreateAggregateDevice](../../reference/input/gameinput/interfaces/igameinput/methods/igameinput_createaggregatedevice.md) method on the [IGameInput](../../reference/input/gameinput/interfaces/igameinput/igameinput.md) interface is used to get the combined system keyboard state. 

Rudimentary keyboard state is meant for mapping keyboard input to game actions, such as movement or firing a weapon. It’s not meant for regular text input and other APIs that are used for that purpose.

### Reading key state

Use the following code to implement `GameInput` for keyboards and mice in your title. 

```c++
uint32_t GetKeyState(  
    uint32_t stateArrayCount,  
    GameInputKeyState* stateArray  
)  

typedef struct  GameInputKeyState
{
    uint32_t scanCode;
    uint32_t codePoint;
    uint8_t virtualKey;
    bool isDeadKey;
} GameInputKeyState;
```

The state for each key isn’t stored at a fixed index within the array. Rather, the number of valid elements in the array grows as keys are pressed. The array shrinks as keys are released. New keys are added at the end of the array, and when a key is released, everything shifts down to fill in the gap. [GetKeyCount](../../reference/input/gameinput/interfaces/igameinputreading/methods/igameinputreading_getkeycount.md) returns the number of pressed keys as shown in the following code. This is used to determine how large of an array should be allocated for [GetKeyState](../../reference/input/gameinput/interfaces/igameinputreading/methods/igameinputreading_getkeystate.md). If the `stateArray` passed in to [`GetKeyState`](../../reference/input/gameinput/interfaces/igameinputreading/methods/igameinputreading_getkeystate.md) is larger than the number of pressed keys, the surplus array elements aren’t written out or zeroed out. Conversely, if `stateArray` is smaller than the number of pressed keys, the array is filled and the surplus pressed keys are missed.

```c++
uint32_t GetKeyCount()  
```

Standard keyboards can only report four to six key presses at a time, and even high-end gaming keyboards rarely support more than 12–16 keys at once. As such, using `GetKeyCount` keeps the maximum size of the array small. The maximum size can be queried via the [IGameInputDevice](../../reference/input/gameinput/interfaces/igameinputdevice/igameinputdevice.md) interface. 

Note that the `codePoint` member specifies the glyph that the system believes is printed on the associated keycap, based on the current keyboard layout. It’s intended for displaying a representation of the key in an input mapping interface, not for building strings of text input.

## Mouse input

The [GetMouseState](../../reference/input/gameinput/interfaces/igameinputreading/methods/igameinputreading_getmousestate.md) method retrieves movement and button state for a mouse, which is returned in a single [GameInputMouseState](../../reference/input/gameinput/structs/gameinputmousestate.md) struct as shown in the following code. Like keyboard state, mouse state is reported separately for each individual mouse that's connected to the system. As with keyboard input, the [CreateAggregateDevice](../../reference/input/gameinput/interfaces/igameinput/methods/igameinput_createaggregatedevice.md) method on the `IGameInput` interface is used to get the combined system mouse state.

```c++
bool GetMouseState(  
    GameInputMouseState* state  
)  

typedef struct GameInputMouseState
{
    GameInputMouseButtons buttons;
    int64_t positionX;
    int64_t positionY;
    int64_t wheelX;
    int64_t wheelY;
} GameInputMouseState;

typedef enum GameInputMouseButtons
{
    GameInputMouseNone          = 0x00000000,
    GameInputMouseLeftButton    = 0x00000001,
    GameInputMouseRightButton   = 0x00000002,
    GameInputMouseMiddleButton  = 0x00000004,
    GameInputMouseButton4       = 0x00000008,
    GameInputMouseButton5       = 0x00000010,
    GameInputMouseWheelTiltLeft = 0x00000020,
    GameInputMouseWhelTiltRight = 0x00000040
} GameInputMouseButtons;
```

### Reading mouse movements

Mouse movement is reported natively as a series of delta values, rather than as an absolute position. This isn't compatible with the polling nature of [`GetCurrentReading`](../../reference/input/gameinput/interfaces/igameinput/methods/igameinput_getcurrentreading.md), as periodically asking for the current mouse reading is likely to miss several intermediate deltas.  

Rather than using [GetNextReading](../../reference/input/gameinput/interfaces/igameinput/methods/igameinput_getnextreading.md) to walk through potentially dozens of historical mouse readings and adding up the deltas, they’re accumulated into a virtual `positionX` and `positionY` value. From there, deltas are calculated by subtracting the `positionX` and `positionY` value from the previous readings that were obtained. Individual deltas are accessible when iterating through all intermediate readings, or through the accumulated deltas when intermediate readings have been skipped.

The `positionX` and `positionY` values are the sum of all movement deltas. These values don’t correlate with screen-space coordinates in any way. The accumulated delta value is only for the mouse events that a process receives while it has input focus.



## User association 

User association isn’t currently supported for keyboards and mice. There’s no interface for mapping either of these peripherals to a user. 


<a id="seeAlsoSection"></a>

## See also

[GameInput readings](../overviews/input-readings.md)

[GameInput devices](../overviews/input-devices.md)

[Advanced GameInput topics](input-advanced-topics.md)

[Input API reference](../../reference/input/gc-reference-input-toc.md)