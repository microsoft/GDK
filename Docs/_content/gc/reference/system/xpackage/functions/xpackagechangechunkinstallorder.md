---
author: M-Stahl
title: XPackageChangeChunkInstallOrder
description: Sets the selected chunks to install first.
kindex: XPackageChangeChunkInstallOrder
ms.author: brianpe
ms.topic: reference
edited: 05/18/2019
security: public
applies-to: pc-gdk
---

# XPackageChangeChunkInstallOrder  

Specifies which selected chunks are to be installed first.

## Syntax  
  
```cpp
HRESULT XPackageChangeChunkInstallOrder(  
        const char* packageIdentifier,  
        uint32_t selectorCount,  
        XPackageChunkSelector* selectors
)  
```  
  
### Parameters  
  
*packageIdentifier* &nbsp;&nbsp;\_In\_z\_  
Type: char*  

  
A string that uniquely identifies the installed package on the disk.  For more information about package identifiers, see [Manage and license downloadable content (DLC)](../../../../commerce/fundamentals/xstore-manage-and-license-optional-packages.md). 


*selectorCount* &nbsp;&nbsp;\_In\_  
Type: uint32_t  

  
The number of selectors in the *selectors* parameter.  


*selectors* &nbsp;&nbsp;\_In\_reads\_(selectorCount)  
Type: [XPackageChunkSelector*](../structs/xpackagechunkselector.md)  

  
An array of selectors that specifies the type of chunks to be affected.  


  
### Return value
Type: HRESULT
  
HRESULT success or error code.  
  
## Remarks
  > [!NOTE]
> This function isn't safe to call on a time-sensitive thread. For more information, see [Time-sensitive threads](../../../../system/overviews/time-sensitive-threads.md).  
  
**XPackageChangeChunkInstallOrder** updates the chunks selected by the specified selector to be placed first in the installation queue. This can take a selector, not just an array of chunk IDs. You can pass more complex selectors here, and the chunks that make them up will all be pushed to the front of the queue.

You can call **XPackageChangeChunkInstallOrder** at any time, not only when the chunks are not installed. If the chunks are already installed, **XPackageChangeChunkInstallOrder** ignores them. The same is true when you provide chunks that, due to intelligent delivery, are not scheduled to be installed at all.

In the following example, to keep the user playing, the game must access a file called “soon”. Function PrioritizeChunk is defined and checks the chunk's current installation status. If the chunk is not already installed, the function asks the streaming system to install it and returns an installation monitor that can monitor the chunk’s progress. If the chunk is already installed, the function returns a null monitor.  

```cpp
HRESULT PrioritizeChunk( 
    XTaskQueueHandle queue, uint32_t chunkId, XPackageInstallationMonitorHandle* monitor) 
{ 
    char id[XPACKAGE_IDENTIFIER_MAX_LENGTH]; 
 
    *monitor = nullptr; 
    HRESULT hr = XPackageGetCurrentProcessPackageIdentifier(_countof(id), id); 
    if (FAILED(hr)) return hr; 
 
    XPackageChunkSelector selector; 
    selector.type = XPackageChunkSelectorType::Chunk; 
    selector.chunkId = chunkId; 
 
    hr = XPackageCreateInstallationMonitor(id, 1, &selector, 1000, queue, monitor); 
 
    if (SUCCEEDED(hr)) 
    { 
        XPackageInstallationProgress progress; 
        XPackageGetInstallationProgress(*monitor, &progress); 
    }

    if (!progress.completed) 
    { 
        hr = XPackageChangeChunkInstallOrder(id, 1, &selector); 
    } 
 
    if (progress.completed || FAILED(hr)) 
    { 
        XPackageCloseInstallationMonitorHandle(*monitor); 
        *monitor = nullptr; 
    } 
 
    return hr; 
} 
```
## Requirements  
  
**Header:** XPackage.h
  
**Library:** xgameruntime.lib  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[XPackage](../xpackage_members.md)  
[Streaming Installation and Intelligent Delivery](../../../../packaging/overviews/streaming_install-intelligent_delivery.md)
  
  