---
author: M-Stahl
title: DStorage (API contents)
description: Xbox DirectStorage APIs.
kindex: DStorage
ms.author: mstahl
ms.topic: navigation
edited: 00/00/0000
security: public
---

# DStorage  

  
  
## Interfaces  
  
| Interface | Description |  
| --- | --- |  
| [IDStorageFactoryX](interfaces/IDStorageFactoryX/idstoragefactoryx.md) | Represents the static DirectStorage factory object. |  
| [IDStorageFactoryX1](interfaces/IDStorageFactoryX1/idstoragefactoryx1.md) | Represents the static DirectStorage factory object. |  
| [IDStorageFileX](interfaces/IDStorageFileX/idstoragefilex.md) | Represents a file to be accessed by DirectStorage. |  
| [IDStorageQueueX](interfaces/IDStorageQueueX/idstoragequeuex.md) | Represents a DirectStorage queue. |  
| [IDStorageStatusArrayX](interfaces/IDStorageStatusArrayX/idstoragestatusarrayx.md) | Represents an array of status entries for the preceding read requests. |  
  
## Functions  
  
| Function | Description |  
| --- | --- |  
| [DStorageGetFactory](functions/dstoragegetfactory.md) | Returns the static DirectStorage factory object. |  
  
## Structures  
  
| Structure | Description |  
| --- | --- |  
| [DSTORAGE_ERROR_RECORD](structs/dstorage_error_record.md) | Detailed record of a failed DirectStorage request. |  
| [DSTORAGE_PRIORITY_STATS](structs/dstorage_priority_stats.md) | DirectStorage per priority statistics. |  
| [DSTORAGE_QUEUE_DESC](structs/dstorage_queue_desc.md) | Properties of a DirectStorage queue. |  
| [DSTORAGE_QUEUE_INFO](structs/dstorage_queue_info.md) | Properties and current state of a DirectStorage queue. |  
| [DSTORAGE_REQUEST](structs/dstorage_request.md) | Represents a DirectStorage read request. |  
| [DSTORAGE_REQUEST_OPTIONS](structs/dstorage_request_options.md) | Options for a DirectStorage read request. |  
| [DSTORAGE_STATS](structs/dstorage_stats.md) | DirectStorage statistics. |  
  
## Enumerations  
  
| Enumeration | Description |  
| --- | --- |  
| [DSTORAGE_BCPACK_MODE](enums/dstorage_bcpack_mode.md) | Types of BCPack decompression to perform after content is read from a file. |  
| [DSTORAGE_COMMAND_TYPE](enums/dstorage_command_type.md) | Types of DirectStorage requests. |  
| [DSTORAGE_DEBUG](enums/dstorage_debug.md) | Flags that control the DirectStorage debug layer. |  
| [DSTORAGE_PRIORITY](enums/dstorage_priority.md) | Priority levels of a DirectStorage queue. |  
| [DSTORAGE_REQUEST_SOURCE_TYPE](enums/dstorage_request_source_type.md) | Source types of a DirectStorage request. |  
| [DSTORAGE_STAGING_BUFFER_SIZE](enums/dstorage_staging_buffer_size.md) | Valid staging buffer sizes. |  
| [DSTORAGE_SWIZZLE_MODE](enums/dstorage_swizzle_mode.md) | Types of texture swizzling to perform. |  
