---
author: M-Stahl
title: CustomInstallActions Element (MicrosoftGame.config)
description: MicrosoftGame.config Reference for CustomInstallActions Element.
kindex: CustomInstallActions
ms.author: zhooper
ms.topic: conceptual
edited: 01/06/2020
security: public
---

# MicrosoftGame.config Element - CustomInstallActions

Specifies a custom installer action with Administration privileges the first time your game runs. Any executable you specify must be located under the “Installers” folder in the base folder of your game. Don’t include any other files in the Installers folder.

## Parent
This element's parent is the DesktopRegistration element.

## Requirement
This element is optional and is not required to be set. 

## Platform
This element only pertains to PC devices.

## Behavior
* No attributes.
* No default value.
* Allowed values are child elements of Folder, InstallActionList, RepairActionList and UninstallActionList.

## Remarks


## See Also
[MicrosoftGame.config Reference - Table of Contents](gc-microsoftgameconfig-toc.md)  