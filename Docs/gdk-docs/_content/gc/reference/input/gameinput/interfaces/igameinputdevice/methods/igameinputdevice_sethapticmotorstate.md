---
author: M-Stahl
title: SetHapticMotorState
description: Sends a waveform to a haptic motor on a device.
kindex: SetHapticMotorState
ms.author: angillie
ms.topic: reference
edited: 01/06/2020
security: public
---

# IGameInputDevice::SetHapticMotorState  
> [!NOTE]
> This function is not yet implemented.

Sends a waveform to a haptic motor on a device.  

## Syntax  
  
```cpp
HRESULT SetHapticMotorState(  
         uint32_t motorIndex,  
         const GameInputHapticFeedbackParams* params,  
         uint64_t timestamp  
)  
```  
  
### Parameters  
  
*motorIndex* &nbsp;&nbsp;\_In\_  
Type: uint32_t  

Index of the haptic motor set state.  


*params* &nbsp;&nbsp;\_In\_opt\_  
Type: [GameInputHapticFeedbackParams*](../../../structs/gameinputhapticfeedbackparams.md)  

Description of the waveform that is played on the haptic motor.  


*timestamp* &nbsp;&nbsp;\_In\_  
Type: uint64_t  

Determines when to apply the change in the force feedback motor state. A timestamp of zero or any timestamp in the past sets the new motor state immediately.  

  
### Return value  
Type: HRESULT
  
Returns ``E_NOTIMPL``.  

## Remarks 

The ``IGameInputDevice::SetHapticMotorState`` method plays a waveform as specified by a [GameInputHapticFeedbackParams](../../../structs/gameinputhapticfeedbackparams.md) structure:

```cpp
typedef struct GameInputHapticFeedbackParams
{
    GameInputHapticWaveformInfo * waveform;
    uint64_t duration;
    float intensity;
    uint32_t playCount;
    uint64_t repeatDelay;
} GameInputHapticFeedbackParams;

```

This method stores the requested values in shared memory and signals an event object. It therefore returns quickly and is safe to call from any context. Passing invalid or unsupported values in the ``GameInputHapticFeedbackParams`` structure results in an error ``HRESULT`` returned. For intermediate and advanced use-cases of the GameInput API, see [Advanced GameInput topics](../../../../../../input/advanced/input-advanced-topics.md).
 
## Requirements  
  
**Header:** GameInput.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
## See also  
  
[Overview of GameInput](../../../../../../input/overviews/input-overview.md)  
[IGameInputDevice](../igameinputdevice.md)  
  
  