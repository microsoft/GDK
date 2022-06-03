---
title: Flat File Install Overview
description: Describes changes to how MSIXVC installs files as flat files.
kindex: packaging
author: zhooper
ms.author: zhooper
ms.topic: conceptual
edited: 02/02/2022
security: public
---

# Flat File Install Overview

Flat File Install is a PC Microsoft Game Development Kit (GDK) install feature, which shipped in the March 2022 Microsoft Game Development Kit (GDK), that helps streamline how MSIXVC files are layed out on disc after being installed. The goal of these changes is to reduce friction for developers by making the file system experience for Microsoft Game Development Kit (GDK) on PC more consistent across loose file and packaged workflows and to get closer to the traditional win32 file system experiences.

## PC Game Developer Workflow changes with Flat File Install

Flat File Install changes how you work with MSIXVC packages in a few key ways. They are as follows:

* Packages are now installed to an XboxGames folder in your OS root by default (i.e. C:\XboxGames). This can be configured using [wdapp gamefolder](../tools-pc/commandlinetools/gr-wdapp.md#wdapp_gamefolder) command line tools in addition to the /drive flag off of wdapp install. Additionally, the C:\XboxGames folder **does not require elevated permissions to access game folders and files within it**.
* **All files, outside of the executable, are modifiable by default**. This also **reduces the runtime decryption cost** which is a benefit to title performance. For more information, please see [Mod support for PC Microsoft Game Development Kit (GDK) titles](packaging-mods.md).
* Files that are installed from an MSIXVC more closely resemble a flat file layout, with all files being accessible directly. This means that there is no longer any notions of package virtualization that hinder writing to the game root or require disabling file system writes/registry writes virtualization.
* As files can now be accessed and modified directly, the following elements no longer need to be specified in the [MicrosoftGame.config](../reference/system/microsoftgameconfig/microsoftgameconfig-schema.md) and are deprecated. 
  - ModFolder
  - EnableWritesToPackageRoot
  - DisableFilesystemWriteVirtualization
  - DisableRegistryWriteVirtualization
> [!NOTE]
> If these elements are present in a MicrosoftGame.config that has been updated to `Game configVersion="1"`, an error will be presented when attempting to package your title. The error will output "The DesktopRegistration entries "modFolder", "enableWritesToPackageRoot", "disableRegistryWriteVirtualization" and "disableFilesystemWriteVirtualization" are deprecated in configVersion >= 1". Removing these elements from the MicrosoftGame.config will resolve this issue. For more information on `Game configVersion="1"` and if it affects your title, see [MicrosoftGame.config Version Details](../reference/system/microsoftgameconfig/microsoftgameconfig-schema.md#MicrosoftGameConfig-VersionDetails).


## Flat File Install Benefits for PC Gamers

Flat File Install allows gamers to select the directory where their games are installed via the Xbox app (limited to one folder per drive), mod installed games, move games across drives via the Xbox app, and repair games via the Xbox app. These changes mean that gamers will have read and write access to all game files—except executables designated in the MicrosoftGame.config, which will remain encrypted. These changes address long-standing requests from PC gamers by opting more games into being moddable, as well as making it easier to find and manage game files. 

## Remarks

* Flat File Install only applies to PC Microsoft Game Development Kit (GDK) games. Games shipped on the Microsoft Store with other app models (i.e. UWP) will not see these benefits.
* If you have any automation that is dependent on parsing the C:\Program Files\WindowsApps path for MSIXVC installs, this change will impact that as all paths will now point to C:\XboxGames unless otherwise specified with wdapp gamefolder.
* Flat File Install will be applied to most titles that exist in GA today. Future Microsoft Game Development Kit (GDK) updates to previously released Microsoft Game Development Kit (GDK) will allow more direct control of this through wdapp tools improvements that exist in the March 2022 Microsoft Game Development Kit (GDK).


## See also

[Getting started packaging for PC](overviews/packaging-getting-started-for-PC.md)  
[Utilizing Microsoft Game Development Kit tools to install and launch your PC title](../tools-pc/launching-on-pc.md)  
[MicrosoftGame.config](../system/overviews/microsoft-game-config/MicrosoftGameConfig-toc.md)  