---
author: M-Stahl
title: XPackageUninstallChunks
description: Uninstalls chunks that match the specified selectors.
kindex: XPackageUninstallChunks
ms.author: brianpe
ms.topic: reference
edited: 05/18/2019
security: public
applies-to: pc-gdk
---

# XPackageUninstallChunks  

Uninstalls chunks that match the specified selectors.  

## Syntax  
  
```cpp
HRESULT XPackageUninstallChunks(  
         const char* packageIdentifier,  
         uint32_t selectorCount,  
         XPackageChunkSelector* selectors  
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

  
An array of selectors that specify the chunks to be uninstalled.  

There's no support for using only the integer ID to specify chunks to be uninstalled; attempting to do so will cause **XPackageUninstallChunks** to return a value of E_INVALIDARG. To specify chunks to be uninstalled, supply additional information for the selector, such as a language or a tag.

  
### Return value

Type: HRESULT
  
HRESULT success or error code.    
  
## Remarks  
  > [!NOTE]
> This function isn't safe to call on a time-sensitive thread. For more information, see [Time-sensitive threads](../../../../system/overviews/time-sensitive-threads.md).  
  
**XPackageUninstallChunks** removes chunks that match the specified installation selectors. This will not remove chunks necessary for the package to function. For example, you can't remove chunks required to provide assets for the language of the currently running game. 

The title is not stopped when chunks are removed. It's up to the title to close all file handles to files in the chunks that it removes and in the chunks where it no longer accesses files.  

In the following example, **XPackageUninstallChunks** is used to uninstall a map package with the tag "BigMaps":

```cpp
HRESULT UninstallBigMaps()
{
    char id[XPACKAGE_IDENTIFIER_MAX_LENGTH];
    HRESULT hr = XPackageGetCurrentProcessPackageIdentifier(_countof(id), id);
    if (FAILED(hr)) return hr;

    XPackageChunkSelector selector;
    selector.type = XPackageChunkSelectorType::Tag;
    selector.tag = "BigMaps";

    hr = XPackageUninstallChunks(id, 1, &selector);
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
  
  