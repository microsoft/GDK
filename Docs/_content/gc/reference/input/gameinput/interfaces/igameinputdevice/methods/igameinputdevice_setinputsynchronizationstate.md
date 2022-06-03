---
author: M-Stahl
title: SetInputSynchronizationState
description: IGameInputDevice::SetInputSynchronizationState
kindex: SetInputSynchronizationState
ms.author: angillie
ms.topic: reference
edited: 00/00/0000
quality: good
security: public
---

# IGameInputDevice::SetInputSynchronizationState  

Enables or disables input synchronization for an input device.  

## Syntax  
  
```cpp
void SetInputSynchronizationState(  
         bool enabled  
)  
```  
  
### Parameters  
  
*enabled* &nbsp;&nbsp;\_In\_  
Type: bool  
  
Indicates whether or not input synchronization state will be set to enabled.    
If true, input synchronization will be enabled.
  
## Remarks  
  
The input synchronization feature analyzes calls made to the GameInput API to determine when the game is most likely to want input to be available. This function returns a not supported error if the input device does not support input synchronization. This device capability is reflected in the [GameInputDeviceCapabilities](../../../enums/gameinputdevicecapabilities.md) enum.
  
## Requirements  
  
**Header:** gameinput.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
## See also  
[IGameInputDevice](../igameinputdevice.md)  
[IGameInputDevice::SendInputSynchronizationHint](igameinputdevice_sendinputsynchronizationhint.md)  
  
  