---
author: scotmi
title: Visual Studio 2022 support notes
description: Describes Microsoft Game Development Kit (GDK) support for using Visual Studio 2022 to build Windows PC games.
kindex:
- Visual Studio 2022 Support Notes
- support notes, Visual Studio 2022
ms.author: stevenpr
ms.topic: conceptual
edited: 05/20/2020
security: public
---

# Visual Studio 2022 support notes

This topic describes Microsoft Game Development Kit (GDK) support for Visual Studio 2022. The original release of Visual Studio 2022, [version 17.0](https://visualstudio.microsoft.com/), and the first update, [version 17.1](https://visualstudio.microsoft.com/) are currently supported for Microsoft Game Development Kit (GDK) development.

## Visual Studio 2022 support in the October 2021 and March 2022 versions of the Microsoft Game Development Kit (GDK)

The March 2022 version of the Microsoft Game Development Kit (GDK) is the first version to officially support Visual Studio 2022.  The October 2021 Microsoft Game Development Kit (GDK) included a Preview of Visual Studio 2022 support.  If you manually installed the Visual Studio 2022 .vsix files that shipped alongside the October 2021 GDK, you'll need to uninstall those files before installing the March 2022 GDK.  Failing to do so will result in debugging and deployment failures when using Visual Studio 2022.  

The following command line can be used to uninstall the October 2021 GDK .vsix files:

```cpp
vsixinstaller /skuName:Enterprise /skuVersion:17.1 /appIdName:VS /appIdInstallPath:"C:\Program Files\Microsoft Visual Studio\2022\Enterprise" /uninstall:Microsoft.Gaming.GDK.PC.v143.211004 /uninstall:Microsoft.Gaming.GDK.PC.v143.Templates /uninstall:Microsoft.Gaming.GDK.PC /uninstall:Microsoft.Gaming.GDK.Xbox.v143.211004 /uninstall:Microsoft.Gaming.GDK.Xbox.v143.Templates /uninstall:Microsoft.Gaming.GDK.Xbox
``` 

Note that this command may vary depending on which edition of Visual Studio 2022 is installed and which .vsix files were installed initially.

If the March 2022 Microsoft Game Development Kit (GDK) was installed prior to uninstalling the October 2021 GDK .vsix files, repair the March 2022 GDK after uninstalling the October 2021 .vsix files to get back into a working state. 

## Installing Visual Studio 2022

The Microsoft Game Development Kit (GDK) supports development with either the **Professional** edition or the **Enterprise** edition of Visual Studio 2022. The Community edition isn't supported. When installing Visual Studio 2022, you must select the **Game development with C++** workload during setup as shown in the following screenshot.

![Installing the Game Development with C++ workload with Visual Studio 2022](../../../../resources/gamecore/secure/images/en-us/vs2022_workloads_game_development.png)

In addition to the core C++ tools that you need for game development, make sure the **Windows 10 SDK (19041)** component is installed to provide the Windows 10 SDK required to build games with the Microsoft Game Development Kit (GDK).

> Windows 10 SDK (20348) or Windows SDK for Windows 11 (10.0.22000) can also be used, but is not required.

While it's not required, installing the **Desktop development with C++** workload provides additional tools and samples that you might find helpful.  For example, **Desktop development with C++** is required if you are building with the Clang/LLVM toolset.

If you're building a game that uses Unity, install the **Game Development with Unity** workload.

## Installing optional toolsets

The Visual Studio 2022 version of the MVSC build tools (version **v143**) is installed with the **Game development with C++** workload.  In addition to the **v143** toolset, the Microsoft Game Development Kit (GDK) also supports building with the following toolsets:

* v142 (the Visual Studio 2019 toolset)
* v141 (the Visual Studio 2017 toolset)
* the C++ Clang tools for windows

This flexibility allows you to upgrade to the Visual Studio 2022 IDE without updating your toolset.

The optional toolsets can be found under the **Desktop Development with C++** workload, or by searching the **Individual Components** in the Visual Studio installation dialog.

![Selecting optional toolsets when installing Visual Studio 2022](../../../../resources/gamecore/secure/images/en-us/vs2022_optional_toolsets.png)

## Selecting a toolset for a project

The toolset to use for a project is specified using the **Platform Toolset** property from the project's property page.

![Specifying the toolset to use when building a project](../../../../resources/gamecore/secure/images/en-us/vs2022_specify_a_toolset.png)

The **PlatformToolset** property can also be specified manually in the project file, as shown in the following property group.

```xml
<PropertyGroup Condition="'$(Configuration)|$(Platform)'=='Debug|Gaming.Xbox.Scarlett.x64'" Label="Configuration">
  <ConfigurationType>Application</ConfigurationType>
  <PlatformToolset>v142</PlatformToolset>
  <UseDebugLibraries>true</UseDebugLibraries>
  <CharacterSet>Unicode</CharacterSet>
  <EmbedManifest>false</EmbedManifest>
  <GenerateManifest>false</GenerateManifest>
</PropertyGroup>
```
## Visual Studio 2022 Servicing Model

Visual Studio 2022 includes a new servicing model that allows you to select a servicing baseline, and then only get updates for that baseline.  This new model replaces the servicing models from previous versions of Visual Studio which strongly encouraged the use of the latest available version.  See [Visual Studio Product Lifecycle and Servicing](/en-us/visualstudio/productinfo/vs-servicing) for more details on the Visual Studio 2022 servicing model.

## Feedback

Bug reports for the **Visual C++ compiler** should be reported (if possible) via Visual Studio _Report a Problem..._. See [Microsoft Docs](/visualstudio/ide/how-to-report-a-problem-with-visual-studio) and the [Developer Community](https://aka.ms/feedback/report?space=62) website. Be sure to read [this page](https://aka.ms/compilerbug) for details on creating a good bug report for the compiler.
> [!NOTE]
> You can add a comment to a public report issue marked as "Microsoft only" if additional NDA information is required to reproduce the issue.

For bug reporting for the **clang/LLVM for Windows compiler**, use https://bugs.llvm.org/

For bug reports for the **Microsoft Standard C++ Library** (a.k.a. STL), use https://github.com/microsoft/STL/issues

As always, feel free to reach out to your *Microsoft Representative* for critical issues that need escalation.

## See also

[Visual Studio for PC Game Development](gr-visualstudio-toc.md)
