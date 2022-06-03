---
author: aablackm
title: Configuring projects without installing the Microsoft Game Development Kit
description: Describes the process of configuring projects without installing the Microsoft Game Development Kit.
kindex:
- Configuring projects without installing the Microsoft Game Development Kit
- MSBuild, Projects, Property, Props, Targets
- Libs, Includes, Customization, Extension Libraries
- 'Win10SDK, Windows 10 SDK '
- sample, CMake
- sample, BWOI
- BWOIExample
- CMakeExample
- ".props"
- ".target"
- flat-deployment files
- Extracted GDK
- XdkEditionTarget
- DurangoXdkInstallPath
- DefaultXdkEditionRootVS2017
- DefaultXdkEditionRootVS2019
- DefaultXdkEditionRootVS2022
- Customization, Without Install
- Extension Libraries
- advanced
ms.author: zhooper
ms.topic: conceptual
edited: 05/12/2020
security: public
---

# Configuring projects without installing the Microsoft Game Development Kit

This topic covers configuring projects to build with MSBuild while referencing extracted Microsoft Game Development Kit (GDK) files. To download example projects that use MSBuild and CMake, see the [Project configuration samples](#BWOI-Samples) section.

| Section | What’s covered |
|------- |------- |
| [Platform property and target files](#BWOI-PlatformsAndTargets) | Types and location of property and target files that are a part of the GDK |
| [Overriding MSBuild properties](#BWOI-OverridingProperties) | How to override properties to work with a flat-deployed GDK
| [Gaming.Xbox.XboxOne.x64 and Gaming.Xbox.Scarlett.x64 project customization](#BWOI-XboxProjects) | Steps to configure your Xbox project to work with a flat-deployed GDK |
| [Gaming.Xbox.XboxOne.x64 and Gaming.Xbox.Scarlett.x64 property overrides for the GDK](#BWOI-XboxGDKOverrides) | Xbox properties overrides to work with a flat-deployed GDK |
| [Gaming.Xbox.XboxOne.x64 and Gaming.Xbox.Scarlett.x64 property overrides for Windows 10 SDK](#BWOI-XboxSDKOverrides) | Xbox properties overrides to work with a flat-deployed Windows 10 SDK |
| [Gaming.Xbox.XboxOne.x64 library and include references](#BWOI-XboxOneReferences) | Library and include reference paths for Xbox One projects |
| [Gaming.Xbox.Scarlett.x64 library and include references](#BWOI-ScarlettReferences) | Library and include reference paths for Xbox Series X&#124;S projects |
| [Gaming.Xbox.XboxOne.x64 and Gaming.Xbox.Scarlett.x64 extension libraries](#BWOI-XboxExtensions) | Xbox property files for the extension libraries (that is, Xbox.Game.Chat) |
| [Gaming.Desktop.x64 project customization](#BWOI-DesktopProjects) | Steps to configure your PC desktop project to work with a flat-deployed GDK |
| [Gaming.Desktop.x64 property overrides for the GDK](#BWOI-DesktopGDKOverrides) | PC desktop properties overrides to work with a flat-deployed GDK |
| [Gaming.Desktop.x64 property overrides for Windows 10 SDK](#BWOI-DesktopSDKOverrides) | PC desktop properties overrides to work with a flat-deployed Windows 10 SDK |
| [Gaming.Desktop.x64 library and include references](#BWOI-DesktopReferences) | Library and include reference paths for PC desktop projects |
| [Gaming.Desktop.x64 extension libraries](#BWOI-DesktopExtensions) | PC desktop property files for the extension libraries (that is, Xbox.Game.Chat) |
| [Property configuration for PC-side tools](#BWOI-PCTools) | Property overrides to properly use PC-side tools |
| [Visual Studio version-specific overrides](#BWOI-VSOverrides) | Property overrides required for versions of Visual Studio |
| [Visual Studio 2017 platform overrides](#BWOI-VS2017Overrides) | Property overrides of the *Platform* folder location in Visual Studio 2017 |
| [Visual Studio 2019 platform overrides](#BWOI-VS2019Overrides) | Property overrides of the *Platform* folder location in Visual Studio 2019 |
| [Visual Studio 2022 platform overrides](#BWOI-VS2022Overrides) | Property overrides of the *Platform* folder location in Visual Studio 2022 |
| [Known Issues with _PlatformFolder](#BWOI-VSKnownIssues) | Known issues with the `_PlatformFolder` property |
| [Project configuration samples](#BWOI-Samples) | Samples to get up and running with a flat-deployed GDK |
| [CMake sample](#BWOI-CMakeSample) | CMake sample to integrate a project with a flat-deployed GDK |
| [MSBuild sample](#BWOI-MSBuildSample) | MSBuild sample to integrate a project with a flat-deployed GDK |

<a id="BWOI-PlatformsAndTargets"></a>

## Platform property and target files

Included in the GDK extracted files is a set of property and target files that are used as part of building the Gaming.Xbox.XboxOne.x64, Gaming.Xbox.Scarlett.x64, or Gaming.Desktop.x64 platforms. These platforms are imported from the *Microsoft.Cpp.Default.props* lookup when building with our platform defined. Inspecting these files will help you better understand how the platform MSBuild components work and how best they can be integrated into your build system.

Eighteen instances of these files exist, based on the version of Visual Studio, the Platform Toolset version, and platform target. The example paths from an extracted *GDK* folder are as follows.

* *C:\ExtractedGDK\220300\Microsoft GDK\220300\GXDK\VS2017\flatDeployment\Common7\IDE\VC\VCTargets\Platforms\Gaming.Xbox.XboxOne.x64*
* *C:\ExtractedGDK\220300\Microsoft GDK\220300\GXDK\VS2017\flatDeployment\Common7\IDE\VC\VCTargets\Platforms\Gaming.Xbox.Scarlett.x64*
* *C:\ExtractedGDK\220300\Microsoft GDK\220300\GXDK\VS2019\flatDeployment\MSBuild\Microsoft\VC\v150\Platforms\Gaming.Xbox.XboxOne.x64*
* *C:\ExtractedGDK\220300\Microsoft GDK\220300\GXDK\VS2019\flatDeployment\MSBuild\Microsoft\VC\v150\Platforms\Gaming.Xbox.Scarlett.x64*
* *C:\ExtractedGDK\220300\Microsoft GDK\220300\GXDK\VS2019\flatDeployment\MSBuild\Microsoft\VC\v160\Platforms\Gaming.Xbox.XboxOne.x64*
* *C:\ExtractedGDK\220300\Microsoft GDK\220300\GXDK\VS2019\flatDeployment\MSBuild\Microsoft\VC\v160\Platforms\Gaming.Xbox.Scarlett.x64*
* *C:\ExtractedGDK\220300\Microsoft GDK\220300\GXDK\VS2022\flatDeployment\MSBuild\Microsoft\VC\v150\Platforms\Gaming.Xbox.XboxOne.x64*
* *C:\ExtractedGDK\220300\Microsoft GDK\220300\GXDK\VS2022\flatDeployment\MSBuild\Microsoft\VC\v150\Platforms\Gaming.Xbox.Scarlett.x64*
* *C:\ExtractedGDK\220300\Microsoft GDK\220300\GXDK\VS2022\flatDeployment\MSBuild\Microsoft\VC\v160\Platforms\Gaming.Xbox.XboxOne.x64*
* *C:\ExtractedGDK\220300\Microsoft GDK\220300\GXDK\VS2022\flatDeployment\MSBuild\Microsoft\VC\v160\Platforms\Gaming.Xbox.Scarlett.x64*
* *C:\ExtractedGDK\220300\Microsoft GDK\220300\GXDK\VS2022\flatDeployment\MSBuild\Microsoft\VC\v170\Platforms\Gaming.Xbox.XboxOne.x64*
* *C:\ExtractedGDK\220300\Microsoft GDK\220300\GXDK\VS2022\flatDeployment\MSBuild\Microsoft\VC\v170\Platforms\Gaming.Xbox.Scarlett.x64*
* *C:\ExtractedGDK\220300\Microsoft GDK\220300\GXDK\VS2017\flatDeployment\Common7\IDE\VC\VCTargets\Platforms\gaming.desktop.x64*
* *C:\ExtractedGDK\220300\Microsoft GDK\220300\GRDK\VS2019\flatDeployment\MSBuild\Microsoft\VC\v150\Platforms\gaming.desktop.x64*
* *C:\ExtractedGDK\220300\Microsoft GDK\220300\GRDK\VS2019\flatDeployment\MSBuild\Microsoft\VC\v160\Platforms\gaming.desktop.x64*
* *C:\ExtractedGDK\220300\Microsoft GDK\220300\GRDK\VS2022\flatDeployment\MSBuild\Microsoft\VC\v150\Platforms\gaming.desktop.x64*
* *C:\ExtractedGDK\220300\Microsoft GDK\220300\GRDK\VS2022\flatDeployment\MSBuild\Microsoft\VC\v160\Platforms\gaming.desktop.x64*
* *C:\ExtractedGDK\220300\Microsoft GDK\220300\GRDK\VS2022\flatDeployment\MSBuild\Microsoft\VC\v170\Platforms\gaming.desktop.x64*

The difference between the v150, v160, and v170 folders for Visual Studio 2019 and Visual Studio 2022 is the use of the v141 (v150), v142 (v160), or v143 (v170) Platform Toolset version (which is defined in the $(PlatformToolset) property).

[Return to the top of this topic.](project-configuration-withoutinstall.md)

<a id="BWOI-OverridingProperties"></a>

## Overriding MSBuild properties

There are multiple ways to override MSBuild properties in your projects. One convenient method is to create a [Directory.Build.props](/visualstudio/msbuild/customize-your-build#directorybuildprops-and-directorybuildtargets) file in the same directory as the project file. Properties defined in this file will be automatically applied when building the project. If the file is not present, the overrides will not be applied. This means you can use the same project file whether or not the Microsoft Game Development Kit (GDK) is installed. If the Microsoft Game Development Kit (GDK) is installed, remove or rename the Directory.Build.props to use the normal build process.

The [MSBuild sample](#BWOI-MSBuildSample) demonstrates the use of a Directory.Build.props file.

The following sections describe the properties we recommend that you override to point to your extracted Microsoft Game Development Kit (GDK) and where to find more details on lib and include paths.

[Return to the top of this topic.](project-configuration-withoutinstall.md)

<a id="BWOI-XboxProjects"></a>

## Gaming.Xbox.XboxOne.x64 and Gaming.Xbox.Scarlett.x64 project customization

Project customization is required to build a Gaming.Xbox.XboxOne.x64 and Gaming.Xbox.Scarlett.x64 project with MSBuild from an extracted GDK. For properties that require overriding, the most important difference between Gaming.Xbox.XboxOne.x64 and Gaming.Xbox.Scarlett.x64 is the `Platform` property definition.

<a id="BWOI-XboxGDKOverrides"></a>

### Gaming.Xbox.XboxOne.x64 and Gaming.Xbox.Scarlett.x64 property overrides for the GDK

The following properties need to be set to enable a successful build of a project that's configured for the Gaming.Xbox.XboxOne.x64 and Gaming.Xbox.Scarlett.x64 platforms. They should be imported before the import of *Microsoft.Cpp.Default.props* that's defined within your project file.

#### Descriptions of properties being overridden

* `BWOI_GDK_Path:` A user property that isn't required, but we recommend that you set it to use the property in future property values to reduce hard-coded paths.
* `Platform`: Specifies the platform that will be used to compile the project. The Xbox console family options in the GDK are Gaming.Xbox.XboxOne.x64 and Gaming.Xbox.Scarlett.x64. The property is set as part of the new project template.
* `XdkEditionTarget`: Overrides which GDK version is used for build compilation. It's defined in *Platform.default.props* and is derived from `XdkEdition`, an internal property that's set in *xdk.props*.
* `DurangoXdkInstallPath`: Overrides the *Microsoft Microsoft Game Development Kit (GDK)* folder location of the extracted GDK. It's defined in *Platform.Edition.default.props*.
* `DefaultXdkEditionRootVS2017`: Overrides the default location of the Visual Studio 2017-compatible `Platform` property and target files. It's defined in *Platform.default.props*. This property should only be defined when using a project with Visual Studio 2017.
* `XdkEditionRootVS2017`: Overrides the location of the Visual Studio 2017-compatible `Platform` property and target files. It's defined in *Platform.props*. This property should only be defined when using a project with Visual Studio 2017.
* `DefaultXdkEditionRootVS2019`: Overrides the default location of the Visual Studio 2019-compatible `Platform` property and target files. It's defined in *Platform.default.props*. This property should only be defined when using a project with Visual Studio 2019.
* `XdkEditionRootVS2019`: Overrides the location of the Visual Studio 2019-compatible `Platform` property and target files. It's defined in *Platform.props*. This property should only be defined when using a project with Visual Studio 2019.
* `DefaultXdkEditionRootVS2022`: Overrides the default location of the Visual Studio 2022-compatible `Platform` property and target files. It's defined in *Platform.default.props*. This property should only be defined when using a project with Visual Studio 2022.
* `XdkEditionRootVS2022`: Overrides the location of the Visual Studio 2022-compatible `Platform` property and target files. It's defined in *Platform.props*. This property should only be defined when using a project with Visual Studio 2022.
* `PlatformToolset`: Overrides the specific version of the build tools to be used for building. v141 is supported in Visual Studio 2017. v141 and v142 are supported in Visual Studio 2019 (v142 is defined by default). v141, v142, and v143 are supported in Visual Studio 2022 (v143 is defined by default). This is defined in *Microsoft.Cpp.Defaults.props*.

Example Gaming.Xbox.Scarlett.x64 property values, based on the previous extracted folder example, for reference:

    <BWOI_GDK_Path>C:\ExtractedGDK\220300\</BWOI_GDK_Path>
    <Platform>Gaming.Xbox.Scarlett.x64</Platform>
    <XdkEditionTarget>220300</XdkEditionTarget>
    <DurangoXdkInstallPath>$(BWOI_GDK_Path)Microsoft GDK\</DurangoXdkInstallPath>
    <DefaultXdkEditionRootVS2017>$(DurangoXdkInstallPath)$(XdkEditionTarget)\GXDK\VS2017\flatDeployment\Common7\IDE\VC\VCTargets\Platforms\$(Platform)\</DefaultXdkEditionRootVS2017>
    <XdkEditionRootVS2017>$(DurangoXdkInstallPath)$(XdkEditionTarget)\GXDK\VS2017\flatDeployment\Common7\IDE\VC\VCTargets\Platforms\$(Platform)\</XdkEditionRootVS2017>
    <DefaultXdkEditionRootVS2019>$(XdkEditionTarget)\GXDK\VS2019\flatDeployment\MSBuild\Microsoft\VC\v160\Platforms\$(Platform)\</DefaultXdkEditionRootVS2019>
    <XdkEditionRootVS2019>$(DurangoXdkInstallPath)$(XdkEditionTarget)\GXDK\VS2019\flatDeployment\MSBuild\Microsoft\VC\v160\Platforms\$(Platform)\</XdkEditionRootVS2019>
    <DefaultXdkEditionRootVS2022>$(XdkEditionTarget)\GXDK\VS2022\flatDeployment\MSBuild\Microsoft\VC\v170\Platforms\$(Platform)\</DefaultXdkEditionRootVS2022>
    <XdkEditionRootVS2022>$(DurangoXdkInstallPath)$(XdkEditionTarget)\GXDK\VS2022\flatDeployment\MSBuild\Microsoft\VC\v170\Platforms\$(Platform)\</XdkEditionRootVS2022>
    <PlatformToolset>$(PlatformToolset)</PlatformToolset>

To override the *Platform* folder to detect Gaming.Xbox.XboxOne.x64-specific and Gaming.Xbox.Scarlett.x64-specific .props and targets, see the following section about Visual Studio platform overrides.

[Return to the top of this topic.](project-configuration-withoutinstall.md)

<a id="BWOI-XboxSDKOverrides"></a>

### Gaming.Xbox.XboxOne.x64 and Gaming.Xbox.Scarlett.x64 property overrides for Windows 10 SDK

The following properties need to be set only when using an extracted Windows 10 SDK. If you're using an installed Windows 10 SDK, this section can be skipped.

* `BWOI_Win10SDK_Path`: A user property that isn't required, but we recommend that you set it to use the property in future property values to reduce hard-coded paths.
* `WindowsSdkDir`: Overrides the location of the Windows 10 SDK.
* `WindowsSdkDir_10:` Overrides the location of the Windows 10 SDK (Windows 10). This is checked via a registry key in*Microsoft.Cpp.WindowsSDK.props*, which is imported during build compilation.
* `UCRTContentRoot`: Overrides the location of the Universal C Runtime Library Content Root. This is defined in *uCRT.props*.
* `UniversalCRTSdkDir`: Overrides the location of the Universal C Runtime Library SDK (Visual C++ C Runtime). This property is checked via a registry key in *Microsoft.Cpp.WindowsSDK.props*, which is imported during build compilation.
* `UniversalCRTSdkDir_10`: Overrides the location of the Universal C Runtime Library SDK (Visual C++ C Runtime for Windows 10). This property is checked via a registry key in *Microsoft.Cpp.WindowsSDK.props*, which is imported during build compilation.
* `WindowsSDK_ExecutablePath_x86`: Overrides the location of the x86 tools that are included in the Windows 10 SDK. Tools such as `rc.exe` reside in this location. This property is defined in *Microsoft.Cpp.WindowsSDK.props*.
* `WindowsSDK_ExecutablePath_x64`: Overrides the location of the x64 tools that are included in the Windows 10 SDK. Tools such as `rc.exe` reside in this location. This property is defined in *Microsoft.Cpp.WindowsSDK.props*.
* `WindowsTargetPlatformVersion`: Overrides the version of the Windows 10 SDK that's being used. This property is defined in the *Platform.Edition.default.props* file (walks a local path if it's not defined).
* `TargetPlatformVersion`: Overrides the version of the Windows 10 SDK that's being used. This property is defined in *Microsoft.Cpp.WindowsSDK.props*.

Example property values, based on the previous extracted folder example, for reference:

    <BWOI_Win10SDK_Path>C:\ExtractedWin10SDK\</BWOI_Win10SDK_Path>
    <WindowsSdkDir>$(BWOI_Win10SDK_Path)Windows Kits\10\</WindowsSdkDir>
    <WindowsSdkDir_10>$(WindowsSdkDir)</WindowsSdkDir_10>
    <UCRTContentRoot>$(WindowsSdkDir)</UCRTContentRoot>
    <UniversalCRTSdkDir>$(WindowsSdkDir)</UniversalCRTSdkDir>
    <UniversalCRTSdkDir_10>$(WindowsSdkDir)</UniversalCRTSdkDir_10>
    <WindowsSDK_ExecutablePath_x86>$(WindowsSdkDir)bin\$(WindowsTargetPlatformVersion)\x86</WindowsSDK_ExecutablePath_x86>
    <WindowsSDK_ExecutablePath_x64>$(WindowsSdkDir)bin\$(WindowsTargetPlatformVersion)\x64</WindowsSDK_ExecutablePath_x64>
    <WindowsTargetPlatformVersion>10.0.19041.0</WindowsTargetPlatformVersion>
    <TargetPlatformVersion>$(WindowsTargetPlatformVersion)</TargetPlatformVersion>


> The Microsoft GDK requires Windows 10 SDK (19041) or later. You can make use of Windows 10 SDK (20348) if you want, but it's not required.

[Return to the top of this topic.](project-configuration-withoutinstall.md)

<a id="BWOI-XboxOneReferences"></a>

### Gaming.Xbox.XboxOne.x64 library and include references

Library and include references do *not* need to be directly overridden, because they derive from the previously mentioned overridden paths. This section is for reference only.

These references are defined in *Platform.Edition.props* within the Gaming.Xbox.XboxOne.x64 *Platform* folder. The properties are constructed as follows.

    <Console_LibRoot>$(WindowsSDKDir)Lib\$(TargetPlatformVersion)\</Console_LibRoot>
    <Console_EndpointLibRoot>$(DurangoXdkInstallPath)GXDK\gameKit\Lib\amd64;$(DurangoXdkInstallPath)GXDK\gameKit\Lib\amd64\XboxOne;$(DurangoXdkInstallPath)GRDK\gameKit\Lib\amd64</Console_EndpointLibRoot>
    <Console_EndpointIncludeRoot>$(DurangoXdkInstallPath)GXDK\gameKit\Include\;$(DurangoXdkInstallPath)GXDK\gameKit\Include\XboxOne\;$(DurangoXdkInstallPath)GRDK\gameKit\Include\</Console_EndpointIncludeRoot>
    <Console_WindowsIncludeRoot>$(WindowsSDKDir)Include\$(TargetPlatformVersion)\</Console_WindowsIncludeRoot>
    <Console_Libs Condition="'$(Console_Libs)'==''">pixevt.lib;d3d12_x.lib;xgameplatform.lib;xgameruntime.lib;xmem.lib;xg_x.lib</Console_Libs>
    <Console_UCRTRedistDebug>$(WindowsSDKDir)bin\$(TargetPlatformVersion)\x64\ucrt\</Console_UCRTRedistDebug>
    <Console_SdkRoot>$(DurangoXdkInstallRoot)</Console_SdkRoot>
    <Console_SdkIncludeRoot>$(Console_EndpointIncludeRoot);$(WindowsSDK_IncludePath);$(UniversalCRT_IncludePath);$(VC_VC_IncludePath);</Console_SdkIncludeRoot>
    <Console_SdkLibPath>$(Console_EndpointLibRoot);$(WindowsSDK_LibraryPath_x64);$(UniversalCRT_LibraryPath_x64);$(VC_LibraryPath_VC_x64_OneCore)</Console_SdkLibPath>

Example defines of library and include properties in MSBuild logs:

    Console_EndpointIncludeRoot = C:\ExtractedGDK\220300\Microsoft GDK\220300\GXDK\gameKit\Include\;C:\ExtractedGDK\220300\Microsoft GDK\220300\GXDK\gameKit\Include\XboxOne\;C:\ExtractedGDK\220300\Microsoft GDK\220300\GRDK\gameKit\Include\
    Console_EndpointLibRoot = C:\ExtractedGDK\220300\Microsoft GDK\220300\GXDK\gameKit\Lib\amd64;C:\ExtractedGDK\220300\Microsoft GDK\220300\GXDK\gameKit\Lib\amd64\XboxOne;C:\ExtractedGDK\220300\Microsoft GDK\220300\GRDK\gameKit\Lib\amd64
    Console_ExtLibPaths = C:\ExtractedGDK\220300\Microsoft GDK\220300\GRDK\ExtensionLibraries\Xbox.Services.API.C\DesignTime\CommonConfiguration\neutral\ExtensionLibrary.props
    Console_ExtLibPathsString = C:\ExtractedGDK\220300\Microsoft GDK\220300\GRDK\ExtensionLibraries\Xbox.Services.API.C\DesignTime\CommonConfiguration\neutral\ExtensionLibrary.props
    Console_GRDKExtLibNamesString = PlayFab.Party.Cpp|PlayFab.PartyXboxLive.Cpp|Xbox.Game.Chat.2.Cpp.API|Xbox.Services.API.C
    Console_GRDKExtLibRoot = C:\ExtractedGDK\220300\Microsoft GDK\220300\GRDK\ExtensionLibraries\
    Console_LibRoot = C:\Program Files (x86)\Windows Kits\10\Lib\10.0.19041.0\
    Console_Libs = pixevt.lib;d3d12_x.lib;xgameplatform.lib;xgameruntime.lib;xmem.lib;xg_x.lib
    Console_SdkIncludeRoot = C:\ExtractedGDK\220300\Microsoft GDK\220300\GRDK\ExtensionLibraries\Xbox.Services.API.C\DesignTime\CommonConfiguration\neutral\Include;C:\ExtractedGDK\220300\Microsoft GDK\220300\GXDK\gameKit\Include\;C:\ExtractedGDK\220300\Microsoft GDK\220300\GXDK\gameKit\Include\XboxOne\;C:\ExtractedGDK\220300\Microsoft GDK\220300\GRDK\gameKit\Include\;C:\Program Files (x86)\Windows Kits\10\Include\10.0.19041.0\um;C:\Program Files (x86)\Windows Kits\10\Include\10.0.19041.0\shared;C:\Program Files (x86)\Windows Kits\10\Include\10.0.19041.0\winrt;C:\Program Files (x86)\Windows Kits\10\Include\10.0.19041.0\cppwinrt;C:\Program Files (x86)\Windows Kits\10\Include\10.0.19041.0\ucrt;C:\Program Files (x86)\Windows Kits\10\Include\10.0.19041.0\ucrt;;C:\Program Files\Microsoft Visual Studio\2022\Enterprise\VC\Tools\MSVC\14.30.30705\include;;
    Console_SdkLibPath = C:\ExtractedGDK\220300\Microsoft GDK\220300\GRDK\ExtensionLibraries\Xbox.Services.API.C\DesignTime\CommonConfiguration\neutral\Lib\Release\v143;C:\ExtractedGDK\220300\Microsoft GDK\220300\GXDK\gameKit\Lib\amd64;C:\ExtractedGDK\220300\Microsoft GDK\220300\GXDK\gameKit\Lib\amd64\XboxOne;C:\ExtractedGDK\220300\Microsoft GDK\220300\GRDK\gameKit\Lib\amd64;C:\Program Files (x86)\Windows Kits\10\Lib\10.0.19041.0\ucrt\x64;C:\Program Files (x86)\Windows Kits\10\Lib\10.0.19041.0\um\x64;C:\Program Files (x86)\Windows Kits\10\lib\10.0.19041.0\ucrt\x64;;C:\Program Files\Microsoft Visual Studio\2022\Enterprise\VC\Tools\MSVC\14.30.30705\lib\onecore\x64
    Console_SdkRoot = C:\ExtractedGDK\220300\Microsoft GDK\
    Console_SdkToolPath = C:\ExtractedGDK\220300\Microsoft GDK\220300\GXDK\bin\XboxOne\
    Console_UCRTRedistDebug = C:\Program Files (x86)\Windows Kits\10\bin\10.0.19041.0\x64\ucrt\
    Console_WindowsIncludeRoot = C:\Program Files (x86)\Windows Kits\10\Include\10.0.19041.0\

[Return to the top of this topic.](project-configuration-withoutinstall.md)

<a id="BWOI-ScarlettReferences"></a>

### Gaming.Xbox.Scarlett.x64 library and include references

Library and include references do *not* need to be directly overridden, because they derive from the previously mentioned overridden paths. This section is for reference only.

These references are defined in *Platform.Edition.props* within the Gaming.Xbox.Scarlett.x64 *Platform* folder. The properties are constructed as follows.

    <Console_LibRoot>$(WindowsSDKDir)Lib\$(TargetPlatformVersion)\</Console_LibRoot>
    <Console_EndpointLibRoot>$(DurangoXdkInstallPath)GXDK\gameKit\Lib\amd64;$(DurangoXdkInstallPath)GXDK\gameKit\Lib\amd64\Scarlett;$(DurangoXdkInstallPath)GRDK\gameKit\Lib\amd64</Console_EndpointLibRoot>
    <Console_EndpointIncludeRoot>$(DurangoXdkInstallPath)GXDK\gameKit\Include\;$(DurangoXdkInstallPath)GXDK\gameKit\Include\Scarlett\;$(DurangoXdkInstallPath)GRDK\gameKit\Include\</Console_EndpointIncludeRoot>
    <Console_WindowsIncludeRoot>$(WindowsSDKDir)Include\$(TargetPlatformVersion)\</Console_WindowsIncludeRoot>
    <Console_Libs Condition="'$(Console_Libs)'==''">pixevt.lib;d3d12_xs.lib;xgameplatform.lib;xgameruntime.lib;xmem.lib;xg_xs.lib</Console_Libs>
    <Console_UCRTRedistDebug>$(WindowsSDKDir)bin\$(TargetPlatformVersion)\x64\ucrt\</Console_UCRTRedistDebug>
    <Console_SdkRoot>$(DurangoXdkInstallRoot)</Console_SdkRoot>
    <Console_SdkIncludeRoot>$(Console_EndpointIncludeRoot);$(WindowsSDK_IncludePath);$(UniversalCRT_IncludePath);$(VC_VC_IncludePath);</Console_SdkIncludeRoot>
    <Console_SdkLibPath>$(Console_EndpointLibRoot);$(WindowsSDK_LibraryPath_x64);$(UniversalCRT_LibraryPath_x64);$(VC_LibraryPath_VC_x64_OneCore)</Console_SdkLibPath>

Example defines of library and include properties in MSBuild logs:

    Console_EndpointIncludeRoot = C:\ExtractedGDK\220300\Microsoft GDK\220300\GXDK\gameKit\Include\;C:\ExtractedGDK\220300\Microsoft GDK\220300\GXDK\gameKit\Include\Scarlett\;C:\ExtractedGDK\220300\Microsoft GDK\220300\GRDK\gameKit\Include\
    Console_EndpointLibRoot = C:\ExtractedGDK\220300\Microsoft GDK\220300\GXDK\gameKit\Lib\amd64;C:\ExtractedGDK\220300\Microsoft GDK\220300\GXDK\gameKit\Lib\amd64\Scarlett;C:\ExtractedGDK\220300\Microsoft GDK\220300\GRDK\gameKit\Lib\amd64
    Console_ExtLibPaths = C:\ExtractedGDK\220300\Microsoft GDK\220300\GRDK\ExtensionLibraries\Xbox.Services.API.C\DesignTime\CommonConfiguration\neutral\ExtensionLibrary.props
    Console_ExtLibPathsString = C:\ExtractedGDK\220300\Microsoft GDK\220300\GRDK\ExtensionLibraries\Xbox.Services.API.C\DesignTime\CommonConfiguration\neutral\ExtensionLibrary.props
    Console_GRDKExtLibNamesString = PlayFab.Party.Cpp|PlayFab.PartyXboxLive.Cpp|Xbox.Game.Chat.2.Cpp.API|Xbox.Services.API.C
    Console_GRDKExtLibRoot = C:\ExtractedGDK\220300\Microsoft GDK\220300\GRDK\ExtensionLibraries\
    Console_LibRoot = C:\Program Files (x86)\Windows Kits\10\Lib\10.0.19041.0\
    Console_Libs = pixevt.lib;d3d12_xs.lib;xgameplatform.lib;xgameruntime.lib;xmem.lib;xg_xs.lib
    Console_SdkIncludeRoot = C:\ExtractedGDK\220300\Microsoft GDK\220300\GRDK\ExtensionLibraries\Xbox.Services.API.C\DesignTime\CommonConfiguration\neutral\Include;C:\ExtractedGDK\220300\Microsoft GDK\220300\GXDK\gameKit\Include\;C:\ExtractedGDK\220300\Microsoft GDK\220300\GXDK\gameKit\Include\Scarlett\;C:\ExtractedGDK\220300\Microsoft GDK\220300\GRDK\gameKit\Include\;C:\Program Files (x86)\Windows Kits\10\Include\10.0.19041.0\um;C:\Program Files (x86)\Windows Kits\10\Include\10.0.19041.0\shared;C:\Program Files (x86)\Windows Kits\10\Include\10.0.19041.0\winrt;C:\Program Files (x86)\Windows Kits\10\Include\10.0.19041.0\cppwinrt;C:\Program Files (x86)\Windows Kits\10\Include\10.0.19041.0\ucrt;C:\Program Files (x86)\Windows Kits\10\Include\10.0.19041.0\ucrt;;C:\Program Files\Microsoft Visual Studio\2022\Enterprise\VC\Tools\MSVC\14.30.30705\include;;
    Console_SdkLibPath = C:\ExtractedGDK\220300\Microsoft GDK\220300\GRDK\ExtensionLibraries\Xbox.Services.API.C\DesignTime\CommonConfiguration\neutral\Lib\Release\v143;C:\ExtractedGDK\220300\Microsoft GDK\220300\GXDK\gameKit\Lib\amd64;C:\ExtractedGDK\220300\Microsoft GDK\220300\GXDK\gameKit\Lib\amd64\Scarlett;C:\ExtractedGDK\220300\Microsoft GDK\220300\GRDK\gameKit\Lib\amd64;C:\Program Files (x86)\Windows Kits\10\Lib\10.0.19041.0\ucrt\x64;C:\Program Files (x86)\Windows Kits\10\Lib\10.0.19041.0\um\x64;C:\Program Files (x86)\Windows Kits\10\lib\10.0.19041.0\ucrt\x64;;C:\Program Files\Microsoft Visual Studio\2022\Enterprise\VC\Tools\MSVC\14.30.30705\lib\onecore\x64
    Console_SdkRoot = C:\ExtractedGDK\220300\Microsoft GDK\
    Console_SdkToolPath = C:\ExtractedGDK\220300\Microsoft GDK\220300\GXDK\bin\Scarlett\
    Console_UCRTRedistDebug = C:\Program Files (x86)\Windows Kits\10\bin\10.0.19041.0\x64\ucrt\
    Console_WindowsIncludeRoot = C:\Program Files (x86)\Windows Kits\10\Include\10.0.19041.0\


[Return to the top of this topic.](project-configuration-withoutinstall.md)

<a id="BWOI-XboxExtensions"></a>

### Gaming.Xbox.XboxOne.x64 and Gaming.Xbox.Scarlett.x64 extension libraries

Extension libraries exist for Xbox.Services.API.C, Xbox.Game.Chat.2.Cpp.API, Xbox.XCurl.API, PlayFab.Party.Cpp, and PlayFab.PartyXboxLive.Cpp. If you're using these features, they should be imported into your project and the associated properties overridden, based on what's defined in the following .props files.

* *C:\ExtractedGDK\220300\Microsoft GDK\220300\GRDK\ExtensionLibraries\Xbox.Services.API.C\DesignTime\CommonConfiguration\Neutral\ExtensionLibrary.props*  
* *C:\ExtractedGDK\220300\Microsoft GDK\220300\GRDK\ExtensionLibraries\Xbox.Game.Chat.2.Cpp.API\DesignTime\CommonConfiguration\neutral\ExtensionLibrary.props*  
* *C:\ExtractedGDK\220300\Microsoft GDK\220300\GRDK\ExtensionLibraries\PlayFab.Party.Cpp\DesignTime\CommonConfiguration\neutral\ExtensionLibrary.props*
* *C:\ExtractedGDK\220300\Microsoft GDK\220300\GRDK\ExtensionLibraries\PlayFab.PartyXboxLive.Cpp\DesignTime\CommonConfiguration\neutral\ExtensionLibrary.props*

>Note: The .props file for Xbox.Services.API.C has added Appnotify.lib, crypt32.lib, and winhttp.lib as additional dependencies.

Extension library properties are defined in *Platform.Edition.props* within the target platform folder. An example of how these properties are constructed is as follows.

    <GDKExtLibNames Condition="'$(GDKExtLibNames)'==''">Xbox.Services.API.C</GDKExtLibNames>
    <Console_GRDKExtLibRoot>$(DurangoXdkInstallPath)GRDK\ExtensionLibraries\</Console_GRDKExtLibRoot>
    <Console_GRDKExtLibNamesString>$([System.String]::Join('|', $([System.IO.Directory]::GetDirectories(&quot;$(Console_GRDKExtLibRoot)&quot;))).Replace('$(Console_GRDKExtLibRoot)',''))</Console_GRDKExtLibNamesString>
    <Console_ExtLibPathsString>$([System.Text.RegularExpressions.Regex]::Replace($(GDKExtLibNames), '($(Console_GRDKExtLibNamesString))','$(Console_GRDKExtLibRoot)%24%26\DesignTime\CommonConfiguration\neutral\ExtensionLibrary.props'))</Console_ExtLibPathsString>
    <Console_ExtLibPaths>$([MSBuild]::Unescape($(Console_ExtLibPathsString)))</Console_ExtLibPaths>

`GDKExtLibNames` allows up to five libraries to be defined. If the property isn't defined, it defaults to Xbox.Services.API.C.

[Return to the top of this topic.](project-configuration-withoutinstall.md)

<a id="BWOI-DesktopProjects"></a>

## Gaming.Desktop.x64 project customization

Project customization is required to build a Gaming.Desktop.x64 project with MSBuild from an extracted Microsoft Game Development Kit (GDK).
> [!NOTE]
> The primary differences between the Gaming.Desktop.x64, Gaming.Xbox.Scarlett.x64, and Gaming.Xbox.XboxOne.x64 property overrides are minimal. The most important thing to note is that the Gaming.Desktop.x64 files are in the *GRDK* path. The Gaming.Xbox.Scarlett.x64 and Gaming.Xbox.XboxOne.x64 files are in the *GXDK* path (excluding extension libraries).

<a id="BWOI-DesktopGDKOverrides"></a>

### Gaming.Desktop.x64 property overrides for the GDK

The following properties need to be set to enable a successful build of a project that's configured for the Gaming.Desktop.x64 platform. These properties should be imported before you import *Microsoft.Cpp.Default.props* as defined within your project file.

#### Descriptions of properties being overridden

* `BWOI_GDK_Path`: A user property that isn't required, but we recommend that you set it to use the property in future property values to reduce hard-coded paths.
* `Platform`: Specifies the platform that will be used to compile the project. The platform in the Microsoft Game Development Kit (GDK) is Gaming.Desktop.x64.
* `XdkEditionTarget`: Overrides which GDK version is used for build compilation. This property is defined in *Platform.default.props* and is derived from `XdkEdition`, an internal property that's set in *xdk.props*.
* `DurangoXdkInstallPath`: Overrides the *Microsoft Microsoft Game Development Kit (GDK)* folder location of the extracted GDK. It's defined in *Platform.Edition.default.props*.
* `DefaultXdkEditionRootVS2017`: Overrides the default location of the Visual Studio 2017-compatible `Platform` property and target files. It's defined in *Platform.default.props*. `DefaultXdkEditionRootVS2017` should only be defined when using a project with Visual Studio 2017.
* `XdkEditionRootVS2017`: Overrides the location of the Visual Studio 2017-compatible `Platform` property and target files. It's defined in *Platform.props*. `XdkEditionRootVS2017` should only be defined when using a project with Visual Studio 2017.
* `DefaultXdkEditionRootVS2019`: Overrides the default location of the Visual Studio 2019-compatible `Platform` property and target files. It's defined in *Platform.default.props*. `DefaultXdkEditionRootVS2019` should only be defined when using a project with Visual Studio 2019.
* `XdkEditionRootVS2019`: Overrides the location of the Visual Studio 2019-compatible `Platform` property and target files. It's defined in *Platform.default.props*. `XdkEditionRootVS2019` should only be defined when using a project with Visual Studio 2019.
* `DefaultXdkEditionRootVS2022`: Overrides the default location of the Visual Studio 2022-compatible `Platform` property and target files. It's defined in *Platform.default.props*. `DefaultXdkEditionRootVS2022` should only be defined when using a project with Visual Studio 2022.
* `XdkEditionRootVS2022`: Overrides the location of the Visual Studio 2022-compatible `Platform` property and target files. It's defined in *Platform.default.props*. `XdkEditionRootVS2022` should only be defined when using a project with Visual Studio 2022.
* `PlatformToolset`: Overrides the specific version of the build tools to be used for building. v141 is supported in Visual Studio 2017. v141 and v142 are supported in Visual Studio 2019 (v142 is defined by default). v141, v142, and v143 are supported in Visual Studio 2022 (v143 is defined by default). This is defined in *Microsoft.Cpp.Defaults.props*.

Example Gaming.Desktop.x64 property values, based on the previous extracted folder example, for reference:

    <BWOI_GDK_Path>C:\ExtractedGDK\220300\</BWOI_GDK_Path>
    <Platform>Gaming.Desktop.x64</Platform>
    <XdkEditionTarget>220300</XdkEditionTarget>
    <DurangoXdkInstallPath>$(BWOI_GDK_Path)Microsoft GDK\</DurangoXdkInstallPath>
    <DefaultXdkEditionRootVS2017>$(DurangoXdkInstallPath)$(XdkEditionTarget)\GRDK\VS2017\flatDeployment\Common7\IDE\VC\VCTargets\Platforms\$(Platform)\</DefaultXdkEditionRootVS2017>
    <XdkEditionRootVS2017>$(DurangoXdkInstallPath)$(XdkEditionTarget)\GRDK\VS2017\flatDeployment\Common7\IDE\VC\VCTargets\Platforms\$(Platform)\</XdkEditionRootVS2017>
    <DefaultXdkEditionRootVS2019>$(XdkEditionTarget)\GRDK\VS2019\flatDeployment\MSBuild\Microsoft\VC\v160\Platforms\$(Platform)\</DefaultXdkEditionRootVS2019>
    <XdkEditionRootVS2019>$(DurangoXdkInstallPath)$(XdkEditionTarget)\GRDK\VS2019\flatDeployment\MSBuild\Microsoft\VC\v160\Platforms\$(Platform)\</XdkEditionRootVS2019>
    <DefaultXdkEditionRootVS2022>$(XdkEditionTarget)\GRDK\VS2022\flatDeployment\MSBuild\Microsoft\VC\v170\Platforms\$(Platform)\</DefaultXdkEditionRootVS2022>
    <XdkEditionRootVS2022>$(DurangoXdkInstallPath)$(XdkEditionTarget)\GRDK\VS2022\flatDeployment\MSBuild\Microsoft\VC\v170\Platforms\$(Platform)\</XdkEditionRootVS2022>
    <PlatformToolset>$(PlatformToolset)</PlatformToolset>

To override the *Platform* folder to detect Gaming.Desktop.x64-specific .props and targets, see the following section on Visual Studio platform overrides.

[Return to the top of this topic.](project-configuration-withoutinstall.md)

<a id="BWOI-DesktopSDKOverrides"></a>

### Gaming.Desktop.x64 property overrides for Windows 10 SDK

The following properties need to be set only when using an extracted Windows 10 SDK. If you're using an installed Windows 10 SDK, this section can be skipped.

* `BWOI_Win10SDK_Path`: A user property that isn't required, but we recommend that you set it to use the property in future property values to reduce hard-coded paths.
* `WindowsSdkDir`: Overrides the location of the Windows 10 SDK.
* `WindowsSdkDir_10`: Overrides the location of the Windows 10 SDK (Windows 10). This property is checked via a registry key in *Microsoft.Cpp.WindowsSDK.props*, which is imported during build compilation.
* `UCRTContentRoot`: Overrides the location of the Universal CRT Content Root. This property is defined in *uCRT.props*.
* `UniversalCRTSdkDir`: Overrides the location of the Universal CRT SDK (Visual C++ C Runtime). It's checked via a registry key in *Microsoft.Cpp.WindowsSDK.props*, which is imported during build compilation.
* `UniversalCRTSdkDir_10`: Overrides the location of the Universal CRT SDK (Visual C++ C Runtime for Windows 10). It's checked via a registry key in *Microsoft.Cpp.WindowsSDK.props*, which is imported during build compilation.
* `WindowsSDK_ExecutablePath_x86`: Overrides the location of the x86 tools that are included in the Windows 10 SDK. Tools such as `rc.exe` reside in this location. It's defined in *Microsoft.Cpp.WindowsSDK.props*.
* `WindowsSDK_ExecutablePath_x64`: Overrides the location of the x64 tools that are included in the Windows 10 SDK. Tools such as `rc.exe` reside in this location. It's defined in *Microsoft.Cpp.WindowsSDK.props*.
* `WindowsTargetPlatformVersion`: Overrides the version of the Windows 10 SDK that's being used. It's defined in the *Platform.Edition.default.props* folder (walks a local path if it's not defined).
* `TargetPlatformVersion`: Overrides the version of the Windows 10 SDK that's being used. It's defined in *Microsoft.Cpp.WindowsSDK.props*.

Example property values, based on the previous extracted folder example, for reference:

    <BWOI_Win10SDK_Path>C:\ExtractedWin10SDK\</BWOI_Win10SDK_Path>
    <WindowsSdkDir>$(BWOI_Win10SDK_Path)Windows Kits\10\</WindowsSdkDir>
    <WindowsSdkDir_10>$(WindowsSdkDir)</WindowsSdkDir_10>
    <UCRTContentRoot>$(WindowsSdkDir)</UCRTContentRoot>
    <UniversalCRTSdkDir>$(WindowsSdkDir)</UniversalCRTSdkDir>
    <UniversalCRTSdkDir_10>$(WindowsSdkDir)</UniversalCRTSdkDir_10>
    <WindowsSDK_ExecutablePath_x86>$(WindowsSdkDir)bin\$(WindowsTargetPlatformVersion)\x86</WindowsSDK_ExecutablePath_x86>
    <WindowsSDK_ExecutablePath_x64>$(WindowsSdkDir)bin\$(WindowsTargetPlatformVersion)\x64</WindowsSDK_ExecutablePath_x64>
    <WindowsTargetPlatformVersion>10.0.19041.0</WindowsTargetPlatformVersion>
    <TargetPlatformVersion>$(WindowsTargetPlatformVersion)</TargetPlatformVersion>

> The Microsoft GDK requires Windows 10 SDK (19041) or later. You can make use of Windows 10 SDK (20348) if you want, but it's not required.

[Return to the top of this topic.](project-configuration-withoutinstall.md)

<a id="BWOI-DesktopReferences"></a>

### Gaming.Desktop.x64 library and include references

Library and include references do *not* need to be directly overridden, because they derive from the previously mentioned overridden paths. This section is for reference only.

These references are defined in *Platform.Edition.props* within the Gaming.Desktop.x64 *Platform* folder. The properties are constructed as follows.

    <Console_LibRoot>$(WindowsSDKDir)Lib\$(TargetPlatformVersion)\</Console_LibRoot>
    <Console_EndpointLibRoot>$(DurangoXdkInstallPath)GRDK\gameKit\Lib\amd64</Console_EndpointLibRoot>
    <Console_EndpointIncludeRoot>$(DurangoXdkInstallPath)GRDK\gameKit\Include\</Console_EndpointIncludeRoot>
    <Console_WindowsIncludeRoot>$(WindowsSDKDir)Include\$(TargetPlatformVersion)\</Console_WindowsIncludeRoot>
    <Console_Libs>dxguid.lib;D3D12.lib;dxgi.lib;runtimeobject.lib;xGameRuntime.lib;</Console_Libs>
    <Console_UCRTRedistDebug>$(WindowsSDKDir)bin\$(TargetPlatformVersion)\x64\ucrt\</Console_UCRTRedistDebug>
    <Console_SdkRoot>$(DurangoXdkInstallRoot)</Console_SdkRoot>
    <Console_SdkIncludeRoot>$(Console_EndpointIncludeRoot);$(WindowsSDK_IncludePath);$(UniversalCRT_IncludePath);$(VC_VC_IncludePath);</Console_SdkIncludeRoot>
    <Console_SdkLibPath>$(Console_EndpointLibRoot);$(Console_LibRoot)um\x64;$(Console_LibRoot)ucrt\x64</Console_SdkLibPath>

Example defines of library and include properties in MSBuild logs:

    Console_EndpointIncludeRoot = C:\ExtractedGDK\220300\Microsoft GDK\220300\GRDK\gameKit\Include\
    Console_EndpointLibRoot = C:\ExtractedGDK\220300\Microsoft GDK\220300\GRDK\gameKit\Lib\amd64
    Console_ExtLibPaths = C:\ExtractedGDK\220300\Microsoft GDK\220300\GRDK\ExtensionLibraries\Xbox.Services.API.C\DesignTime\CommonConfiguration\neutral\ExtensionLibrary.props
    Console_ExtLibPathsString = C:\ExtractedGDK\220300\Microsoft GDK\220300\GRDK\ExtensionLibraries\Xbox.Services.API.C\DesignTime\CommonConfiguration\neutral\ExtensionLibrary.props
    Console_GRDKExtLibNamesString = PlayFab.Party.Cpp|PlayFab.PartyXboxLive.Cpp|Xbox.Game.Chat.2.Cpp.API|Xbox.Services.API.C
    Console_GRDKExtLibRoot = C:\ExtractedGDK\220300\Microsoft GDK\220300\GRDK\ExtensionLibraries\
    Console_LibRoot = C:\Program Files (x86)\Windows Kits\10\Lib\10.0.19041.0\
    Console_Libs = dxguid.lib;D3D12.lib;dxgi.lib;runtimeobject.lib;xGameRuntime.lib;
    Console_SdkIncludeRoot = C:\ExtractedGDK\220300\Microsoft GDK\220300\GRDK\ExtensionLibraries\Xbox.Services.API.C\DesignTime\CommonConfiguration\neutral\Include;C:\ExtractedGDK\220300\Microsoft GDK\220300\GRDK\gameKit\Include\;C:\Program Files (x86)\Windows Kits\10\Include\10.0.19041.0\um;C:\Program Files (x86)\Windows Kits\10\Include\10.0.19041.0\shared;C:\Program Files (x86)\Windows Kits\10\Include\10.0.19041.0\winrt;C:\Program Files (x86)\Windows Kits\10\Include\10.0.19041.0\cppwinrt;C:\Program Files (x86)\Windows Kits\10\Include\10.0.19041.0\ucrt;C:\Program Files (x86)\Windows Kits\10\Include\10.0.19041.0\ucrt;;C:\Program Files (x86)\Microsoft Visual Studio\2022\Enterprise\VC\Tools\MSVC\14.30.30705\include;;
    Console_SdkLibPath = C:\ExtractedGDK\220300\Microsoft GDK\220300\GRDK\ExtensionLibraries\Xbox.Services.API.C\DesignTime\CommonConfiguration\neutral\Lib\Release\v143;C:\ExtractedGDK\220300\Microsoft GDK\220300\GRDK\gameKit\Lib\amd64;C:\Program Files (x86)\Windows Kits\10\Lib\10.0.19041.0\um\x64;C:\Program Files (x86)\Windows Kits\10\Lib\10.0.19041.0\ucrt\x64
    Console_SdkRoot = C:\ExtractedGDK\220300\Microsoft GDK\
    Console_WindowsIncludeRoot = C:\Program Files (x86)\Windows Kits\10\Include\10.0.19041.0\

[Return to the top of this topic.](project-configuration-withoutinstall.md)

<a id="BWOI-DesktopExtensions"></a>

### Gaming.Desktop.x64 extension libraries

Extension libraries exist for Xbox.Services.API.C, Xbox.Game.Chat.2.Cpp.API, Xbox.XCurl.API, PlayFab.Party.Cpp, and PlayFab.PartyXboxLive.Cpp. If you're using these features, they should be imported into your project and the proper properties overridden, based on what's defined in the following .props files.

* *C:\ExtractedGDK\220300\Microsoft GDK\220300\GRDK\ExtensionLibraries\Xbox.Services.API.C\DesignTime\CommonConfiguration\Neutral\ExtensionLibrary.props*  
* *C:\ExtractedGDK\220300\Microsoft GDK\220300\GRDK\ExtensionLibraries\Xbox.Game.Chat.2.Cpp.API\DesignTime\CommonConfiguration\neutral\ExtensionLibrary.props*  
* *C:\ExtractedGDK\220300\Microsoft GDK\220300\GRDK\ExtensionLibraries\PlayFab.Party.Cpp\DesignTime\CommonConfiguration\neutral\ExtensionLibrary.props*
* *C:\ExtractedGDK\220300\Microsoft GDK\220300\GRDK\ExtensionLibraries\PlayFab.PartyXboxLive.Cpp\DesignTime\CommonConfiguration\neutral\ExtensionLibrary.props*

>Note: The .props file for Xbox.Services.API.C has added Appnotify.lib as an additional dependency and you will need to import that library into your project.  

Extension library properties are defined in *Platform.Edition.props* within the target platform folder. An example of the how these properties are constructed is as follows.

      <GDKExtLibNames Condition="'$(GDKExtLibNames)'==''">Xbox.Services.API.C</GDKExtLibNames>
      <Console_GRDKExtLibRoot>$(DurangoXdkInstallPath)GRDK\ExtensionLibraries\</Console_GRDKExtLibRoot>
      <Console_GRDKExtLibNamesString>$([System.String]::Join('|', $([System.IO.Directory]::GetDirectories(&quot;$(Console_GRDKExtLibRoot)&quot;))).Replace('$(Console_GRDKExtLibRoot)',''))</Console_GRDKExtLibNamesString>
      <Console_ExtLibPathsString>$([System.Text.RegularExpressions.Regex]::Replace($(GDKExtLibNames), '($(Console_GRDKExtLibNamesString))','$(Console_GRDKExtLibRoot)%24%26\DesignTime\CommonConfiguration\neutral\ExtensionLibrary.props'))</Console_ExtLibPathsString>
      <Console_ExtLibPaths>$([MSBuild]::Unescape($(Console_ExtLibPathsString)))</Console_ExtLibPaths>

`GDKExtLibNames` allows up to five libraries to be defined. If it isn't defined, it defaults to Xbox.Services.API.C.

[Return to the top of this topic.](project-configuration-withoutinstall.md)

<a id="BWOI-PCTools"></a>

## Property overrides for PC-side tools

When using the Microsoft Game Development Kit (GDK) as an extracted flat deployment, we recommend that you define these properties if you're also using PC-side tooling.

    <GameDK>$(BWOI_Win10SDK_Path)</GameDK>
    <GameDKLatest>$(BWOI_Win10SDK_Path)$(XDKEditionTarget)\</GameDKLatest>
    <GRDKLatest>$(GameDKLatest)GRDK\</GRDKLatest>
    <GXDKLatest>$(GameDKLatest)GXDK\</GXDKLatest>

<a id="BWOI-VSOverrides"></a>

## Visual Studio version-specific overrides

This section details version-specific Visual Studio properties that are required to be overridden to properly work with build without installation.

<a id="BWOI-VS2017Overrides"></a>

### Visual Studio 2017 platform overrides

The following property needs to be overridden to enable Visual Studio 2017 to properly find the `Platform` property and target file location.

#### Description of the property being overridden

`_PlatformFolder`: This overrides the Visual Studio path for determining where the `Platform` property and target files are located. This is defined in *Microsoft.Cpp.ToolsetLocation.props*.

Example property values, based on the previous extracted folder example, for reference:

    <_PlatformFolder>$(XdkEditionRootVS2017)</_PlatformFolder>

[Return to the top of this topic.](project-configuration-withoutinstall.md)

<a id="BWOI-VS2019Overrides"></a>

### Visual Studio 2019 platform overrides

Starting with Visual Studio 2019, the `_PlatformFolder` property was deprecated. The solution for supporting a project configuration without installation requires additional steps in Visual Studio 2019.

To do this, copy the required files from an installed version of Visual Studio 2019 to your extracted GDK path. For example:

* For v141 Platform Toolset: *C:\Program Files (x86)\Microsoft Visual Studio\2019\Enterprise\MSBuild\Microsoft\VC\v150*
* For v142 Platform Toolset: *C:\Program Files (x86)\Microsoft Visual Studio\2019\Enterprise\MSBuild\Microsoft\VC\v160*

These should be copied to match the folder structure of the following paths.

* For v141 Platform Toolset: *C:\ExtractedGDK\220300\Microsoft GDK\220300\GRDK\VS2019\flatDeployment\MSBuild\Microsoft\VC\v150\Platforms*
* For v142 Platform Toolset: *C:\ExtractedGDK\220300\Microsoft GDK\220300\GRDK\VS2019\flatDeployment\MSBuild\Microsoft\VC\v160\Platforms*
> [!NOTE]
> The previous example involves copying files directly into your *ExtractedGDK* folder. If you would prefer to keep the extracted GDK and Visual Studio VC Targets files separate for reference/maintainability, you can copy both the *ExtractedGDK* and VC Targets into a new combined folder path, as previously mentioned, for referencing by your build system.
>
>
> An example of this would be as follows.
>
> * Copy all the files from *C:\Program Files (x86)\Microsoft Visual Studio\2019\Enterprise\MSBuild\Microsoft\VC\v160* root (\*.\*) to a similar path within the *C:\ExtractedGDK\220300_CombinedGDK\\* folder.
> * Copy all the files from *C:\ExtractedGDK\220300\Microsoft GDK\* into a similar path within the *C:\ExtractedGDK\220300_CombinedGDK\\* folder.
> * Change *references/paths/properties* to point to *C:\ExtractedGDK\220300_CombinedGDK\\* equivalent paths.
>

After this is completed, the following properties need to be overridden when invoking the build in Visual Studio 2019 to properly find the `Platform` properties and target file location.

* Set `DisableInstalledVCTargetsUse` to `true`
* `VCTargetsPath15`: Overrides the Visual Studio path for determining where the Visual Studio 2017 Build Tools (v150) property and target files are located.
* `VCTargetsPath16`: Overrides the Visual Studio path for determining where the Visual Studio 2019 Build Tools (v160) property and target files are located.
> [!NOTE]
> Because the VC Targets Path property is part of defining the `XdkEditionRootVS2019` property, you can opt to avoid setting `XdkEditionRootVS2019` in this case.

An example property value, based on the previous extracted folder example, for reference:

    <DisableInstalledVCTargetsUse>true</DisableInstalledVCTargetsUse>
    <VCTargetsPath15>$(DurangoXdkInstallPath)$(XdkEditionTarget)\GXDK\VS2019\flatDeployment\MSBuild\Microsoft\VC\v150\</VCTargetsPath15>
    <VCTargetsPath16>$(DurangoXdkInstallPath)$(XdkEditionTarget)\GXDK\VS2019\flatDeployment\MSBuild\Microsoft\VC\v160\</VCTargetsPath16>
> [!NOTE]
> In the scenario where you would like to keep the *ExtractedGDK* and VC Targets separate for reference/maintainability, you can specify the `VCTargetsPath` properties as such (where *$(CombinedGDK)* is the new location that you've created).
>
> * Set `VCTargetsPath15` to *$(CombinedGDK)\v150\\*
> * Set `VCTargetsPath16` to *$(CombinedGDK)\v160\\*
>

### Visual Studio 2019 (16.5) property to respect Windows 10 SDK overrides

When using Visual Studio 2019 version 16.5 or later, another property needs to be set to ensure that the Windows 10 SDK property overrides are properly respected, shown as follows.

    <ClearDevCommandPromptEnvVars>false</ClearDevCommandPromptEnvVars>

[Return to the top of this topic.](project-configuration-withoutinstall.md)

<a id="BWOI-VS2022Overrides"></a>

### Visual Studio 2022 platform overrides

Starting with Visual Studio 2019, the `_PlatformFolder` property was deprecated. The solution for supporting a project configuration without installation requires additional steps in Visual Studio 2022.

To do this, copy the required files from an installed version of Visual Studio 2022 to your extracted GDK path. For example:

* For v141 Platform Toolset: *C:\Program Files\Microsoft Visual Studio\2022\Enterprise\MSBuild\Microsoft\VC\v150*
* For v142 Platform Toolset: *C:\Program Files\Microsoft Visual Studio\2022\Enterprise\MSBuild\Microsoft\VC\v160*
* For v143 Platform Toolset: *C:\Program Files\Microsoft Visual Studio\2022\Enterprise\MSBuild\Microsoft\VC\v170*

These should be copied to match the folder structure of the following paths.

* For v141 Platform Toolset: *C:\ExtractedGDK\220300\Microsoft GDK\220300\GRDK\VS2022\flatDeployment\MSBuild\Microsoft\VC\v150\Platforms*
* For v142 Platform Toolset: *C:\ExtractedGDK\220300\Microsoft GDK\220300\GRDK\VS2022\flatDeployment\MSBuild\Microsoft\VC\v160\Platforms*
* For v143 Platform Toolset: *C:\ExtractedGDK\220300\Microsoft GDK\220300\GRDK\VS2022\flatDeployment\MSBuild\Microsoft\VC\v170\Platforms*
> [!NOTE]
> The previous example involves copying files directly into your *ExtractedGDK* folder. If you would prefer to keep the extracted GDK and Visual Studio VC Targets files separate for reference/maintainability, you can copy both the *ExtractedGDK* and VC Targets into a new combined folder path, as previously mentioned, for referencing by your build system.
>
>
> An example of this would be as follows.
>
> * Copy all the files from *C:\Program Files\Microsoft Visual Studio\2022\Enterprise\MSBuild\Microsoft\VC\v170* root (\*.\*) to a similar path within the *C:\ExtractedGDK\220300_CombinedGDK\\* folder.
> * Copy all the files from *C:\ExtractedGDK\220300\Microsoft GDK\* into a similar path within the *C:\ExtractedGDK\220300_CombinedGDK\\* folder.
> * Change *references/paths/properties* to point to *C:\ExtractedGDK\220300_CombinedGDK\\* equivalent paths.
>

After this is completed, the following properties need to be overridden when invoking the build in Visual Studio 2022 to properly find the `Platform` properties and target file location.

* Set `DisableInstalledVCTargetsUse` to `true`
* `VCTargetsPath15`: Overrides the Visual Studio path for determining where the Visual Studio 2017 Build Tools (v150) property and target files are located.
* `VCTargetsPath16`: Overrides the Visual Studio path for determining where the Visual Studio 2019 Build Tools (v160) property and target files are located.
* `VCTargetsPath17`: Overrides the Visual Studio path for determining where the Visual Studio 2022 Build Tools (v170) property and target files are located.
> [!NOTE]
> Because the VC Targets Path property is part of defining the `XdkEditionRootVS2022` property, you can opt to avoid setting `XdkEditionRootVS2022` in this case.

An example property value, based on the previous extracted folder example, for reference:

    <DisableInstalledVCTargetsUse>true</DisableInstalledVCTargetsUse>
    <VCTargetsPath15>$(DurangoXdkInstallPath)$(XdkEditionTarget)\GXDK\VS2022\flatDeployment\MSBuild\Microsoft\VC\v150\</VCTargetsPath15>
    <VCTargetsPath16>$(DurangoXdkInstallPath)$(XdkEditionTarget)\GXDK\VS2022\flatDeployment\MSBuild\Microsoft\VC\v160\</VCTargetsPath16>
    <VCTargetsPath17>$(DurangoXdkInstallPath)$(XdkEditionTarget)\GXDK\VS2022\flatDeployment\MSBuild\Microsoft\VC\v170\</VCTargetsPath17>
> [!NOTE]
> In the scenario where you would like to keep the *ExtractedGDK* and VC Targets separate for reference/maintainability, you can specify the `VCTargetsPath` properties as such (where *$(CombinedGDK)* is the new location that you've created).
>
> * Set `VCTargetsPath15` to *$(CombinedGDK)\v150\\*
> * Set `VCTargetsPath16` to *$(CombinedGDK)\v160\\*
> * Set `VCTargetsPath17` to *$(CombinedGDK)\v170\\*
>

### Visual Studio 2022 property to respect Windows 10 SDK overrides

Additionally, another property needs to be set to ensure that the Windows 10 SDK property overrides are properly respected, shown as follows.

    <ClearDevCommandPromptEnvVars>false</ClearDevCommandPromptEnvVars>

[Return to the top of this topic.](project-configuration-withoutinstall.md)

<a id="BWOI-VSKnownIssues"></a>

## Known Issues with _PlatformFolder

There's a set of known issues with `_PlatformFolder` that currently have workarounds. They can be found as follows.

Failures due to incorrectly defining `_PlatformFolder` can be present. They can show up as the following:

* "The Platform for project 'ExtractedGDK.vcxproj' is invalid. 'Platform='Gaming.Xbox.XboxOne.x64'." This error can also appear if some other project is trying to follow a project-to-project reference to this project, this project has been unloaded or isn't included in the solution, and the referencing project doesn't build by using the same or an equivalent platform.

   ExtractedGDK *C:\Program Files (x86)\Microsoft Visual Studio\2017\Enterprise\Common7\IDE\VC\VCTargets\Microsoft.Cpp.InvalidPlatform.targets*

* "The `OutputPath` property isn't set for project 'ExtractedGDK.vcxproj'. Please check to make sure that you've specified a valid combination of configuration and platform for this project. Configuration='Release' Platform='Gaming.Xbox.XboxOne.x64'." This error might also appear if some other project is trying to follow a project-to-project reference to this project, this project has been unloaded or isn't included in the solution, and the referencing project doesn't build by using the same or an equivalent configuration or platform.

   ExtractedGDK *C:\Program Files\Microsoft Visual Studio\2022\Enterprise\MSBuild\Current\Bin\Microsoft.Common.CurrentVersion.targets*

The `_PlatformFolder` property should be overridden before additional imports. If you're still running into issues, you can try to do the following:

* Copy files from your *XdkEditionRootVS2017* directory to the `_PlatformFolder` location (*C:\Program Files (x86)\Microsoft Visual Studio\2017\Enterprise\Common7\IDE\VC\VCTargets\Platforms*).
* Create a junction between the *XdkEditionRootVS2017* directory and the `PlatformFolder` location (mklink /J *C:\Program Files (x86)\Microsoft Visual Studio\2017\Enterprise\Common7\IDE\VC\VCTargets\Platforms\Gaming.Xbox.XboxOne.x64* *C:\ExtractedGDK\220300\Microsoft GDK\220300\GXDK\VS2017\flatDeployment\Common7\IDE\VC\VCTargets\Platforms\Gaming.Xbox.XboxOne.x64*).

[Return to the top of this topic.](project-configuration-withoutinstall.md)

<a id="BWOI-Samples"></a>

## Project configuration samples

This section describes how to get code samples for scenarios without installation.

<a id="BWOI-CMakeSample"></a>

### CMake sample

The **CMakeExample** Sample, including instructions to get up and running, can be downloaded for reference from the [Xbox Developer Downloads](https://aka.ms/gdkdl) page. Under "Select file type," choose "GDK," and under "Select build/version number," choose the latest "Samples only" item.

[Return to the top of this topic.](project-configuration-withoutinstall.md)

<a id="BWOI-MSBuildSample"></a>

### MSBuild sample

The **BWOIExample** Sample, including instructions to get up and running, can be downloaded for reference from the [Xbox Developer Downloads](https://aka.ms/gdkdl) page. Under "Select file type," choose "GDK," and under "Select build/version number," choose the latest "Samples only" item.

[Return to the top of this topic.](project-configuration-withoutinstall.md)

<a id="BWOI-SeeAlso"></a>

## See also

[Using tools without installing the Microsoft Game Development Kit](tools-usage-withoutinstall.md)

[Using the Microsoft Game Development Kit without installation](gc-usingwithoutinstall-toc.md)