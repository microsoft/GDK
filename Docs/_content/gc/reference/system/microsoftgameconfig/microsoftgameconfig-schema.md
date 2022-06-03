---
author: M-Stahl
title: MicrosoftGame.config Reference
description: MicrosoftGame.config Reference
kindex:
- MicrosoftGame.config Reference
- MicrosoftGame.config, reference
- reference, MicrosoftGame.config
- config file, MicrosoftGame.config
- Registration Launch
- Game
- Identity
- GameOsVersion
- AdvancedUserModel
- MediaCapture
- GameDVRSystemComponent
- BlockBroadcast
- BlockGameDVR
- PersistentLocalStorage
- SizeMB
- RelatedProducts
- TitleId
- StoreId
- MSAAppId
- VirtualMachine
- XboxOneTitleMemoryMaxMB
- XboxOneXTitleMemoryMaxMB
- XboxAnacondaTitleMemory
- XboxOneXTitleMemory
- MSAFullTrust
- ExecutableList
- Executable
- IsDevOnly
- ShellVisuals
- Resources
- DevelopmentOnly
- DebugNetworkPortList
- DebugNetworkPort
- Resource
- XboxLockhartTitleMemoryMaxMB
- XboxAnacondaTitleMemoryMaxMB
- SMTEnabled
- RequiresEraShim
- ProcessorArchitecture
- MainPackageDependency
- DependencyList
- CustomInstallActions
- ModFolder
- DisableRegistryWriteVirtualization
- DisableFilesystemWriteVirtualization
- MultiplayerProtocol
- FileTypeAssociation
- KnownDependency
- Dependency
- InstallAction
- RepairAction
- UninstallAction
- Folder
- schema
- InstallActionList
- RepairActionList
- UninstallActionList
- AllowedProduct
- RelatedProduct
- GameDVRSystemComponent
- BlockBroadcast
- BlockGameDVR
- ExtendedAttribute
- ContentIdOverride
- EKBIDOverride
- FileType
- DisplayName
- Logo
- InfoTip
- EditFlags
- SupportedFileTypes
- MicrosoftGame.config Reference Executable#MGC-Executable
- MicrosoftGame.config Reference AdvancedUserModel#MGC-AdvancedUserModel
- MicrosoftGame.config Reference CustomInstaller#MGC-CustomInstaller
- MicrosoftGame.config Reference DevelopmentOnly#MGC-DevelopmentOnly
- MicrosoftGame.config Reference FileSystemVirtualization#MGC-FileSystemVirtualization
- MicrosoftGame.config Reference RegistryVirtualization#MGC-RegistryVirtualization
- MicrosoftGame.config Reference DlcCompat#MGC-DlcCompat
- MicrosoftGame.config Reference PackageRootWrites#MGC-PackageRootWrites
- MicrosoftGame.config Reference ShellVisuals#MGC-ShellVisuals
- MicrosoftGame.config Reference FileTypeAssociation#MGC-FileTypeAssociation
- MicrosoftGame.config Reference FrameworkDependency#MGC-FrameworkDependency
- MicrosoftGame.config Reference GameOsVersion#MGC-GameOsVersion
- MicrosoftGame.config Reference Identity#MGC-Identity
- MicrosoftGame.config Reference Languages#MGC-Languages
- MicrosoftGame.config Reference MediaCapture#MGC-MediaCapture
- MicrosoftGame.config Reference MemoryConfig#MGC-MemoryConfig
- MicrosoftGame.config Reference MultiplayerProtocol#MGC-MultiplayerProtocol
- MicrosoftGame.config Reference PLS#MGC-PLS
- MicrosoftGame.config Reference ProcessorArch#MGC-ProcessorArch
- MicrosoftGame.config Reference EraShim#MGC-EraShim
- MicrosoftGame.config Reference RequiresXboxLive#MGC-RequiresXboxLive
- MicrosoftGame.config Reference Smt#MGC-Smt
- MicrosoftGame.config Reference XboxCompat#MGC-XboxCompat
ms.author: zhooper
ms.topic: conceptual
edited: 01/06/2020
security: public
---

# MicrosoftGame.config reference

## Summary

This topic describes additional details/reference material for the MicrosoftGame.config file. It includes the following sections.

