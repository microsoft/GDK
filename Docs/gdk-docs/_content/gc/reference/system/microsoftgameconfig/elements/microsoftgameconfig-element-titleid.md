---
author: M-Stahl
title: TitleId Element (MicrosoftGame.config)
description: MicrosoftGame.config Reference for TitleId Element.
kindex: TitleId
ms.author: zhooper
ms.topic: conceptual
edited: 01/06/2020
security: public
---

# MicrosoftGame.config Element - TitleId

Specifies the Titles Xbox Live Title ID, used for identity with Xbox Live services. As of the March 2022 GDK, the Title Id is now required, if the MSAAppId element is specified, for new titles as it is leveraged to enable a set of [PC ecosystem improvements](../../../../get-started-with-pc-dev/overviews/gr-pc-ecosystem-updates.md). This requirement is enforced by a MicrosoftGame.config schema version update (from configVersion 0 to configVersion 1) that only applies to new titles created with the March 2022 GDK and beyond.

## Parent
This element's parent is the Game element.

## Requirement
This element is optional and is not required to be set. 
If configVersion = 1 in the MicrosoftGame.config, this element is required to be set when:
* A MSAAppId element is specified.
* A NoCodePCRoot element is specified.
* The AdvancedUserModel element is set to the value of false.


## Platform
This element pertains to PC and Console.

## Behavior
* No attributes.
* No default value.
* Allowed value is 8 hexidecimal characters.

## Remarks
* The TitleId element is your Title Identity that is generated from Partner Center. This can be found in the [Game Setup -> Identity details](../../../../live/get-started/live-setup-partner-center-partners.md) in your Partner Center project.
* The TitleId element, in your MicrosoftGame.config, must match the value in Partner Center. The [MicrosoftGame.config Editor](../../../../system/overviews/microsoft-game-config/MicrosoftGameConfig-Editor.md) provides a tool, called the Store Association Wizard, which will automatically sync the local .config values for TitleId (and other Id values) with what is present in Partner Center for your product.
* The Visual Studio new project template will provide a default value of 'FFFFFFFF' for this element. This value allows for early iteration of getting your title compiling without having to immediately acquire the Id from Partner Center. It is strongly recommended to change this Id as soon as you get your title building to avoid failures when attempting to do API calls.

## See Also
[MicrosoftGame.config Reference - Table of Contents](gc-microsoftgameconfig-toc.md)  