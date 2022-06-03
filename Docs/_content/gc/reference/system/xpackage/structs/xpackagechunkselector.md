---
author: M-Stahl
title: XPackageChunkSelector
description: Defines the criteria for selecting a set of chunks.
kindex: XPackageChunkSelector
ms.author: brianpe
ms.topic: reference
edited: 07/02/2019
security: public
applies-to: pc-gdk
---

# XPackageChunkSelector
  
 Defines the criteria for selecting a set of chunks.  
  
<a id="syntaxSection"></a>
  
## Syntax
  
```cpp
typedef struct XPackageChunkSelector {  
    XPackageChunkSelectorType type;  
    union  
    {  
        const char* language;  
        const char* tag;  
        const char* feature;  
        uint32_t chunkId;  
    };  
} XPackageChunkSelector  
```
  
<a id="membersSection"></a>
  
### Members
  
*type*  
Type: [XPackageChunkSelectorType](../enums/xpackagechunkselectortype.md)  
  
The selector's type.  
  
*language*  
Type: const char\*  
  
The language attribute to match, such as "en-US" English (United States) or "fr-FR" French (France).  
  
*tag*  
Type: const char\*  
  
A tag attribute to match, such as *BigMap* or *SmallMap*.  
  
*feature*  
Type: const char\*  
  
The feature to match, such as "BigMaps".  
  
*chunkId*  
Type: uint32_t  
  
The chunk number to match.  
  
<a id="remarksSection"></a>
  
## Remarks
  
An array of `XPackageChunkSelector` objects is used to select a set of chunks for many operations in the installation API. This section describes the rules used to transform an array of `XPackageChunkSelector` objects into a set of chunk IDs. Each `XPackageChunkSelector` has a selector type and a selector value. A chunk is included if all chunk specifiers defined on the chunk match all installation selectors.  
  
Packages contain all the files that make up a game. Files can be grouped into logical units called chunks. A chunk has a numeric ID, and it can also have zero or more textual attributes like a language or a user-defined tag. Many XPackage APIs operate on groups of chunks. These APIs use an array of `XPackageChunkSelectors` to describe which chunks the API will use. This section describes the rules used to transform an array of `XPackageChunkSelector` objects into an array of chunk IDs. Each `XPackageChunkSelector` has a selector type and a selector value. A chunk is included if all attributes defined on the chunk match all chunk selectors.  
  
In the following table, the chunk selector array has two selectors: language and a tag.  
  
| Selector type | Selector value |  
| ------------- | -------------- |  
| Language | en-US |  
| Tag | BigMap |  
  
The following table is an example of defining a set of chunks with various attributes.  
  
| Chunk | Language | Tag |  
| ----- | -------- | --- |  
| 1 | en-US | (none) |  
| 2 | en-US; fr-FR | (none) |  
| 3 | fr-FR | (none) |  
| 4 | fr-FR | BigMap |  
| 5 | fr-FR; en-US | BigMap; SmallMap |  
| 6 | en-US | SmallMap |  
  
Referring to the preceding table, chunks selected by the chunk selector array use chunk attributes 1, 2, and 5. Chunks that are not selected by the chunk selector use chunk attributes 3, 4, and 6.  
  
To give this chunk array example some perspective:  
  
* A chunk selector type is matched with a chunk attribute only if that specifier is defined on the chunk. Chunks 1 – 3 have no tag defined, so the chunk selector with a type of tag is ignored for these chunks.  
* A chunk can define more than one value for an attribute by separating multiple values with semicolons. Only one value needs to match.  
* If any chunk selector type is rejected, the chunk is rejected no matter how many other selectors matched. Chunk 6 is rejected because SmallMap does not match BigMap, yet the language matches.  
  
A chunk selector value can contain multiple values separated by semicolons, just like a chunk can in its layout file. Also, it is legal to define an array with the same chunk selector type more than once.  
  
These are equivalent as shown in the following code example:  
  
```cpp  
XPackageChunkSelector selectors1[] =  
{
    { XPackageChunkSelectorType::Language, "en-US" },
    { XPackageChunkSelectorType::Language, "fr-FR" }
};
  
XPackageChunkSelector selectors2[] =  
{ 
    { XPackageChunkSelectorType::Language, "en-US;fr-FR" },
};
```  
  
The platform may further filter the set of regions that match. For example, you can add a `Devices` attribute to a chunk to make it available only on a particular set of consoles. Chunks you select will be included only if they also match system attributes. If you want to install German but your package has a German chunk available only on Xbox One X consoles, the installation monitor will not include this chunk in its monitoring on an Xbox One console. If it did, the installation for German would not complete.  
  
For information about the packaging technology used with Xbox One titles, see [Overview of Packaging](../../../../packaging/overviews/packaging.md). For information about the steps to create an XVC package, see [Getting started packaging titles for Xbox consoles](../../../../packaging/overviews/packaging-getting-started-for-console.md).  
  
<a id="requirementsSection"></a>
  
## Requirements  
  
**Header:** XPackage.h  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
<a id="seealsoSection"></a>
  
## See also  
  
[Streaming Installation and Intelligent Delivery](../../../../packaging/overviews/streaming_install-intelligent_delivery.md)  
[XPackage](../xpackage_members.md)  
  