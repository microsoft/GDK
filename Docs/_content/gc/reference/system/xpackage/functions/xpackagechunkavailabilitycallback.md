---
author: M-Stahl
title: XPackageChunkAvailabilityCallback
description: A user-defined callback used by [XPackageEnumerateChunkAvailability](xpackageenumeratechunkavailability.md).
kindex: XPackageChunkAvailabilityCallback
ms.author: brianpe
ms.topic: reference
edited: 05/18/2019
quality: good
security: public
applies-to: pc-gdk
---

# XPackageChunkAvailabilityCallback  

A user-defined callback used by [XPackageEnumerateChunkAvailability](xpackageenumeratechunkavailability.md).  

## Syntax  
  
```cpp
bool XPackageChunkAvailabilityCallback(  
         void* context,  
         const XPackageChunkSelector* selector,  
         XPackageChunkAvailability availability  
)  
```  
  
### Parameters  
  
*context* &nbsp;&nbsp;\_In\_  
Type: void*  

  
The context passed to [XPackageEnumerateChunkAvailability](xpackageenumeratechunkavailability.md).  


*selector* &nbsp;&nbsp;\_In\_  
Type: [XPackageChunkSelector*](../structs/xpackagechunkselector.md)  

  
The selector list passed to [XPackageEnumeratePackages](xpackageenumeratepackages.md).  


*availability* &nbsp;&nbsp;\_In\_  
Type: [XPackageChunkAvailability](../enums/xpackagechunkavailability.md)  


The availability of the matching chunks.  


  
### Return value
Type: bool
  
To continue enumerating, return true. To stop enumerating, return false.  

## Remarks
**XPackageChunkAvailabilityCallback** is a function callback passed to [XPackageEnumerateChunkAvailability](xpackageenumeratechunkavailability.md). It's invoked for each element of the enumeration. To continue enumerating, return true from this callback; to stop enumerating, return false.

## Requirements  
  
**Header:** XPackage.h
  
**Library:** xgameruntime.lib  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[XPackage](../xpackage_members.md)  
[Streaming Installation and Intelligent Delivery](../../../../packaging/overviews/streaming_install-intelligent_delivery.md) 
[XPackageEnumerateChunkAvailability](xpackageenumeratechunkavailability.md)
  
  