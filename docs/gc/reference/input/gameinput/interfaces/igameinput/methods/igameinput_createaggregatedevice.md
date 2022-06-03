---
author: M-Stahl
title: CreateAggregateDevice
description: CreateAggregateDevice API reference
kindex: CreateAggregateDevice
ms.author: angillie
ms.topic: reference
edited: 07/02/2019
quality: good
security: public
---

# IGameInput::CreateAggregateDevice  
> [!NOTE]
> This function is not yet implemented.

Creates a virtual [IGameInputDevice](../../igameinputdevice/igameinputdevice.md) instance which aggregates all input of the specified [GameInputKind](../../../enums/gameinputkind.md).  

## Syntax  

```cpp
HRESULT CreateAggregateDevice(  
         GameInputKind inputKind,  
         IGameInputDevice** device  
)  
```  
  
### Parameters  
  
*inputKind* &nbsp;&nbsp;\_In\_  
Type: [GameInputKind](../../../enums/gameinputkind.md)  

  
The type of input which the returned virtual [IGameInputDevice](../../igameinputdevice/igameinputdevice.md) will aggregate readings for.  


*device* &nbsp;&nbsp;\_COM\_Outptr\_  
Type: IGameInputDevice**  

  
The resulting IGameInputDevice. 
Will return null on error.

  
### Return value  
Type: HRESULT
  
This function is not yet implemented.
Returns E_NOTIMPL. 

Planned implementation commonly returns an error when an unsupported [GameInputKind](../../../enums/gameinputkind.md) is used or when attempting to combine [GameInputKind](../../../enums/gameinputkind.md) flags.  
 
  
## Remarks  
  
The input kind specified in the call to the CreateAggregateDevice method must be a single value from the [GameInputKind](../../../enums/gameinputkind.md) enumeration; combining [GameInputKind](../../../enums/gameinputkind.md) flags is not supported. If an application needs aggregated input for multiple input kinds, it must create a virtual [IGameInputDevice](../../igameinputdevice/igameinputdevice.md) instance for each one.  

There are a few input kinds that do not make sense from an aggregation perspective. To avoid surprising or unexpected behavior, aggregation of the following input kinds is not supported:  

* GameInputKindRawDeviceReport  
* GameInputKindController  
* GameInputKindTouch  
* GameInputKindMotion  
  
## Requirements  
  
**Header:** GameInput.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
## See also  

[Input API Overview](../../../../../../input/overviews/input-overview.md)  
[IGameInput](../igameinput.md)  