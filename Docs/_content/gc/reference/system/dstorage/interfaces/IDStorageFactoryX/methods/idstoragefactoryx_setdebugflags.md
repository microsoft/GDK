---
author: M-Stahl
title: SetDebugFlags
description: Sets flags used to control the debug layer.
kindex: SetDebugFlags
ms.author: mstahl
ms.topic: reference
edited: 04/28/2020
security: public
---

# IDStorageFactoryX::SetDebugFlags  

Sets flags used to control the debug layer.  

## Syntax  

```cpp
void SetDebugFlags(  
         UINT32 flags  
)  
```  

### Parameters  

*flags*  
Type: UINT32  

A set of flags controlling the debug layer.  

### Return value  
Type: void

## Remarks

This method sets flags that control whether DirectStorage performs additional validations when requests are enqueued. The validations are intended to aid debugging.  Note that these debug flags only affect the behavior of errors that are detectable at enqueue time.  Errors that occur as part of the asynchronous
handling of requests, such as a corrupt stream or mismatched buffer size for compressed content, can be detected and retrieved through
[IDStorageStatusArrayX::GetHResult](../../IDStorageStatusArrayX/methods/idstoragestatusarrayx_gethresult.md) once those requests have completed.

The [DSTORAGE_DEBUG](../../../enums/dstorage_debug.md) enumeration defines the flags used by `SetDebugFlags`.

## Requirements  

**Header:** dstorage_xs.h  

**Library:** dstorage_xs.lib  

**Supported platforms:** Xbox Series consoles  

## See also  
[IDStorageFactoryX](../idstoragefactoryx.md)  
[DStorage](../../../dstorage_members.md)  