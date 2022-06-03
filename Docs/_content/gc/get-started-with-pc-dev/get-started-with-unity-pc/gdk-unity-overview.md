---
author: sdgmiller
title: GDK Unity package Overview
description: Provides an overview about the GDK Unity package and how to acquire it.
kindex:
- GDK Unity package Overview
- Unity Overview
ms.author: zhooper
ms.topic: conceptual
edited: 11/16/2020
security: public
---

# Microsoft Game Development Kit Unity package overview

Use this topic to develop your PC title by using the GDK Unity package. It's a custom package that's built for the [Unity](https://unity.com/) game engine that enables PC Unity developers to efficiently develop their titles for the Microsoft Game Development Kit. The package is imported to your Unity project. Its primary features show up as a "GDK" menu option within Unity.

The GDK Unity package was built to improve your development workflow directly in Unity. Within Unity, you can edit the [MicrosoftGame.config](../../system/overviews/microsoft-game-config/MicrosoftGameConfig-Overview.md), build an [MSIXVC package](../../packaging/overviews/packaging-getting-started-for-PC.md), configure your PC [sandbox environment](../../live/test-release/sandboxes/live-setup-sandbox.md), and use [platform APIs](../../reference/gc-reference-toc.md). The GDK Unity package includes the following features.

* [Store Association Wizard](features/gdk-unity-store-association.md) 
* [MSIXVC packages](features/gdk-unity-build-and-run.md) 
* [Switch Sandbox tool](features/gdk-unity-configure-sandbox.md) 
* [Built-in example scenes](features/gdk-unity-samples.md) 
* [Managed API wrappers](features/gdk-unity-api-wrappers.md) 

> [!NOTE]
> The package doesn't support Xbox console development. For more information about Xbox console development support within Unity, see [Unity for Game Core package](https://forum.unity.com/forums/microsoft-game-core.367/).

## GDK Unity package compatibility

The GDK Unity package is compatible with any version of Unity that is 2017 or newer.

Each release, Microsoft tests the GDK Unity package with LTS versions of Unity, going back to Unity 2017 LTS.

As newer versions of the package become available, you can upgrade the GDK Unity package to your Unity project for additional functionality. The GDK Unity package is dependent on the Microsoft Game Development Kit star(GDK) to properly work. Many components of the GDK Unity package work as integrations or wrappers of GDK components.

It's important to keep your GDK Unity package version aligned with the current GDK that you're using. 

### Unity and Xbox compatibility
The Unity GDK support for console is 2019.4+. If you cannot upgrade to 2019.4+, then we recommend using XDK for your console build and the GDK for your PC build.

**Note:** If going down this route, it is a good idea to discuss with your Microsoft representative the feasibility of using the XDK for your console build.

## Install the GDK Unity package

Download the Unity package that matches the installed version of the GDK from the [GitHub repo](https://github.com/microsoft/gdk-unity-package/releases).

## How to use the GDK Unity package

For more information about getting started using this package with your Unity project, see [Importing the GDK Unity package to your Unity project](gdk-unity-import-plugin.md).


## Troubleshoot issues with the GDK Unity package

For more information about troubleshooting issues with the GDK Unity package, see [Troubleshooting the GDK Unity package](gdk-unity-troubleshooting.md).


## Azure PlayFab Party functionality within Unity

For more information about PlayFab Party integration with Unity, see [PlayFab Party SDK for Unity](../../networking/overviews/game-mesh/party-unity-plugin.md).


## See also

[Get started with Unity for PC development](gc-get-started-with-unity-pc-toc.md) 