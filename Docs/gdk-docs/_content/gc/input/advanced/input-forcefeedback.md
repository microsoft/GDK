---
author: M-Stahl
title: Force feedback on GameInput
description: Describes the function and developer actions for force feedback.
kindex: Input Force Feedback
ms.author: chrism
ms.topic: conceptual
security: public
edited: 11/07/2020
---

# Force feedback on GameInput

Use this topic to understand how force feedback on `GameInput` can manage device output. With force feedback, game input devices can physically move one or more of the device's input controls to provide tactile feedback to the user. Force feedback works with input devices that simulate vehicle operation, such as driving wheels and flight simulation rigs. These devices contain a force feedback motor that applies force to the controller over an axis. On a racing wheel, it's a rotational force that turns the wheel to simulate an in-game scenario. Use force feedback with a flight stick to make levers difficult to push or pull from a particular position. 

For more information about the `GameInput` interfaces that support force feedback, see [IGameInputDevice](../../reference/input/gameinput/interfaces/igameinputdevice/igameinputdevice.md) and [IGameInputForceFeedbackEffect](../../reference/input/gameinput/interfaces/igameinputforcefeedbackeffect/igameinputforcefeedbackeffect.md).

## Check for a force feedback motor

To create a force feedback effect, you need the [IGameInputDevice](../../reference/input/gameinput/interfaces/igameinputdevice/igameinputdevice.md) interface that represents the input device that you want to apply the effect to. After acquiring the `IGameInputDevice` interface, check the number of force feedback motors on the device by examining the [GameInputDeviceInfo](../../reference/input/gameinput/structs/gameinputdeviceinfo.md) struct. This can be done by calling [IGameInputDevice::GetDeviceInfo](../../reference/input/gameinput/interfaces/igameinputdevice/methods/igameinputdevice_getdeviceinfo.md). If there’s a force feedback motor in the input device, the [GameInputDeviceInfo](../../reference/input/gameinput/structs/gameinputdeviceinfo.md) member `ForceFeedbackMotorCount` has a value of one or greater. 

## Creating a force feedback effect

If a device's [GameInputDeviceInfo](../../reference/input/gameinput/structs/gameinputdeviceinfo.md) struct indicates that it has one or more force feedback motors, create a force feedback effect for the device by calling [IGameInputDevice::CreateForceFeedbackEffect](../../reference/input/gameinput/interfaces/igameinputdevice/methods/igameinputdevice_createforcefeedbackeffect.md) as shown in the following code.

```cpp
HRESULT CreateForceFeedbackEffect(  
         uint32_t motorIndex,  
         const GameInputForceFeedbackParams* params,  
         IGameInputForceFeedbackEffect** effect  
) 
```

The motor index parameter is the index of the motor affected by force feedback. This index corresponds to the appropriate motor in the [GameInputDeviceInfo](../../reference/input/gameinput/structs/gameinputdeviceinfo.md) struct's [GameInputForceFeedbackMotorInfo](../../reference/input/gameinput/structs/gameinputforcefeedbackmotorinfo.md) array. This array includes information about the force feedback motors that are present and their capabilities.  

For the second parameter, build the [GameInputForceFeedbackParams](../../reference/input/gameinput/structs/gameinputforcefeedbackparams.md) struct for the force feedback effect that describes the characteristics of the effect as shown in the following code. 

```cpp
typedef struct GameInputForceFeedbackParams {  
    GameInputForceFeedbackEffectKind kind;  
    union  
    {  
        GameInputForceFeedbackConstantParams constant;  
        GameInputForceFeedbackRampParams ramp;  
        GameInputForceFeedbackPeriodicParams sineWave;  
        GameInputForceFeedbackPeriodicParams squareWave;  
        GameInputForceFeedbackPeriodicParams triangleWave;  
        GameInputForceFeedbackPeriodicParams sawtoothUpWave;  
        GameInputForceFeedbackPeriodicParams sawtoothDownWave;  
        GameInputForceFeedbackConditionParams spring;  
        GameInputForceFeedbackConditionParams friction;  
        GameInputForceFeedbackConditionParams damper;  
        GameInputForceFeedbackConditionParams inertia;  
    };  
} 
```

Choose a [GameInputForceFeedbackEffectKind](../../reference/input/gameinput/enums/gameinputforcefeedbackeffectkind.md) enum, and then initialize the corresponding `GameInputForceFeedbackParams` struct. 

For example, to create a feedback effect with the spring behavior, [GameInputForceFeedbackParams](../../reference/input/gameinput/structs/gameinputforcefeedbackparams.md) consists of the [GameInputForceFeedbackEffectKind](../../reference/input/gameinput/enums/gameinputforcefeedbackeffectkind.md) value `GameInputForceFeedbackSpring` and the [GameInputForceFeedbackConditionParams](../../reference/input/gameinput/structs/gameinputforcefeedbackconditionparams.md) struct for a spring. Fill in the parameters for your chosen [GameInputForceFeedbackEffectKind](../../reference/input/gameinput/enums/gameinputforcefeedbackeffectkind.md) enum. 

