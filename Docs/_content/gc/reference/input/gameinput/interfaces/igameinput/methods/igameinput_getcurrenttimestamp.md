---
author: M-Stahl
title: GetCurrentTimestamp
description: IGameInput::GetCurrentTimestamp API reference
kindex: IGameInput::GetCurrentTimestamp
ms.author: angillie
ms.topic: reference
edited: 00/00/0000
quality: good
security: public
---

# IGameInput::GetCurrentTimestamp  

Returns a GameInput timestamp, taken at the moment the method is called.  

## Syntax  
  
```cpp
uint64_t GetCurrentTimestamp(  
)  
```  
  
### Parameters  
  
### Return value  

Type: uint64_t
  
Timestamp measure in microseconds.
  
## Remarks  
  
The GameInput API uses QPC time, expressed in microseconds, as the currency for its timestamps and other temporal functionality. Using a monotonically increasing counter instead of the system time ensures that no jitter is introduced as a result of system clock adjustments. Several methods within the GameInput API either return timestamp values or take timestamp values as an input. This method enables applications to reason about the values of other timestamps, relative to the present.
You can use GetCurrentTimeStamp in functions like [IGameInputDevice::SetRumbleState](../../igameinputdevice/methods/igameinputdevice_setrumblestate.md) which takes a timestamp as a parameter to determine when to take some action. You can also use this to reason about readings and when they happened relative to now by comparing the results with the results of [IGameInputReading::GetTimeStamp](../../igameinputreading/methods/igameinputreading_gettimestamp.md).
  
## Requirements  
  
**Header:** GameInput.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
## See also  

[Input API Overview](../../../../../../input/overviews/input-overview.md)  
[IGameInput](../igameinput.md)  
[IGameInputReading::GetTimeStamp](../../igameinputreading/methods/igameinputreading_gettimestamp.md)  
[IGameInputDevice::SetRumbleState](../../igameinputdevice/methods/igameinputdevice_setrumblestate.md)  