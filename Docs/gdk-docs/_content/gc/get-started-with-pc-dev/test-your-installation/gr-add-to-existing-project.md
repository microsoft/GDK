---
author: M-Stahl
title: Adding the GDK to an existing desktop project
description: Describes how to add the Microsoft Game Development Kit to an existing desktop (Windows PC) project.
kindex: Adding the GDK to an existing Desktop project
ms.author: shafit
ms.topic: conceptual
edited: 03/20/2020
security: public
---

# Adding the Microsoft Game Development Kit to an existing desktop project
> [!NOTE]
> The following information assumes that you have an existing x64 desktop (Windows PC) project, a custom engine, and have installed the Microsoft Game Development Kit (GDK). If you aren't installing the GDK, see [Configuring projects without installing the Microsoft Game Development Kit](../../tools-console/usingwithoutinstall/project-configuration-withoutinstall.md).

The following steps will result in your project:
* Using the Windows API family `WINAPI_FAMILY_DESKTOP_APP` and linking against typical PC libraries, including `kernel32.lib`, `user32.lib`, and `gdi32.lib`.
* Including the necessary headers and libraries.
* Including `XGameRuntime.h` and linking to `XGameRuntime.lib`. All the Gaming Runtime capabilities are ready to use.
* Having the ability to debug your game by using F5 with full package identity based on your *MicrosoftGame.config* file.

#### To add the GDK to an existing desktop project

1. Add the Gaming.Desktop.x64 platform to your solution:  
   With your project open in Visual Studio, select **Build** > **Configuration Manager**. Select the **Active Solution platform** drop-down list, and then select **New**. From the drop-down list, select **Gaming.Desktop.x64** as shown in the following screenshot.  

    ![Adding Gaming.Desktop.x64 platform to the project](../../../../resources/gamecore/secure/images/en-us/ConfigurationManager_Add_GamingDesktopx64.png)  

1. Set up *MicrosoftGame.config*:  
The GDK includes a Visual Studio Item Template for adding MicrosoftGame.config files to a project.  To add a file using the Item Template:

* Right click on a project and select Add->New Item.  
* The MicrosoftGame.config template can be found in the Visual C++->Gaming->Microsoft Game Development Kit->Edition node of the tree, shown as follows.

 ![MicrosoftGame.config Item Template](../../../../resources/gamecore/secure/images/en-us/GameConfig_ItemTemplate.png)

Note that the solution may need to be closed and reopened for Visual Studio to properly recognize the new MicrosoftGame.config file.

 1. Enable deployment for your project  
 Ensure that the *Deploy* checkbox is selected in Visual Studio's Configuration Manager.  Doing so will cause your project to be registered such that it can use the gaming runtime services.

  ![Enabling deployment for a project](../../../../resources/gamecore/secure/images/en-us/ConfigManager_enable_deploy.png)

For more information, see [MicrosoftGame.config overview](../../system/overviews/microsoft-game-config/MicrosoftGameConfig-Overview.md).
