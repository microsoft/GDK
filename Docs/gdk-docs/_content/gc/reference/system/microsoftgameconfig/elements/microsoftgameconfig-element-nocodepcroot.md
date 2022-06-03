---
author: zhooper
title: NoCodePCRoot Element (MicrosoftGame.config)
description: MicrosoftGame.config Reference for NoCodePCRoot Element.
kindex: NoCodePCRoot
ms.author: zhooper
ms.topic: conceptual
edited: 10/11/2021
security: public
---

# MicrosoftGame.config Element - NoCodePCRoot

Specifies the local folder where Save Games are stored.

## Parent
This element's parent is the SaveGameStorage element.

## Requirement
This element is optional and is not required to be set.

## Platform
This element only pertains to PC devices.

## Behavior
* Attribute of RelativeTo.
* Attribute values for RelativeTo are AppData, Public, LocalAppData, LocalAppDataLow, ProgramData, SavedGames or UserProfile.
* Allowed value is a relative file path.

## Remarks
* This element will be enabled in a future GDK release.
* To use this element, a valid TitleId and MSAAppId element must be specified in your MicrosoftGame.config.

## See Also
[MicrosoftGame.config Reference - Table of Contents](gc-microsoftgameconfig-toc.md)  