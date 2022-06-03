---
author: jgup
title: Intelligent Delivery features and recipes
description: Describes how to use Intelligent Delivery features and recipes to represent groups of content that are individually addable and removable by using APIs within your game.
kindex: Intelligent Delivery- Features and Recipes
ms.author: jgup
ms.topic: conceptual
edited: 11/25/2020
security: public
---

# Intelligent Delivery features and recipes
   
This topic describes how to use features and recipes for improving a user’s initial and subsequent installation times for your game. Features and recipes work together to define groups of content within your base game that users can add and remove during initial installation, as well as from within the shell later. You can also use runtime APIs to dynamically query the installation state of features and trigger the addition and removal of features.

A feature is an XML element that specifies a developer-facing ID string attribute. It also specifies the user-facing localizable display name and image for display in the shell. The feature specifies one or more tags. At installation and update time, the system finds all the tags that are referenced by the installed features, and it installs all chunks that contain those tags.

A recipe is an XML element that specifies a list of features that should be installed. There’s always a default recipe, and the features that the recipe includes are always installed. Additional recipes can be defined. They’re activated at installation time, if the user or current console has an entitlement to any of the `StoreIds` specified, as shown in the following code.

```xml
<Recipes>
    <!-- A recipe is always active if it has no child StoreId elements—the name "default" is a convention. -->
    <Recipe Id="default" IncludedFeatures="CampaignFeature;MultiPlayerFeature"/>

    <!-- This recipe is active by default, but only on Xbox Series X hardware.  -->
    <Recipe Id="default-anaconda" IncludedFeatures="HDFeature" Devices="Xbox-Anaconda"/>

    <!-- PremiumProduct recipe is active, which means PremiumFeature installs if user owns 9PXXXXXXXXXX. -->
    <Recipe Id="PremiumProduct" IncludedFeatures="PremiumFeature">
        <StoreId>9PXXXXXXXXXX</StoreId>
    </Recipe>
</Recipes>
<Features>
    <Feature Id="CampaignFeature" DisplayName="ms-resource:CampaignFeatureName" Image="campaignlogo.png" Tags="Campaign1;Campaign2"/>
    <Feature Id="MultiPlayerFeature" DisplayName="ms-resource:MultiPlayerFeatureName" Image="MPlogo.png" Tags="Multiplayer1;Multiplayer2" />
    <Feature Id="HDFeature" DisplayName="ms-resource:HDTexturesFeatureName" Image="HDlogo.png" Tags="hd"/>
    <Feature Id="PremiumFeature" DisplayName="ms-resource:PremiumFeatureName" Image="Premiumlogo.png" Tags="extras"/>
</Features>


<Chunk Id="8000" Tags="Campaign1">
<Chunk Id="8001" Tags="Campaign2">
<!-- This chunk uses the # character, so it’s only installed if both the Campaign and HD features are active. -->
<Chunk Id="8001" Tags="Campaign1#hd"> 

<Chunk Id="9000" Tags="Multiplayer1">
<!-- This chunk uses the # character, so it’s only installed if both the Multiplayer and HD features are active. -->
<Chunk Id="9001" Tags="Multiplayer1#hd"> 

<!-- This chunk is installed if either the Multiplayer or SinglePlayer features are active. -->
<Chunk Id="10000" Tags="Multiplayer1;Campaign1">
<!-- This chunk is installed if either the (Multiplayer feature and HD feature) or (SinglePlayer feature and HD feature) are active. -->
<Chunk Id="10001" Tags="Multiplayer1#hd;Campaign1#hd">

<Chunk Id="11000" Tags="extras">
<!-- This chunk uses the # character, so it’s only installed if both the Premium and HD features are active. -->
<Chunk Id="11001" Tags="extras#hd"> 
```
> [!NOTE]
> Features can contain more than one tag attribute, separated by semicolons. A chunk is included for installation if any of the tags in the chunk are included by an active feature. The `#` symbol installs a tag if the tags on both side of the `#` are active.

## Localizing feature display names

The localization of `DisplayNames` is done the same way as localization of name attributes within the *MicrosoftGame.config* file. This is done by using the `ms-resource:name` format, along with the *.resw* files that are in the strings directory of your game, and the per-locale strings in appropriately named subdirectories. For more information, see [MicrosoftGame.Config Localization](../system/overviews/microsoft-game-config/MicrosoftGameConfig-Localization.md)
> [!NOTE]
> The localized string values and images that are used with MicrosoftGame.config and Intelligent Delivery aren’t encrypted within published packages, neither in developer sandboxes nor retail. Use placeholder values in your game for the title, icons, and any sensitive content. Sensitive content includes any content that’s referenced by Intelligent Delivery during development, prior to public disclosure of your title, or specific content that’s found within your title.

## Hidden features

Features are marked hidden, which prevents users from deciding whether they’re shown as selectable options at the time of installation, or when managing the shell after your title is installed. Take care when using Hidden features, because the only way to add or remove them is by using APIs within your title. Any bugs uncovered in your title could result in inaccessible content until you provide a content update to fix those bugs. The following code is an example of a feature marked as hidden.

```xml
  <Feature Id="HiddenFeature" Hidden="true" Tags="HiddenFeature1" />
```

## Checking feature installation status
   
  
You can use features to check for the presence of all chunks with tags that are specified by that feature. When performing these runtime queries, the Device and Language specifiers are taken into consideration. If you have device or language-specific content within your feature, it will still return as `true` so long as one language, and all chunks applicable to the current device within that feature, are installed.
  
For example, if the Campaign Feature's assets are contained in chunks 8000, 8001, and 8002, instead of calling the [XPackageFindChunkAvailability](../reference/system/xpackage/functions/xpackagefindchunkavailability.md) method to determine whether that set of chunks is fully installed and playable, you can tag all three chunks with the custom tag "campaign1", and reference "campaign1" in your Campaign Feature. You can then call the [XPackageFindChunkAvailability](../reference/system/xpackage/functions/xpackagefindchunkavailability.md) method by using the [XPackageChunkSelector](../reference/system/xpackage/structs/xpackagechunkselector.md) with the Campaign Feature ID to easily get the installation status of that set of data. 
  
<a id="ID4EHB"></a>

## See also  
[Intelligent Delivery introduction](overviews/intelligentdelivery.md)     
[XPackageChunkSelector](../reference/system/xpackage/structs/xpackagechunkselector.md)     
[XPackageInstallChunks](../reference/system/xpackage/functions/xpackageinstallchunks.md)     
[MicrosoftGame.Config localization](../system/overviews/microsoft-game-config/MicrosoftGameConfig-Localization.md)  