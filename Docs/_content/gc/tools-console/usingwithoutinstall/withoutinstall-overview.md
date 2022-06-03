---
author: kevincog
title: Overview of building without installing the Microsoft Game Development Kit
description: Gives an overview of how and why to use the Microsoft Game Development Kit (GDK) without installation.
kindex:
- Overview of building without installing the Microsoft Game Development Kit
- advanced
- MSBuild, Environment, Projects
ms.author: kevincog
ms.topic: conceptual
edited: 00/00/0000
security: public
---

# Overview of building without installing the Microsoft Game Development Kit

This topic gives an overview of how and why to build Microsoft Game Development Kit (GDK) projects without installing the Microsoft Game Development Kit (GDK). This is intended for advanced users.

## Build without install overview

Normally, building a Microsoft Game Development Kit (GDK) project requires installing the Microsoft Game Development Kit (GDK) on the development machine. However, it is also possible to build using an extracted version of the Microsoft Game Development Kit (GDK). This extracted Microsoft Game Development Kit (GDK) can be copied to a build server or checked into a source control system and used without needing to run an installer. You will need to customize the build environment and project configuration to reference the extracted Microsoft Game Development Kit (GDK) files.

At a high level, building without installing involves the following process:

1. Make sure you have the required Visual Studio components [installed](bwoi-vs-setup.md).
2. Get an extracted version of the Microsoft Game Development Kit (GDK). This can be downloaded directly from the [Xbox Developer Downloads](https://aka.ms/gdkdl) site, or manually extracted from the regular Microsoft Game Development Kit (GDK) installer. See [Extracting the Microsoft Game Development Kit setup payload](extract-setup-payload.md) for more details.
3. Configure the build environment to reference the extracted Microsoft Game Development Kit (GDK). This involves updating environment variables and paths. See [Configuring Build Environment without installing Microsoft Game Development Kit](build-environment-withoutinstall.md) for more details.
4. Configure the projects to reference the extracted Microsoft Game Development Kit (GDK). This involves overriding project properties to match the desired Microsoft Game Development Kit (GDK). See [Configuring projects without installing the Microsoft Game Development Kit](project-configuration-withoutinstall.md) for more details.
5. Build the projects.

## Sample projects

The Microsoft Game Development Kit (GDK) includes several code samples demonstrating building without installing the Microsoft Game Development Kit (GDK). These include detailed instructions, scripts to set up and configure the environment, and sample project configurations. These show the process in action and can serve as a reference for a custom configuration.

To download samples, visit the [Xbox Developer Downloads](https://aka.ms/gdkdl) page. Under "Select file type" choose "GDK", and under "Select build/version number," choose the latest "Samples only" item. After downloading, look at the following samples:

* **BWOIExample:** Demonstrates how to build an MSBuild project without installing the Microsoft Game Development Kit (GDK). Also includes a Dockerfile, demonstrating how to build in a [Windows container](/en-us/virtualization/windowscontainers/) using [Docker](/en-us/virtualization/windowscontainers/manage-docker/configure-docker-daemon).
* **CMakeExample:** Demonstrates how to build a Microsoft Game Development Kit (GDK) title using CMake. Includes an option for building without installing the Microsoft Game Development Kit (GDK).
* **CMakeGDKExample:** Demonstrates another way to build a Microsoft Game Development Kit (GDK) title by using CMake to generate MSBuild projects. Includes an option for building without installing the Microsoft Game Development Kit (GDK).
* **CMakeXboxConsoleApp** Demonstrates how to build a command line app that can run on Xbox hardware for development purposes.  Includes an option for building without installing the Microsoft Game Development Kit (GDK).

## See also

[Extracting the Microsoft Game Development Kit (GDK) setup payload](extract-setup-payload.md)  

[Using the Microsoft Game Development Kit without installation](gc-usingwithoutinstall-toc.md)