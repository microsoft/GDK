---
author: M-Stahl
title: ContentIdOverride Element (MicrosoftGame.config)
description: MicrosoftGame.config Reference of ContentIdOverride Element.
kindex: ContentIdOverride
ms.author: zhooper
ms.topic: conceptual
edited: 01/06/2020
security: public
---

# MicrosoftGame.config Element - ContentIdOverride

An override, for development-only, to a games ContentID. Utilize the xbapp list /d command, with a package installed, to get your titles ContentID.

## Parent
This element's parent is the DevelopmentOnly element.

## Requirement
This element is optional and is not required to be set. 

## Platform
This element only pertains to Console devices.

## Behavior
* No attributes.
* Default value is a SHA-256 hash created based on the PackageFamilyName of your title (if a value is not supplied).
* Allowed value is a GUID.

## Remarks


## See Also
[MicrosoftGame.config Reference - Table of Contents](gc-microsoftgameconfig-toc.md)  