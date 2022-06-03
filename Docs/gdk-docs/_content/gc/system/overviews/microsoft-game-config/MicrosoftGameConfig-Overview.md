---
author: M-Stahl
title: MicrosoftGame.config overview
description: Provides an overview of MicrosoftGame.config.
kindex:
- MicrosoftGame.config Overview
- MicrosoftGame.config, Overview
- overview, MicrosoftGame.config
- config file, MicrosoftGame.config
- Registration Launch
ms.author: zhooper
ms.topic: conceptual
edited: 04/21/2020
security: public
---

# MicrosoftGame.config overview

*MicrosoftGame.config* is a manifest file that's used to store game-specific configuration information. It's used during the packaging of your game for ingestion and publishing through Microsoft Store, as well as for registering information about the game during local iteration on loose-file builds during game development.  

This topic explains the purpose and use of *MicrosoftGame.config*, as well as its relationship to *AppXManifest.xml*. It also explains some caveats that are related to the use of *MicrosoftGame.config* in this release of the Microsoft Game Development Kit (GDK).

## What is MicrosoftGame.config?

Each game that's distributed through Microsoft Store must include a manifest that declares at a minimum the title's identity, the publisher name, and a set of title-specific shell visuals (strings, icons, and images) that are used to display the game's name and graphical representation in Microsoft Store and shell (for console) and Start menu, taskbar, and other places in the Windows Shell (for PC). Additionally, a game can implement optional features such as downloadable content (DLC), which rely on configuration values that are also stored in the game's manifest. The name of the manifest file is *MicrosoftGame.config*.

## Why create a new manifest schema?

Each package in Microsoft Store contains a manifest called *AppXManifest.xml*. Its schema has evolved over many years to accommodate a broad range of application features and scenarios.

With *MicrosoftGame.config*, game developers interact with a simpler, [gaming-centric manifest schema](../../../reference/system/microsoftgameconfig/microsoftgameconfig-schema.md) that is more accessible, less error-prone, and more productive. When the developer packages or registers a game, tools perform validation on the contents of the *MicrosoftGame.config* and generate a well-formed *AppXManifest.xml* on behalf of the game developer. The generated `AppXManifest` is included in the resulting package.
> [!NOTE]
> As of the March 2022 Microsoft Game Development Kit (GDK), the Game configVersion has been updated from 0 to 1 for new titles created with this Microsoft Game Development Kit (GDK) and future releases. This changes what elements are required to enable a set of [PC ecosystem improvements](../../../get-started-with-pc-dev/overviews/gr-pc-ecosystem-updates.md). Existing titles may opt into this version update to take advantage of these improvements. For more information, please see [MicrosoftGame.config Reference (sample MicrosoftGame.config and schema)](../../../reference/system/microsoftgameconfig/microsoftgameconfig-schema.md).

## Available documentation

In the offline documentation file for the Microsoft Game Development Kit (GDK) (GDK.chm), you can find documentation about *MicrosoftGame.config* in the locations that are shown in the following table.  

| Topic location | What's covered |
|------- |------- |
| [MicrosoftGame.config](MicrosoftGameConfig-toc.md) | Provides overview information about *MicrosoftGame.config* and its role in game registration and packaging |
| [MicrosoftGame.config Editor](MicrosoftGameConfig-Editor.md) | Provides an overview of the UI tool that allows for easier editing of the *MicrosoftGame.config* file, in addition to automatically syncing title Ids, names and key values from its associated Partner Center project |
| [Development environment and tools](../../../tools-console/gc-tools-toc.md) | Discusses the use of [wdapp.exe](../../../tools-pc/commandlinetools/gr-wdapp.md) and [xbapp.exe (NDA topic)](../../../tools-console/xbox-tools-and-apis/commandlinetools/xbapp.md) to register loose-file builds and to launch your game |
| [Reference](../../../reference/gc-reference-toc.md) | Provides [Reference details](../../../reference/system/microsoftgameconfig/microsoftgameconfig-schema.md) about the sample .config and schema for *MicrosoftGame.config* |
| [Packaging](../../../packaging/overviews/packaging.md) | Discusses the use of makepkg.exe to generate a package by using your *MicrosoftGame.config* for [Console](../../../packaging/overviews/packaging-getting-started-for-console.md) and [PC](../../../packaging/overviews/packaging-getting-started-for-PC.md) |  

