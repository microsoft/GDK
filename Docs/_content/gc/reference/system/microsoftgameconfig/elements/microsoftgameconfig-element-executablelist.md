---
author: M-Stahl
title: ExecutableList Element (MicrosoftGame.config)
description: MicrosoftGame.config Reference for ExecutableList Element.
kindex: ExecutableList
ms.author: zhooper
ms.topic: conceptual
edited: 01/06/2020
security: public
---

# MicrosoftGame.config Element - ExecutableList

List of title executables. At least one entry is required to register or package the title successfully. Overrides for Display Name and Logo allow unique values for this exe in the shell (The resources specified above in “ShellVisuals” node will be the default for each exe unless otherwise overridden here).

## Parent
This element's parent is the Game element.

## Requirement
This element is required to be set.

## Platform
This element pertains to PC and Console.

## Behavior
* No attributes.
* No default value.
* Allowed values are child elements of Executable.

## Remarks
ExecutableList can have unlimited child Executable elements.

## See Also
[MicrosoftGame.config Reference - Table of Contents](gc-microsoftgameconfig-toc.md)  