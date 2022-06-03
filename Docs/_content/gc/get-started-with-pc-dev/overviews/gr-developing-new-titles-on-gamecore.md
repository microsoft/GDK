---
author: M-Stahl
title: Starting development of a new title using Gaming Runtime
description: Starting development of a new title using Gaming Runtime
kindex: Starting development of a new title using Gaming Runtime
ms.author: douglau
ms.topic: conceptual
edited: 07/21/2020
security: public
---

# Starting development of a new title using Gaming Runtime

This topic describes how to get started developing a new title by using the Gaming Runtime.

## Getting started by using Visual Studio project templates for the Gaming Runtime
 
When the Microsoft Game Development Kit (GDK) is installed on a development PC with Visual Studio, it installs four project templates for targeting PC Desktop as shown in the following table.  
  
| Target platform | Template | Description |
| --- | --- | --- |
| Desktop | Direct3D 12 Desktop Game | Creates a project in the Visual Studio project system that builds a standalone PC game executable. |
| Desktop | Direct3D 12 Desktop Game Makefile | Creates a project that's suitable for building a PC Desktop game from a `makefile` by using a command prompt. |
| Desktop | Desktop Static Library | Creates a project in the Visual Studio project system that builds a static library. It's suitable to include in a game that's targeting PC Desktop. |
| Desktop | Desktop DLL | Creates a project in the Visual Studio project system that builds a DLL. It's suitable to include in a game that's targeting PC Desktop. |  
    

To access these templates:  

1. Open Visual Studio.
1. Select **File** > **New** > **Project**. The **New Project** dialog box will appear.
1. In the **New Project** dialog, expand **Installed** > **Visual C++** > **Gaming** > **Microsoft Game Development Kit**. Select the month that matches your Microsoft Game Development Kit (GDK) release. (In Visual Studio 2019, search for the previously mentioned projects by name.)
1. From the list of Microsoft Game Development Kit project templates, select the project template that you want.
1. Select **OK**.
  
## Use the appropriate template

#### Game exclusively targeting PC Desktop 

If you're developing a game that exclusively targets PC devices, the Direct3D 12 Desktop Game template is the common starting point. Some of the key aspects of this template include the following:

* Uses Windows API Family `WINAPI_FAMILY_DESKTOP_APP` and links against typical PC Desktop libraries, including *kernel32.lib*, *user32.lib*, and *gdi32.lib*. As a result, the full breadth of PC Desktop APIs are available for use in the game.
* Includes the necessary headers and libraries so that the template is ready for the addition of the Direct3D 12 graphics implementation that's compatible with PC Desktop.
* Links against *XGameRuntime.lib* and includes the necessary headers so that all of the Gaming Runtime capabilities are ready for use. 
* Declares a build configuration that's based on the platform "Gaming.Desktop.x64", which builds an x64 target with the expectation that you plan to iterate on the game locally (on your development PC) by using the local debugger.
* Creates a *MicrosoftGame.config* file with placeholder information that you can later fill in with your title's information from Partner Center.



## See also

[MicrosoftGame.Config overview](../../system/overviews/microsoft-game-config/MicrosoftGameConfig-Overview.md)  

[Getting started with the Gaming Runtime](../gr-get-started-with-pc-dev-toc.md)