## MicrosoftGame.config creation

When creating a new project for the Gaming.Desktop.x64, Gaming.Xbox.XboxOne.x64, or Gaming.Xbox.Scarlett.x64 platform, a *MicrosoftGame.config* is associated with your project in Visual Studio. It has default values that allow early development on PC and Xbox without the need for further configuration until you start to use features in the Gaming Runtime, Microsoft Store, and title identity.

An example of this default *MicrosoftGame.config*, for Xbox, is as follows.

```xml
<?xml version="1.0" encoding="utf-8"?>
<Game configVersion="1">
  <!-- For more information on MicrosoftGame.config elements, please refer to online GDK documentation found at https://aka.ms/GDK_MSGC or the MicrosoftGame.config topic in the System section of the offline GDK documentation. -->

  <Identity Name="41336PublisherName.ExampleGame"
            Publisher="CN=A4954634-DF4B-47C7-AB70-D3215D246AF1"
            Version="1.6.0.0"/>

  <ExecutableList>
    <Executable Name="ExampleGame.exe"
                  Id="Game"/>
    <!--        TargetDeviceFamily="XboxOne" Or "Scarlett" | TargetDeviceFamily specifies what device the executable was built for.
                IsDevOnly="false" | IsDevOnly specifies if is a Development only executable.
                OverrideDisplayName="Xbox Game Override"
                OverrideLogo="GraphicsLogoOverride.png"
                OverrideSquare44x44Logo="SmallLogoOverride.png"
                OverrideSplashScreenImage="SplashScreenOverride.png" -->
  </ExecutableList>

  <ShellVisuals DefaultDisplayName="Example Game"
                PublisherDisplayName="Example Publisher"
                Square150x150Logo="GraphicsLogo.png"
                Square44x44Logo="SmallLogo.png"
                Description="Example Game"
                ForegroundText="light"
                BackgroundColor="#000040"
                SplashScreenImage="SplashScreen.png"
                StoreLogo="StoreLogo.png"/>

  <!-- <MSAAppId>0000000000000000</MSAAppId> | Required if TitleId is specified and Game configVersion = 1 is specified in the MicrosoftGame.config -->
  <!-- <TitleId>FFFFFFFF</TitleId> | Required if MSAAppId is specified and Game configVersion = 1 is specified in the MicrosoftGame.config -->

  <!-- <StoreId>9NTL0QDWZ4FS</StoreId> | StoreID specifies the store identity of this title.  Required in development so that commerce related APIs will function. -->

  <!-- <Resources> | Resources is a list of Language Locale pairs used to localize Shell Visuals.
        <Resource Language="en-us"/>
        <Resource Language="de-de"/>
        <Resource Language="es-mx"/>
    </Resources> -->

  <!-- <DevelopmentOnly> | DevelopmentOnly is a list of development-only properties.
      <DebugNetworkPortList>
        <DebugNetworkPort>4600</DebugNetworkPort> | DebugNetworkPort specifies an additional port to open for development on a Development Kit.
      </DebugNetworkPortList>
   </DevelopmentOnly> -->

  <!-- <PersistentLocalStorage>
        <SizeMB>322</SizeMB> | SizeMB specifies the size in MB of Persistent Local Storage.
    </PersistentLocalStorage> -->

</Game>
```
> [!NOTE]
> If you manually add a *Microsoftgame.config* file to your project, you must make sure to change the file properties to be a `copy` file type.

### Manually adding a MicrosoftGame.config file

One or more MicrosoftGame.config files can also be added to your project manually.  Adding a file manually can be done in two ways:

* By setting the appropriate properties on an existing file such that Visual Studio recognizes it as a MicrosoftGame.config file.
* By using an Item Template provided with the Microsoft Game Development Kit (GDK) C++ project system.

