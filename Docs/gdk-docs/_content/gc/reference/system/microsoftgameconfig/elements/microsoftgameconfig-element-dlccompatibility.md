---
author: M-Stahl
title: DlcCompatibility Element (MicrosoftGame.config)
description: MicrosoftGame.config Reference for DlcCompatibility Element.
kindex: DlcCompatibility
ms.author: zhooper
ms.topic: conceptual
edited: 01/06/2020
security: public
---

# MicrosoftGame.config Element - DlcCompatibility

Specifies the minimum console generation for DLC the game is compatible with. Developers would use this with a Xbox One title that is running on a Xbox Series X&#124;S console but wishes to load DLC packages built for Xbox One. This would allow the DLC to exist on any storage, not just fast storage.

## Parent
This element's parent is the VirtualMachine element.

## Requirement
This element is optional and is not required to be set. 

## Platform
This element only pertains to Console devices.

## Behavior
* No attributes.
* Default value is the TargetDeviceFamily of your packages main executable.
* Allowed values are XboxOne and Scarlett.

## Remarks

## See Also
[MicrosoftGame.config Reference - Table of Contents](gc-microsoftgameconfig-toc.md)  