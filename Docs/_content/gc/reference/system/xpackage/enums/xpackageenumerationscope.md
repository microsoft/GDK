---
author: M-Stahl
title: XPackageEnumerationScope
description: Indicates the scope of packages to be returned when installation packages are being enumerated.
kindex: XPackageEnumerationScope
ms.author: brianpe
ms.topic: reference
edited: 05/21/2019
security: public
applies-to: pc-gdk
---

# XPackageEnumerationScope
  
Indicates the scope of packages to be returned when installation packages are being enumerated.  
  
<a id="syntaxSection"></a>
  
## Syntax
  
```cpp
enum class XPackageEnumerationScope  : uint32_t  
{  
    ThisOnly,  
    ThisAndRelated  
}  
```  
  
<a id="constantsSection"></a>
  
## Constants
  
| Constant | Description |  
| --- | --- |  
| ThisOnly | Scope is limited to just apps or content associated with the calling process. |  
| ThisAndRelated | Scope includes apps or content associated with the calling process and also includes apps or content that are associated with any package the calling process has added to its RelatedProducts section of its game config file. |  
  
<a id="remarksSection"></a>
  
## Remarks
  
The constants in this enumeration are used by packages, apps, and content associated with the calling process. These constants are specified in the *RelatedProducts* section of the **Game config** file. For information about the packaging technology used with Xbox One titles, see [Overview of Packaging](../../../../packaging/overviews/packaging.md). For information about the steps to create an XVC package, see [Getting started packaging titles for Xbox consoles](../../../../packaging/overviews/packaging-getting-started-for-console.md).  
  
<a id="requirementsSection"></a>
  
## Requirements
  
**Header:** XPackage.h  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also
  
[How to create and use Downloadable Content Packages (DLC) for PC and Xbox One](../../../../packaging/packaging-downloadable-content-dlc.md)  
[XPackage](../xpackage_members.md)  
  