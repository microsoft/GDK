---
author: M-Stahl
title: GetTimestamp
description: IGameInputReading::GetTimestamp API
kindex: IGameInputReading::GetTimestamp
ms.author: angillie
ms.topic: reference
edited: 01/06/2020
quality: good
security: public
---

# IGameInputReading::GetTimestamp  

Retrieves the microsecond timestamp associated with the IGameInputReading.  

## Syntax  
  
```cpp
uint64_t GetTimestamp(  
)  
```  
  
### Parameters  
  
  
### Return value  

Type: uint64_t
  
The microsecond timestamp describing when the input was made.  
  
## Remarks  

There are cases where a time stamp is not sufficient to differentiate between two separate readings. Make sure that you also check the sequence number of a reading with the [IGameInputReading::GetSequenceNumber](igameinputreading_getsequencenumber.md) function.  
You can compare the results of this function with the current time by comparing the results from [IGameInput::GetCurrentTimeStamp.md](../../igameinput/methods/igameinput_getcurrenttimestamp.md).
  
## Requirements  
  
**Header:** GameInput.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
## See also  

[Input API Overview](../../../../../../input/overviews/input-overview.md)  
[IGameInputReading](../igameinputreading.md)  
[IGameInput::GetCurrentTimeStamp.md](../../igameinput/methods/igameinput_getcurrenttimestamp.md)