---
author: M-Stahl
title: TargetDeviceFamilyForDLC Element (MicrosoftGame.config)
description: MicrosoftGame.config Reference for TargetDeviceFamilyForDLC Element.
kindex: TargetDeviceFamilyForDLC
ms.author: zhooper
ms.topic: conceptual
edited: 01/06/2020
security: public
---

# MicrosoftGame.config Element - TargetDeviceFamilyForDLC

Specifies the target platform the DLC package is built for. Allowed values are XboxOne, Scarlett and PC.

## Parent
This element's parent is the Game element.

## Requirement
This element is optional and is not required to be set. 

## Platform
This element pertains to PC and Console.

## Behavior
* No attributes.
* No default value.
* Allowed values are XboxOne, Scarlett and PC.

## Remarks
* TargetDeviceFamilyForDLC element is required when creating packages for DLC content.
* This element should match the TargetDeviceFamily attribute specified by the executable of the main product the DLC is being associated with.

## See Also
[MicrosoftGame.config Reference - Table of Contents](gc-microsoftgameconfig-toc.md)  