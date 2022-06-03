---
author: M-Stahl
title: XPackageFindChunkAvailability
description: Returns the minimum availability for the collection of chunks that match the specified selectors.
kindex: XPackageFindChunkAvailability
ms.author: brianpe
ms.topic: reference
edited: 05/21/2019
security: public
applies-to: pc-gdk
---

# XPackageFindChunkAvailability  

Returns the minimum availability for the collection of chunks that match the specified selectors.  

## Syntax  
  
```cpp
HRESULT XPackageFindChunkAvailability(  
         const char* packageIdentifier,  
         uint32_t selectorCount,  
         XPackageChunkSelector* selectors,  
         XPackageChunkAvailability* availability  
)  
```  
  
### Parameters  
  
*packageIdentifier* &nbsp;&nbsp;\_In\_z\_  
Type: char*  

  
A string that uniquely identifies the installed package on the disk. For more information about package identifiers, see [Manage and license downloadable content (DLC)](../../../../commerce/fundamentals/xstore-manage-and-license-optional-packages.md).    


*selectorCount* &nbsp;&nbsp;\_In\_  
Type: uint32_t  

  
The number of selectors in the *selectors* parameter.  


*selectors* &nbsp;&nbsp;\_In\_reads\_opt\_(selectorCount)  
Type: [XPackageChunkSelector*](../structs/xpackagechunkselector.md)  

  
An array of selectors that specify the chunks to be checked.  


*availability* &nbsp;&nbsp;\_Out\_  
Type: [XPackageChunkAvailability*](../enums/xpackagechunkavailability.md)  

  
On return, lists the availability of the chunks. 


  
### Return value
Type: HRESULT
  
HRESULT success or error code.    
  
## Remarks
  > [!NOTE]
> This function isn't safe to call on a time-sensitive thread. For more information, see [Time-sensitive threads](../../../../system/overviews/time-sensitive-threads.md).  
  
**XPackageFindChunkAvailability** takes an array of chunk selectors, finds the associated chunks, and then returns the minimum availability for those chunks. Availability ranges according to the following values: 
* Ready: The chunk is already installed and can be read. 
* Pending: The chunk is not installed yet but will be. 
* Installable: The chunk will not be installed, but it could be downloaded. 
* Unavailable: The chunk cannot be downloaded.  

The following example accepts a track name for a racing game and, if the track is not installed, prints the download size for the track:

```cpp
HRESULT ListDownloadSize(char* trackName)
{
    XPackageChunkSelector selector;
    selector.type = XPackageChunkSelectorType::Tag;
    selector.tag = trackName;

    char id[XPACKAGE_IDENTIFIER_MAX_LENGTH];
    HRESULT hr = XPackageGetCurrentProcessPackageIdentifier(_countof(id), id);
    if (FAILED(hr)) return hr;

    XPackageChunkAvailability availability;
    hr = XPackageFindChunkAvailability(id, 1, &selector, &availability);
    if (FAILED(hr)) return hr;

    if (availability == XPackageChunkAvailability::Installable)
    {
        uint64_t downloadSize;
        hr = XPackageEstimateDownloadSize(id, 1, &selector, &downloadSize, nullptr);
        if (FAILED(hr)) return hr;

        printf("Download Size for track %s: %I64u\n", trackName, downloadSize);
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
  
  
  