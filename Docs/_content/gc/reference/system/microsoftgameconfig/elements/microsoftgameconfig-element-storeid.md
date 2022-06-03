---
author: M-Stahl
title: StoreId Element (MicrosoftGame.config)
description: MicrosoftGame.config Reference for StoreId Element.
kindex: StoreId
ms.author: zhooper
ms.topic: conceptual
edited: 01/06/2020
security: public
---

# MicrosoftGame.config Element - StoreId

Specifies the store identity of this title. Specified in Partner Center under Product Management -> Product Identity.

## Parent
This element's parent is the Game element.

## Requirement
This element is optional and is not required to be set. 

## Platform
This element pertains to PC and Console.

## Behavior
* No attributes.
* No default value.
* Allowed value is the StoreId, derived from Partner Center.

## Remarks
* The StoreId is 12 characters long (alphanumeric values).
* The StoreId element, in your MicrosoftGame.config, must match the value in Partner Center. The [MicrosoftGame.config Editor](../../../../system/overviews/microsoft-game-config/MicrosoftGameConfig-Editor.md) provides a tool, called the Store Association Wizard, which will automatically sync the local .config values for MSAAppId (and other Id values) with what is present in Partner Center for your product.

## See Also
[MicrosoftGame.config Reference - Table of Contents](gc-microsoftgameconfig-toc.md)  