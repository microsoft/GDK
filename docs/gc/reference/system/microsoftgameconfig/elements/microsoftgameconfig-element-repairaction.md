---
author: M-Stahl
title: RepairAction Element (MicrosoftGame.config)
description: MicrosoftGame.config Reference for RepairAction Element.
kindex: RepairAction
ms.author: zhooper
ms.topic: conceptual
edited: 01/06/2020
security: public
---

# MicrosoftGame.config Element - RepairAction

Specifies a repair action, within the Repair Action List. Maximum of 100 entries.

## Parent
This element's parent is the RepairActionList element.

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