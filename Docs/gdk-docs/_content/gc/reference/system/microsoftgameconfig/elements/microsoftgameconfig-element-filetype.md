---
author: M-Stahl
title: FileType Element (MicrosoftGame.config)
description: MicrosoftGame.config Reference for FileType Element.
kindex: FileType
ms.author: zhooper
ms.topic: conceptual
edited: 01/06/2020
security: public
---

# MicrosoftGame.config Element - FileType

Specifies a file type extension to be used as part of the SupportedFileTypes element.

## Parent
This element's parent is the SupportedFileTypes element.

## Requirement
This element is optional and is not required to be set. 

## Platform
This element only pertains to PC devices.

## Behavior
* Attribute is ContentType.
* No default value for FileType or ContentType attribute.
* Allowed value is a string up to 64 characters long for FileType and ContentType attribute allows a string matching the [RFC 4288](https://www.ietf.org/rfc/rfc4288.txt) standard.

## Remarks
The value for FileType is a dot and then up to 64 non-whitespace characters which will represent a file extension. Examples of these are .map or .world.

## See Also
[MicrosoftGame.config Reference - Table of Contents](gc-microsoftgameconfig-toc.md)  