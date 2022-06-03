---
author: M-Stahl
title: "<Chunk> element"
description: Defines a <emphasis>chunk</emphasis>, which is a collection of files that should be installed as a group.
kindex: Chunk element
ms.author: scotmi
ms.topic: reference
edited: 07/30/2020
security: public
quality: good
---

# &lt;Chunk> element

Defines a *chunk*, which is a collection of files that should be installed as a group.
<a id="syntaxSection"></a>



## Syntax  

```xml
<Chunk
  Marker = string
  Id = string 
  Devices = string
  Languages = string
  Tags = string>
</Chunk>  
```

<a id="ID4ET"></a>



### Attributes  

#### Marker  

Indicates that all chunks up to and including this chunk in the layout XML file are required before the title can launch. The only accepted value for the `Marker` attribute is "Launch". Note that all chunks that occur before the marked chunk in the manifest are required for launch, regardless of their IDs.


#### Id  

Required. The identifier for a chunk. A title can use this ID to query for the status of installation and to modify the order of installation at runtime.


#### Devices  

Declares the types of devices to which the content in a specific chunk applies.


#### Languages  

Declares the language to which the content in a chunk applies.


#### Tags  

Allows you to mark groups of chunks as related. This simplifies checking whether the chunks that are needed to run a title are all present on the user's system. This attribute is also used to group chunks into Features.


The order of chunks in the final image follows the order of all chunks in the layout xml document, top to bottom. Consequently, this is also the default order of installation.

<a id="remarks"></a>



## Remarks  


[MakePkg.exe](makepkg.md) scans for certain files in your package and moves them to a special *registration* chunk. Among these files are *MicrosoftGame.config*, any images referenced within *MicrosoftGame.config*, and *Resources.pri*, if present. You can manually lay out these files in the *layout.xml* file by specifying "Registration" in the `Id` attribute for the chunk that contains these files.  

<a id="ID4EXB"></a>



## Information on elements


| Relationship | Element name |
| --- | --- |
| Parent element | [Package](deployment-element-package.md)|
| Child element | [FileGroup](deployment-element-filegroup.md)|


<a id="ID4EIC"></a>



## Example  



```xml
<Chunk Id="1234" Marker="Launch" Languages="en" Devices="Anaconda" Tags="Campaign1">
  <FileGroup DestinationPath="\Campaign1\Anaconda\en" SourcePath="X:\Campaign1\Anaconda\en" Include="*.*"/>
</Chunk>  
```

## See also  
  
[Deployment package schema](atoc-deployment-schema.md)  
  