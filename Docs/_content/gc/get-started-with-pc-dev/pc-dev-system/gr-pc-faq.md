---
author: M-Stahl
title: FAQ for PC developers
description: Provides an FAQ for PC developers.
kindex: FAQ for PC developers
ms.author: shafit
ms.topic: conceptual
edited: 03/19/2020
security: public
---

# Frequently asked questions (FAQ)

| Question |
| --- |
| [Why are some of my MicrosoftGame.config dependencies not installed in the developer sandbox?](#MissingDependenciesDevSandbox) |
| [Why can't I see sandboxed store content after publishing: Error 194?](#SandboxedStoreContent) |
| [Why can't I get the latest version of gaming services?](#GamingServicesInstall) |
| [How can I uninstall a package which was installed by another user?](#UninstallPackagesMultiUser) |
| [How can I report a problem?](#ReportAProblem) |
| [Where should I save local game saves?](#LocalGameSaves) |

<a id="MissingDependenciesDevSandbox"></a>

### Why are some of my MicrosoftGame.config dependencies not installed in the developer sandbox?

The store is unable to install framework dependencies that are declared in [MicrosoftGame.config](../../system/overviews/microsoft-game-config/MicrosoftGameConfig-toc.md) while in a developer sandbox. These dependencies need to be manually installed on the PC for your title to work.
> [!NOTE]
> It's important to ensure that the versions you install are the same as the versions that are specified in MicrosoftGame.config.

For more information, see [Framework package dependencies](../../packaging/packaging-framework-packages.md). 

<a id="SandboxedStoreContent"></a>

### Why can't I see sandboxed store content after publishing: Error 194?

You need to be signed in to Xbox Live on the PC. If you've recently run `wsreset`, you should sign out and sign in again.

<a id="GamingServicesInstall"></a>

### Why can't I get the latest version of gaming services?

You might not be in the RETAIL sandbox. Switch to the RETAIL sandbox, run Windows Update, and then return to your development sandbox.

<a id="UninstallPackagesMultiUser"></a>

### How can I uninstall a package that was installed by another user?

To remove a package for all the users on the PC, run the following command in an elevated PowerShell prompt: `Remove-AppXPackage -allusers <package_name>`.

<a id="ReportAProblem"></a>

### How can I report a problem?

After installing the Microsoft Game Development Kit (GDK), there's an **Xbox** item in the Visual Studio menu bar. To open a dialog box through which you can report a problem, select **Xbox** > **Xbox Report-a-Problem**.

![Xbox Report-a-Problem in Visual Studio](../../../../resources/gamecore/secure/images/en-us/vs_report_problem.png)
> [!NOTE]
> Don't select **Feedback icon** > **Report-a-Problem** to report a problem. 

<a id="LocalGameSaves"></a>

### Where should I save local game saves?

We recommend that you use the [XGameSave API](../../reference/system/xgamesave/xgamesave_members.md) to store game saves in the cloud. For more information, see [Game saves](../../system/overviews/game-save/game-saves-toc.md).

We recommend saving local game saves to the user's *Documents* folder: *Documents\Saved Games\<Developer Name>\<Game Name>*. > [!NOTE]
> Ensure that your code creates these folders if they don't exist. This ensures that gamers can discover their saved games and back them up if `XGameSave` isn't used.