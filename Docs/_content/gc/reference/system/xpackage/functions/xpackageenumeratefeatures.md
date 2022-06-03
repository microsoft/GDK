---
author: M-Stahl
title: XPackageEnumerateFeatures
description: Enumerates features defined in the package's layout file.
kindex: XPackageEnumerateFeatures
ms.author: brianpe
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# XPackageEnumerateFeatures  

Enumerates features defined in the package's layout file.  

## Syntax  
  
```cpp
HRESULT XPackageEnumerateFeatures(  
         const char* packageIdentifier,  
         void* context,  
         XPackageFeatureEnumerationCallback* callback  
)  
```  
  
### Parameters  
  
*packageIdentifier* &nbsp;&nbsp;\_In\_z\_  
Type: char*  
  
The package to enumerate the features of the layout file. For more information about package identifiers, see [Manage and license downloadable content (DLC)](../../../../commerce/fundamentals/xstore-manage-and-license-optional-packages.md).    
  
*context* &nbsp;&nbsp;\_In\_opt\_  
Type: void*  
  
Context to be passed to the callback specified in the *callback* parameter.
  
*callback* &nbsp;&nbsp;\_In\_  
Type: XPackageFeatureEnumerationCallback*  
  
Caller defined callback.    
  
## Remarks

This function enumerates the features defined in the package’s *layout.xml*. Most importantly, this includes the ``displayName`` for that feature which it is shown in the *Shell* manage page for the game. For information about the packaging technology used with Xbox One titles, see [Overview of Packaging](../../../../packaging/overviews/packaging.md). 

### Return value
Type: HRESULT
  
HRESULT success or error code.  
  
  
## Requirements  
  
**Header:** XPackage.h  
  
**Library:** xgameruntime.lib  

**Supported Platforms**: Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  

[XPackageFeature](../structs/xpackagefeature.md)  
[XPackage](../xpackage_members.md)  

  
  