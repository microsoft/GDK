---
author: M-Stahl
title: DependencyList Element (MicrosoftGame.config)
description: MicrosoftGame.config Reference for DependencyList Element.
kindex: DependencyList
ms.author: zhooper
ms.topic: conceptual
edited: 01/06/2020
security: public
---

# MicrosoftGame.config Element - DependencyList

Determines which framework packages need to be installed before installing the title package. For more information on child element usage, please click here.

## Parent
This element's parent is the DesktopRegistration element.

## Requirement
This element is optional and is not required to be set. 

## Platform
This element only pertains to PC devices.

## Behavior
* No attributes.
* No default value.
* Allowed values are child elements of Dependency and KnownDependency.

## Remarks
DependencyList can have up to 128 Dependency and KnownDependency child elements.

## See Also
[MicrosoftGame.config Reference - Table of Contents](gc-microsoftgameconfig-toc.md)  