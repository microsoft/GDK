---
author: M-Stahl
title: DSTORAGE_DEBUG
description: Flags that control the DirectStorage debug layer.
kindex: DSTORAGE_DEBUG
ms.author: mstahl
ms.topic: reference
edited: 04/28/2020
security: public
---

# DSTORAGE_DEBUG  

Flags that control the DirectStorage debug layer.    

## Syntax  
  
```cpp
enum DSTORAGE_DEBUG    
{  
    DSTORAGE_DEBUG_NONE = 0x00,  
    DSTORAGE_DEBUG_SHOW_ERRORS = 0x01,  
    DSTORAGE_DEBUG_BREAK_ON_ERROR = 0x02,  
    DSTORAGE_DEBUG_RECORD_OBJECT_NAMES  = 0x04
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| DSTORAGE_DEBUG_NONE | DirectStorage debug layer is disabled. |  
| DSTORAGE_DEBUG_SHOW_ERRORS | Print error information to a debugger. |  
| DSTORAGE_DEBUG_BREAK_ON_ERROR | Trigger a debug break each time an error is detected. |  
| DSTORAGE_DEBUG_RECORD_OBJECT_NAMES | Include `IDStorageStatusArrayX` and `ID3D12Fence` names in ETW events. |  
  
## Remarks

This enumeration is used by the [IDStorageFactoryX::SetDebugFlags](../interfaces/IDStorageFactoryX/methods/idstoragefactoryx_setdebugflags.md) method. The flags control whether DirectStorage performs additional validations when requests are enqueued. The validations are intended to aid debugging. 

## Requirements  
  
**Header:** dstorage_xs.h  
  
**Supported platforms:** Xbox Series consoles  
  
## See also  
[IDStorageFactoryX::SetDebugFlags](../interfaces/IDStorageFactoryX/methods/idstoragefactoryx_setdebugflags.md)  
[DStorage](../dstorage_members.md)  
  