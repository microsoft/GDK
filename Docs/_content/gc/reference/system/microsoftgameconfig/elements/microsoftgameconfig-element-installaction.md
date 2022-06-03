---
author: M-Stahl
title: InstallActoin Element (MicrosoftGame.config)
description: MicrosoftGame.config Reference for InstallAction Element.
kindex: InstallAction
ms.author: zhooper
ms.topic: conceptual
edited: 01/06/2020
security: public
---

# MicrosoftGame.config Element - InstallAction

Specifies an install action, within the Install Action List. Maximum of 100 entries.

## Parent
This element's parent is the InstallActionList element.

## Requirement
This element is optional and is not required to be set. 

## Platform
This element only pertains to PC devices.

## Behavior
* Attributes are File, Name and Arguments. attributes.
* No default value.
* Allowed value for File attribute is a valid executable within the folder specified by the parent CustomInstallActions element, Argument attribute is a string provided to that executable and Name attribute is a string.

## Remarks
To properly configure an uninstall or repair action, ensure that the Name attribute matches in the InstallAction, UninstallAction and RepairAction elements.

## See Also
[MicrosoftGame.config Reference - Table of Contents](gc-microsoftgameconfig-toc.md)  