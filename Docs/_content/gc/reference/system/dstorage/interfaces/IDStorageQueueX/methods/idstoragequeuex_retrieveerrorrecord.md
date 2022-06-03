---
author: M-Stahl
title: RetrieveErrorRecord
description: Retrieves an error record.
kindex: RetrieveErrorRecord
ms.author: mstahl
ms.topic: reference
edited: 05/02/2020
security: public
---

# IDStorageQueueX::RetrieveErrorRecord  

Retrieves an error record.  

## Syntax  
  
```cpp
void RetrieveErrorRecord(  
         DSTORAGE_ERROR_RECORD *record  
)  
```  
  
### Parameters  
  
*record* &nbsp;&nbsp;\_Out\_  
Type: [DSTORAGE_ERROR_RECORD](../../../structs/dstorage_error_record.md) \*  
  
Receives the error record.  
  
### Return value  
Type: void
  
## Remarks 

When the error event is signaled, this method can be called to retrieve a [DSTORAGE_ERROR_RECORD](../../../structs/dstorage_error_record.md) object. The record contains the count of errors since the previous call to `RetrieveErrorRecord` and full data for the first failed request. 

After the error record is retrieved, do not call this method again before the next error event is signaled. Otherwise, *CommandType* in `DSTORAGE_ERROR_RECORD` returns `DSTORAGE_COMMAND_TYPE_NONE`, indicating no error.

For more information, see the "GetErrorEvent/RetrieveErrorRecord" section in [DirectStorage overview](../../../../../../system/overviews/directstorage/directstorage-overview.md). 
  
## Requirements  
  
**Header:** dstorage_xs.h  
  
**Library:** dstorage_xs.lib  
  
**Supported platforms:** Xbox Series consoles  
  
## See also  
[IDStorageQueueX::GetErrorEvent](idstoragequeuex_geterrorevent.md)  
[IDStorageQueueX](../idstoragequeuex.md)  
[DStorage](../../../dstorage_members.md)  
  