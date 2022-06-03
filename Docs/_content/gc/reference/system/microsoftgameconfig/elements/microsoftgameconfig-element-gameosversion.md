---
author: M-Stahl
title: GameOsVersion Element (MicrosoftGame.config)
description: MicrosoftGame.config Reference for GameOsVersion Element.
kindex: GameOsVersion
ms.author: zhooper
ms.topic: conceptual
edited: 01/06/2020
security: public
---

# MicrosoftGame.config Element - GameOsVersion

Specifies the version of the GameOS that this title requires to run. Will use the currently running or default GameOS if not specified.

## Parent
This element's parent is the Game element.

## Requirement
This element is optional and is not required to be set. 

## Platform
This element only pertains to Console devices.

## Behavior
* No attributes.
* Default value is the version of the GameOs.xvd that is side-by-side with the title (if loose file build) or embedded in the .xvc (if packaged).
* Allowed value is a four part version number (i.e. 10.0.18362.0).

## Remarks
* If you are experiencing a launch error indicating "The game host failed to start", we recommend that you check that the GameOsVersion you are defining in your MicrosoftGame.config matches the GameOsVersion you are building your title with.

## See Also
[MicrosoftGame.config Reference - Table of Contents](gc-microsoftgameconfig-toc.md)  