After selecting the force feedback motor effect by its index and creating the [GameInputForceFeedbackParams](../../reference/input/gameinput/structs/gameinputforcefeedbackparams.md) struct, call [IGameInputDevice::CreateForceFeedbackEffect](../../reference/input/gameinput/interfaces/igameinputdevice/methods/igameinputdevice_createforcefeedbackeffect.md) to create the effect. It's represented by an [IGameInputForceFeedbackEffect](../../reference/input/gameinput/interfaces/igameinputforcefeedbackeffect/igameinputforcefeedbackeffect.md) interface. 

The force feedback effect's lifetime is associated with the created [IGameInputForceFeedbackEffect](../../reference/input/gameinput/interfaces/igameinputforcefeedbackeffect/igameinputforcefeedbackeffect.md) interface. When the effect is created, it’s loaded to the device. When the last reference is released, the force feedback effect is stopped and unloaded from the device motor.


## Applying and updating force feedback effects

When a force feedback effect is created, it’s loaded directly into the device motor. A force feedback motor has a finite amount of memory. This limits the number of force feedback effects that are loaded and played at the same time. Calling [IGameInputDevice::CreateForceFeedbackEffect](../../reference/input/gameinput/interfaces/igameinputdevice/methods/igameinputdevice_createforcefeedbackeffect.md) after reaching this limit causes the function to return an error.

After creating a force feedback effect, it’s loaded to the force feedback motor in a stopped state. After it’s loaded, use the [IGameInputForceFeedbackEffect](../../reference/input/gameinput/interfaces/igameinputforcefeedbackeffect/igameinputforcefeedbackeffect.md) interface to [set the state](../../reference/input/gameinput/interfaces/igameinputforcefeedbackeffect/methods/igameinputforcefeedbackeffect_setstate.md) of the effect to `Running`. This plays the effect on the device motor. 

### States of force feedback effect

A force feedback effect moves through several states to match the current state of the game. It’s important that you update and take note of the state of an effect in accordance with your game to maintain the expected behavior.

The states of force feedback can be set according to [GameInputFeedbackEffectState](../../reference/input/gameinput/enums/gameinputfeedbackeffectstate.md) as shown in the following code.

```cpp
typedef enum GameInputFeedbackEffectState    
{  
    GameInputFeedbackStopped = 0,  
    GameInputFeedbackRunning = 1,  
    GameInputFeedbackPaused = 2  
} GameInputFeedbackEffectState  
```  

After the force feedback effect is created, it changes to the `Stopped` state. If a new or stopped feedback effect is set to the `Running` state, it plays from the beginning of the effect. Setting the state to `Paused` causes the force feedback effect to stop affecting the motor. However, setting a `Paused` state effect to `Running` causes the force feedback effect to apply the effect pattern where it left off. 

Stopping an effect ends the effect, but you can trigger the effect again later. For example, when a user leaves rough terrain in a racing game. Likewise, pausing an effect is useful for situations where gameplay is unchanged but the user wants to navigate the UI, such as a pause menu.

Set the state of a force feedback effect by calling [IGameInputForceFeedbackEffect::SetState](../../reference/input/gameinput/interfaces/igameinputforcefeedbackeffect/methods/igameinputforcefeedbackeffect_setstate.md). 

### Updating a force feedback effect

Adjust the gain of a force feedback effect or provide a new set of parameters if the new [GameInputForceFeedbackParams](../../reference/input/gameinput/structs/gameinputforcefeedbackparams.md) struct shares the same [GameInputForceFeedbackEffectKind](../../reference/input/gameinput/enums/gameinputforcefeedbackeffectkind.md) enum.

#### Gain

Change the intensity of a force feedback effect by adjusting its gain with the [IGameInputForceFeedbackEffect::SetGain](../../reference/input/gameinput/interfaces/igameinputforcefeedbackeffect/methods/igameinputforcefeedbackeffect_setgain.md) function as shown in the following code.

```cpp
void SetGain(  
         float gain  
)  
```

The gain can be a value between 0 and 1. By default, the gain of a force feedback effect is set to 1. This function is primarily used to ease the intensity of an effect.

#### Setting new parameters

Provide new parameters for a force feedback effect by using the [IGameInputForceFeedbackEffect::SetParams](../../reference/input/gameinput/interfaces/igameinputforcefeedbackeffect/methods/igameinputforcefeedbackeffect_setparams.md) function as shown in the following code.

```cpp
bool SetParams(  
         const GameInputForceFeedbackParams* params  
)  
```

When using this function to replace the parameters of a force feedback effect, use the same [GameInputForceFeedbackEffectKind](../../reference/input/gameinput/enums/gameinputforcefeedbackeffectkind.md) enum as the force feedback effect you’re setting parameters for. New parameters take immediately, and they’re applied without stopping the running effect. 

If the running effect is stopped, it’s restarted with new parameters. Some games can change parameters to simulate different feedback patterns by setting the parameters for a feedback effect with a [GameInputForceFeedbackEffectKind](../../reference/input/gameinput/enums/gameinputforcefeedbackeffectkind.md) enum of `constant`. 


## See also 

[IGameInputForceFeedbackEffect](../../reference/input/gameinput/interfaces/igameinputforcefeedbackeffect/igameinputforcefeedbackeffect.md) 

[IGameInputDevice](../../reference/input/gameinput/interfaces/igameinputdevice/igameinputdevice.md) 