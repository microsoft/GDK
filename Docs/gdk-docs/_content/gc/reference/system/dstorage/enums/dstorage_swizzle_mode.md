---
author: M-Stahl
title: DSTORAGE_SWIZZLE_MODE
description: Types of texture swizzling to perform.
kindex: DSTORAGE_SWIZZLE_MODE
ms.author: mstahl
ms.topic: reference
edited: 04/28/2020
security: public
---

# DSTORAGE_SWIZZLE_MODE  

Types of texture swizzling to perform.  

## Syntax  
  
```cpp
enum DSTORAGE_SWIZZLE_MODE  : UINT64  
{  
    DSTORAGE_SWIZZLE_MODE_NONE = 0,  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| DSTORAGE_SWIZZLE_MODE_NONE | No swizzling. |  
  
## Remarks

This enumeration is used in the [DSTORAGE_REQUEST_OPTIONS](../structs/dstorage_request_options.md) structure.

In the current preview release, only `DSTORAGE_SWIZZLE_MODE_NONE` is supported.

For more information, see the "Decompression" section of [DirectStorage overview](../../../../system/overviews/directstorage/directstorage-overview.md).
  
## Requirements  
  
**Header:** dstorage_xs.h  
  
**Supported platforms:** Xbox Series consoles  
  
## See also  
[DStorage](../dstorage_members.md)  
  