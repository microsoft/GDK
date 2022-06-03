---
author: M-Stahl
title: DSTORAGE_COMMAND_TYPE
description: Types of DirectStorage requests.
kindex: DSTORAGE_COMMAND_TYPE
ms.author: mstahl
ms.topic: reference
edited: 05/02/2020
security: public
---

# DSTORAGE_COMMAND_TYPE  

Types of DirectStorage requests. 

## Syntax  
  
```cpp
enum DSTORAGE_COMMAND_TYPE    
{  
    DSTORAGE_COMMAND_TYPE_NONE = -1,  
    DSTORAGE_COMMAND_TYPE_REQUEST = 0,  
    DSTORAGE_COMMAND_TYPE_STATUS = 1,  
    DSTORAGE_COMMAND_TYPE_SIGNAL = 2  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| DSTORAGE_COMMAND_TYPE_NONE | No request. |  
| DSTORAGE_COMMAND_TYPE_REQUEST | Read request. |  
| DSTORAGE_COMMAND_TYPE_STATUS | Status write request. |  
| DSTORAGE_COMMAND_TYPE_SIGNAL | Fence write request.   |  
  
## Remarks  
  
This enumeration is used in the [DSTORAGE_ERROR_RECORD](../structs/dstorage_error_record.md) structure. It specifies the type of the first failed request in the queue since the previous call to [IDStorageQueueX::RetrieveErrorRecord](../interfaces/IDStorageQueueX/methods/idstoragequeuex_retrieveerrorrecord.md). `DSTORAGE_COMMAND_TYPE_NONE` indicates no failed request.

For more information, see the "GetErrorEvent/RetrieveErrorRecord" section in [DirectStorage overview](../../../../system/overviews/directstorage/directstorage-overview.md). 
  
## Requirements  
  
**Header:** dstorage_xs.h  
   
**Supported platforms:** Xbox Series consoles  
  
## See also  
[DStorage](../dstorage_members.md)  
  