---
author: zhooper
title: MaxUserQuota Element (MicrosoftGame.config)
description: MicrosoftGame.config Reference for MaxUserQuota Element.
kindex: MaxUserQuota
ms.author: zhooper
ms.topic: conceptual
edited: 10/11/2021
security: public
---

# MicrosoftGame.config Element - MaxUserQuota

Manages the Maximum Save Game User quota size (in MB) for Game Save Storage.

## Parent
This element's parent is the SaveGameStorage element.

## Requirement
This element is optional and is not required to be set.

## Platform
This element only pertains to PC devices.

## Behavior
* No attributes.
* Default value is 256 MB.
* Allowed value is an integer between 256 MB and 4096 MB.

## Remarks
* This element will be enabled in a future GDK release.

## See Also
[MicrosoftGame.config Reference - Table of Contents](gc-microsoftgameconfig-toc.md)  