---
author: jgup
title: Getting started with packaging for PC
description: Describes getting started with packaging for PC.
kindex: Packaging for PC
ms.author: jgup
ms.topic: conceptual
edited: 10/04/2019
security: public
---

# Getting started with packaging titles for a PC by using the MSIXVC packaging tools

Use the following steps to create an MSIXVC package that can be sideloaded for testing on your target test development PC and then submitted to Partner Center for publishing.

## Check the minimum requirements for the Windows 10 version

Windows 10 version 18362 or later is required for deployment testing of MSIXVC-based packages.

## Evaluate your packaging needs  

If your package has any of the following properties or needs any of the following features, see the [Other packaging considerations and advanced features](#msixvc_advanced_features) section later in this topic.

* __Framework package dependencies__  
  If your app relies on redistributable software, you can use prepackaged versions of many of these prerequisites from Microsoft, which can be declared as dependencies and installed automatically.

* __Custom installation actions__  
  If your app relies on redistributable software that there's no framework package available for, you can chain-install these dependencies.

## Prepare your content  

Place all source material of your title in a single directory. Ensure that you remove any files that are incompatible with the MSIXVC packaging system or unsuitable for shipping in retail packages.

* PDB files.

* Universal Windows Platform (UWP) and Appx "footprint" files, including AppxSignature.p7x and AppxBlockMap.xml.  
  If you've previously shipped as a UWP in Microsoft Store, you might have some of these files associated with your Appx or MSIX package, and they must be removed.

* Any references to other PC game stores: assets, binaries, and more.

## Obtain your product's identity info from Partner Center  

Work with your Microsoft representative to create your product in Partner Center. This is a prerequisite for the next step, which requires that you know your publisher identity and your package name. Details for this step are covered outside of this topic, and you might need assistance from your Microsoft representative.

## Create your MicrosoftGame.config xml file in the root folder, and then create the rest of your game content

A sample MicrosoftGame.config xml file is included [later in this topic](#sample). This can be used as reference alongside using the [MicrosoftGame.config Editor](../../system/overviews/microsoft-game-config/MicrosoftGameConfig-Editor.md) which will streamline creation of your .config file and automatically sync down Id and name values from your Partner Center project.


## Identify any Visual C/C++ runtime dependencies

Identify any Visual C/C++ runtime dependencies of your package. We recommend that you ensure they're listed as dependencies in your MicrosoftGame.config or are explicitly copied into your package payload. For more details, see [Framework package dependencies](../packaging-framework-packages.md).


## Create your icons for display in the shell and store packages  

For each image listed in the following MicrosoftGame.config sample, place a corresponding file in the root folder of your game, scaled to the size specified. Alternately, image assets can be placed in a subdirectory, with the ShellVisuals icon paths adjusted to match. The [MicrosoftGame.config Editor](../../system/overviews/microsoft-game-config/MicrosoftGameConfig-Editor.md) provides the ability to generate these images for you with a single source image as input.


## Install the Microsoft Game Development Kit, which includes the MakePkg.exe packaging tool 

By default, the Microsoft Game Development Kit (GDK) command prompts are in this folder:  
C:\Program Files (x86)\Microsoft GDK\Command Prompts


## Create your packaging layout mapping file   

Open a Microsoft Game Development Kit (GDK) command prompt in the folder that contains a single folder with all your game content, and then run the following command:  

`MakePkg genmap /f layout.xml /d <Your_game_folder>`

This creates a file called layout.xml (this is the suggested name, you can use any other name), which is used during the packaging step. For more information on packaging tools, please see [Make package (makepkg.exe)](makepkg.exe).

## Use Intelligent Delivery to determine how to reduce installation sizes

To learn how to reduce installation sizes by tagging content in your layout.xml file, see [Overview of Intelligent Delivery](intelligentdelivery.md). Consider using Intelligent Delivery if you have sizable localized assets or content that shouldn't be installed by default but should be available for download when triggered by your game.

## Create your package 

Create the package by using the following command:  

`MakePkg pack /f layout.xml /lt /d <Your_game_folder_name> /nogameos /pc /pd <Output_Folder_Name>`

Note that for licensing dependent (for example, in-game store and trial) scenarios, you will need to MakePkg with the actual content ID. This real content ID is generated the first time this package is ingested in Partner Center, and can be found in the details of the submitted package in the Packages page.  


## Enable developer mode on your target PC  

1. Open Settings.

2. Enter **Developer** in the search field. From the options displayed, select **Use developer features**.

3. Select **Developer mode**. A dialog box appears, saying that the system is adding some features. Before moving beyond this step, wait for this process to finish.

## Test your app installation  

Run the following command:  
`Wdapp install <Your_Package.msixvc>`  

The package must exist on a local drive on your development PC, or on a network location mapped to a drive letter. Installation from Universal Naming Convention (UNC) shares isn't yet supported.
Note that if you don't see progress, you can open the Microsoft Store app and view the progress under the Downloads and updates section indicated by a downward-pointing arrow in the upper-right corner of the app, if present. You can also select the ellipsis (...), and then select **Downloads and updates**.

As of the March 2022 Microsoft Game Development Kit (GDK), MSIXVC packages install to the `[drive]:\XboxGames` folder layed out as flat files that can be modified and accessed directly. This drive location can be configured by [Application Management (wdapp.exe)](../../tools-pc/commandlinetools/gr-wdapp.md). For more information on Flat File Install features, please see [Flat File Install Overview](../packaging-flatfileinstall.md).

## Prepare your final package, and then submit it to Partner Center  

The package you created by using the previous [MakePkg.exe](../deployment/makepkg.md) command used the **/LT** parameter, which encrypts using a test/development key. For maximum security, run the MakePkg.exe command again with the **/LK** flag to encrypt it with a stable key or with the **/L** flag to encrypt it with a unique key. We recommend using /LK rather than /L because packages created with /LK can be used for local size delta comparisons and benefit from delta upload optimizations when submitting to Partner Center.

<a id="sample"></a>

## Sample MicrosoftGame.config

Create a file called MicrosoftGame.config. Use the following content in the root directory of your game content, and then remove any comments for items that you don't need.

While you can manually create the MicrosoftGame.config, the best way to create this is leveraging the [MicrosoftGame.config Editor](../../system/overviews/microsoft-game-config/MicrosoftGameConfig-Editor.md). This tool will also allow for simple syncing of Identity and Id values directly from your Partner Center project.

```xml
<?xml version="1.0" encoding="utf-8"?>
<Game configVersion="1">
    <!-- Publisher should match the exact value provided in the "Package/Identity/Publisher" field of the Game setup -> Identity section of your product's configuration area in Partner Center.
         Name should match the exact value provided in the "Package/Identity/Name" field of the Game setup -> Identity section of your product's configuration area in Partner Center. -->
    <Identity Name="**REPLACE**"
        Publisher="**REPLACE**"
        Version="1.0.1.0"/>
        <!-- The fourth digit of the version number is reserved for Microsoft Store use -->
    <!--  Optional: Use StoreId if your product will offer durable downloadable content (DLC) packages.
    Look up the Store ID (12-character alphanumeric string) of your main application package in the Game setup -> Identity section of your product's configuration area in Partner Center. (Example: 9PNX12345AAA)
    <StoreId>**REPLACE WITH STOREID**</StoreId> -->

    <MSAAppId>**REPLACE WITH MSAAPPID**</MSAAppId> <!-- This value is found in the Xbox services -> Xbox Settings section in your product's configuration area in Partner Center. -->
    <TitleId>**REPLACE WITH TITLEID**</TitleId> <!-- This value is found in the Game Setup -> Identity section of your product's configuration area in Partner Center. -->

    <!--  Include any additional languages your title supports as appropriate -->
    <Resources>
      <Resource Language="en-US" />
    </Resources>

     <!-- Use override display name if you want to display a different title in the shell than the DefaultDisplayName from the ShellVisuals section, or if you need to localize it. -->

     <!-- Configuring the Alias attribute will allow you to take advantage of Execution Alias functionality when launching your executable. For more information, please see the MicrosoftGame.config reference documentation. -->

    <ExecutableList>
      <Executable Name="**REPLACE**"
                  Id="Game"
                  Alias="**REPLACE**"
                  OverrideDisplayName="**REPLACE**"
                  />
    </ExecutableList>

    <!-- DefaultDisplayName should match the exact value provided in the "Package/Identity/Name" field of the Game setup -> Identity section of your product's configuration area in Partner Center.
         PublisherDisplayName should use the exact value provided in the "Package/Properties/PublisherDisplayName" field of the Game setup -> Identity section of your product's configuration area in Partner Center.-->
    
    <!-- The following asset sizes apply
         StoreLogo - 100x100
         Square150x150Logo - 150x150
         Square44x44Logo - 44x44
         SplashScreenImage - 1920x1080
    -->
    <ShellVisuals DefaultDisplayName="**REPLACE**" 
                  PublisherDisplayName="**REPLACE**"
                  StoreLogo="StoreLogo.png"
                  Square150x150Logo="Logo.png"
                  Square44x44Logo="SmallLogo.png"
                  Description="**REPLACE**"
                  BackgroundColor="#000040"
                  SplashScreenImage="SplashScreen.png"/>
    
    <DesktopRegistration>
      <!-- Include this section if you need to run a custom installer action with Administrator privileges the first time that your game runs.
           Any executable you specify must be located under the "Installers" folder in the base folder of your game. Don't include any other files in the
           Installers folder.
      <CustomInstallActions>
        <Folder>Installers</Folder>
        <InstallActionList>
          <InstallAction File="CustomInstaller.exe" Name="UniqueInstallTaskName" Arguments="/silent /example" />
        </InstallActionList>
      </CustomInstallActions>
      -->
      <DependencyList>
        <!-- Omit the Dependency items if your game doesn't need them, or the entire DependencyList element. Note that your version of VCLibs may be different. See the Framework package dependencies topic of the documentation for details and guidance. -->
        <KnownDependency Name="VC11"/>
      </DependencyList>
        <!-- Select the ProcessorArchitecture that matches your game executables. -->
      <ProcessorArchitecture>x64</ProcessorArchitecture>
      <!--<ProcessorArchitecture>x86</ProcessorArchitecture>-->

      <!-- Include this section if your game uses Xbox Live Multiplayer invites.
      <MultiplayerProtocol>true</MultiplayerProtocol>
      -->
    </DesktopRegistration>

    <!-- Include this section if your game writes files to its installation directory, and you're unable to change this by altering your source code and recompiling your game.
    <ExtendedAttributeList>
      <ExtendedAttribute Name="RestrictedCapability" Value="packageWriteRedirectionCompatibilityShim"/>
    </ExtendedAttributeList>
    -->
</Game>

```

<a id="msixvc_advanced_features"></a>

## Other packaging considerations and advanced features

### Framework packages for common software dependencies  

If your app relies on some redistributable software and that software is available in the Microsoft Store as a framework package, instead of chain-installing the redistributable, you can declare a dependency on the framework package.

For example, if your app uses the legacy DirectX runtime which historically was satisfied using the dxsetup.exe [redist from the microsoft downloads site](https://www.microsoft.com/download/details.aspx?id=35), you can declare a dependency on the framework package alongside the standard dependencies on Windows.Universal and Windows.Desktop, as follows.  This is preferred over installing the redist directly using a custom install action, because the framework packages can automatically be updated via the Microsoft Store, and custom install actions require administrator approval and generate acknowledgement prompts as part of the install process.

```xml
<DependencyList>
  <KnownDependency Name="DX11"/>
</DependencyList>
```

For a full list of known dependencies, refer to documentation for [MicrosoftGame.config Element - KnownDependency](../../reference/system/microsoftgameconfig/elements/microsoftgameconfig-element-knowndependency.md).

At installation time, the operating system and Microsoft Store ensures that this package dependency is installed along with your app. For more details, including those on DirectX and Visual Studio C/C++ runtime framework package dependencies, see [Framework package dependencies](../packaging-framework-packages.md).


### Mods support  

As of the March 2022 Microsoft Game Development Kit (GDK), Mods are now supported by default. For more information, see [Mods](../packaging-mods.md).

### Custom installation actions  

If your app relies on additional installers (.exe or .msi files) that must be chain-installed when your app is installed, you can use the CustomInstallActions element to configure this. 

For redistributables, you should check whether a framework package is available and contains the prerequisites you need, before deciding to use a custom installer for things like VC runtime or DirectX redistributable .exe or .msi files. For detailed instructions about custom installation actions, see [Custom installation actions](../packaging-custom-install-actions.md).

### Restricted Capability Permissions

In addition to configuring your MicrosoftGame.config file to include the correct elements, you will need to email your Account Manager to enable permissions to be set for your title to use the following features.

* Custom installation actions (CustomInstallActions element).

## See also  
[Getting started packaging titles for Xbox consoles](packaging-getting-started-for-console.md)  
[MicrosoftGame.Config](../../system/overviews/microsoft-game-config/MicrosoftGameConfig-toc.md)  
[Utilizing Microsoft Game Development Kit tools to install and launch your PC title](../../tools-pc/launching-on-pc.md)  