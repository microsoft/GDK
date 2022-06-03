---
author: M-Stahl
title: DSTORAGE_REQUEST_SOURCE_TYPE
description: Source types of a DirectStorage request.
kindex: DSTORAGE_REQUEST_SOURCE_TYPE
ms.author: mstahl
ms.topic: reference
edited: 04/28/2020
security: public
---

# DSTORAGE_REQUEST_SOURCE_TYPE  

Source types of a DirectStorage request.    

## Syntax  
  
```cpp
enum DSTORAGE_REQUEST_SOURCE_TYPE  : UINT64  
{  
    DSTORAGE_REQUEST_SOURCE_FILE = 0,  
    DSTORAGE_REQUEST_SOURCE_MEMORY = 1  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| DSTORAGE_REQUEST_SOURCE_FILE | The source of the DirectStorage request is a file. |  
| DSTORAGE_REQUEST_SOURCE_MEMORY | The source of the DirectStorage request is a block of memory. |  
  
## Remarks

This enumeration is used in the following structures:

- [DSTORAGE_QUEUE_DESC](../structs/dstorage_queue_desc.md) 
- [DSTORAGE_QUEUE_INFO](../structs/dstorage_queue_info.md) 
- [DSTORAGE_REQUEST_OPTIONS](../structs/dstorage_request_options.md) 

A file-sourced queue accepts only file-sourced requests. A memory-sourced queue accepts only memory-sourced requests. For more information, see the "Memory-to-memory decompression" section of [DirectStorage overview](../../../../system/overviews/directstorage/directstorage-overview.md). 
  
## Requirements  
  
**Header:** dstorage_xs.h  
   
**Supported platforms:** Xbox Series consoles  
  
## See also  
[IDStorageFactoryX::CreateQueue](../interfaces/IDStorageFactoryX/methods/idstoragefactoryx_createqueue.md)  
[DStorage](../dstorage_members.md)  
  