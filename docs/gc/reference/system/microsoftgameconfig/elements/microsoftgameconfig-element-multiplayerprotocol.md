---
author: M-Stahl
title: MultiplayerProtocol Element (MicrosoftGame.config)
description: MicrosoftGame.config Reference for MultiplayerProtocol Element.
kindex: MultiplayerProtocol
ms.author: zhooper
ms.topic: conceptual
edited: 01/06/2020
security: public
---

# MicrosoftGame.config Element - MultiplayerProtocol

Allows for protocol activation within the title via “ms-xbl-multiplayer” protocol. Primarily used to enable Game Bar to launch games / multiplayer game invites.

## Parent
This element's parent is the DesktopRegistration element.

## Requirement
This element is optional and is not required to be set. 

## Platform
This element only pertains to PC devices.

## Behavior
* Attributes of Executable.
* Default value is false. Executable attribute does not have a default value.
* Allowed value is true and false. Executable attribute is a relative path to the executable file.

## Remarks
* Executable attribute is optional and should match the executable defined in the ExecutableList element that should be protocol activated.
* If the attribute is not provided, the protocol will default to activating the first Executable in the ExecutableList element.

## See Also
[MicrosoftGame.config Reference - Table of Contents](gc-microsoftgameconfig-toc.md)  