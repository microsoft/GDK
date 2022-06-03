---
author: M-Stahl
title: XPackageEnumerateChunkAvailability
description: Examines the installation package and enumerates the availability of all chunks that match the specified selectors.
kindex: XPackageEnumerateChunkAvailability
ms.author: brianpe
ms.topic: reference
edited: 05/18/2019
quality: good
security: public
applies-to: pc-gdk
---

# XPackageEnumerateChunkAvailability  

Examines the installation package and enumerates the availability of all chunks that match the specified selectors.  

## Syntax  
  
```cpp
HRESULT XPackageEnumerateChunkAvailability(  
         const char* packageIdentifier,  
         XPackageChunkSelectorType type,  
         void* context,  
         XPackageChunkAvailabilityCallback* callback  
)  
```  
  
### Parameters  
  
*packageIdentifier* &nbsp;&nbsp;\_In\_z\_  
Type: char*  

  
A string that uniquely identifies the installed package on the disk. For more information about package identifiers, see [Manage and license downloadable content (DLC)](../../../../commerce/fundamentals/xstore-manage-and-license-optional-packages.md).    


*type* &nbsp;&nbsp;\_In\_  
Type: [XPackageChunkSelectorType](../enums/xpackagechunkselectortype.md)  

  
The type of attributes to be enumerated.  


*context* &nbsp;&nbsp;\_In\_  
Type: void*  

  
The context to be passed to the callback specified in the *callback* parameter.  


*callback* &nbsp;&nbsp;\_In\_  
Type: [XPackageChunkAvailabilityCallback*](xpackagechunkavailabilitycallback.md)  

  
A callback to be called on completion.  


  
### Return value
Type: HRESULT
  
HRESULT success or error code.    
  
## Remarks
  > [!NOTE]
> This function isn't safe to call on a time-sensitive thread. For more information, see [Time-sensitive threads](../../../../system/overviews/time-sensitive-threads.md).  
  
**XPackageEnumerateChunkAvailability** is used to examine the package and to enumerate the availability of all selectors of a particular type. For example, calling this with **XPackageChunkSelectorType::Language** will enumerate all language attributes in the package, as well as their availability. 

In the example below, a game will show all the languages it supports and will allow the user to install or remove a language. To do this, the game will query the package to determine which languages are available and whether they are installed.

```cpp
HRESULT GetPackageLanguages(_Out_ std::map<std::string, bool>& languages)
{
    char id[XPACKAGE_IDENTIFIER_MAX_LENGTH];

    HRESULT hr = XPackageGetCurrentProcessPackageIdentifier(_countof(id), id);
    if (FAILED(hr)) return hr;

    hr = XPackageEnumerateChunkAvailability(id,
        XPackageChunkSelectorType::Language, &languages,
        [](void* context, const XPackageChunkSelector* sel, XPackageChunkAvailability av)
    {
        auto languages = static_cast<std::map<std::string, bool>*>(context);
        switch (av)
        {
        case XPackageChunkAvailability::Ready:
        case XPackageChunkAvailability::Pending:
            languages->emplace(sel->language, true);
            break;

        case XPackageChunkAvailability::Installable:
            languages->emplace(sel->language, false);
            break;

        case XPackageChunkAvailability::Unavailable:
        default:
            break;
        }
        return true;
    });

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
  
  