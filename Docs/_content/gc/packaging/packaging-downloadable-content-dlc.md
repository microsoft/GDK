---
author: M-Stahl
title: GDK downloadable content (DLC) packages
description: Describes how to create downloadable content (DLC) packages for GDK titles.
kindex: Downloadable content DLC
ms.author: brianhud
ms.topic: conceptual
edited: '08/02/2019'
security: public
---

# Microsoft Game Development Kit downloadable content (DLC) packages

Downloadable content (DLC) packages for the GDK are packages that are separate from your main game. DLC packages are sold and downloaded independently from the rest of your game, or as part of purchase bundles.

The process of creating, publishing, and consuming DLC packages is conceptually the same as it was for Xbox One console titles, but some of the packaging file formats and runtime APIs have been updated and are easier to use.

DLC packages are supported on PCs by using the same packaging structure, and are accessed with the same runtime APIs on both console and PC.

With Xbox Series X&#124;S and Xbox One consoles, a DLC package stub file can be generated and used for both platforms. If the DLC package contains real content differences, please use the TargetDeviceFamilyForDLC element to generate platform-specific DLC packages.

## Set up your main package identity

1. Look up the Store ID (12 character alphanumeric string) of your main application package in the **Game Setup** page for your main game product. (Example: 9PNX12345AAA)

2. Add the StoreId element to your main package's MicrosoftGame.config file.

```xml
<?xml version="1.0" encoding="utf-8"?>
<Game configVersion="1">
    <!-- Content omitted for brevity. -->
    <StoreId>**REPLACE WITH STOREID**</StoreId>
</Game>
```

## Create a DLC package

1. Create your DLC package add-on within Partner Center from the **Add-Ons** menu under your main product.

2. Place all your DLC package content into a single directory.

3. Create a MicrosoftGame.config file in the same directory as your DLC package content by using the sample data as follows.

4. Specify the **Target Device Family** that this DLC package is being created for in the TargetDeviceFamilyForDLC field. Allowed values are Xbox One, Xbox Series X&#124;S or PC. It is required to be specified for XboxOne and Xbox Series X&#124;S, and is optional on PC as long as the /pc flag is used when generating the DLC .MSIXVC file using makepkg.exe.

5. Look up the **Package/Identity/Name** field of your main application package in the **Game Setup** page of Partner Center, and then put the Identity Name in the MainPackageDependency field. For example, MyPackageName

6. Look up the Store ID (12-character alphanumeric string) of your Add-on/DLC package from Partner Center, and then place it in the StoreId field as follows.

7. Look up the Store ID (12-character alphanumeric string) of your main application package in the **Game Setup** page for your main game product. Place it into the AllowedProductId field as follows. For example, 9PNX12345AAA

```xml
<?xml version="1.0" encoding="utf-8"?>
<Game configVersion="1">
    <Identity Name="**REPLACE**"
        Publisher="**REPLACE**"
        Version="1.0.0.0"/>
    <ShellVisuals DefaultDisplayName="**REPLACE**"
                  PublisherDisplayName="**REPLACE**"
                  StoreLogo="Storelogo.png"
                  Square150x150Logo="Logo.png"
                  Square44x44Logo="SmallLog.png"
                  Description="**REPLACE**"
                  BackgroundColor="#000040"
                  SplashScreenImage="SplashScreen.png"/>
    <StoreId>**REPLACE WITH STOREID OF ADD-ON / DLC**</StoreId>
    <TargetDeviceFamilyForDLC>**REPLACE**</TargetDeviceFamilyForDLC>
    <AllowedProducts>
      <AllowedProduct>**REPLACE WITH STOREID OF BASE GAME**</AllowedProduct>
    </AllowedProducts>

<!-- The Desktop Registration section is for PC only. -->
    <DesktopRegistration>
      <MainPackageDependency Name="**REPLACE_WITH_IDENTITY_OF_PARENT_PRODUCT**" />
      <ProcessorArchitecture>x64</ProcessorArchitecture>
    </DesktopRegistration>
</Game>
```

8. Open a Microsoft Game Development Kit (GDK) command prompt in the folder that contains a single folder with all your game content, and then run the following command:<br/>
`MakePkg genmap /f layout.xml /d <Your_dlc_folder>`

9. If you're creating DLC for PC, use the following command:<br/>
`MakePkg pack /f layout.xml /lt /d <Your_dlc_folder_name> /pc /pd <Output_Folder_Name>`

10. If you're creating DLC for console, use the following command:<br/>
`MakePkg pack /f layout.xml /lt /d <Your_dlc_folder_name> /pd <Output_Folder_Name>`

In previous SDKs, you  would pass the Product ID GUID of your main game on the command line with the /ProductID flag.
With the MicrosoftGame.Config model of configuring your DLC package relationships, you should no longer use the */ProductID* parameter. MakePkg automatically places the appropriate information into your package based on the StoreIDs listed in your MicrosoftGame.config file.

## Accessing DLC packages at runtime from your game  

The basic steps to consume content within a DLC package are:

1. [Enumerate the packages](../reference/system/xpackage/functions/xpackageenumeratepackages.md)
2. [Check for a valid user license for the target package](../commerce/fundamentals/xstore-manage-and-license-optional-packages.md)
3. Take the packageIdentifier from the enumeration results and pass it to the [XPackageMount](../reference/system/xpackage/functions/xpackagemount.md) API.

On Xbox Series X&#124;S consoles, you can only consume DLC packages with a Xbox Series X&#124;S TargetDeviceFamilyForDLC unless you specify XboxOne for the DlcCompatibility field in your MicrosoftGame.config:

```xml
    <VirtualMachine>
        <DlcCompatibility>XboxOne</DlcCompatibility>
    </VirtualMachine>
```

Xbox Series X&#124;S DLC can be installed only on fast storage while Xbox One DLC has no such restriction, so ensure you take this in to account before opting your game in.

## Deploying and testing a DLC package  

Ensure you install your main game package prior to installing your DLC package.

For Xbox console, install your DLC package with the following command:
`xbapp install <Your_DLC_Package.xvc>`

For PC, install your DLC package with the following command:
`wdapp install <Your_DLC_Package.msixvc>`

DLC content can also be registered from a directory with loose files, and testing can also be done with packages downloaded from the Store.

More details are described in the article [Manage and license downloadable content](../commerce/fundamentals/xstore-manage-and-license-optional-packages.md).