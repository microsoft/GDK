---
author: M-Stahl
title: XGameStreamingGetGamepadPhysicality
description: Gets the input physicality mapping from a specific gamepad reading.
kindex: XGameStreamingGetGamepadPhysicality
ms.author: arikcohen
ms.topic: reference
edited: 12/24/2020
security: public
applies-to: pc-gdk
---

# XGameStreamingGetGamepadPhysicality

Gets the input physicality mapping from a specific gamepad reading.

<a id="syntaxSection"></a>

## Syntax

```cpp
HRESULT XGameStreamingGetGamepadPhysicality(
         IGameInputReading* gamepadReading,
         XGameStreamingGamepadPhysicality* gamepadPhysicality
)
```

<a id="parametersSection"></a>

### Parameters

*gamepadReading* &nbsp;&nbsp;\_In\_
Type: IGameInputReading\*

The gamepad reading that is being queried.

*gamepadPhysicality* &nbsp;&nbsp;\_Out\_
Type: [XGameStreamingGamepadPhysicality](../enums/xgamestreaminggamepadphysicality.md)\*

The physicality of the input reading.

<a id="retvalSection"></a>

### Return value

Type: HRESULT

Returns **S_OK** if successful; otherwise, returns an error code.

**Potential Errors**

| Error Code | Error Value | Reason for Error |
| --- | --- | --- | 
| E_GAMESTREAMING_NOT_INITIALIZED | 0x89245400 | The XGameStreaming runtime has not been initialized. Call `XGameStreamingInitialize` before calling other APIs. |
| E_GAMESTREAMING_NOT_STREAMING_CONTROLLER | 0x89245404 | The current reading didn't come from a streaming controller. |

<a id="remarksSection"></a>

## Remarks

Games might want to differentiate a controller input based on whether the input was from a physically attached controller, or from a touch layout that has been translated into a virtual controller input.

**Example scenario**

The game has a *jump* action associated with the **A** button. It offers a touch layout with the *jump* icon configured with the **A** button press on the virtual controller. The game also offers players the ability to remap the physical controller in a way that **A** is no longer associated with *jump*.

The game can present visual hints to interact with elements in the game (for example, Press **A** to *jump*). When the player uses the touch layouts, the visual hint should show the iconography of the touch layout's button.

<a id="exampleSection"></a>

## Example

In the following code example, the game has the *jump* action linked to the **A** button on the controller by default. While this setting is customizable by the player, the touch layout
on the screen is fixed, and therefore an **A** button press from the touch layout should be treated as *jump*, always, while the **A** from a physical controller should be treated as whatever the
player set for the controller mapping customization.

```cpp
void Game::Update(DX::StepTimer const& timer)
{
    g_gameInput->GetCurrentReading(GameInputKind::GameInputKindController, g_gamepad, &reading);
    
    GameInputGamepadState state;
    reading->GetGamepadState(&state);

    XGameStreamingGamepadPhysicality physicality = XGameStreamingGamepadPhysicality::None;
    
    HRESULT hr = XGameStreamingGetGamepadPhysicality(reading, &physicality);

    if ((state.buttons & GameInputGamepadA) != GameInputGamepadNone)
    {
        if (SUCCEEDED(hr))
        {
            if ((physicality & XGameStreamingGamepadPhysicality::AVirtual) == 
                XGameStreamingGamepadPhysicality::AVirtual)
            {
                // 'A' Input came from touch layout
                // Perform 'jump' action, if applicable
            }
            else if ((physicality & XGameStreamingGamepadPhysicality::APhysical) == 
                 XGameStreamingGamepadPhysicality::APhysical)
            {
                // 'A' Input came from the physical controller.
                // Lookup 'A' from the user's customized controller mapping.
                // Perform whatever action A is mapped to, if applicable.
            }
        }
        else
        {
            // Physicality not present on this gamepad.
            // Perform input ‘A’ action as if there were no stream.
        }
    }

    // UI icon updates.
    // If the player is using the touch layouts, then show touch iconography, 
    // otherwise switch to the physical controller iconography.
    if (SUCCEEDED(hr))
    {
        if ((physicality & XGameStreamingGamepadPhysicality::AllVirtual) != 
            XGameStreamingGamepadPhysicality::None)
        {
            // At least one input is coming from virtual touch layout.
            // Update UI icons to match the touch layouts.
        } 
        else 
        {
            if ((physicality & XGameStreamingGamepadPhysicality::AllPhysical) != 
                XGameStreamingGamepadPhysicality::None)
            {
                // At least one input is coming from a physical controller.
                // Update UI icons to match a physical controller inputs (for example, LT/LB/RT/RB icon).
            }
        }
    }
    else
    {
        // Use the default non-streaming behavior for UI icons 
    }
}
```

<a id="requirementsSection"></a>

## Requirements

**Header:** xgamestreaming.h

**Library:** xgameruntime.lib

**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles

<a id="seealsoSection"></a>

## See also

[XGameStreaming](../xgamestreaming_members.md)  
[XGameStreamingGamepadPhysicality](../enums/xgamestreaminggamepadphysicality.md)  
[XGameStreaming Touch Adaptation](../xgamestreaming_members.md#TouchAdaptation)  