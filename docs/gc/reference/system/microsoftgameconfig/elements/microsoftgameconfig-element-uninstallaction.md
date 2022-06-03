---
author: M-Stahl
title: UninstallAction Element (MicrosoftGame.config)
description: MicrosoftGame.config Reference for UninstallAction Element.
kindex: UninstallAction
ms.author: zhooper
ms.topic: conceptual
edited: 01/06/2020
security: public
---

# MicrosoftGame.config Element - UninstallAction

Specifies an uninstall action, within the Uninstall Action List. Maximum of 100 entries.

## Parent
This element's parent is the UninstallActionList element.

## Requirement
This element is optional and is not required to be set. 

## Platform
This element only pertains to PC devices.

## Behavior
* Attributes are File, Name and Arguments.
* No default value.
* Allowed value for File attribute is a valid executable within the folder specified by the parent CustomInstallActions element, Argument attribute is a string provided to that executable and Name attribute is a string.

## Remarks
Name attribute should match the associated Name attribute in the InstallAction element.


## See Also
[MicrosoftGame.config Reference - Table of Contents](gc-microsoftgameconfig-toc.md)  