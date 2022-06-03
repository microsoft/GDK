---
author: M-Stahl
title: GetDevice
description: IGameInputReading::GetDevice API
kindex: IGameInputReading::GetDevice
ms.author: angillie
ms.topic: reference
edited: 00/00/0000
quality: good
security: public
---

# IGameInputReading::GetDevice  

Gets the device associated with an IGameInputReading.  

## Syntax  
  
```cpp
void GetDevice(  
         IGameInputDevice** device  
)  
```  
  
### Parameters  
  
*device* &nbsp;&nbsp;\_Outptr\_  
Type: IGameInputDevice**  
  
The device associated with the IGameInputReading  
  
### Return value  

Type: void
  
## Remarks  

Use this method to gain information about the makes of a device and it's capabilities. For example you may need to know the number of buttons, arrays, and axis on the device. This will be important when you need to pass in buffers of an appropriate size for the many Get\*State functions like [IGameInputReading::GetGamepadState](igameinputreading_getgamepadstate.md) which require a developer created buffer.
  
## Requirements  
  
**Header:** GameInput.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
## See also  

[Input API Overview](../../../../../../input/overviews/input-overview.md)  
[IGameInputReading](../igameinputreading.md)  
[IGameInputReading::GetGamepadState](igameinputreading_getgamepadstate.md)  
  