To use an existing file as a MicrosoftGame.config file:

* Set your configuration to the "Gaming.Xbox.XboxOne.x64", "Gaming.Xbox.Scarlett.x64" or "Gaming.Desktop.x64" platform.
* Add the *MicrosoftGame.config* file for your game as a file in your Visual Studio project.
* In the properties for the *MicrosoftGame.config* file, set Item Type to **Microsoft Game Config**, shown as follows.

![Adding MGCCompile Item Type to project](../../../../../resources/gamecore/secure/images/en-us/MGCCompile.png)

To add a new MicrosoftGame.config file using the Item Template:

* Right click on a project and select Add->New Item.  
* The MicrosoftGame.config template can be found in the Visual C++->Gaming->Microsoft Game Development Kit->Edition node of the tree, shown as follows.

 ![MicrosoftGame.config Item Template](../../../../../resources/gamecore/secure/images/en-us/GameConfig_ItemTemplate.png)

### Visual Studio project property for MicrosoftGame.config

Whenever a MicrosoftGame.config file is added to a project, either automatically when the project is created, or manually, a property (`MGCCompile`) is added to your Visual Studio project.  The `MGCCompile` property is used by the project system to automate the following:

* Generation of a .pri file if you have localized string resources
* Copying your *MicrosoftGame.config* to your output folder
* Registration of your *MicrosoftGame.config* after the build
* Launching of your game with identity in the debugger


After this property is added, it should be included in your Visual Studio project file and can be seen as the following item group when inspecting the file directly.

```xml
  <ItemGroup>
    <MGCCompile Include="MicrosoftGame.Config" />
  </ItemGroup>
```

### Managing multiple MicrosoftGame.config files in Visual Studio and MSBuild

A Microsoft Game Development Kit (GDK) Visual Studio project may have several MicrosoftGame.config files associated with it.  It's common to use different MicrosoftGame.config files for different build configurations, or for Xbox and PC builds, for example.  If you had previously used custom-build logic to manage multiple MicrosoftGame.config files, this scenario is now directly supported by the project system.

