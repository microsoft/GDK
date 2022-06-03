---
author: M-Stahl
title: XboxCompatibility Element (MicrosoftGame.config)
description: MicrosoftGame.config Reference for XboxCompatibility Element.
kindex: XboxCompatibility
ms.author: zhooper
ms.topic: conceptual
edited: 01/06/2020
security: public
---

# MicrosoftGame.config Element - XboxCompatibility

Specifies the maximum console generation that the game is compatible with. Developers would use this with a Xbox One title that is running in backwards compatibility on Xbox Series X&#124;S. The primary usage of this would be to get access to enhanced features such as extra memory. The allowed values are “XboxOne”, which will behave like a normal backwards compatible title, and “Scarlett”, which will allow the backwards compatible title to access enhanced features.

## Parent
This element's parent is the VirtualMachine element.

## Requirement
This element is optional and is not required to be set. 

## Platform
This element only pertains to Console devices.

## Behavior
* No attributes.
* Default value is XboxOne.
* Allowed values are XboxOne and Scarlett.

## Remarks


## See Also
[MicrosoftGame.config Reference - Table of Contents](gc-microsoftgameconfig-toc.md)  