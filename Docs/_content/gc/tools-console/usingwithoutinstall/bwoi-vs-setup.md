---
author: kevincog
title: Visual Studio toolset setup
description: Lists the required Visual Studio and Visual Studio Build Tools components for building without installing the Microsoft Game Development Kit.
kindex:
- Workloads for building without installing the Microsoft Game Development Kit
- Component IDs for building without installing the Microsoft Game Development Kit
- Visual Studio workloads and component IDs for building without installing the Microsoft Game Development Kit
ms.author: kevincog
ms.topic: conceptual
edited: 00/00/0000
security: public
---

# Visual Studio toolset setup for building without installing the Microsoft Game Development Kit

For building Microsoft GDK projects, you can set up [Visual Studio 2022](https://visualstudio.microsoft.com/downloads/) (which can build v141, v142, and v143 platform toolset VC++ projects), [Visual Studio 2019](https://visualstudio.microsoft.com/older-downloads/) (which can build v141 and v142 platform toolset VC++ projects), or [Visual Studio 2017](https://visualstudio.microsoft.com/vs/older-downloads/) (which can only build v141 platform toolset VC++ projects). You can also use either a full Visual Studio install or Build Tools for Visual Studio. Be sure to install the following components:  

## Visual Studio 2022

### Full Visual Studio Install for VS 2022

| Workload | Component ID (for command line install) |   
| --- | --- |  
| Game Development with C++ | Microsoft.VisualStudio.Workload.NativeGame |
| Required Component: Windows 10 SDK (10.0.19041.0) | Microsoft.VisualStudio.Component.Windows10SDK.19041 |
| Optional Component: MSVC v142 - VS 2019 C++ x64/x86 build tools | Microsoft.VisualStudio.ComponentGroup.VC.Tools.142.x86.x64 |
| Optional Component: MSVC v141 - VS 2017 C++ x64/x86 build tools | Microsoft.VisualStudio.Component.VC.v141.x86.x64 |
| Optional Component: C++ Clang tools for Windows | Microsoft.VisualStudio.ComponentGroup.NativeDesktop.Llvm.Clang |
| Optional: Desktop development with C++ | Microsoft.VisualStudio.Workload.NativeDesktop |



### Build Tools Visual Studio for VS 2022

| Workload | Component ID (for command line install) |   
| --- | --- |  
| Desktop development with C++ | Microsoft.VisualStudio.Workload.NativeDesktop |
| Required Component: Windows 10 SDK (10.0.19041.0) | Microsoft.VisualStudio.Component.Windows10SDK.19041 |
| Required Component: MSVC v143 - VS 2022 C++ x64/x86 build tools | Microsoft.VisualStudio.Component.VC.Tools.x86.x64 |
| Optional Component: MSVC v142 - VS 2019 C++ x64/x86 build tools | Microsoft.VisualStudio.ComponentGroup.VC.Tools.142.x86.x64 |
| Optional Component: MSVC v141 - VS 2017 C++ x64/x86 build tools | Microsoft.VisualStudio.Component.VC.v141.x86.x64 |
| Optional Component: C++ Clang tools for Windows | Microsoft.VisualStudio.ComponentGroup.NativeDesktop.Llvm.Clang |


## Visual Studio 2019

### Full Visual Studio Install for VS 2019

| Workload | Component ID (for command line install) |   
| --- | --- |  
| Game Development with C++ | Microsoft.VisualStudio.Workload.NativeGame |
| Required Component: Windows 10 SDK (10.0.19041.0) | Microsoft.VisualStudio.Component.Windows10SDK.19041 |
| Optional Component: MSVC v141 - VS 2017 C++ x64/x86 build tools | Microsoft.VisualStudio.Component.VC.v141.x86.x64 |
| Optional Component: C++ Clang-cl for Windows<br />C++ Clang-cl for v142 build tools (x64/x86) | Microsoft.VisualStudio.ComponentGroup.NativeDesktop.Llvm.Clang |
| Optional: Desktop development with C++ | Microsoft.VisualStudio.Workload.NativeDesktop |



### Build Tools Visual Studio for VS 2019

| Workload | Component ID (for command line install) |   
| --- | --- |  
| Desktop development with C++ | Microsoft.VisualStudio.Workload.NativeDesktop |
| Required Component: Windows 10 SDK (10.0.19041.0) | Microsoft.VisualStudio.Component.Windows10SDK.19041 |
| Required Component: MSVC v142 - VS 2019 C++ x64/x86 build tools (Latest) | Microsoft.VisualStudio.Component.VC.Tools.x86.x64 |
| Optional Component: MSVC v141 - VS 2017 C++ x64/x86 build tools | Microsoft.VisualStudio.Component.VC.v141.x86.x64 |
| Optional Component: C++ Clang-cl for Windows<br />C++ Clang-cl for v142 build tools (x64/x86) | Microsoft.VisualStudio.ComponentGroup.NativeDesktop.Llvm.Clang |


## Visual Studio 2017

### Full Visual Studio Install for VS 2017

| Workload | Component ID (for command line install) |   
| --- | --- |  
| Game Development with C++ | Microsoft.VisualStudio.Workload.NativeGame |  
| Optional: Desktop development with C++ | Microsoft.VisualStudio.Workload.NativeDesktop |



### Build Tools Visual Studio for VS 2017


| Workload | Component ID (for command line install) |   
| --- | --- |  
| C++ Build Tools | Microsoft.VisualStudio.Workload.VCTools |  




> For VS 2017 (15.9 update), the Windows 10 SDK (17763) will be installed by default. To get the Windows 10 SDK (19041) you need to install it [stand-alone](https://developer.microsoft.com/en-US/windows/downloads/windows-10-sdk) or use it as a [NuGet](https://www.nuget.org/packages/Microsoft.Windows.SDK.CPP.x64/) package.
