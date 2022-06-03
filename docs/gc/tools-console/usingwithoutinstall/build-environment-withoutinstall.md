---
author: aablackm
title: Configuring the build environment without installing the Microsoft Game Development Kit (GDK)
description: Describes the process of configuring the build environment without installing Microsoft Game Development Kit (GDK).
kindex:
- Configuring Build Environment without installing Microsoft Game Development Kit (GDK)
- evnvar, variables, environment
- Build Environment, Batch, SET
- Command Prompt
- GamingXboxVars.cmd
- GamingDesktopVars.cmd
- Environment Variables
- without Install
- advanced
- MSBuild, Environment, Projects
ms.author: zhooper
ms.topic: conceptual
edited: 11/11/2019
security: public
---

# Configuring the build environment without installing the Microsoft Game Development Kit

This topic covers configuring the build environment and command prompts within the extracted Microsoft Game Development Kit (GDK) because they require additional steps after the Microsoft Game Development Kit (GDK) is extracted to work properly. 

## Environment variable command files

Included in the Microsoft Game Development Kit (GDK) is a set of .cmd files that are used to define the environment variables. They're needed to properly create command prompts for access to command line operations (including building with MSBuild).

There are two instances of these .cmd files. They can be found in the following example extracted files locations.

* C:\ExtractedGDK\220300\Microsoft GDK\Command Prompts\GamingXboxVars.cmd  
* C:\ExtractedGDK\220300\Microsoft GDK\Command Prompts\GamingDesktopVars.cmd  

Inspecting these files can help get a better insight on how the environment variables are defined and detected. Most environment variables are set based on an IF NOT check so they can be overridden if set ahead of execution.

The first input variable, %1, is used to determine the platform and Visual Studio version. The values available for this are the following:

* GamingXboxVS2017
* GamingXboxVS2019
* GamingXboxVS2022
* GamingXboxScarlettVS2017
* GamingXboxScarlettVS2019
* GamingXboxScarlettVS2022
* GamingDesktopVS2017
* GamingDesktopVS2019
* GamingDesktopVS2022

An example of this usage is (from the command line) GamingXboxVars.cmd&nbsp;GamingXboxVS2022.

This sets up a command prompt with environment variables that are defined for working with Xbox and Visual Studio 2022. The following sections detail which environment variables must be overridden to set up a command prompt that references extracted kit files.

## Environment variable configuration for Gaming.Xbox.XboxOne.x64 and Gaming.Xbox.Scarlett.x64

Before calling the **GamingXboxVars.cmd** in Microsoft Game Development Kit (GDK) command prompts, the following environment variables should be set to refer to Extracted locations and override local installation checks.

* **GXDKEDITION:** The edition number of the Gaming Xbox Development Kit (GXDK). For example, 220300 refers to the March 2022 Microsoft Game Development Kit (GDK).
* **GameDK:** The root location of the Microsoft Game Development Kit (GDK).
* **GameDKLatest:** The latest edition number folder under the root location.
* **WindowsSdkDir:** The location of the Windows 10 SDK.
* **GamingGRDKBuild:** The location of the Gaming Runtime Development Kit (GRDK)-specific files.
* **GamingGXDKBuild:** The location of the Microsoft Game Development Kit (GDK)-specific files.
* **VSInstallDir:** The location of the Visual Studio installation.

Example commands for setting these environment variables to point to example extracted files are as follows.

```cmd
SET GXDKEDITION=220300
SET "GameDK=C:\ExtractedGDK\%GXDKEDITION%\Microsoft GDK\"
SET "GameDKLatest=%GameDK%%GXDKEDITION%\"
SET "WindowsSdkDir=C:\ExtractedWin10SDK\Windows Kits\10\"
SET "GamingGRDKBuild=%GameDKLatest%GRDK\"
SET "GamingGXDKBuild=%GameDKLatest%GXDK\"
SET "VSInstallDir=C:\Program Files\Microsoft Visual Studio\2022\Enterprise\"
```

Use the **GamingXboxVars.cmd** input variable, described in the previous section, to switch between Xbox One and Xbox Series X&#124;S environments.

## Environment variable configuration for Gaming.Desktop.x64

Before calling the **GamingDesktopVars.cmd** in Microsoft Game Development Kit (GDK) command prompts, the following environment variables should be set to refer to Extracted locations and override local installation checks.

