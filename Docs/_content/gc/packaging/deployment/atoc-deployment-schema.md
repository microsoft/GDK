---
author: M-Stahl
title: Schema introduction
description: >-
  The mapping file used as input for the makepkg tool has five allowed elements that describe the contents of a package: Package, Chunk, File, Recipe, and Feature. These elements describe the overall package, individual streamable segments of a package (chunks), and the files in each of those chunks.  Features allow groups
  of chunks that users can choose to have installed or remove, and Recipes allow the set of Features enabled for a given installation to be tied to entitlements owned by the user or a home console for the user.
kindex:
- Deployment Package Schema
- mapping file
ms.author: scotmi
ms.topic: conceptual
edited: 10/30/2019
security: public
---

# Deployment package schema


The mapping file used as input for the makepkg tool has five allowed elements that describe the contents of a package: Package, Chunk, File, Recipe, and Feature. These elements describe the overall package, individual streamable segments of a package (chunks), and the files in each of those chunks.  Features allow groups of chunks that users can choose to have installed or remove, and Recipes allow the set of Features enabled for a given installation to be tied to entitlements owned by the user or a home console for the user.

A small mapping file could look something like the following code example.  

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
</Package>  
```

The MicrosoftGame.config and all files it references (e.g. Logo, Splash Screen, etc.) should be included in a File Group when generating your package. The GameOs.xvd should not be included in your mapping file as it is automatically embedded in your package during package generation.

<a id="ID4E2"></a>



## Intelligent Delivery examples  


The following mapping file demonstrates how to use Intelligent Delivery to control which chunks are installed by the system, and defines *Features* which the user can choose to enable or disable at install time and later from within the shell. Each chunk can have a *specifier* so that chunks can be selectively delivered based on the device type and language settings of the console.  Any package which uses *Features* must also specify a default *Recipe*, and can optionally specify additional Recipes.

```xml
<Package>
    <!-- Features bring down Chunks with the associated Tags.
         Users can override install defaults to deselect features they don't want,
         and can add/remove features from within the shell after install as well. -->
    <Features>
        <Feature Id="CampaignFeature" DisplayName="MyGame Campaign Name" Image="CampaignLogo.png" Tags="CampaignTag" />
        <Feature Id="MultiPlayerFeature" DisplayName="MyGame Multiplayer Name" Image="MPLogo.png" Tags="MPTag" />
        <Feature Id="PremiumFeature" Image="PremiumLogo.png" Tags="PremiumTag" />
    </Features>
    <!-- Recipes declare which Features are included for a given install.
         Recipes are additive, and persist for the life of an install,
         They are never removed, though users can choose to add/remove individual Features -->
    <Recipes>
        <!-- default Recipe is always active -->
        <Recipe Id="default" IncludedFeatures="CampaignFeature;MPFeature"/>
        <!-- PremiumProduct Recipe is active, causing PremiumFeature to be installed if user owns 9PXXXXXXXXXX -->
        <Recipe Id="PremiumProduct" IncludedFeatures="PremiumFeature">
            <StoreId>9PXXXXXXXXXX</StoreId>
        </Recipe>
    </Recipes>
    <Chunk Id="1000" Marker="Launch">
        <FileGroup DestinationPath="\" SourcePath="X:\bin" Include="*.*"/>
        <FileGroup DestinationPath="\Maps" SourcePath=".\Maps" Include="map.idx"/>
    </Chunk>
    <Chunk Id="2000">
        <FileGroup DestinationPath="\Maps" SourcePath=".\Maps" Include="*.map"/>
    </Chunk>
    <Chunk Id="3000">
        <FileGroup DestinationPath="\Maps" SourcePath="Z:\Extras" Include="*.map"/>
        <FileGroup DestinationPath="\Pics" SourcePath=".\Images" Include="*.png"/>
        <FileGroup DestinationPath="\Pics" SourcePath="Z:\Extras" Include="*.png"/>
    </Chunk>
    <!--Chunk 4000 will be installed if the best language fit for the console language is French-->
    <!--Make sure that any language specifiers used here are also in your MicrosoftGame.config-->
    <Chunk Id="4000" Languages="fr">
        <FileGroup DestinationPath="\Localized\Fr" SourcePath="Z:\Localized\fr" Include="*.dat"/>
    </Chunk>
    <!--Chunk 5000 will be installed on Anaconda consoles-->
    <Chunk Id="5000" Devices="Xbox-Anaconda">
        <FileGroup DestinationPath="\Anaconda" SourcePath="Z:\Anaconda" Include="*.dat"/>
    </Chunk>
    <!--Chunk 6000 contains the Campaign mode content-->
    <Chunk Id="6000" Tags="CampaignTag">
        <FileGroup DestinationPath="\Campaign" SourcePath="Z:\Campaign" Include="*.dat"/>
    </Chunk>
    <!--Chunk 6100 contains the Campaign mode content specific to French language-->
    <Chunk Id="6100" Tags="CampaignTag" Languages="fr">
        <FileGroup DestinationPath="\Campaign\fr" SourcePath="Z:\Campaign\fr" Include="*.dat"/>
    </Chunk>
    <!--Chunk 6200 contains the Campaign mode content specific to English language-->
    <Chunk Id="6200" Tags="CampaignTag" Languages="en">
        <FileGroup DestinationPath="\Campaign\en" SourcePath="Z:\Campaign\en" Include="*.dat"/>
    </Chunk>
    <!--Chunk 7000 contains the Multiplayer mode content-->
    <Chunk Id="7000" Tags="MPTag">
        <FileGroup DestinationPath="\Multiplayer" SourcePath="Z:\Multiplayer" Include="*.dat"/>
    </Chunk>
    <!--Chunk 7100 contains the Multiplayer mode content specific to French language-->
    <Chunk Id="7100" Tags="MPTag" Languages="fr">
        <FileGroup DestinationPath="\Multiplayer\fr" SourcePath="Z:\Multiplayer\fr" Include="*.dat"/>
    </Chunk>
    <!--Chunk 7200 contains the Multiplayer mode content specific to English language-->
    <Chunk Id="7200" Tags="MPTag" Languages="en">
        <FileGroup DestinationPath="\Multiplayer\en" SourcePath="Z:\Multiplayer\en" Include="*.dat"/>
    </Chunk>
    <!--Chunk 8000 contains the premium content which is triggered for download by the PremiumProduct
        Recipe if user owns ProductID 9PXXXXXXXXXX-->
    <Chunk Id="8000" Tags="PremiumTag">
        <FileGroup DestinationPath="\Premium" SourcePath="Z:\premium" Include="*.dat"/>
    </Chunk>
</Package>
```

<a id="ID4EXE"></a>



## In this section  

[Chunk](deployment-element-chunk.md)  
Describes a collection of files that should be installed as a group.


[FileGroup](deployment-element-filegroup.md)  
Describes a rule by which files will be added to a *chunk*.


[Package](deployment-element-package.md)  
Describes a collection of chunks that make up a complete installation of a title.

<a id="ID4EDF"></a>



## See also  
 [Make package (makepkg.exe)](makepkg.md)