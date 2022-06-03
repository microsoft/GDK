---
author: M-Stahl
title: EditFlags Element (MicrosoftGame.config)
description: MicrosoftGame.config Reference for EditFlags Element.
kindex: EditFlags
ms.author: zhooper
ms.topic: conceptual
edited: 01/06/2020
security: public
---

# MicrosoftGame.config Element - EditFlags

Specifies Edit Flags controlling Windows system warnings for the File Type Association.

## Parent
This element's parent is the FileTypeAssociation element.

## Requirement
This element is optional and is not required to be set. 

## Platform
This element only pertains to PC devices.

## Behavior
* Attributes are OpenIsSafe and AlwaysUnsafe.
* Default value is false for both OpenIsSafe and AlwaysUnsafe attributes.
* Allowed values are true and false for the OpenIsSafe and AlwaysUnsafe attributes.

## Remarks
If AlwaysUnsafe is set to true, a Windows dialogue box will appear warning about opening an unknown file.
If OpenIsSafe is set to true, a Windows dialogue box with a standard warning is present.
If both are set to true, AlwaysUnsafe will take precedent.

## See Also
[MicrosoftGame.config Reference - Table of Contents](gc-microsoftgameconfig-toc.md)  