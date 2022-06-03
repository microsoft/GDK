---
author: M-Stahl
title: XPackageFeature
description: Describes a feature.
kindex: XPackageFeature
ms.author: brianpe
ms.topic: reference
security: public
edited: 07/08/2020
applies-to: pc-gdk
---

# XPackageFeature
  
Describes a feature.  
  
<a id="syntaxSection"></a>
  
## Syntax
  
```cpp
typedef struct XPackageFeature {  
    const char* id;  
    const char* displayName;  
    const char* tags;  
    bool hidden;  
    uint32_t storeIdCount;
    const char** storeIds;
} XPackageFeature  
```
  
<a id="membersSection"></a>
  
### Members
  
*id*  
Type: const char\*  
  
The feature ID.  
  
*displayName*  
Type: const char\*  
  
The display name that will be shown to the user.  
  
*tags*  
Type: const char\*  
  
The package’s feature tags.  
  
*hidden*  
Type: bool  
  
Determines whether the package’s feature is hidden.  

*storeIdCount*  
Type: uint32_t  

The number of store IDs in the storeIds array.

*storeIds*  
Type: const char\*\*  

An array of store IDs associated with this feature through a recipe. If there are no associated store IDs this field will be null.
  
<a id="remarksSection"></a>
  
## Remarks
  
The `XPackageFeature` structure describes the features of a package.  `XPackageFeature` defines the feature ID, display name, and feature tags. It also determines whether the package’s feature is hidden. A feature ID may be related to zero or more store IDs through a recipe. Related store IDs are available on `XPackageFeature`.  

For information about the packaging technology used with Xbox One titles, see [Overview of Packaging](../../../../packaging/overviews/packaging.md).  
  
<a id="requirementsSection"></a>
  
## Requirements
  
**Header:** XPackage.h  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
<a id="seealsoSection"></a>
  
## See also
  
[XPackageEnumerateFeatures](../functions/xpackageenumeratefeatures.md)  
[XPackage](../xpackage_members.md)  
  