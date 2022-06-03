---
author: M-Stahl
title: Intelligent Delivery introduction
description: Describes how to use Intelligent Delivery to install only a subset of content.
kindex: Intelligent Delivery
ms.author: brianhud
ms.topic: conceptual
edited: '08/05/2019'
security: public
---

# Intelligent Delivery
   

Intelligent Delivery is a set of features whose purpose is to reduce the size of game installs on customer devices.  This is accomplished by segmenting content into different logical chunks and applying specifiers to those chunks to set up rules for when those chunks will be installed.

With the Microsoft Game Development Kit (GDK), Intelligent Delivery has been updated to allow developer defined Features, which represent groupings of content that end users can select, either at install time, or after a game has been installed, from within the Shell.
   
When creating packages, you use Features and specifiers to annotate chunks in the package layout xml file. 

The [Deployment Schema](../deployment/atoc-deployment-schema.md) topic contains examples for using Intelligent Delivery to define Chunks with specifiers and Features which control their installation.

Intelligent delivery offers the following capabilities to group content and control when it is installed. 

* [Features & Recipes](../intelligentdelivery-features-recipes.md)<br/>
  Features represent independently addable and removable functionality within a base game.  For example, a game can make its campaign and multiplayer functionality independently addable and removable to allow users to recover space for Features they don't want. A Recipe is a list of Features to be installed.

* [Device specifiers](../intelligentdelivery-device.md)<br/>
  Declares the types of devices to which the content in a specific chunk applies.

* [Language specifiers](../intelligentdelivery-language.md)<br/>
  Declares the language to which the content in a chunk applies.

* [Custom tags](../intelligentdelivery-custom.md)<br/>
  Allows you to mark groups of chunks as related, which simplifies checking whether the chunks needed to run a title are all present on the user's system.

* [OnDemand content](../intelligentdelivery-ondemand.md)<br/>
  Allows titles to designate content that isn't installed by default but can be installed at the request of the user or title.  The use of the OnDemand specifier is no longer recommended, see note below.
> [!NOTE]
> ContentType specifiers as well as OnDemand tags have been deprecated in favor of Features, which provide a richer ability to group content which users can add and remove as logical units within your base game package.
> [!IMPORTANT]
> Because intelligent delivery data such as Features, Recipes, and custom tags can be used as part of installation calculations, this data isn't encrypted within the XVC. Sensitive data shouldn't be used for specifier names, because it could be gleaned from a package file that's stored on a content delivery network (CDN)—even during prerelease timeframes.

<a id="ID4EWB"></a>

## In this section  

### Intelligent Delivery Overviews

[Intelligent Delivery: Features and Recipes](../intelligentdelivery-custom.md)  
Describes how to use Intelligent Delivery Features allow end users to choose which parts of your game to install.  

[Intelligent Delivery: Custom tag specifiers](../intelligentdelivery-custom.md)  
Describes how to use Intelligent Delivery to support multi-disc and other complex installation scenarios.  

[Intelligent Delivery: devices specifiers](../intelligentdelivery-device.md)  
Describes how to use Intelligent Delivery to specify the devices on which a chunk is to be installed.  
  
[Intelligent Delivery: language specifiers](../intelligentdelivery-language.md)  
Describes how to use Intelligent Delivery to specify the language-specific assets to be installed on a console.  
  
[Intelligent Delivery: OnDemand content](../intelligentdelivery-ondemand.md)  
Describes how to use Intelligent Delivery to designate content that isn't installed by default but can be installed at the request of the user or title.  

### Intelligent Delivery implementation

[Dynamic chunk reordering](../packaging-chunkreordering.md)  
Describes how to change the order in which chunks are installed after the chunks required for the game to run have finished installing.  

[Streaming installation: debugging](../packaging-debugging.md)  
Describes how to connect a debugger to your installation process.  

[Streaming installation: status](../packaging-installstatus.md)  
Describes how to check the status of chunks associated with certain aspects of gameplay to see if they have been installed.

[Multi-disc functionality](../packaging-multi-disc.md)  
Describes how to package your title so that it can be stored on more than one disc.  