A MicrosoftGame.config file can be assigned to individual build configurations in two ways.  First, the **Xbox Gaming Project Control tool window** includes support for [managing multiple MicrosoftGame.config files (NDA topic)](../../../tools-console/xbox-tools-and-apis/visualstudio/xbox-gaming-project-control.md#multiple_game_configs), shown as follows.

![Managing multiple MicrosoftGame.config files in the Xbox Project Gaming Control](../../../../../resources/gamecore/secure/images/en-us/vs_pgc_mgc_default.png)

Alternatively, MicrosoftGame.config files can be assigned to configurations by editing the project file directly.  Use the `DefaultApplyTo` element of the `MGCCompile` property to specify a default MicrosoftGame.config file.  This default file will be used for all configurations unless explicitly overridden.  Use the `ApplyTo` element of the `MGCCompile` property to assign a configuration file to a particular build configuration.

The following snippet from a project file a specifies MicrosoftGame_dev.Config as the default configuration file.  MicrosoftGame_dev.Config will be used for all build configurations other than *Release*, for which an override (MicrosoftGame_release.Config) has been specified.

```xml
<ItemGroup>
   <MGCCompile Include="MicrosoftGame_release.Config">
     <ApplyTo Condition="'$(Configuration)|$(Platform)'=='Release|Gaming.Xbox.XboxOne.x64'">True</ApplyTo>
   </MGCCompile>
   <MGCCompile Include="MicrosoftGame_dev.Config">
     <DefaultApplyTo">True</DefaultApplyTo>
   </MGCCompile>
</ItemGroup>
```

### IntelliSense support for MicrosoftGame.config

Modification of a *MicrosftGame.config* within Visual Studio now supports [IntelliSense](/visualstudio/ide/using-intellisense?view=vs-2019) features. This allows for additional insights as shown in the following two screenshots.

Valid element names are automatically listed when an element is being authored.   
![Example of IntelliSense with MicrosoftGame.config: Valid element names are automatically listed when an element is being authored](../../../../../resources/gamecore/secure/images/en-us/GameConfig_IntelliSense.png)

Warnings are present when an invalid element or invalid element value is present.   
![Example of IntelliSense with MicrosoftGame.config: Warnings are present when an invalid element or invalid element value is present](../../../../../resources/gamecore/secure/images/en-us/GameConfig_IntelliSense2.png)


### Platform requirements for MicrosoftGame.config

When creating a *MicrosoftGame.config* file for your title, you'll need to create one for each Microsoft Game Development Kit (GDK) platform (Gaming.Xbox.XboxOne.x64, Gaming.Xbox.Scarlett.x64, and Gaming.Desktop.x64). This is required to ensure that the element values being stored in the *MicrosoftGame.config* have a one-to-one mapping with the platform that your executable is built against. This is primarily specified by the `TargetDeviceFamily` attribute in the `Executable` element within the *MicrosoftGame.config* file. For more information, see the [Additional Element Details](../../../reference/system/microsoftgameconfig/microsoftgameconfig-schema.md) section in the reference topic.

When launching your title, it behaves differently based on the platform requirements, the device the title is being launched on, and the executable type, as seen in the following table.

| MicrosoftGame.config presence | TargetDeviceFamily setting | Launch device | Action | Notes |
|---|---|---|---|---|
| Yes | Xbox Series X&#124;S | Xbox Series X&#124;S | Launch natively on the Xbox Series X Dev Kit | |
| Yes | Xbox Series X&#124;S | Xbox One | Returns an error (0x887e0002), indicating that the incorrect platform was launched on the launch device | |
| Yes | XboxOne | Xbox Series X&#124;S | Launch with Microsoft Game Development Kit (GDK) back-compat VM on the Xbox Series X Dev Kit | |
| Yes | XboxOne | Xbox One | Launch natively on the Xbox One Development Kit | |
| Yes | Not defined | Xbox Series X&#124;S | Launch natively on the Xbox Series X Dev Kit | |
| Yes | Not defined | Xbox One | Launch natively on the Xbox One dev kit | |
| No | N/A | Xbox Series X&#124;S | Launch natively on the Xbox Series X Dev Kit | |
| No | N/A | XboxOne | Launch natively on the Xbox One dev kit | |
| Yes | PC | PC | Launch as a Win32 x64 with identity on PC | |
| Yes | Not defined | PC | Launch as a Win32 x64 with identity on PC | |
| No | N/A | PC | Launch as a Win32 x64 without identity on PC | |

> [!NOTE]
> In the scenario where a Xbox Series X&#124;S title launches on a Xbox Series X Dev Kit without a MicrosoftGame.config, it will re-use existing Microsoft Game Development Kit (GDK) VM state if applicable. As an example, if a back-compat Microsoft Game Development Kit (GDK) title (Xbox One on Xbox Series X&#124;S) had launched prior to attempting to launch a Xbox Series X&#124;S native title, it will run it using that same back-compat Microsoft Game Development Kit (GDK) VM. We recommended using a MicrosoftGame.config with TargetDeviceFamily configured to indicate the proper intent if you run into this scenario. ERA titles will run in a separate VM state and as such will not influence the Microsoft Game Development Kit (GDK) VM behavior in this scenario.

### Creating and editing a MicrosoftGame.config outside of Visual Studio

As noted above, Visual Studio provides many ways to create and manage your title's MicrosoftGame.config file. In addition to creating and editing within Visual Studio, there is a stand-alone tool that provides creation and authoring of the MicrosoftGame.config directly.

The [MicrosoftGame.config Editor](MicrosoftGameConfig-Editor.md) is a UI tool that enables easier authoring and editing of .config files. This editor also includes hooks into your title information in Partner Center to automatically pull down and sync information, such as your TitleId, MSAAppId and StoreId, by way of a Store Association Wizard. Feedback is welcome so please use the suggestion tool within the editor to let us know your thoughts.

## Launching a game without MicrosoftGame.config

In the Microsoft Game Development Kit (GDK), you can launch a PC game or an Xbox game without having a *MicrosoftGame.config* present. This is allowed for early development ahead of creating a *MicrosoftGame.config* and is intended to provide flexibility for when you want to opt in to features within the Gaming Runtime, Microsoft Store, and title identity. To ship a title with the Microsoft Game Development Kit (GDK), a *MicrosoftGame.config* is required to create your title package ahead of submission to Microsoft Store. It is recommended to adopt and configure your title's *MicrosoftGame.config* as soon as you start developing features that require the Gaming Runtime, Xbox Live, Microsoft Store or title identity.

PC games that do not have a *MicrosoftGame.config* can be built and launched by double clicking the built executable. They will with no integration of Gaming Runtime features. For support of Gaming Runtime features, Title Identity, MSIXVC Packaging support and the capability to submit to the Microsoft Store - a *MicrosoftGame.config* is required.

Xbox games that do not have a *MicrosoftGame.config* will be able to utilize GDK tooling to deploy loose file builds, launch, debug and utilize a sub-set of Microsoft Game Development Kit (GDK) functionality out of the box. For supporting full Microsoft Game Development Kit (GDK) features, Title Identity, XVC Packaging support and the capability to submit to the Microsoft store - a *MicrosoftGame.config* is required.

To launch your title, on Xbox, without a *MicrosoftGame.config*, you can:

- [xbapp.exe (NDA topic)](../../../tools-console/xbox-tools-and-apis/commandlinetools/xbapp.md) launch.
- Use the Xbox Manager deploy/launch functionality.
- Launch the title from Developer Home (Dev Home) on your Xbox.

For more information about launching a Win32 PC game, see the following section.

<a id="MSGC-PCLaunch"></a>

## Launching a Win32 game

A Win32 PC game that uses no Gaming Runtime or gaming cloud services can be launched and/or debugged just like any other Windows executable. Simply click the game executable with your mouse or run the executable directly in a command-prompt window, and the game process is created.  

Gaming services perform work on a game's behalf. To use Gaming Runtime or gaming cloud services, a game must provide contextual data. For example, a game can pass the Xbox Live service a unique identifier called title identity, which allows the service to identify which game is granting achievements to players. Contextual information like title identity can be persistently stored in the Windows App Repository through a process called registration. It's through registration that a game also specifies which strings and logos the Windows Shell should use to represent the game in the application list of the Start menu.  

Through an action called app-launch, a game process is created and the game is provided with access to its persistent contextual information from the app repository. If you don't app-launch the game, a process is created to run the game, but its context will be unavailable. This prevents the game from properly using Gaming Runtime and gaming cloud services.  

You can app-launch your game in any of the following ways.

- Start menu (app list, app tile)
- Taskbar search (search results list/detail panel)  
- [wdapp.exe](../../../tools-pc/commandlinetools/gr-wdapp.md) launch
- Windows Device Portal (WDP): **Installed Apps** > **Start**  

## Debugging a Win32 game

In the Microsoft Game Development Kit (GDK), Win32 PC games go through the registration and app-launch paths when selecting F5 to build and run. This brings this workflow up to the same standard that exists on Xbox.

With regards to Debug Installed App Package on Win32 PC, the Debug Installed App Package in Visual Studio doesn't add your game to its list of packages that can be debugged if the manifest with your game is called *MicrosoftGame.config*. Debug Installed App Package only recognizes your game as a package if a file named *AppXManifest.xml* is present in the folder with your executable. To work around this, you can create a simple `AppXManifest` that contains valid values for your game and manually save it in the folder with your executable and *MicrosoftGame.config*.  


## See also
[MicrosoftGame.config](MicrosoftGameConfig-toc.md)  
[MicrosoftGame.config localization](MicrosoftGameConfig-Localization.md)  
[MicrosoftGame.config Editor](MicrosoftGameConfig-Editor.md)  
[MicrosoftGame.config Reference (sample MicrosoftGame.config and schema)](../../../reference/system/microsoftgameconfig/microsoftgameconfig-schema.md)  
[Overview of packaging](../../../packaging/overviews/packaging.md)  