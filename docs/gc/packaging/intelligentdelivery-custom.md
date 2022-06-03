---
author: M-Stahl
title: 'Intelligent Delivery: Custom tag specifiers'
description: Describes how to use Intelligent Delivery to support multi-disc and other complex installation scenarios.
kindex: Intelligent Delivery- Custom tag specifiers
ms.author: brianhud
ms.topic: conceptual
edited: '08/05/2019'
security: public
---

# Intelligent Delivery: custom tag specifiers
   
  
Custom tag specifiers mark groups of chunks as related.  The primary use for custom tags is to group chunks for inclusion into [Features](intelligentdelivery-features-recipes.md).
 
<a id="ID4EV"></a>

```xml
<Chunk Id="7000" Tags="LevelEditor">  
```

## Grouping related chunks  
   
  
Use custom tag specifiers to mark groups of chunks as related. This simplifies the process of checking whether all the chunks needed to run a title are present on the user's console.   
   
  
For example, instead of trying to determine whether Level 1's assets are contained in chunks 1000, 1001, and 1002, and instead of calling the [XPackageFindChunkAvailability](../reference/system/xpackage/functions/xpackagefindchunkavailability.md) method to determine whether Level 1 is fully installed and ready to be played, you can tag all three chunks with the custom tag "Level 1". You can then call the [XPackageFindChunkAvailability](../reference/system/xpackage/functions/xpackagefindchunkavailability.md) method by using the [XPackageChunkSelector](../reference/system/xpackage/structs/xpackagechunkselector.md) to easily get the installation status of that set of data. 
  
<a id="ID4EHB"></a>


## Chunks which only install when multiple features are active  
   
  
You can express more than one custom tag specifier in a chunk, so that the chunk will only be installed if both of the tags present in Features which are enabled. This is accomplished by joining both tags together with the # symbol.     
  
Chunk 8000 will only be installed if there is an active feature including the campaign tag, as well as the hd tag.  If the user uninstalls the campaign Feature, or the HD Texture Feature, Chunk 8000 will be removed along with chunks which include the tags in the Feature which was removed.


```xml
<Features>
  <Feature Id="campaign_feature_id" DisplayName="Campaign" Tags="campaign"/>
  <Feature Id="hd_feature_id" DisplayName="HD Textures" Tags="hd"/>
</Features>

<Chunk Id="8000" Tags="campaign#hd">  <!-- This chunk is only installed if both the Campaign and HD Textures Features are active -->
<Chunk Id="8001" Tags="campaign">
<Chunk Id="8002" Tags="hd">
<Chunk Id="8003" Tags="campaign;hd">  <!-- This chunk is only installed if either the Campaign or the HD Textures Features are active -->
```


## Omitting content from packages for disc manufacturing  
   
  
You can use tag specifiers to specify that some content shouldn't be part of the on-disc package. For example, if your game takes up 65 GB of disc space, the optional content such as 20 GB of behind-the-scenes videos would be too large for a single BD50 Blu-ray Disc.   
   
  
Use custom tag specifiers to specify that certain content in a package isn't installed by default. You can designate a chunk as OnDemand, for example, so it would be installed only if the title requests it. For easy download of such an optional OnDemand chunk at runtime, it would also be marked with a custom tag specifier in the layout.xml file. Your title can request a download of the content from Xbox Live by setting the custom tag in the [XPackageChunkSelector](../reference/system/xpackage/structs/xpackagechunkselector.md) passed to the [XPackageInstallChunks](../reference/system/xpackage/functions/xpackageinstallchunks.md) API.   
  
<a id="ID4EYB"></a>

   

## Multi-disc titles  
   
  
For multi-disc publishing, use tag specifiers to designate which disc the content is placed on. For example, you can place all multiplayer content on disc 2 of a compilation disc. 

Alternatively, when you produce multi-disc SKUs for different regions, use this feature to place EFIGS on one Blu-ray Disc SKU and Japanese on another (for example, for mastering and duplication) by uploading and managing only a single MSIXVC image.   



  
<a id="ID4E6B"></a>

   

## See also  
 [Intelligent Delivery](overviews/intelligentdelivery.md) 