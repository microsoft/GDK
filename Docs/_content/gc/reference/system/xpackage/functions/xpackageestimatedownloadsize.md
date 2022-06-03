---
author: M-Stahl
title: XPackageEstimateDownloadSize
description: Computes the download size of the chunks that match the specified installation selectors.
kindex: XPackageEstimateDownloadSize
ms.author: brianpe
ms.topic: reference
edited: 05/18/2019
security: public
applies-to: pc-gdk
---

# XPackageEstimateDownloadSize  

Computes the download size of the chunks that match the specified installation selectors.  

## Syntax  
  
```cpp
HRESULT XPackageEstimateDownloadSize(  
         const char* packageIdentifier,  
         uint32_t selectorCount,  
         XPackageChunkSelector* selectors,  
         uint64_t* downloadSize,  
         bool* shouldPresentUserConfirmation  
)  
```  
  
### Parameters  
  
*packageIdentifier* &nbsp;&nbsp;\_In\_z\_  
Type: char*  

  
A string that uniquely identifies the installed package on the disk. For more information about package identifiers, see [Manage and license downloadable content (DLC)](../../../../commerce/fundamentals/xstore-manage-and-license-optional-packages.md).    


*selectorCount* &nbsp;&nbsp;\_In\_  
Type: uint32_t  

  
The number of selectors in the *selectors* parameter.  


*selectors* &nbsp;&nbsp;\_In\_reads\_(selectorCount)  
Type: [XPackageChunkSelector*](../structs/xpackagechunkselector.md)  

  
An array of selectors that specify the chunks to be operated on.  


*downloadSize* &nbsp;&nbsp;\_Out\_  
Type: uint64_t*  

  
On return, contains the download size of the specified installation selectors.  

*shouldPresentUserConfirmation* &nbsp;&nbsp;\_Out\_opt\_  
Type: bool*  

  
If the download would require the user's confirmation, returns true; otherwise, returns false.  


  
### Return value
Type: HRESULT
  
HRESULT success or error code.    

## Remarks
  > [!NOTE]
> This function isn't safe to call on a time-sensitive thread. For more information, see [Time-sensitive threads](../../../../system/overviews/time-sensitive-threads.md).  
  
If provided, the *shouldPresentUserConfirmation* parameter will be set to true if the estimated download size is large enough to prompt the user to accept the download size. 

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
    
    
  
  