---
author: M-Stahl
title: PowerOff
description: Turns the power off on the input device.
kindex: PowerOff
ms.author: angillie
ms.topic: reference
edited: 01/06/2020
security: public
---

# IGameInputDevice::PowerOff  
> [!NOTE]
> This function is not yet implemented.

Turns off the power to the input device.  

## Syntax  
  
```cpp
void PowerOff(  
)  
```  
  
### Parameters  
  
This method has no parameters.

### Return value 

Type: void
  
No return value.  
  
## Remarks  
  
The ``IGameInputDevice::PowerOff`` method turns the power off to the input device. The [IGameInputDevice](../igameinputdevice.md) interface provides applications access to rich information about an input device’s properties, capabilities, and current state. You can query device information such as its type, abilities, and battery state. You may also activate some device-specific hardware like haptic and force feedback.

![alert](../../../../../../../../resources/gamecore/images/en-us/common/note.gif) **NOTE:** Not all devices support this power-off function.

## Requirements  
  
**Header:** gameinput.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
## See also  

[Advanced GameInput topics](../../../../../../input/advanced/input-advanced-topics.md)    
[Overview of GameInput](../../../../../../input/overviews/input-overview.md)  
[IGameInputDevice](../igameinputdevice.md)  