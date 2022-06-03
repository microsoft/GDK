---
author: M-Stahl
title: XPackageFeatureEnumerationCallback
description: The callback used by XPackageEnumerateFeatures to enumerate each feature.
kindex: XPackageFeatureEnumerationCallback
ms.author: brianpe
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# XPackageFeatureEnumerationCallback  

The callback used by [XPackageEnumerateFeatures](xpackageenumeratefeatures.md) to enumerate each feature.     

## Syntax  
  
```cpp
bool XPackageFeatureEnumerationCallback(  
         void* context,  
         const XPackageFeature* feature  
)  
```  
  
### Parameters  
  
*context* &nbsp;&nbsp;\_In\_  
Type: void*  
  
The context passed to [XPackageEnumerateFeatures](xpackageenumeratefeatures.md) when enumeration of the features was initiated.      
  
*feature* &nbsp;&nbsp;\_In\_  
Type: [XPackageFeature*](../structs/xpackagefeature.md)  
  
Pointer to an [XPackageFeature](../structs/xpackagefeature.md) structure describing the feature.   
  
  
### Return value
Type: bool
  
Return true to continue enumerating packages, or false to stop the enumeration.  

## Remarks  

This callback function enumerates the features defined in the package’s layout.xml. A prominent feature defined in the package’s layout file is the ``displayName``. The ``displayName`` is shown in the *Shell* manage page for the game. For information about the packaging technology used with Xbox One titles, see [Overview of Packaging](../../../../packaging/overviews/packaging.md).

  
## Requirements  
  
**Header:** XPackage.h  
  
**Supported Platforms**: Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  

[XPackageEnumerateFeatures](xpackageenumeratefeatures.md)  
[XPackageFeature](../structs/xpackagefeature.md)  
[XPackage](../xpackage_members.md)  

  
  