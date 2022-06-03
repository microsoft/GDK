---
author: aablackm
title: PIXRecordMemoryAllocationEvent
description: Records a memory allocation event.
kindex:
- PIXRecordMemoryAllocationEvent
- PIX, PIXRecordMemoryAllocationEvent
ms.author: jerry.zhou
ms.topic: reference
edited: 06/13/2019
quality: good
security: public
---

# PIXRecordMemoryAllocationEvent  
  
Records a memory allocation event.
  
## Syntax  

```cpp
void PIXRecordMemoryAllocationEvent(  
         USHORT allocatorId,  
         void* baseAddress,  
         size_t size,  
         UINT64 metadata  
)  
```  

### Parameters  

*allocatorId* &nbsp;&nbsp;  
Type: USHORT  

An ID you can use to identify groups of memory allocations in the memory profiler. For example, if you have different heaps for things such as graphics, audio, and physics, you can assign each of these categories a different **allocatorID** so they are easy to identify when viewing a memory capture in PIX.  

*baseAddress* &nbsp;&nbsp;  
Type: void*  

The starting address of the memory that has been allocated.  

*size* &nbsp;&nbsp;  
Type: size_t  

The size of the memory that has been allocated in bytes.  

*metadata* &nbsp;&nbsp;  
Type: UINT64  

A 64-bit unsigned integer you can use to tag an allocation with additional data. This extra data is displayed in PIX in a **UserData** column. You can use this extra data to identify the type of object within your title that is stored at a given memory location, for example. 

### Return value
Type: void

## Remarks
  
A PIX memory tracking event provides the data that PIX needs to display information about all memory allocations and releases made from within the title’s custom memory allocators in memory profiling captures. By providing this data, PIX will show all the same data for your custom allocators that it does for calls to **VirtualAlloc**/**VirtualFree** and **HeapAlloc**/**HeapFree**.
  
If there are many events occurring at the same time or the system is under a heavy load, memory events can be lost by Event Tracing for Windows (ETW). Event loss will result in an incomplete analysis of data. PIX Memory Capture UI will display a warning indicating event loss.   
  
Multiple [PIXRecordMemoryFreeEvent](pixrecordmemoryfreeevent.md) calls can be used to track memory that is progressively freed from a single allocation.
  
See [PIX custom memory allocators (NDA topic)](../../../../tools-console/xbox-tools-and-apis/pix/pix-custom-memory-allocators.md) for information about how data from custom allocations and frees is shown in memory captures.
  
## Requirements  

**Header:** pixmemory.h  

**Library:** pixevt.lib  
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  

## See also  
[PIX (NDA topic)](../../../../tools-console/xbox-tools-and-apis/pix/pix.md)  

[PIX custom memory allocators (NDA topic)](../../../../tools-console/xbox-tools-and-apis/pix/pix-custom-memory-allocators.md)

[PIX API reference](../pix3_members.md)  

[PIXRecordMemoryFreeEvent](pixrecordmemoryfreeevent.md)  