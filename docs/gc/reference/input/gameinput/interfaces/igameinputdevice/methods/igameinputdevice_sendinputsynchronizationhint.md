---
author: M-Stahl
title: SendInputSynchronizationHint
description: Analyzes calls made to the GameInput API to determine when the game input device is available.
kindex: SendInputSynchronizationHint
ms.author: angillie
ms.topic: reference
edited: 00/00/0000
security: public
---

# IGameInputDevice::SendInputSynchronizationHint  

Analyzes calls made to the GameInput API to determine when the game input device is available. 

## Syntax  
  
```cpp
void SendInputSynchronizationHint(  
)  
```  
  
### Parameters  
  
  
This method has no parameters.

### Return value

Type: void
  
No return value  
  
## Remarks  
  
The ``IGameInputDevice::SendInputSynchronizationHint`` synchronization method analyzes calls made to the GameInput API and determines when a game's input device is available. If there is an issue determining the input device's availability, call this function to allow the GameInput API to synchronize the pattern so that it gets called more often than other calls to the GameInput API.  

![alert](../../../../../../../../resources/gamecore/images/en-us/common/note.gif) **NOTE:** For best results, it is recommended to call this function on a fixed cadence within the game loop.

  
## Requirements  
  
**Header:** gameinput.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
## See also  

[Advanced GameInput topics](../../../../../../input/advanced/input-advanced-topics.md)   
[Overview of GameInput](../../../../../../input/overviews/input-overview.md)   
[IGameInputDevice::SetInputSynchronizationState](igameinputdevice_setinputsynchronizationstate.md)  
[IGameInputDevice](../igameinputdevice.md)  
  
  