| Section | Description |
| --- | --- |
| [Element details](#MicrosoftGameConfig-Elements) | Provides a list of MicrosoftGame.config element names, purpose and notes. |
| [Sample MicrosoftGame.config file](#MicrosoftGameConfig-Example) | Provides an example MicorosftGame.config for Xbox & PC. |
| [XSD Schema for MicrosoftGame.config](#XSD-Schema-id) | Provides details on the XSD Schema used to validate the MicrosoftGame.config. |
| [Previous Element reference](#MicrosoftGameConfig-OldElements) | Provides a list of elements of note that have changed, including references to changes from ERA. |
| [MicrosoftGame.config and DLC creation](#MicrosoftGameConfig-DLC) | Provides more information on creating a MicrosoftGame.config for a DLC product. |
| [See also](#MicrosoftGameConfig-SeeAlso) | Provides links to additional documentation related to MicrosoftGame.config. |


<a id="MicrosoftGameConfig-VersionDetails"></a>

### Game configVersion details

As of the March 2022 Microsoft Game Development Kit (GDK), the Game configVersion has been updated from 0 to 1 for new MicrosoftGame.config files generated using Microsoft Game Development Kit (GDK) tools. This version update changes which elements are required to enable a set of [PC ecosystem improvements](../../../get-started-with-pc-dev/overviews/gr-pc-ecosystem-updates.md).

The changes between Game configVersion 0 and 1 are as follows:

* MSAAppId and TitleId element are required if either is specified in the MicrosoftGame.config (i.e. if the TitleId is specified, the MSAAppId must also be specified).
* MSAAppId and TitleId element are required if NoCodePCRoot element is specified or AdvancedUserModel element is set to the value of false.
* ModFolder, EnableWritesToPackageRoot, DisableFilesystemWriteVirtualization and DisableRegistryWriteVirtualization elements have now been deprecated with configVersion 1.

Which requirements, defined in the schema, will be run against a title is defined by this value in the MicrosoftGame.config:

```xml
<Game configVersion="1">
```

The Game configVersion allows for values of 0 and 1. These new requirements will not impact existing titles upgrading to the March 2022 Microsoft Game Development Kit (GDK) as their Game configVersion will remain set to 0.


<a id="MicrosoftGameConfig-Elements"></a>

### Element details

This section details the element name, if required, purpose, parent node and additional notes for definable elements within the MicrosoftGame.config.

| Node Name | Required | Purpose | Parent | Notes |
|---|---|---|---|---|
| [Game](elements/microsoftgameconfig-element-game.md) | Required | Singular Parent Node that contains all other content | | |
| <a id="MGC-Identity"/> [Identity](elements/microsoftgameconfig-element-identity.md) | Required | Defines the title's Name, Publisher and Version | Game | Title information can be found in Partner Center under Product Management -> Product Identity; see [Setting up a game at Partner Center, for Managed Partners](../../../live/get-started/live-setup-partner-center-partners.md). <br> Used during registration to uniquely identify the title. <br> Name and Publisher are required fields. <br> Version will default to 1.0.0.0 if not specified. <br> Additional packages for subsequent console generations must increment package major version beyond existing package versions. |  
| <a id="MGC-ShellVisuals"/> [ShellVisuals](elements/microsoftgameconfig-element-shellvisuals.md) | Required for packaged build | Defines the title's Shell presence. For example, Images and Names. | Game | Used during registration to surface the title in the Shell. |  
| <a id="MGC-Languages"/> [Resources](elements/microsoftgameconfig-element-resources.md) | Optional | List of Language Locale pairs used to localize Shell Visuals. | Game | May be copied and pasted from an existing AppxManifest as the format is retained. <br> For more information, see [Packaging](../../../packaging/gc-packaging-toc.md). |  
| [Resource](elements/microsoftgameconfig-element-resource.md) | Optional | An individual entry of a Language Locale in the Resources list. | Resources | |  
| [ExecutableList](elements/microsoftgameconfig-element-executablelist.md) | Required | List of title executables. | Game | At least one entry is required to register or package the title successfully. <br> The "IsDevOnly" attribute allows you to ensure this entry will not be included in a submission signed package.<br> Overrides for Display Name and Logo allow unique values for this exe in the shell (The resources specified above in “ShellVisuals” node will be the default for each exe unless otherwise overridden here). |  
| <a id="MGC-Executable"/> [Executable](elements/microsoftgameconfig-element-executable.md) | Required | Specifies the details of a specific executable. | ExecutableList | This section attributes include the name of the executable (Name), which device it's built for (TargetDeviceFamily), it's Application ID (Id), if it's a Development only executable (IsDevOnly), if the display name from the ShellVisuals node should be overridden (OverrideDisplayName), if the Logo from ShellVisuals node should be overridden (OverrideLogo), if the Square480x480Logo from ShellVisuals node should be overridden (OverrideSquare480x480Logo), if the Square44x44Logo from ShellVisuals node should be overridden (OverrideSquare44x44Logo), if the SplashScreenImage from ShellVisuals node should be overridden (OverrideSplashScreenImage), and if the executable has an alias (Alias (currently Desktop only). |  
| <a id="MGC-AdvancedUserModel"/> [AdvancedUserModel](elements/microsoftgameconfig-element-advancedusermodel.md) | Required (Console only) | Specifies if Advanced User Model should be used for your title. | Game | This means your title supports the active user changing without requiring a restart. If disabled, then the simple user model is used which guarantees your title will always keep the active user that it was launched with. See [GDK User Models (NDA topic)](../../../system/overviews/user/gamecore-user-models.md) for more information. |  
| <a id="MGC-GameOsVersion"/> [GameOsVersion](elements/microsoftgameconfig-element-gameosversion.md) | Optional (Console only) | Specifies the version of the Microsoft Game Development Kit (GDK) gameOS that this title requires to run. | Game | Will use the currently running or default GameOS if not specified. |  
| <a id="MGC-MediaCapture"/> [MediaCapture](elements/microsoftgameconfig-element-mediacapture.md)) | Optional (Console only) | Specifies the desired behavior for system Media Capture apps while this title is running. | Game | Media capture requires title identity to be configured to work properly.|
| [GameDVRSystemComponent](elements/microsoftgameconfig-element-gamedvrsystemcomponent.md) | Optional (Console only) | Specifies if the Game DVR system component is enabled or not. | MediaCapture | |
| [BlockBroadcast](elements/microsoftgameconfig-element-blockbroadcast.md) | Optional (Console only) | Specifies if broadcasting the title should be blocked or allowed. | MediaCapture | |
| [BlockGameDVR](elements/microsoftgameconfig-element-blockgamedvr.md) | Optional (Console only) | Specifies if Game DVR recordings of the title should be blocked or allowed. | MediaCapture | |
| [StoreId](elements/microsoftgameconfig-element-storeid.md) | Optional | Specifies the store identity of this title. | Game | Specified in Partner Center under Product Management -> Product Identity. |
| [AllowedProducts](elements/microsoftgameconfig-element-allowedproducts.md) | Optional | Specifies the StoreId of the associated title or titles that this Downloadable Content Package (DLC) title belongs to. | Game | For more information, see [Downloadable Content Packages (DLCs)](../../../packaging/packaging-downloadable-content-dlc.md). |
| [AllowedProduct](elements/microsoftgameconfig-element-allowedproduct.md) | Optional | Specifies the StoreId of the associated title that this Downloadable Content Package (DLC) title belongs to. | AllowedProducts | |
| [RelatedProducts](elements/microsoftgameconfig-element-relatedproducts.md) | Optional | Specifies the StoreId of products to which this DLC title is related to. | Game | For more information, see [Downloadable Content Packages (DLCs)](../../../packaging/packaging-downloadable-content-dlc.md). |  
| [RelatedProduct](elements/microsoftgameconfig-element-relatedproduct.md) | Optional | A specific entry of a StoreId of products to which this DLC title is related to. | RelatedProducts | | 
| [TargetDeviceFamilyForDLC](elements/microsoftgameconfig-element-targetdevicefamilyfordlc.md) | Optional (DLC only) | Specifies the target platform the DLC package is built for. Allowed values are XboxOne, Scarlett and PC | Game | | 
| <a id="MGC-PLS"/> [PersistentLocalStorage](elements/microsoftgameconfig-element-persistentlocalstorage.md) | Optional (Console only) | Specifies the desired size of the titles Persistent Local Storage. | Game | Persistent local storage requires title identity to be configured to work properly. |  
| [SizeMB](elements/microsoftgameconfig-element-sizemb.md) | Optional (Console only) | Specifies the minimum size in MB of Persistent Local Storage. | PersistentLocalStorage | Persistent local storage requires title identity to be configured to work properly. |  
| [GrowableToMB](elements/microsoftgameconfig-element-growabletomb.md) | Optional (Console only) | Specifies the maximum size in MB the Persistent Local Storage can grow to over time. | PersistentLocalStorage | Persistent local storage requires title identity to be configured to work properly. |
| <a id="MGC-MemoryConfig"/> [VirtualMachine](elements/microsoftgameconfig-element-virtualmachine.md) | Optional (Console only) | Specifies the title memory allocation on specific Xbox One hardware. | Game | |  
| [XboxOneXTitleMemory](elements/microsoftgameconfig-element-xboxonextitlememory.md) | Optional (Console only) | Specifies the title memory setting for Xbox One X consoles. | Virtual Machine | Allowed values of "Standard" or "Advanced". |  
| [XboxAnacondaTitleMemory](elements/microsoftgameconfig-element-xboxanacondatitlememory.md) | Optional (Console only) | Specifies the title memory setting for Xbox Series X consoles. | Virtual Machine | Allowed values of "Standard" or "Advanced". |  
| <a id="MGC-Smt"/> [SMTEnabled](elements/microsoftgameconfig-element-smtenabled.md) | Optional (Console only) | Specifies if SMT is enabled or not. | Virtual Machine | |  
| <a id="MGC-EraShim"/> [RequiresEraShim](elements/microsoftgameconfig-element-requireserashim.md) | Optional (Console only) | Specifies if Xbox One ERA Shim is required or not. | Virtual Machine | |  
| <a id="MGC-XboxCompat"/> [XboxCompatibility](elements/microsoftgameconfig-element-xboxcompatibility.md) | Optional (Console only) | Specifies the maximum console generation that the game is compatible with. | Virtual Machine | Developers would use this with a Xbox One title that is running in backwards compatibility on Xbox Series X&#124;S. The primary usage of this would be to get access to enhanced features such as extra memory. The allowed values are "XboxOne", which will behave like a normal backwards compatible title, and "Scarlett", which will allow the backwards compatible title to access enhanced features. |
| <a id="MGC-DlcCompat"/> [DlcCompatibility](elements/microsoftgameconfig-element-dlccompatibility.md) | Optional (Console only) | Specifies the minimum console generation for DLC  the game is compatible with. | Virtual Machine | Developers would use this with a Xbox One title that is running on a Xbox Series X&#124;S console but wishes to load DLC packages built for Xbox One.  This would allow the DLC to exist on any storage, not just fast storage.
| [MSAFullTrust](elements/microsoftgameconfig-element-msafulltrust.md) | Optional (PC Desktop only) |  Specifies if the Title is declared as "MSA Full Trust". | Game | This should not be used unless otherwise noted by your Account Manager. |  
| [MSAAppId](elements/microsoftgameconfig-element-msaappid.md) | Required | Specifies the Titles MSA App ID, which is used with Xbox Live Title ID (as follows) for identity with Xbox Live services. | Game | As of the March 2022 Microsoft Game Development Kit (GDK), the MSAAppId element is must be present if the TitleId element is specified. For more information, see [PC ecosystem improvements](../../../get-started-with-pc-dev/overviews/gr-pc-ecosystem-updates.md). |  
| [TitleId](elements/microsoftgameconfig-element-titleid.md) | Optional | Specifies the Titles Xbox Live Title ID, used for identity with Xbox Live services. | Game | As of the March 2022 Microsoft Game Development Kit (GDK), the TitleId element must be present if the MSAAppId element is specified. For more information, see [PC ecosystem improvements](../../../get-started-with-pc-dev/overviews/gr-pc-ecosystem-updates.md). |  
| <a id="MGC-RequiresXboxLive"/> [RequiresXboxLive](elements/microsoftgameconfig-element-requiresxboxlive.md) | Optional | Specifies if the title requires Xbox Live connectivity in order to run. | Game | |  
| [ExtendedAttributeList](elements/microsoftgameconfig-element-extendedattributelist.md) | Optional | Fallback for additional attributes outside of existing elements. | Game | This should not be used unless otherwise noted by your Account Manager. |
| [ExtendedAttribute](elements/microsoftgameconfig-element-extendedattribute.md) | Optional | A specific fallback designation in the Extended Attribute List. | Game | This should not be used unless otherwise noted by your Account Manager. |
| [DesktopRegistration](elements/microsoftgameconfig-element-desktopregistration.md) | Optional (PC Desktop only) | Specifies attributes to use when registering the title on the PC desktop platform. | Game | |
| <a id="MGC-ProcessorArch"/> [ProcessorArchitecture](elements/microsoftgameconfig-element-processorarchitecture.md) | Optional (PC Desktop only) | Specifies the processor architecture that matches your game executables. | DesktopRegistration | Attribute examples for this element are x64 & x86. |
| [MainPackageDependency](elements/microsoftgameconfig-element-mainpackagedependency.md) | Optional (PC Desktop DLC only) | Specifies the identity of the base package to which your DLC belongs. | DesktopRegistration | |
| <a id="MGC-FrameworkDependency"/> [DependencyList](elements/microsoftgameconfig-element-dependencylist.md) | Optional (PC Desktop only) | Determines which framework packages need to be installed before installing the title package. | DesktopRegistration | For more information on child element usage, please click [here](microsoftgameconfig-schema.md#MGC-Dependency). |
| [KnownDependency](elements/microsoftgameconfig-element-knowndependency.md) | Optional (PC Desktop only) | Shortcut to specify one of the commonly used framework packages. | DependencyList | Attribute specification of name is required and MinVersion is set automatically. Refer to the ST_KnownDependency section in the following schema for a list of possible shortcuts. |
| <a id="MGC-Dependency"/>[Dependency](elements/microsoftgameconfig-element-dependency.md) | Optional (PC Desktop only) | Specific framework package and version that are required to be installed ahead of the title. | DependencyList | Attribute specification of name and MinVersion must be set. |
| <a id="MGC-CustomInstaller"/> [CustomInstallActions](elements/microsoftgameconfig-element-custominstallactions.md) | Optional (PC Desktop only) | Specifies a custom installer action with Administration privileges the first time your game runs. | DesktopRegistration | Any executable you specify must be located under the "Installers" folder in the base folder of your game. Don't include any other files in the Installers folder. |
| [Folder](elements/microsoftgameconfig-element-folder.md) | Optional (PC Desktop only) | Specifies the folder location of the Installers. | CustomInstallActions | |
| [InstallActionList](elements/microsoftgameconfig-element-installactionlist.md) | Optional (PC Desktop only) | Specifies a list of install actions, including the executable file, name and arguments. | CustomInstallActions | |
| [InstallAction](elements/microsoftgameconfig-element-installaction.md) | Optional (PC Desktop only) | Specifies an install action, within the Install Action List. | InstallActionList | Maximum of 100 entries. |
| [RepairActionList](elements/microsoftgameconfig-element-repairactionlist.md) | Optional (PC Desktop only) | Specifies a list of repair actions. | CustomInstallActions | |
| [RepairAction](elements/microsoftgameconfig-element-repairaction.md) | Optional (PC Desktop only) | Specifies a repair action, within the Repair Action List. | RepairActionList | Maximum of 100 entries. |
| [UninstallActionList](elements/microsoftgameconfig-element-uninstallactionlist.md) | Optional (PC Desktop only) | Specifies a list of uninstall actions. | CustomInstallActions | |
| [UninstallAction](elements/microsoftgameconfig-element-uninstallaction.md) | Optional (PC Desktop only) | Specifies an uninstall action, within the Uninstall Action List. | UninstallActionList | Maximum of 100 entries. |
| [ModFolder](elements/microsoftgameconfig-element-modfolder.md) | Optional (PC Desktop only) | Defines the location of end-user mods for your game files. | DesktopRegistration | This element is now deprecated as of the March 2022 Microsoft Game Development Kit (GDK). |
| <a id="MGC-RegistryVirtualization"/> [DisableRegistryWriteVirtualization](elements/microsoftgameconfig-element-disableregistrywritevirtualization.md) | Optional (PC Desktop only) | Set to true if your game must make operating system-wide registry writes. | DesktopRegistration | This element is now deprecated as of the March 2022 Microsoft Game Development Kit (GDK). |
| <a id="MGC-FileSystemVirtualization"/> [DisableFilesystemWriteVirtualization](elements/microsoftgameconfig-element-disablefilesystemwritevirtualization.md) | Optional (PC Desktop only) | Set to true if your game must make operating system-wide file writes. | DesktopRegistration | This element is now deprecated as of the March 2022 Microsoft Game Development Kit (GDK). |
| <a id="MGC-PackageRootWrites"/> [EnableWritesToPackageRoot](elements/microsoftgameconfig-element-enablewritestopackageroot.md) | Optional (PC Desktop only) | Set to true if your game needs to write to the package install location. | DesktopRegistration | This element is now deprecated as of the March 2022 Microsoft Game Development Kit (GDK). |
| <a id="MGC-MultiplayerProtocol"/> [MultiplayerProtocol](elements/microsoftgameconfig-element-multiplayerprotocol.md) | Optional (PC Desktop only) | Allows for protocol activation within the title via "ms-xbl-multiplayer" protocol. | DesktopRegistration | Primarily used to enable Game Bar to launch games / multiplayer game invites. |
| <a id="MGC-FileTypeAssociation"/> [FileTypeAssociation](elements/microsoftgameconfig-element-filetypeassociation.md) | Optional (PC Desktop only) | Allows a file type to be associated with an executable in your package.  | DesktopRegistration | An example would be a specific extension for a title's map editor. |
| [DisplayName](elements/microsoftgameconfig-element-displayname.md) | Optional (PC Desktop only) | Specifies a display name for the File Type Association. | FileTypeAssociation | |
| [Logo](elements/microsoftgameconfig-element-logo.md) | Optional (PC Desktop only) | Specifies a logo for the File Type Association. | FileTypeAssociation | |
| [InfoTip](elements/microsoftgameconfig-element-infotip.md) | Optional (PC Desktop only) | Specifies an Info Tip for the File Type Association. | FileTypeAssociation | |
| [EditFlags](elements/microsoftgameconfig-element-editflags.md) | Optional (PC Desktop only) | Specifies Edit Flags for the File Type Association. | FileTypeAssociation | |
| [SupportedFileTypes](elements/microsoftgameconfig-element-supportedfiletypes.md) | Optional (PC Desktop only) | Specifies the supported file types for the File Type Association. | FileTypeAssociation | |
| [FileType](elements/microsoftgameconfig-element-filetype.md) | Optional (PC Desktop only) | Specifies a file type extension to be used as part of the SupportedFileTypes element. | SupportedFileTypes | |
| <a id="MGC-DevelopmentOnly"/> [DevelopmentOnly](elements/microsoftgameconfig-element-developmentonly.md) | Optional (Console only) | A list of development-only properties. | Game | |
| [ContentIdOverride](elements/microsoftgameconfig-element-contentidoverride.md) | Optional (Console only) | An override, for development-only, to a games ContentID. | DevelopmentOnly | Utilize the <i>xbapp list /d /nosystem</i> commmand, with a package installed, to get your titles ContentID. |
| [EKBIDOverride](elements/microsoftgameconfig-element-ekbidoverride.md) | Optional (Console only) | An override, for development-only, to a games EKBID (trial version ID). | DevelopmentOnly | Utilize the <i>xbapp list /d</i> commmand, with a package installed,  to get your titles EKBID. |
| [DebugNetworkPortList](elements/microsoftgameconfig-element-debugnetworkportlist.md) | Optional (Console only) | A list of additional ports to open for development on a Development Kit. | DevelopmentOnly | |
| [DebugNetworkPort](elements/microsoftgameconfig-element-debugnetworkport.md) | Optional (Console only) | Additional port to open for development on a dev kit. | DebugNetworkPortList | |

[Return to the top of this topic.](microsoftgameconfig-schema.md)

<a id="MicrosoftGameConfig-Example"></a>

## Sample MicrosoftGame.config file

The following MicrosoftGame.config is an example config showing how elements are used for Xbox Series X&#124;S (with comments on differences for Xbox One). For an example of a MicrosoftGame.config for PC, see [Getting Started with Packaging For PC](../../../packaging/overviews/packaging-getting-started-for-PC.md).

```xml
<?xml version="1.0" encoding="utf-8"?>
<Game configVersion="1">
    
    <Identity Name="41336PublisherName.ExampleGame" Publisher="CN=A4954634-DF4B-47C7-AB70-D3215D246AF1" Version="1.6.0.0"/>
    
    <GameOsVersion>**REPLACE**</GameOsVersion>
    
    <MediaCapture>
        <GameDVRSystemComponent>true</GameDVRSystemComponent>
        <BlockBroadcast>0</BlockBroadcast>
        <BlockGameDVR>0</BlockGameDVR>
    </MediaCapture>
    
    <PersistentLocalStorage>
        <SizeMB>322</SizeMB>
    </PersistentLocalStorage>
    
    <MSAAppId>0000000000000000</MSAAppId>

    <TitleId>FFFFFFFF</TitleId>

    <StoreId>9NZTKMP36L8J</StoreId>
    
    <RelatedProducts>
        <RelatedProduct>9NZTKMP36L8J</RelatedProduct>
        <RelatedProduct>9NQJV5BMKR6C</RelatedProduct>
        <RelatedProduct>9PNX38847DWW</RelatedProduct>
    </RelatedProducts>
    
    <VirtualMachine>
        <XboxAnacondaTitleMemory>Standard</XboxAnacondaTitleMemory>
        <!-- <XboxOneXTitleMemory>Standard</XboxOneXTitleMemory> if MicrosoftGame.config is for Xbox One instead of Xbox Series X&#124;S. -->
    </VirtualMachine>
    
    <MSAFullTrust>false</MSAFullTrust>
    
    <ExecutableList>
         <!-- TargetDeviceFamily="XboxOne" if the MicrosoftGame.config is for Xbox One instead of Xbox Series X&#124;S. -->
        <Executable Name="ExampleGame.exe"
            TargetDeviceFamily="Scarlett"
            Id="Game"
            IsDevOnly="false"
            OverrideDisplayName="Example Game"
            OverrideLogo="OverriddenLogo.png" />
        <Executable Name="ExampleGame_Debug.exe"
            IsDevOnly="true"/>
        <Executable Name="ExampleGame_Profile.exe"
            IsDevOnly="true" />
    </ExecutableList>
    
    <ShellVisuals DefaultDisplayName="Example Game"
        PublisherDisplayName="Example Publisher"
        StoreLogo="StoreLogoFile.png"
        Square150x150Logo="LogoFile150x150.png"
        Square44x44Logo="LogoFile44x44.png"
        Square480x480Logo="LogoFile480x480.png"
        Description="Example Game"
        ForegroundText="light"
        BackgroundColor="#ffffff"
        SplashScreenImage="SplashScreen.png"/>
    
    <Resources>
        <Resource Language="en-us"/>
        <Resource Language="de-de"/>
        <Resource Language="es-mx"/>
    </Resources>

    <DevelopmentOnly>
      <DebugNetworkPortList>
        <DebugNetworkPort>4600</DebugNetworkPort>
      </DebugNetworkPortList>
    </DevelopmentOnly>
</Game>
```

[Return to the top of this topic.](microsoftgameconfig-schema.md)

<a id="XSD-Schema-id"></a>

## XSD Schema for MicrosoftGame.config  

The latest schema for the MicrosoftGame.config file is in the &lt;install root&gt;/bin folder of the Microsoft Game Development Kit (GDK) installation as GameConfigSchema.xsd.

See the following example of the GameConfigSchema.xsd:

```xml  
<?xml version="1.0" encoding="utf-8"?>
<xs:schema attributeFormDefault="unqualified" elementFormDefault="qualified" xmlns:xs="http://www.w3.org/2001/XMLSchema">
    <!-- Types -->

    <xs:simpleType name="ST_NonEmptyString">
        <xs:restriction base="xs:string">
            <xs:minLength value="1"/>
            <xs:maxLength value="32767"/>
            <xs:pattern value="[^\s]|([^\s].*[^\s])"/>
        </xs:restriction>
    </xs:simpleType>

    <xs:simpleType name="ST_GUID">
        <xs:restriction base="ST_NonEmptyString">
            <xs:pattern value="[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}"/>
        </xs:restriction>
    </xs:simpleType>

    <xs:simpleType name="ST_VersionQuad">
        <xs:restriction base="ST_NonEmptyString">
            <xs:pattern value="(0|[1-9][0-9]{0,3}|[1-5][0-9]{4}|6[0-4][0-9]{3}|65[0-4][0-9]{2}|655[0-2][0-9]|6553[0-5])(\.(0|[1-9][0-9]{0,3}|[1-5][0-9]{4}|6[0-4][0-9]{3}|65[0-4][0-9]{2}|655[0-2][0-9]|6553[0-5])){3}"/>
        </xs:restriction>
    </xs:simpleType>

    <xs:simpleType name="ST_Hex8">
        <xs:restriction base="ST_NonEmptyString">
            <xs:pattern value="[0-9a-fA-F]{8}"/>
        </xs:restriction>
    </xs:simpleType>

    <xs:simpleType name="ST_Hex16">
        <xs:restriction base="ST_NonEmptyString">
            <xs:pattern value="[0-9a-fA-F]{16}"/>
        </xs:restriction>
    </xs:simpleType>

    <xs:simpleType name="ST_PLSSize">
        <xs:restriction base="xs:integer">
            <!-- The actual max is determined by policy -->
            <xs:maxInclusive value="100000"/>
            <xs:minInclusive value="10"/>
        </xs:restriction>
    </xs:simpleType>

    <xs:simpleType name="ST_GrowablePLSSize">
        <xs:restriction base="xs:integer">
            <xs:minInclusive value="10"/>
        </xs:restriction>
    </xs:simpleType>

    <xs:complexType name="CT_PersistentLocalStorage">
        <xs:all>
            <xs:element name="SizeMB" type="ST_PLSSize" minOccurs="0" maxOccurs="1"/>
            <xs:element name="GrowableToMB" type="ST_GrowablePLSSize" minOccurs="0" maxOccurs="1"/>
        </xs:all>
    </xs:complexType>

    <xs:simpleType name="ST_FileNameCharSet">
        <xs:restriction base="ST_NonEmptyString">
            <xs:pattern value="[^&lt;&gt;&quot;:%\|\?\*\x01-\x1f]+"/>
        </xs:restriction>
    </xs:simpleType>

    <xs:simpleType name="ST_FileName">
        <xs:restriction base="ST_FileNameCharSet">
            <xs:pattern value="([^/\\]*[^./\\]+)(\\[^/\\]*[^./\\]+)*"/>
            <xs:pattern value="([^/\\]*[^./\\]+)(/[^/\\]*[^./\\]+)*"/>
        </xs:restriction>
    </xs:simpleType>

    <xs:simpleType name="ST_FileNameNoPath">
        <xs:restriction base="ST_FileName">
            <xs:pattern value="[^\\/]+"/>
        </xs:restriction>
    </xs:simpleType>

    <xs:simpleType name="ST_AsciiWindowsId">
        <xs:restriction base="ST_NonEmptyString">
            <xs:pattern value="([A-Za-z][A-Za-z0-9]*)(\.[A-Za-z][A-Za-z0-9]*)*"/>
            <xs:maxLength value="255"/>
        </xs:restriction>
    </xs:simpleType>

    <xs:simpleType name="ST_DeviceFamily">
        <xs:restriction base="xs:string">
            <xs:enumeration value="XboxOne"/>
            <xs:enumeration value="Scarlett"/>
            <xs:enumeration value="PC"/>
        </xs:restriction>
    </xs:simpleType>

    <xs:simpleType name="ST_ApplicationId">
        <xs:restriction base="ST_AsciiWindowsId">
            <xs:maxLength value="64"/>
        </xs:restriction>
    </xs:simpleType>

    <xs:simpleType name="ST_StoreId">
        <xs:restriction base="xs:string">
            <xs:minLength value="12"/>
            <xs:maxLength value="12"/>
            <xs:pattern value="[0-9bcdfghjklmnpqrstvwxzBCDFGHJKLMNPQRSTVWXZ]{12}"/>
        </xs:restriction>
    </xs:simpleType>

    <xs:simpleType name="ST_Executable">
        <xs:restriction base="ST_FileName">
            <xs:pattern value=".+\.([Ee][Xx][Ee])"/>
        </xs:restriction>
    </xs:simpleType>

    <xs:simpleType name="ST_ExecutableNoPath">
        <xs:restriction base="ST_FileName">
            <xs:pattern value="[^\\]+\.([Ee][Xx][Ee])"/>
        </xs:restriction>
    </xs:simpleType>

    <xs:simpleType name="ST_ImageFile">
        <xs:restriction base="ST_FileName">
            <xs:pattern value=".+\.(png)"/>
        </xs:restriction>
    </xs:simpleType>

    <xs:simpleType name="ST_ResourceReference">
        <xs:restriction base="ST_NonEmptyString">
            <xs:pattern value="\bms-resource:.{1,256}"/>
        </xs:restriction>
    </xs:simpleType>

    <xs:simpleType name="ST_DisplayName">
        <xs:union memberTypes="ST_ResourceReference">
            <xs:simpleType>
                <xs:restriction base="ST_NonEmptyString">
                    <xs:maxLength value="256"/>
                </xs:restriction>
            </xs:simpleType>
        </xs:union>
    </xs:simpleType>

    <xs:simpleType name="ST_Description">
        <xs:restriction base="ST_NonEmptyString">
            <xs:pattern value="[^\x01-\x1f]+"/>
            <xs:maxLength value="2048"/>
        </xs:restriction>
    </xs:simpleType>

    <xs:simpleType name="ST_ForegroundText">
        <xs:restriction base="xs:string">
            <xs:enumeration value="light"/>
            <xs:enumeration value="dark"/>
        </xs:restriction>
    </xs:simpleType>

    <xs:simpleType name="ST_Color">
        <xs:restriction base="xs:string">
            <xs:pattern value="#[\da-fA-F]{6}"/>
            <xs:pattern value="aliceBlue|antiqueWhite|aqua|aquamarine|azure|beige|bisque|black|blanchedAlmond|blue|blueViolet|brown|burlyWood"/>
            <xs:pattern value="cadetBlue|chartreuse|chocolate|coral|cornflowerBlue|cornsilk|crimson|cyan|darkBlue|darkCyan|darkGoldenrod|darkGray"/>
            <xs:pattern value="darkGreen|darkKhaki|darkMagenta|darkOliveGreen|darkOrange|darkOrchid|darkRed|darkSalmon|darkSeaGreen|darkSlateBlue"/>
            <xs:pattern value="darkSlateGray|darkTurquoise|darkViolet|deepPink|deepSkyBlue|dimGray|dodgerBlue|firebrick|floralWhite|forestGreen"/>
            <xs:pattern value="fuchsia|gainsboro|ghostWhite|gold|goldenrod|gray|green|greenYellow|honeydew|hotPink|indianRed|indigo|ivory"/>
            <xs:pattern value="khaki|lavender|lavenderBlush|lawnGreen|lemonChiffon|lightBlue|lightCoral|lightCyan|lightGoldenrodYellow|lightGreen"/>
            <xs:pattern value="lightGray|lightPink|lightSalmon|lightSeaGreen|lightSkyBlue|lightSlateGray|lightSteelBlue|lightYellow|lime|limeGreen"/>
            <xs:pattern value="linen|magenta|maroon|mediumAquamarine|mediumBlue|mediumOrchid|mediumPurple|mediumSeaGreen|mediumSlateBlue|mediumSpringGreen"/>
            <xs:pattern value="mediumTurquoise|mediumVioletRed|midnightBlue|mintCream|mistyRose|moccasin|navajoWhite|navy|oldLace|olive|oliveDrab"/>
            <xs:pattern value="orange|orangeRed|orchid|paleGoldenrod|paleGreen|paleTurquoise|paleVioletRed|papayaWhip|peachPuff|peru|pink|plum"/>
            <xs:pattern value="powderBlue|purple|red|rosyBrown|royalBlue|saddleBrown|salmon|sandyBrown|seaGreen|seaShell|sienna|silver|skyBlue"/>
            <xs:pattern value="slateBlue|slateGray|snow|springGreen|steelBlue|tan|teal|thistle|tomato|transparent|turquoise|violet|wheat|white"/>
            <xs:pattern value="whiteSmoke|yellow|yellowGreen"/>
        </xs:restriction>
    </xs:simpleType>

    <xs:complexType name="CT_Resources">
        <xs:sequence>
            <xs:element name="Resource" maxOccurs="200" minOccurs="0" >
                <xs:complexType>
                    <xs:attribute name="Language" type="xs:language" use="required"/>
                </xs:complexType>
            </xs:element>
        </xs:sequence>
    </xs:complexType>

     <xs:complexType name="CT_Identity">
        <xs:attribute name="Name" type="ST_PackageName" use="required"/>
        <xs:attribute name="Publisher" type="ST_Publisher" use="required"/>
        <xs:attribute name="ResourceId" type="ST_ResourceId" use="optional"/>
        <xs:attribute name="Version" type="ST_VersionQuad" use="optional"/>
    </xs:complexType>

    <xs:complexType name="CT_ShellVisuals">
        <xs:attribute name="DefaultDisplayName" type="ST_DisplayName" use="optional"/>
        <xs:attribute name="PublisherDisplayName" type="ST_DisplayName" use="optional"/>
        <xs:attribute name="StoreLogo" type="ST_ImageFile" use="optional"/>
        <xs:attribute name="Square150x150Logo" type="ST_ImageFile" use="optional"/>
        <xs:attribute name="Square44x44Logo" type="ST_ImageFile" use="optional"/>
        <xs:attribute name="Square480x480Logo" type="ST_ImageFile" use="optional"/>
        <xs:attribute name="Description" type="ST_Description" use="optional"/>
        <xs:attribute name="ForegroundText" type="ST_ForegroundText" use="optional"/>
        <xs:attribute name="BackgroundColor" type="ST_Color" use="optional"/>
        <xs:attribute name="SplashScreenImage" type="ST_ImageFile" use="optional"/>
    </xs:complexType>

    <xs:simpleType name="ST_MemoryConfig">
        <xs:restriction base="xs:string">
            <xs:enumeration value="Standard"/>
            <xs:enumeration value="Advanced"/>
        </xs:restriction>
    </xs:simpleType>

    <xs:simpleType name="ST_ConsoleGeneration">
        <xs:restriction base="xs:string">
            <xs:enumeration value="XboxOne"/>
            <xs:enumeration value="Scarlett"/>
        </xs:restriction>
    </xs:simpleType>

    <xs:complexType name="CT_VirtualMachine">
        <xs:all>
            <xs:element name="XboxOneXTitleMemory" type="ST_MemoryConfig" minOccurs="0"/>
            <xs:element name="XboxAnacondaTitleMemory" type="ST_MemoryConfig" minOccurs="0"/>
            <xs:element name="SMTEnabled" type="xs:boolean" minOccurs="0"/>
            <xs:element name="RequiresEraShim" type="xs:boolean" minOccurs="0"/>
            <xs:element name="XboxCompatibility" type="ST_ConsoleGeneration" minOccurs="0"/>
            <xs:element name="DlcCompatibility" type="ST_ConsoleGeneration" minOccurs="0"/>
        </xs:all>
    </xs:complexType>

    <xs:complexType name="CT_DesktopRegistration">
        <xs:sequence minOccurs="0" maxOccurs="unbounded">
            <xs:element name="ProcessorArchitecture" type="ST_ProcessorArchitecture" minOccurs="0"/>
            <xs:element name="MainPackageDependency " minOccurs="0">
                <xs:complexType>
                    <xs:attribute name="Name" type="ST_PackageName"/>
                </xs:complexType>
            </xs:element>
            <xs:element name="DependencyList" type="CT_DependencyList" minOccurs="0"/>
            <xs:element name="CustomInstallActions" type="CT_CustomInstallActions" minOccurs="0"/>
            <xs:element name="ModFolder" minOccurs="0">
                <xs:complexType>
                    <xs:attribute name="Name" type="ST_FileNameNoPath" use="optional"/>
                </xs:complexType>
            </xs:element>
            <xs:element name="DisableRegistryWriteVirtualization" type="xs:boolean" minOccurs="0"/>
            <xs:element name="DisableFilesystemWriteVirtualization" type="xs:boolean" minOccurs="0"/>
            <xs:element name="EnableWritesToPackageRoot" type="xs:boolean" minOccurs="0"/>
            <xs:element name="MultiplayerProtocol" minOccurs="0">
                <xs:complexType>
                    <xs:simpleContent>
                        <xs:extension base="xs:boolean">
                            <xs:attribute name="Executable" type="ST_Executable"  use="optional"/>
                        </xs:extension>
                    </xs:simpleContent>
                </xs:complexType>
            </xs:element>
            <xs:element name="FileTypeAssociation" type="CT_FileTypeAssociation" minOccurs="0" maxOccurs="100"/>
        </xs:sequence>
    </xs:complexType>

    <xs:simpleType name="ST_KnownDependency">
        <xs:restriction base="xs:string">
            <xs:enumeration value="DX11"/>
            <xs:enumeration value="VC11"/>
            <xs:enumeration value="VC12"/>
            <xs:enumeration value="VC14"/>
        </xs:restriction>
    </xs:simpleType>

    <xs:simpleType name="ST_ProcessorArchitecture">
        <xs:restriction base="xs:string">
            <xs:enumeration value="x64"/>
            <xs:enumeration value="x86"/>
        </xs:restriction>
    </xs:simpleType>

    <xs:complexType name="CT_DependencyList">
        <xs:sequence maxOccurs="128" minOccurs="0">
            <xs:element name="KnownDependency" minOccurs="0">
                <xs:complexType>
                    <xs:attribute name="Name" type="ST_KnownDependency" use="required"/>
                </xs:complexType>
            </xs:element>
            <xs:element name="Dependency" minOccurs="0">
                <xs:complexType>
                    <xs:attribute name="Name" type="ST_PackageName" use="required"/>
                    <xs:attribute name="MinVersion" type="ST_VersionQuad" use="required"/>
                </xs:complexType>
            </xs:element>
        </xs:sequence>
    </xs:complexType>

    <xs:complexType name="CT_CustomInstallAction">
        <xs:attribute name="File" type="ST_FileName" use="required"/>
        <xs:attribute name="Name" type="ST_NonEmptyString" use="required"/>
        <xs:attribute name="Arguments" type="ST_NonEmptyString" />
    </xs:complexType>

    <xs:complexType name="CT_InstallActionList">
        <xs:sequence maxOccurs="100" minOccurs="0">
            <xs:element name="InstallAction" type="CT_CustomInstallAction" />
        </xs:sequence>
    </xs:complexType>

    <xs:complexType name="CT_RepairActionList">
        <xs:sequence maxOccurs="100" minOccurs="0">
            <xs:element name="RepairAction" type="CT_CustomInstallAction" />
        </xs:sequence>
    </xs:complexType>

    <xs:complexType name="CT_UninstallActionList">
        <xs:sequence maxOccurs="100" minOccurs="0">
            <xs:element name="UninstallAction" type="CT_CustomInstallAction" />
        </xs:sequence>
    </xs:complexType>

    <xs:complexType name="CT_CustomInstallActions">
        <xs:all>
            <xs:element name="Folder" type="ST_FileName" minOccurs="1"/>
            <xs:element name="InstallActionList" type="CT_InstallActionList" minOccurs="0"/>
            <xs:element name="RepairActionList" type="CT_RepairActionList" minOccurs="0"/>
            <xs:element name="UninstallActionList" type="CT_UninstallActionList" minOccurs="0"/>
        </xs:all>
    </xs:complexType>

    <xs:complexType name="CT_ExecutableList">
        <xs:sequence maxOccurs="unbounded" minOccurs="0">
            <xs:element name="Executable">
                <xs:complexType>
                    <xs:attribute name="Name" type="ST_Executable" use="required"/>
                    <xs:attribute name="TargetDeviceFamily" type="ST_DeviceFamily" use="optional"/>
                    <xs:attribute name="Id" type="ST_ApplicationId" use="optional"/>
                    <xs:attribute name="IsDevOnly" type="xs:boolean" use="optional"/>
                    <xs:attribute name="OverrideDisplayName" type="ST_DisplayName" use="optional"/>
                    <xs:attribute name="OverrideLogo" type="ST_ImageFile" use="optional"/>
                    <xs:attribute name="OverrideSquare480x480Logo" type="ST_ImageFile" use="optional"/>
                    <xs:attribute name="OverrideSquare44x44Logo" type="ST_ImageFile" use="optional"/>
                    <xs:attribute name="OverrideSplashScreenImage" type="ST_ImageFile" use="optional"/>
                    <xs:attribute name="Alias" type="ST_ExecutableNoPath" use="optional"/>
                </xs:complexType>
            </xs:element>
        </xs:sequence>
    </xs:complexType>

    <xs:complexType name="CT_AllowedProductsList">
        <xs:sequence maxOccurs="unbounded" minOccurs="0">
            <xs:element name="AllowedProduct" type="ST_StoreId"/>
        </xs:sequence>
    </xs:complexType>

    <xs:complexType name="CT_ExtendedAttributeList">
        <xs:sequence maxOccurs="unbounded" minOccurs="0">
            <xs:element name="ExtendedAttribute">
                <xs:complexType>
                    <xs:attribute name="Name" type="ST_NonEmptyString" use="optional"/>
                    <xs:attribute name="Value" type="ST_NonEmptyString" use="optional"/>
                </xs:complexType>
            </xs:element>
        </xs:sequence>
    </xs:complexType>

    <xs:complexType name="CT_RelatedProductsList">
        <xs:sequence maxOccurs="unbounded" minOccurs="0">
            <xs:element name="RelatedProduct" type="ST_StoreId"/>
        </xs:sequence>
    </xs:complexType>

    <xs:complexType name="CT_MediaCapture">
        <xs:all>
            <xs:element name="GameDVRSystemComponent" type="xs:boolean" minOccurs="0"/>
            <xs:element name="BlockBroadcast" type="xs:boolean" minOccurs="0"/>
            <xs:element name="BlockGameDVR" type="xs:boolean" minOccurs="0"/>
        </xs:all>
    </xs:complexType>

    <xs:simpleType name="ST_AllowedAsciiCharSet">
        <xs:restriction base="ST_NonEmptyString">
            <xs:pattern value="[-_. A-Za-z0-9]+"/>
        </xs:restriction>
    </xs:simpleType>

    <xs:simpleType name="ST_AsciiIdentifier">
        <xs:restriction base="ST_AllowedAsciiCharSet">
            <xs:pattern value="[^_ ]+"/>
        </xs:restriction>
    </xs:simpleType>

    <xs:simpleType name="ST_PackageName">
        <xs:restriction base="ST_AsciiIdentifier">
            <xs:minLength value="3"/>
            <xs:maxLength value="50"/>
        </xs:restriction>
    </xs:simpleType>

    <xs:simpleType name="ST_DistinguishedName">
        <xs:restriction base="ST_NonEmptyString">
            <xs:pattern value="(CN|L|O|OU|E|C|S|STREET|T|G|I|SN|DC|SERIALNUMBER|(OID\.(0|[1-9][0-9]*)(\.(0|[1-9][0-9]*))+))=(([^,+=&quot;&lt;&gt;#;])+|&quot;.*&quot;)(, ((CN|L|O|OU|E|C|S|STREET|T|G|I|SN|DC|SERIALNUMBER|(OID\.(0|[1-9][0-9]*)(\.(0|[1-9][0-9]*))+))=(([^,+=&quot;&lt;&gt;#;])+|&quot;.*&quot;)))*"/>
        </xs:restriction>
    </xs:simpleType>

    <xs:simpleType name="ST_Publisher">
        <xs:restriction base="ST_DistinguishedName">
            <xs:maxLength value="8192"/>
        </xs:restriction>
    </xs:simpleType>

    <xs:simpleType name="ST_ResourceId">
        <xs:restriction base="ST_AsciiIdentifier">
            <xs:maxLength value="30"/>
        </xs:restriction>
  </xs:simpleType>

    <xs:simpleType name="ST_Port">
        <xs:restriction base="ST_NonEmptyString">
            <xs:pattern value="[1-9][0-9]{0,4}"/>
        </xs:restriction>
    </xs:simpleType>

    <xs:complexType name="CT_DebugNetworkPortList">
        <xs:sequence maxOccurs="unbounded" minOccurs="0">
            <xs:element name="DebugNetworkPort" type="ST_Port"/>
        </xs:sequence>
    </xs:complexType>

    <xs:complexType name="CT_DevelopmentOnly">
      <xs:all>
        <xs:element name="ContentIdOverride" type="ST_GUID" minOccurs="0"/>
        <xs:element name="EKBIDOverride" type="ST_GUID" minOccurs="0"/>
        <xs:element name="DebugNetworkPortList" type="CT_DebugNetworkPortList" minOccurs="0"/>
      </xs:all>
    </xs:complexType>

    <xs:simpleType name="ST_FTAInfoTip">
        <xs:restriction base="ST_NonEmptyString">
            <xs:maxLength value="1024"/>
        </xs:restriction>
    </xs:simpleType>

    <xs:simpleType name="ST_ContentTypeCharSet">
        <xs:restriction base="ST_NonEmptyString">
            <xs:pattern value="[!#$%&amp;'*+-.^_`|~0-9a-z/]*"/>
        </xs:restriction>
    </xs:simpleType>

    <xs:simpleType name="ST_ContentType">
        <xs:restriction base="ST_ContentTypeCharSet">
            <xs:pattern value="[^/]{1,127}/[^/]{1,127}"/>
        </xs:restriction>
    </xs:simpleType>

    <xs:simpleType name="ST_FileType">
        <xs:restriction base="ST_FileNameCharSet">
            <xs:pattern value="\.[^.\\]+"/>
            <xs:maxLength value="64"/>
        </xs:restriction>
    </xs:simpleType>

    <xs:complexType name="CT_FTASupportedFileTypes">
        <xs:sequence>
            <xs:element name="FileType" maxOccurs="1000" >
                <xs:complexType>
                    <xs:simpleContent>
                        <xs:extension base="ST_FileType">
                            <xs:attribute name="ContentType" type="ST_ContentType" use="optional"/>
                        </xs:extension>
                    </xs:simpleContent>
                </xs:complexType>
            </xs:element>
        </xs:sequence>
    </xs:complexType>

    <xs:simpleType name="ST_FTAName">
        <xs:restriction base="ST_AllowedAsciiCharSet">
            <xs:pattern value="[^ A-Z]+"/>
            <xs:maxLength value="100"/>
        </xs:restriction>
    </xs:simpleType>

    <xs:complexType name="CT_FileTypeAssociation">
        <xs:all>
            <xs:element name="DisplayName" type="ST_DisplayName" minOccurs="0"/>
            <xs:element name="Logo" type="ST_ImageFile" minOccurs="0"/>
            <xs:element name="InfoTip" type="ST_FTAInfoTip" minOccurs="0"/>
            <xs:element name="EditFlags" minOccurs="0">
                <xs:complexType>
                    <xs:attribute name="OpenIsSafe" type="xs:boolean" use="optional"/>
                    <xs:attribute name="AlwaysUnsafe" type="xs:boolean" use="optional"/>
                </xs:complexType>
            </xs:element>
            <xs:element name="SupportedFileTypes" type="CT_FTASupportedFileTypes"/>
        </xs:all>
        <xs:attribute name="Name" type="ST_FTAName" use="required"/>
        <xs:attribute name="Executable" type="ST_Executable"  use="optional"/>
    </xs:complexType>

    <xs:simpleType name="ST_GameSaveNoCodePcRootRelativeLocation">
        <xs:restriction base="xs:string">
            <xs:enumeration value="AppData"/>
            <xs:enumeration value="Public"/>
            <xs:enumeration value="LocalAppData"/>
            <xs:enumeration value="LocalAppDataLow"/>
            <xs:enumeration value="ProgramData"/>
            <xs:enumeration value="SavedGames"/>
            <xs:enumeration value="UserProfile"/>
        </xs:restriction>
    </xs:simpleType>

    <xs:simpleType name="ST_GameSaveUserQuotaSize">
        <xs:restriction base="xs:integer">
            <xs:maxInclusive value="4096"/>
            <xs:minInclusive value="256"/>
        </xs:restriction>
    </xs:simpleType>

    <xs:complexType name="CT_SaveGameStorage">
        <xs:all>
            <xs:element name="NoCodePCRoot" minOccurs="0">
                <xs:complexType>
                    <xs:simpleContent>
                        <xs:extension base="ST_FileName">
                            <xs:attribute name="RelativeTo" type="ST_GameSaveNoCodePcRootRelativeLocation" use="required"/>
                        </xs:extension>
                    </xs:simpleContent>
                </xs:complexType>
            </xs:element>
            <xs:element name="SCID" type="ST_GUID" minOccurs="0"/>
            <xs:element name="MaxUserQuota" type="ST_GameSaveUserQuotaSize" minOccurs="0"/>
        </xs:all>
    </xs:complexType>

    <!-- Root -->
    <xs:element name="Game">
        <xs:complexType>
            <xs:all>
                <xs:element name="Identity" type="CT_Identity" />
                <xs:element name="ShellVisuals" type="CT_ShellVisuals" minOccurs="0"/>
                <xs:element name="Resources" type="CT_Resources" minOccurs="0"/>
                <xs:element name="ExecutableList" type="CT_ExecutableList" minOccurs="0"/>
                <xs:element name="GameOsVersion" type="ST_VersionQuad" minOccurs="0"/>
                <xs:element name="MediaCapture" type="CT_MediaCapture" minOccurs="0"/>
                <xs:element name="StoreId" type="ST_StoreId" minOccurs="0" />
                <xs:element name="TargetDeviceFamilyForDLC" type="ST_DeviceFamily" minOccurs="0"/>
                <xs:element name="AllowedProducts" type="CT_AllowedProductsList" minOccurs="0"/>
                <xs:element name="RelatedProducts" type="CT_RelatedProductsList" minOccurs="0"/>
                <xs:element name="PersistentLocalStorage" type="CT_PersistentLocalStorage" minOccurs="0"/>
                <xs:element name="VirtualMachine" type="CT_VirtualMachine" minOccurs="0"/>
                <xs:element name="MSAFullTrust" type="xs:boolean" minOccurs="0"/>
                <xs:element name="MSAAppId" type="ST_NonEmptyString" minOccurs="0"/>
                <xs:element name="TitleId" type="ST_Hex8" minOccurs="0"/>
                <xs:element name="RequiresXboxLive" type="xs:boolean" minOccurs="0"/>
                <xs:element name="ExtendedAttributeList" type="CT_ExtendedAttributeList" minOccurs="0"/>
                <xs:element name="DesktopRegistration" type="CT_DesktopRegistration" minOccurs="0"/>
                <xs:element name="DevelopmentOnly" type="CT_DevelopmentOnly" minOccurs="0"/>
                <xs:element name="AdvancedUserModel" type="xs:boolean" default="true" minOccurs="0" maxOccurs="1" />
                <xs:element name="SaveGameStorage" type="CT_SaveGameStorage" minOccurs="0"/>
            </xs:all>
            <xs:attribute name="configVersion" use="required">
                <xs:simpleType>
                    <xs:restriction base="xs:integer">
                        <xs:maxInclusive value="1"/>
                    </xs:restriction>
                </xs:simpleType>
            </xs:attribute>
        </xs:complexType>
        <xs:unique name="Resource_Language">
            <xs:selector xpath="Resources/Resource"/>
            <xs:field xpath="@Language"/>
        </xs:unique>
    </xs:element>
</xs:schema>
```

[Return to the top of this topic.](microsoftgameconfig-schema.md)

<a id="MicrosoftGameConfig-OldElements"></a>

## Previous Element reference
* PrimaryServiceConfig was an element used in Xbox One ERA AppxManifest.xml to define SCID calls. This is now defined in code and configured in DevCenter.
* VisualElements was an element used in Xbox One ERA AppxManifest.xml to define Store logos and other visual aspects of the title. This is now defined in ShellVisuals.
* GpuAvailability was an element used in Xbox One ERA AppxManifest.xml to define GPU availability. This is now done automatically as all Microsoft Game Development Kit (GDK) titles automatically get variable setting (as much GPU as possible).
* ConnectedStorageQuota was an element used in Xbox One ERA AppxManifest.xml to define connected storage size. This is now determined by a server-side setting.
* LicenseOverrides was an element used in Xbox One ERA debug_licensing_overrides.xml to define overrides for ContentID, ProductID and EKBID. This is now managed in the MicrosoftGame.config directly with the ContentIDOverride, StoreId and EKBIDOverride elements.
* NetworkManifest elements were defined in a previous version of MicrosoftGame.config. These are now done through existing Networking APIs with the exception of the DebugNetworkPortList elements.
* XboxOneTitleMemoryMaxMB & XboxOneXTitleMemoryMaxMB was an element used in a previous version of MicrosoftGame.config. The XboxOneTitleMemoryMaxMB is no longer configurable and the Xbox One X and Xbox Series X elements for Title Memory configuration are now XboxOneXTitleMemory and XboxAnacondaTitleMemory.
* packageWriteRedirectionCompatibilityShim was previously an ExtendedAttribute value to enable this functionality ahead of the May 2020 GDK. As of the May 2020 GDK, this is now tracked as it's own element, EnableWritesToPackageRoot.

[Return to the top of this topic.](microsoftgameconfig-schema.md)

<a id="MicrosoftGameConfig-Capabilities"></a>

## Restricted Capabilities Configuration

In Microsoft Game Development Kit (GDK), restricted capabilities are configured via MicrosoftGame.config elements. A mapping of commonly used capabilities are as follows.

* runFullTrust capability is configured to be enabled by default.
* customInstallActions capability is configured by the CustomInstallActions element.

Restricted Capabilities require emailing your Account Manager to ensure permissions for these are enabled (this is required in addition to properly updating your MicrosoftGame.config). For more information on these capabilities and how to configure your MicrosoftGame.config to use them in your PC game, see [Getting started with packaging titles for PC](../../../packaging/overviews/packaging-getting-started-for-PC.md).

<a id="MicrosoftGameConfig-DLC"></a>

## MicrosoftGame.config as part of DLC package creation

For more information on how to generate a MicrosoftGame.config for a DLC package, please see [Downloadable content (DLC) packages](../../../packaging/packaging-downloadable-content-dlc.md).

[Return to the top of this topic.](microsoftgameconfig-schema.md)

<a id="MicrosoftGameConfig-SeeAlso"></a>

## See also  
[MicrosoftGame.config Element Reference](elements/gc-microsoftgameconfig-toc.md)  
[MicrosoftGame.Config](../../../system/overviews/microsoft-game-config/MicrosoftGameConfig-toc.md)  
[MicrosoftGame.Config Overview](../../../system/overviews/microsoft-game-config/MicrosoftGameConfig-Overview.md)  
[MicrosoftGame.Config Localization](../../../system/overviews/microsoft-game-config/MicrosoftGameConfig-Localization.md)  
[Overview of packaging](../../../packaging/overviews/packaging.md)  