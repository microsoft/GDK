---
author: aablackm
title: Project templates in Visual Studio for PC game development
description: Describes how the Microsoft Game Development Kit installs several Visual Studio C++ project templates for making Windows PC game titles.
kindex:
- Project Templates in Visual Studio for PC Game Development
- templates, Visual Studio
- project templates, Visual Studio
- properties, Visual Studio
ms.author: stevenpr
ms.topic: conceptual
edited: 05/20/2020
security: public
---

# Project templates in Visual Studio for PC game development

This topic describes the Windows PC games project templates that are available in Visual Studio.


## Project templates  

The Microsoft Game Development Kit (GDK) installs the following Visual Studio C++ project templates.

* **Direct3D 12 Desktop Game:** A project for a Windows game that uses Direct3D 12 and C++

* **Direct3D 12 Desktop Game Makefile:** A project for a Windows game that uses Direct3D 12 and C++ by using an external build system

* **Desktop Static Library:** A project for a Windows static library

* **Desktop DLL:** A project for a Windows dynamic-link library

## Locating the Microsoft Game Development Kit (GDK) project templates

The way in which you find project templates differs, depending on whether you're using Visual Studio 2019 or Visual Studio 2017. In Visual Studio 2019, the templates are located by searching and filtering in the **Create a new project** dialog box. The Microsoft Game Development Kit (GDK) templates can be found by filtering to the **C++** language, the **Windows** platform, and the **Games** project type as shown in the following screenshot.

![Screenshot of the Create a new project dialog box in Visual Studio 2019 for locating Windows PC gaming templates](../../../../resources/gamecore/secure/images/en-us/vs_2019_pc_templates.png)

In Visual Studio 2017, the Windows PC game templates are located by expanding the **Visual C++**, **Gaming**, and **Microsoft Game Development Kit** nodes in the **New Project** dialog box as shown in the following screenshot.

![Screenshot of the New Project dialog box in Visual Studio 2017 for locating Windows PC gaming templates](../../../../resources/gamecore/secure/images/en-us/vs_2017_pc_templates.png)


## The Gaming.Desktop.x64 platform, msbuild files, and properties  

The Microsoft Game Development Kit (GDK) defines an msbuild platform named Gaming.Desktop.x64 to be used for Windows PC game development. Gaming.Desktop.x64 includes a set of msbuild properties and targets files that define the required preprocessor directives (such as _GAMING_DESKTOP), and setup paths such that, for example, extension libraries, include files, and libraries are correctly found under *C:\Program Files (x86)\Microsoft GDK\edition\GRDK* when your game is built. For specific details about the msbuild properties and targets that are defined by the Gaming.Desktop.x64 platform, see [Configuring projects without installing the Microsoft Game Development Kit](../../tools-console/usingwithoutinstall/project-configuration-withoutinstall.md).

## See also

[Visual Studio (for PC game development)](gr-visualstudio-toc.md)