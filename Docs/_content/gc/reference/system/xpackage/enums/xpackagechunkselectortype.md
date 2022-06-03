---
author: M-Stahl
title: XPackageChunkSelectorType
description: Indicates the selector type.
kindex: XPackageChunkSelectorType
ms.author: brianpe
ms.topic: reference
edited: 07/08/2020
security: public
applies-to: pc-gdk
---

# XPackageChunkSelectorType
  
Indicates the selector type.  
  
<a id="syntaxSection"></a>
  
## Syntax
  
```cpp
enum class XPackageChunkSelectorType  : uint32_t  
{  
    Language,  
    Tag,  
    Chunk,  
    Feature  
}  
```  
  
<a id="constantsSection"></a>
  
## Constants
  
| Constant | Description |  
| --- | --- |  
| Language | Enumerate language attributes. |  
| Tag | Enumerate tag attributes. |  
| Chunk | Enumerate chunks. |  
| Feature | Enumerate features. |  
  
<a id="remarksSection"></a>
  
## Remarks
  
This enumeration uses selector types for language and tag attributes. It also uses the chunk constant to enumerate installation chunks. Packages contain all the files that make up a game. Files can be grouped into logical units called chunks. A chunk has a numeric ID and can also have zero or more textual attributes like a language or a user-defined tag. Many XPackage APIs operate on groups of chunks.  
  
For information about the packaging technology used with Xbox One titles, see [Overview of Packaging](../../../../packaging/overviews/packaging.md). For information about the steps to create an XVC package, see [Getting started packaging titles for Xbox consoles](../../../../packaging/overviews/packaging-getting-started-for-console.md).  
  
<a id="requirementsSection"></a>
  
## Requirements
  
**Header:** XPackage.h  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
<a id="seealsoSection"></a>
  
## See also
  
[Streaming Installation and Intelligent Delivery](../../../../packaging/overviews/streaming_install-intelligent_delivery.md)  
[XPackage](../xpackage_members.md)  
  