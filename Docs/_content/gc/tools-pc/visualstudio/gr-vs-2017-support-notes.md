---
author: scotmi
title: Visual Studio 2017 support notes
description: This topic describes Microsoft Game Development Kit (GDK) support for Visual Studio 2017
kindex:
- Visual Studio 2017 Support Notes
- support notes, Visual Studio 2017
ms.author: stevenpr
ms.topic: conceptual
edited: 12/12/2019
security: public
---

# Visual Studio 2017 support notes
This topic describes Microsoft Game Development Kit (GDK) support for Visual Studio 2017. The release to manufacturing (RTM) version of Visual Studio 2017 and the latest update (currently [version 15.9](https://www.visualstudio.com/news/releasenotes/vs2017-relnotes)) are supported for Microsoft Game Development Kit development.    

## Installing Visual Studio 2017  

The Microsoft Game Development Kit (GDK) supports development with either the Professional or Enterprise SKUs of Visual Studio 2017.  The Community edition is not supported.  When installing Visual Studio 2017, you must select the *Game Development with C++* workload during setup.

![Game development with C++](../../../../resources/gamecore/secure/images/en-us/vs_workloads_game_devlopment.png)

While not required, installing the *Desktop development with C++* workload, provides additional tools and samples that you might find helpful.

The version of the Windows 10 SDK needed to build PC games with the Microsoft Game Development Kit (GDK) is not included in Visual Studio 2017 setup.  The required version of the Windows 10 SDK (10.0.19041.0) can be downloaded directly from the [Windows Dev Center](https://aka.ms/windowssdk).

## Exception specifiers  

C++11 introduced a new, streamlined method of annotating exception-throwing behavior of functions. At the same time, older exception specifiers were deprecated and removed as of C++17. For details, see [Exception Specifications (throw, noexcept) (C++)](/cpp/cpp/exception-specifications-throw-cpp?view=vs-2017).

To support this change, there’s been several modifications to the C++ compiler over the update cycle for Visual Studio 2017 as follows.

- As of Visual Studio 2017 (15.5 update), use of C++14 mode with /permissive- or use of C++17 mode results in new warnings and errors related to the deprecation of **throw()**, **throw(…)**, **throw(list)** in favor of **noexcept**, **noexcept(false)**, as well as when detecting mismatches between declarations of functions with respect to their exception specifiers. These can be disabled by using /Zc:noexceptTypes- as a workaround for non-conforming code.

- As of Visual Studio 2017 (15.8 update), the preprocessor define _NOEXCEPT, which was used internally by the Visual C++ Runtime, has been completely removed. The library instead uses the **noexcept** keyword directly in all conditions. Any external code or third-party code that used the internal _NOEXCEPT macro needs to be updated. It should use noexcept directly, but failing that, you need to define a local preprocessor define value directly instead of relying on the Visual C++ Runtime to define it.

```cpp
  #ifndef _NOEXCEPT
  #define _NOEXCEPT noexcept
  #endif
```

C++ destructors are implicitly **noexcept**. Also, the [C++ Core Guidelines](https://github.com/isocpp/CppCoreGuidelines) recommend using the **noexcept** keyword for all default constructors, move constructors, move operators, and swap functions.

## Known issues

* [.NET Core updates delivered through Microsoft Update](https://devblogs.microsoft.com/dotnet/net-core-updates-coming-to-microsoft-update/) can block Microsoft Game Development Kit (GDK) installation. To resolve this issue, update your Visual Studio instance or uninstall the [workloads that contain Microsoft.NET.Core.Component.SDK.2.1](/visualstudio/install/workload-component-id-vs-enterprise?view=vs-2017&preserve-view=true) through the Visual Studio Installer then retry (un)installing the Microsoft Game Development Kit (GDK).

## See also
[Visual Studio for PC Game Development](gr-visualstudio-toc.md)
