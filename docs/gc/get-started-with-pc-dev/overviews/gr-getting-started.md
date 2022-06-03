---
author: M-Stahl
title: Getting started for PC
description: Getting started for PC
kindex: Getting started for PC
ms.author: douglau
ms.topic: conceptual
edited: 05/12/2021
security: public
---

# Getting started for PC

## Prerequisites

If you plan to use the Gaming Runtime to build or package a PC game, we recommend Windows 10 64-bit OS with the May 2019 Update or later. In addition, you will, at a minimum, need to install the following on your development PC.  

- Visual Studio 2019 or Visual Studio 2017 (Update 15.9 or later).
- May 2020 version of the Windows 10 SDK (10.0.19041.0) or later. This version is required to use the May 2020 Microsoft Game Development Kit (GDK).
- November 2019 (QFE2) version of the Microsoft Game Development Kit (GDK) or later.

For more information, see [SDKs and tools](../../getstarted/overviews/sdk-and-tools.md).  

If you plan to install and run PC games that are packaged using MSIXVC and/or use Gaming Runtime APIs, the device on which you plan to test your games (which can be your development PC or a remote PC device) must have the following installed.  

- Windows 10 (May 2019 Update or later) client OS (64-bit)  
- Gaming Services Runtime (installed automatically when you install an MSIXVC-packaged game from Microsoft Store. You can manually install the latest version from [Microsoft Store](ms-windows-store://pdp/?productid=9MWPM2CQNLHN).  

For more information about setting up your PC to prepare for development using the Gaming Runtime, see [Setting up your development PC for Gaming Runtime title development](../../getstarted/overviews/set-up-dev-pc.md).  

## Understanding Packaging

MSIXVC is the packaging format that's required by Microsoft Store. A packaged game requires a *MicrosoftGame.config* file, which enables the title's identity and title-specific shell visuals in Microsoft Store. For more information, see [MicrosoftGame.config overview](../../system/overviews/microsoft-game-config/MicrosoftGameConfig-Overview.md).

To get started packaging your existing PC game, see [Getting started with packaging for PC](../../packaging/overviews/packaging-getting-started-for-PC.md).
> [!NOTE]
> As of the March 2022 Microsoft Game Development Kit (GDK), improvements have been made to how files are layed out on disc as a result of installing an MSIXVC package. These improvements make game files more discoverable and simplify management of installed MSIXVC games. For more information, see [Flat File Install Overview](../../packaging/packaging-flatfileinstall.md).

## Preparing to develop for Xbox Live

For information about developing with Xbox Live, see [Getting started with Xbox Live](../../live/get-started/live-getstarted-nav.md).

We recommend installing the [Xbox app](https://www.xbox.com/xbox-app) to help manage Xbox Live sign-in on your PC.

If your title supports Xbox Live multiplayer functionality, Xbox Game Bar must be installed ([install from Microsoft Store](https://www.microsoft.com/p/xbox-game-bar/9nzkpstsnw4p)).
> [!NOTE]
> Xbox Game Bar is automatically included in most Windows 10 versions. For testing, Xbox Game Bar should always be updated to the most recent version.

## Requesting additional permissions for your PC title

Some features, configured by your [MicrosoftGame.config](../../system/overviews/microsoft-game-config/MicrosoftGameConfig-Overview.md) file, will require additional permissions to work properly. If you intend to use any of the following features, contact your account manager to get the necessary permissions. 

* [Xbox Live](../../live/live-nav.md)
* Mod support
* Custom installation actions
* Non-virtualized `Filesystem` and `Registry` writes
* File writes to installation location

For more information, see [Getting started with packaging for PC](../../packaging/overviews/packaging-getting-started-for-PC.md).

## Window display modes

For information about recommended window display modes, see [Window display modes and title-callable UI dialogs](window-display-modes-and-tcui.md).

## Configuring your title to run as a single instance

For more information about recommendations and example code for running your title as a single instance, see [Configuring your title to run as a single instance](single-instance-application.md).

## Checking for updates

It is a best practice to check for mandatory updates for your PC game. This way if you need to patch your game, you can ensure that fix gets to all of your players. 
> [!NOTE]
> Checking for mandatory updates happens automatically on the console, but on the PC you must write the code to check for updates. See the [checking for updates](../../commerce/pc-specific-considerations/xstore-checking-for-updates.md) topic for more information.  

## See also  

[Getting started with PC game development](../gr-get-started-with-pc-dev-toc.md)  

[Utilizing Microsoft Game Development Kit tools to install and launch your PC title](../../tools-pc/launching-on-pc.md)  