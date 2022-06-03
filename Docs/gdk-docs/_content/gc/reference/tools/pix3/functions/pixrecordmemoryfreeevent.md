---
author: aablackm
title: PIXRecordMemoryFreeEvent
description: Records a memory freeing event.
kindex:
- PIXRecordMemoryFreeEvent
- PIX, PIXRecordMemoryFreeEvent
ms.author: jerry.zhou
ms.topic: reference
edited: 06/13/2019
quality: good
security: public
---

# PIXRecordMemoryFreeEvent  
  
Records a memory freeing event. 
  

## Syntax  
  
```cpp
void PIXRecordMemoryFreeEvent(  
         USHORT allocatorId,  
         void* baseAddress,  
         size_t size,  
         UINT64 metadata  
)  
```  

### Parameters  
  
*allocatorId* &nbsp;&nbsp;  
Type: USHORT  

An ID you can use to identify groups of memory allocations in the memory profiler. For example, if you have different heaps for things such as graphics, audio, and physics, you can assign each of these categories a different allocatorID so they are easy to identify when viewing a memory capture in PIX.  

*baseAddress* &nbsp;&nbsp;  
Type: void*  

The starting address of the memory that has been freed.  

*size* &nbsp;&nbsp;  
Type: size_t  

The size of the memory that has been freed in bytes.   
  
*metadata* &nbsp;&nbsp;  
Type: UINT64  

A 64-bit unsigned integer you can use to tag a memory freeing with additional data. This extra data is displayed in PIX in a UserData column. You can use this extra data to identify the type of object within your title that has been freed at a given memory location, for example. The value passed to `PIXRecordMemoryFreeEvent` does not have to match the value passed to the corresponding call to [PIXRecordMemoryAllocationEvent](pixrecordmemoryallocationevent.md).  

### Return value
  
Type: void

## Remarks
  
A PIX memory tracking event provides the data that PIX needs to display information about all memory allocations and releasings made from within the title’s custom memory allocators in memory profiling captures. By providing this data, PIX will show all the same data for your custom allocators that it does for calls to `VirtualAlloc/VirtualFree` and `HeapAlloc/HeapFree`.
  
PIX uses the *baseAddress* and *size* parameters to locate the corresponding allocation as follows: If *baseAddress* matches the *baseAddress* passed to the corresponding call to [PIXRecordMemoryAllocationEvent](pixrecordmemoryallocationevent.md), PIX will match up the allocation and free by simply comparing the addresses. In this case, 0 can be passed for the *size* parameter. 
If *baseAddress* is different than the value specified in the corresponding allocation, the *size* parameter must be specified as non-zero. In this case, PIX will find the corresponding allocations using both *baseAddress* and *size*.  
  
If there are a large number of events occurring at the same time or the system is under a heavy load, memory events can be lost by Event Tracing for Windows (ETW). Event loss will result in an incomplete analysis of data. PIX Memory Capture UI will display a warning indicating event loss.
  
  
## Requirements  
  
**Header:** pixmemory.h

**Library:** pixevt.lib
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  

## See also  
  
[PIX custom memory allocators (NDA topic)](../../../../tools-console/xbox-tools-and-apis/pix/pix-custom-memory-allocators.md)
[PIX API reference](../pix3_members.md)  
[PIXRecordMemoryAllocationEvent](pixrecordmemoryallocationevent.md)  
[PIX (NDA topic)](../../../../tools-console/xbox-tools-and-apis/pix/pix.md)  