* **GRDKEDITION:** The edition number of the Gaming Runtime Development Kit (GRDK). For example, 220300 refers to the March 2022 Microsoft Game Development Kit (GDK).
* **GameDK:** The root location of the Microsoft Game Development Kit (GDK).
* **GameDKLatest:** The latest edition number folder under the root location.
* **WindowsSdkDir:** The location of the Windows 10 SDK.
* **GamingGRDKBuild:** The location of the Gaming Runtime Development Kit (GRDK)-files.
* **VSInstallDir:** The location of the Visual Studio installation.

Example commands for setting these environment variables to point to example extracted files are as follows.

```cmd
SET GRDKEDITION=220300
SET "GameDK=C:\ExtractedGDK\%GRDKEDITION%\Microsoft GDK\"
SET "GameDKLatest=%GameDK%%GRDKEDITION%\"
SET "WindowsSdkDir=C:\ExtractedWin10SDK\Windows Kits\10\"
SET "GamingGRDKBuild=%GameDKLatest%GRDK\"
SET "VSInstallDir=C:\Program Files\Microsoft Visual Studio\2022\Enterprise\"
```

## Command-prompt setup

The command prompts, when the Microsoft Game Development Kit (GDK) is installed, are created as shortcuts to the appropriate Microsoft Game Development Kit (GDK) command prompts .cmd file. An example of this is as follows.

C:\Windows\System32\cmd.exe /k "C:\ExtractedGDK\220300\Microsoft GDK\Command Prompts\GamingXboxVars.cmd" GamingXboxVS2022

Creating a shortcut with the previous contents will provide the same environment setup as the installed command prompt scripts. Wrapping a script that sets the above environment variables and then executes this with the appropriate input variable would be a recommended way to configure this.

## Lib & Include references from the Microsoft Game Development Kit (GDK)

The environment variable script sets the following locations for Lib & Include paths. The following examples, for Gaming.Xbox.Scarlett.x64, are provided for reference and shouldn't be overridden (The MSVC Tools version, in this example, is derived from the VCToolsVersion environment variable).

```cmd
INCLUDE=C:\Program Files (x86)\Windows Kits\10\Include\um;C:\Program Files (x86)\Windows Kits\10\Include\shared;C:\Program Files (x86)\Windows Kits\10\Include\winrt;C:\Program Files (x86)\Windows Kits\10\Include\cppwinrt;C:\Program Files (x86)\Windows Kits\10\Include\ucrt;C:\ExtractedGDK\220300\Microsoft GDK\220300\GXDK\gamekit\include\Scarlett;C:\ExtractedGDK\220300\Microsoft GDK\220300\GXDK\gamekit\include;C:\ExtractedGDK\220300\Microsoft GDK\220300\GRDK\gamekit\include;C:\Program Files\Microsoft Visual Studio\2022\Enterprise\VC\Tools\MSVC\14.30.30705\INCLUDE;

LIB=C:\Program Files (x86)\Windows Kits\10\Lib\um\x64;C:\Program Files (x86)\Windows Kits\10\Lib\ucrt\x64;C:\ExtractedGDK\220300\Microsoft GDK\220300\GXDK\gamekit\lib\amd64\Scarlett;C:\ExtractedGDK\220300\Microsoft GDK\220300\GXDK\gamekit\lib\amd64;C:\ExtractedGDK\220300\Microsoft GDK\220300\GRDK\gamekit\lib\amd64;C:\Program Files\Microsoft Visual Studio\2022\Enterprise\VC\Tools\MSVC\14.30.30705\lib\x64;

LIBPATH=C:\Windows\Microsoft.NET\Framework\v4.0.30319;C:\Program Files\Microsoft Visual Studio\2022\Enterprise\VC\
```

## Lib & Include references from the Windows 10 SDK

The environment variable script sets the following locations for Lib & Include paths for the Windows 10 SDK. The following examples are provided for reference and shouldn't be overridden.

```cmd
WindowsIncludeRoot=C:\Program Files (x86)\Windows Kits\10\Include\
WindowsLibRoot=C:\Program Files (x86)\Windows Kits\10\Lib\
```

## See also

[Configuring projects without installing the Microsoft Game Development Kit](project-configuration-withoutinstall.md)

[Using the Microsoft Game Development Kit without installation](gc-usingwithoutinstall-toc.md)