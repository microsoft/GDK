---
author: M-Stahl
title: XPackageChunkAvailability
description: Indicates the availability of installation chunks.
kindex: XPackageChunkAvailability
ms.author: brianpe
ms.topic: reference
edited: 05/18/2019
security: public
applies-to: pc-gdk
---

# XPackageChunkAvailability
  
Indicates the availability of installation chunks.
  
<a id="syntaxSection"></a>
  
## Syntax
  
```cpp
enum class XPackageChunkAvailability  : uint32_t  
{  
    Ready,  
    Pending,  
    Installable,  
    Unavailable  
}  
```  
  
<a id="constantsSection"></a>
  
## Constants
  
| Constant | Description |  
| --- | --- |  
| Ready | The chunk is already installed and can be read. |  
| Pending | The chunk is not installed yet but will be. |  
| Installable | The chunk will not be installed but can be downloaded. |  
| Unavailable | The chunk can't be downloaded. |  
  
<a id="remarksSection"></a>
  
## Remarks
  
This enumeration determines the status and availability of the XPackage API installation files. Packages contain all the files that make up a game. Files can be grouped into logical units called chunks. A chunk has a numeric ID and can also have zero or more textual attributes like a language or a user-defined tag. Many XPackage APIs operate on groups of chunks.  
  
For information about the packaging technology used with Xbox One titles, see [Overview of Packaging](../../../../packaging/overviews/packaging.md). For information about the steps to create an XVC package, see [Getting started packaging titles for Xbox consoles](../../../../packaging/overviews/packaging-getting-started-for-console.md).  
  
<a id="requirementsSection"></a>
  
## Requirements
  
**Header:** XPackage.h  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
<a id="seealsoSection"></a>
  
## See also
  
[Streaming Installation and Intelligent Delivery](../../../../packaging/overviews/streaming_install-intelligent_delivery.md)  
[XPackage](../xpackage_members.md)  
  