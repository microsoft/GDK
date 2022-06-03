---
author: M-Stahl
title: "<FileGroup> element"
description: Defines a rule by which files are added to a <emphasis>chunk</emphasis>, which is a collection of files that should be installed as a group.
kindex:
- FileGroup element
- alignment chunk, deployment package schema
- 1073741823, chunk ID
- chunk, 1073741823
- ID, chunk 1073741823
ms.author: scotmi
ms.topic: reference
edited: 07/30/2020
security: public
quality: good
---

# &lt;FileGroup> element
Defines a rule by which files are added to a *chunk*, which is a collection of files that should be installed as a group.
<a id="syntaxSection"></a>

   

## Syntax  
   
```xml
<FileGroup
  SourcePath = string
  DestinationPath = string
  Include = string />  
```
  
<a id="ID4E3"></a>

   

### Attributes  
  
#### SourcePath  

Required. The source of files against which the rule is run. The path is relative to the content directory that's passed in with the `/d` parameter to the [makepkg](makepkg.md) tool.
  
  
#### DestinationPath  

Required. The target destination where files that are matched by the rule are placed in the file system of the generated image. This attribute should specify only the directory name. It shouldn't include the file name.
  
  
#### Include  

Required. The rule for matching files under this source location. You can use a path that's relative to the source location, the standard "*" and "?" wildcards, and/or environment variables.
  
<a id="remarks"></a>

   

## Remarks  
   
  
This element isn't recursive. Every directory to be included must be specified by its own `FileGroup` element.  

<a id="ID4EXC"></a>

   

## Information on elements

| Relationship | Element name | 
| --- | --- | 
| Parent element| [Chunk](deployment-element-chunk.md)|
| Child element| None | 

 
<a id="ID4EDD"></a>

   

## Example  


   
```xml
<FileGroup DestinationPath="\Data\Maps" SourcePath="Y:\Maps\Level1" Include="*.map"/>
<FileGroup DestinationPath="\Data\Maps" SourcePath="Y:\Maps\Level2" Include="*.map"/>
<FileGroup DestinationPath="\Data\Maps" SourcePath="Y:\Maps\Level3" Include="*.map"/>  
```
  
## See also  
  
[Deployment package schema](atoc-deployment-schema.md)  
  