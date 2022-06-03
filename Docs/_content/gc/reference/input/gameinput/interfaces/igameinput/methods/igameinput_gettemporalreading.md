---
author: M-Stahl
title: GetTemporalReading
description: Retrieves a synthesized IGameInputReading interface that simulates a device state at a specific time.
kindex: GetTemporalReading
ms.author: angillie
ms.topic: reference
edited: 07/02/2019
security: public
---

# IGameInput::GetTemporalReading  
> [!NOTE]
> This function is not yet implemented.

Retrieves a synthesized IGameInputReading interface that simulates a device state at a specific time.  

## Syntax  
  
```cpp
HRESULT GetTemporalReading(  
         uint64_t timestamp,  
         IGameInputDevice* device,  
         IGameInputReading** reading  
)  
```  
  
### Parameters  
  
*timestamp* &nbsp;&nbsp;\_In\_  
Type: uint64_t  

Target time to simulate a device state. The designated time is in the range of 500 ms in the past to 100 ms in the future.  


*device* &nbsp;&nbsp;\_In\_  
Type: IGameInputDevice*  

  
The device to predict the state of at the designated time. 


*reading* &nbsp;&nbsp;\_COM\_Outptr\_  
Type: IGameInputReading**  

  
The returned synthesized reading.  


  
### Return value  
Type: HRESULT
  
Returns ``E_NOTIMPL``.  
  
## Remarks  
  
For readings in the past, the GameInput API simply performs linear interpolation between historical readings. For readings in the future, the GameInput API computes the velocity and acceleration of analog inputs to predict their future values. As a result, the farther into the future the requested reading is, the less accurate the prediction becomes. The state of digital inputs cannot be predicted, so the most current state is always reported.

For temporal readings, the [GetInputKind](../../igameinputreading/methods/igameinputreading_getinputkind.md) method on the ``IGameInputReading`` interface always returns a value that does not have the ``GameInputKindRawDeviceReport`` flag set. Likewise, the [GetRawReport](../../igameinputreading/methods/igameinputreading_getrawreport.md) method on the ``IGameInputReading`` interface always returns a ``NULL`` pointer (for temporal readings).

The ``GetTemporalReading`` method outputs a ``NULL`` pointer and returns a failure ``HRESULT`` if it is unable to return a reading. This can happen if insufficient reading data is available in the input stream buffer to accurately interpolate or predict the device’s state at the requested timestamp. This also happens if the provided timestamp is more than 500 ms in the past or more than 100 ms in the future.  
  
## Requirements  
  
**Header:** GameInput.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
## See also  

[Advanced GameInput topics](../../../../../../input/advanced/input-advanced-topics.md)  
[Overview of GameInput](../../../../../../input/overviews/input-overview.md)  
[IGameInput](../igameinput.md)  
  
  