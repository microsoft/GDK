---
author: M-Stahl
title: "<Package> element"
description: Specifies a <emphasis>package</emphasis>, which is a collection of chunks that make up a complete installation of a title.
kindex: Package element
ms.author: scotmi
ms.topic: reference
edited: 07/30/2020
security: public
quality: good
---

# &lt;Package> element

Specifies a *package*, which is a collection of chunks that make up a complete installation of a title. 
<a id="syntaxSection"></a>

   

## Syntax  
   
```xml
<Package >
</Package>  
```
   
<a id="remarks"></a>

   

## Remarks  
   
  
The source paths that are specified in the `FileGroup` element aren't recursive. Every directory to be included must be specified in its own `FileGroup` element.  
  
<a id="ID4E5"></a>

   

## Information on elements

| Relationship | Element name | 
| --- | --- | 
| Parent element | None |
| Child element | [Chunk](deployment-element-chunk.md)| 

 
<a id="ID4EKB"></a>

   

## Example  



```xml
<Package>
  <Chunk Id="1000" Marker="Launch">
    <FileGroup DestinationPath="\" SourcePath="X:\bin" Include="*.*"/>
  </Chunk>
  <Chunk Id="1001">
    <FileGroup DestinationPath="\Data\Maps" SourcePath="Y:\Maps\Level1" Include="*.map"/>
    <FileGroup DestinationPath="\Data\Maps" SourcePath="Y:\Maps\Level2" Include="*.map"/>
    <FileGroup DestinationPath="\Data\Maps" SourcePath="Y:\Maps\Level3" Include="*.map"/>
    <FileGroup DestinationPath="\Data\Maps" SourcePath="W:\ExtraMaps" Include="*.map"/>
    <FileGroup DestinationPath="\Data\Textures" SourcePath="M:\MapTextures" Include="*.png"/>
    <FileGroup DestinationPath="\Data\Textures" SourcePath="W:\ExtraMapTextures" Include="*.png"/>
  </Chunk>
  <Chunk Id="1073741823">
    <FileGroup DestinationPath="\" SourcePath=".\" Include="Update.AlignmentChunk"/>
  </Chunk>
</Package>  
```
  
## See also  
  
[Deployment package schema](atoc-deployment-schema.md)  
  