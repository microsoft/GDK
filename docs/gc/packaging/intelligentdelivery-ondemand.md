---
author: M-Stahl
title: 'Intelligent Delivery: OnDemand content'
description: Describes how to use Intelligent Delivery to designate content that isn't installed by default but can be installed at the request of either the user or the title.
kindex: Intelligent Delivery- OnDemand content
ms.author: brianhud
ms.topic: conceptual
edited: '08/05/2019'
security: public
---

# Intelligent Delivery: OnDemand content
> [!NOTE]
> Use of the OnDemand attribute is no longer recommended.  Instead, you should consider using Features and Recipes to group content into independent addable and removable groups.  Features and Recipes still allow you to specify what content installs by default, just like the OnDemand attribute.

OnDemand chunks allow titles to designate content that's not installed by default but can be installed at the user's request or when the title calls the [XPackageInstallChunks](../reference/system/xpackage/functions/xpackageinstallchunks.md) method.

 
To specify a chunk as OnDemand, apply the `OnDemand` attribute to a chunk in your layout.xml file as shown in the following example.
   
```xml
<Chunk Id="6000" Tags="LevelEditor" OnDemand="true">  
```

Chunks which include the `OnDemand` attribute must also include custom tag specifiers so that runtime APIs can reference the associated chunk by tag.

Titles can uninstall OnDemand content by calling the [XPackageUninstallChunks](../reference/system/xpackage/functions/xpackageuninstallchunks.md) method.


<a id="ID4EKB"></a>

   

## See also  
 [Intelligent Delivery](overviews/intelligentdelivery.md)