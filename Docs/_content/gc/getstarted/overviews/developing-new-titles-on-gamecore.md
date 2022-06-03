---
author: M-Stahl
title: Developing a new title with the GDK in Visual Studio
description: How to create a new Microsoft Game Development Kit (GDK) project once your development environment is set up.
kindex: Developing a new title with the GDK
ms.author: douglau
ms.topic: conceptual
edited: 10/03/2019
security: public
---

# Developing a new title with the Microsoft Game Development Kit in Visual Studio

This topic describes how to create a new Microsoft Game Development Kit (GDK) project in Visual Studio.

Gaming titles developed on Microsoft Game Development Kit (GDK) can target PCs, Xbox consoles, or both platforms (if a common codebase is used). These gaming titles can also have capabilities designed to take advantage of the features unique to each platform. You choose the target platform and whether (and how extensively) device extensions are used.

## Getting started with the project templates in Visual Studio for Microsoft Game Development Kit (GDK)

When you install the Gaming eXtensions Development Kit (GXDK) on a development computer with Visual Studio, the following templates are also installed.  
* Four project templates for targeting the PC
* Four project templates for targeting the Xbox console

| Target platform | Template | Description |
| --- | --- | --- |
| Desktop | Direct3D 12 Desktop Game | In the Visual Studio project system, creates a project that builds a standalone PC game executable |
| | Direct3D 12 Desktop Game Makefile | Creates a project that's suitable for building a PC game from a makefile by using a command prompt |
| | Desktop Static Library | In the Visual Studio project system, creates a project that builds a static library suitable for inclusion in a Microsoft Game Development Kit (GDK) game that targets PCs |
| | Desktop DLL | In the Visual Studio project system, creates a project that builds a dynamic-link library suitable for inclusion in a Microsoft Game Development Kit (GDK) game that targets PCs |
| Console | Direct3D 12 Xbox Game | In the Visual Studio project system, creates a project that builds a standalone game executable that targets the Xbox console |
| | Direct3D 12 Xbox Game Makefile | Creates a project that's suitable for building an Xbox console game from a makefile by using a command prompt |
| | Xbox Static Library | In the Visual Studio project system, creates a project that builds a static library suitable for inclusion in a Microsoft Game Development Kit (GDK) game that targets the Xbox console |
| | Xbox DLL | In the Visual Studio project system, creates a project that builds a dynamic-link library suitable for inclusion in a Microsoft Game Development Kit (GDK) game that targets the Xbox console |


To access these templates:
1. Open Visual Studio.
1. Choose **File -> New -> Project**. The New Project dialog appears.
1. In the New Project Dialog, expand **Installed -> Visual C++ -> Gaming -> Microsoft Game Development Kit** and select the month that matches your GDK release (in Visual Studio 2019, search for the above projects by name).
1. From the list of Microsoft Game Development Kit (GDK) project templates, select the project template you want.
1. Click **OK**.

## Choosing a template

If you're starting a new Microsoft Game Development Kit (GDK) project, one of the first things you need to do is decide which Microsoft Game Development Kit (GDK) template to use. The answer depends on whether your game is targeting PCs, Xbox, or both.

### Games for PCs only

The Direct3D 12 Desktop Game template is the common starting point. Here are some of the template's key features.

* Uses Windows API Family WINAPI_FAMILY_DESKTOP_APP and links against typical PC libraries, including kernel32.lib, user32.lib, and gdi32.lib. The full set of PC APIs is available for use in the game.

* Includes the necessary headers and libraries. The template is ready for the addition of the D3D12 graphics implementation that's compatible with the PC.

* Includes XGameRuntime.h and links to XGameRuntime.lib. All the Microsoft Game Development Kit (GDK) Gaming Runtime capabilities are ready to use.

* Declares a build configuration that's based on platform Gaming.Desktop.x64, which builds an x64 target with the expectation that you're iterating on the game locally (on your development computer) by using the local debugger.


### Games for Xbox

The Direct3D 12 Xbox Game template is the common starting point. Here are some of the template's key features.

* Uses Windows API Family WINAPI_FAMILY_GAMES and links against XGamePlatform.lib, restricting the set of core platform APIs to those guaranteed to be supported on the Xbox Game OS.

* Includes the necessary headers and libraries. The template is ready for the addition of the D3D12 graphics implementation that takes full advantage of Xbox device-specific hardware extensions.

* Includes XGameRuntime.h and links to XGameRuntime.lib. All the Microsoft Game Development Kit (GDK) Gaming Runtime capabilities are ready to use.

* Declares a build configuration that's based on platform Gaming.Xbox.XboxOne.x64, which builds an x64 target with the expectation that you're iterating on the game by using an Xbox One ERA dev kit set for remote debugging.


### Games for PCs and Xbox

We recommend that you start with one of the two previously mentioned templates and add a second build configuration within your project.
For example, if you start with a **Direct3D 12 Desktop Game** project, which automatically includes a build configuration for the **Gaming.Desktop.x64** platform, you can add a second build configuration which has the platform set to **Gaming.Xbox.XboxOne.x64**.
When you build your project, Visual Studio then builds one version of your game for the PC and another for the Xbox console.

This recommended approach requires you to tailor your source code (either by using `#define/#ifdef` or by partitioning platform-specific code into separate DLLs) such that the PC configuration of your game uses "stock" Direct3D 12, and the Xbox configuration of your game uses the device-extension equivalent Direct3D 12.x.
As you switch your active configuration between **Gaming.Desktop.x64** and **Gaming.Xbox.XboxOne.x64**, tooling settings change appropriately, such as which debugger to use and which libraries to link against.

## Next steps

After verifying your GDK installation by creating a new project, your next steps depend on whether you are developing a PC game or an Xbox game.

* If you are developing a PC game you should follow the steps in [Get started with PC game development](../../get-started-with-pc-dev/gr-get-started-with-pc-dev-toc.md).  

* If you are developing an Xbox game you should follow the steps in [Get started with Xbox console development (NDA topic)](../gc-getstarted-toc.md).  



## See also
[MicrosoftGame.Config Overview](../../system/overviews/microsoft-game-config/MicrosoftGameConfig-Overview.md)  
[Getting started with the Microsoft Game Development Kit (GDK) (NDA topic)](../gc-getstarted-toc.md)