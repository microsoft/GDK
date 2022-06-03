---
author: M-Stahl
title: GameInput Dynamic Latency Input
description: Provides an overview of the input synchronization features that are available in Dynamic Latency Input.
kindex: GameInput readings
ms.author: angillie
ms.topic: conceptual
edited: 11/09/2020
security: public
---

# Dynamic Latency Input


<a id="introductionSection"></a>
 
Use this topic to understand how Dynamic Latency Input (DLI) synchronizes in-game device input and output. *Input lag*, or *input latency*, is defined as the delay between the time that a physical input occurs and an output is sent. In gaming, this is the time between a button press and screen output. Keeping this latency low is crucial to keeping users engaged and immersed in gameplay.

Input latency is the time between a button press and a game reading it. DLI is an input architecture that’s designed to reduce latency in this part of the equation. 

## Overview of Dynamic Latency Input 
 
DLI is a synchronization system between the Xbox controller and game platform. It assesses the game's input calling pattern and adjusts the report rate of the controller to deliver up-to-date input just before the input call. The following are the key components that are necessary to complete an input call.
 * A controller that’s capable of dynamically adjusting how often it reports and reads its buttons.
 * The ability to monitor game input reading patterns to predict when the next input is needed.
 * The ability to use these patterns to adjust the controller reports so that they align with the game's needs. 

## DLI accuracy
 
DLI runs when a supported device is in use. It monitors how well it’s predicting when the next input read will occur. It also keeps this value as an internal confidence. If the predictions are consistently off, the confidence gets too low and DLI disables itself. 
The most common reason for a low-confidence value is inconsistent behavior. DLI assumes that input is read at a consistent cadence and synchronizes to it. Some games use simulation threads that outpace DLI or that read input at inconsistent intervals. These cases confuse DLI and lower its confidence because it can’t find a stable rate to synchronize to. 
> [!NOTE]
> DLI is limited to a cadence of 125Hz. Attempting a cadence higher than that value will result in DLI disabling itself.

### Use hints to increase accuracy
 
To mitigate low confidence values and assist DLI, hints are sent to the platform that give you control of when input synchronizes. When [SendInputSynchronizationHint](../../reference/input/gameinput/interfaces/igameinputdevice/methods/igameinputdevice_sendinputsynchronizationhint.md) is called, DLI ignores input read timing and synchronizes to the hint call. To ensure inputs don't come in late, use `SendInputSynchronizationHint` right before the first input read of each simulation pass as shown in the following code.

```c++
IGameInputDevice::SendInputSynchronizationHint()
```

 

## Disabling DLI
 
There’s currently no recommended situation for turning off input synchronization, but disabling it can help when evaluating its benefits. Use [SetInputSynchronizationState](../../reference/input/gameinput/interfaces/igameinputdevice/methods/igameinputdevice_setinputsynchronizationstate.md) to disable or re-enable DLI as shown in the following code. 

```c++
IGameInputDevice::SetInputSynchronizationState(bool enabled)
```



## Analyzing DLI performance
For more information about how DLI performs against a title, see [Analyzing Dynamic Latency Input performance (NDA topic)](../../tools-console/xbox-tools-and-apis/pix/pix-input-sync.md).

## Device support

DLI only runs on input devices with supporting firmware. For more information about devices that support DLI, see [GameInputDeviceCapabilities](../../reference/input/gameinput/enums/gameinputdevicecapabilities.md). 



<a id="seeAlsoSection"></a>
## See also

[GameInput fundamentals](../overviews/input-fundamentals.md)

[Advanced GameInput topics](input-advanced-topics.md)

[Input API reference](../../reference/input/gc-reference-input-toc.md)