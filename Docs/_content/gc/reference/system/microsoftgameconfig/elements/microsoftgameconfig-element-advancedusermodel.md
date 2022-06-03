---
author: M-Stahl
title: AdvancedUserModel Element (MicrosoftGame.config)
description: MicrosoftGame.config Reference for AdvancedUserModel Element.
kindex: AdvancedUserModel
ms.author: zhooper
ms.topic: conceptual
edited: 01/06/2020
security: public
---

# MicrosoftGame.config Element - AdvancedUserModel

Specifies if Advanced User Model should be used for your title. This means your title supports the active user changing without requiring a restart. If disabled, then the simplified user model is used which guarantees your title will always keep the active user that it was launched with. See [GDK User Models (NDA topic)](../../../../system/overviews/user/gamecore-user-models.md) for more information.

## Parent
This element's parent is the Game element.

## Requirement
This element is required to be set.

## Platform
This element only pertains to Console devices.

## Behavior
* No attributes.
* Default value is true.
* Allowed values are true or false.

## Remarks
* This element will be enabled in a future GDK release for PC devices.
* To use this element with the value of false, a valid TitleId and MSAAppId element must be specified in your MicrosoftGame.config.

## See Also
[MicrosoftGame.config Reference - Table of Contents](gc-microsoftgameconfig-toc.md)  