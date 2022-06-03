---
author: M-Stahl
title: DSTORAGE_BCPACK_MODE
description: Types of BCPack decompression to perform after content is read from a file.
kindex: DSTORAGE_BCPACK_MODE
ms.author: mstahl
ms.topic: reference
edited: 04/28/2020
security: public
---

# DSTORAGE_BCPACK_MODE  

Types of BCPack decompression to perform after content is read from a file.  

## Syntax  
  
```cpp
enum DSTORAGE_BCPACK_MODE  : UINT64  
{  
    DSTORAGE_BCPACK_MODE_NONE = 0,  
    DSTORAGE_BCPACK_MODE_BC1 = 1,  
    DSTORAGE_BCPACK_MODE_BC2 = 2,  
    DSTORAGE_BCPACK_MODE_BC3 = 3,  
    DSTORAGE_BCPACK_MODE_BC4 = 4,  
    DSTORAGE_BCPACK_MODE_BC5 = 5,  
    DSTORAGE_BCPACK_MODE_BC6H = 6,  
    DSTORAGE_BCPACK_MODE_BC7 = 7,  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| DSTORAGE_BCPACK_MODE_NONE | Perform no BCPack decompression. |  
| DSTORAGE_BCPACK_MODE_BC1 | Perform BCPack decompression of BC1 texture data. |  
| DSTORAGE_BCPACK_MODE_BC2 | Perform BCPack decompression of BC2 texture data. |  
| DSTORAGE_BCPACK_MODE_BC3 | Perform BCPack decompression of BC3 texture data. |  
| DSTORAGE_BCPACK_MODE_BC4 | Perform BCPack decompression of BC4 texture data. |  
| DSTORAGE_BCPACK_MODE_BC5 | Perform BCPack decompression of BC5 texture data. |  
| DSTORAGE_BCPACK_MODE_BC6H | Perform BCPack decompression of BC6H texture data. |  
| DSTORAGE_BCPACK_MODE_BC7 | Perform BCPack decompression of BC7 texture data. |  
  
## Remarks 

This enumeration is used in the [DSTORAGE_REQUEST_OPTIONS](../structs/dstorage_request_options.md) structure.

Using `DSTORAGE_BCPACK_MODE_NONE` means that the data isn't compressed by using BCPack. 

For more information, see the "Decompression" section of [DirectStorage overview](../../../../system/overviews/directstorage/directstorage-overview.md).
  
## Requirements  
  
**Header:** dstorage_xs.h  
   
**Supported platforms:** Xbox Series consoles  
  
## See also  
[DStorage](../dstorage_members.md)  
  