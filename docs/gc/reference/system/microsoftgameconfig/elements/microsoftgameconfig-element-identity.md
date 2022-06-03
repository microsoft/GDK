---
author: M-Stahl
title: Identity Element (MicrosoftGame.config)
description: MicrosoftGame.config Reference for Identity Element.
kindex: Identity
ms.author: zhooper
ms.topic: conceptual
edited: 01/06/2020
security: public
---

# MicrosoftGame.config Element - Identity

Defines the title's Name, Publisher, ResourceId and Version. Title information can be found in Partner Center under Product Management -> Product Identity; see [Setting up a game at Partner Center, for Managed Partners](../../../../live/get-started/live-setup-partner-center-partners.md), for Managed Partners. Used during registration to uniquely identify the title. Name and Publisher are required fields. Version will default to 1.0.0.0 if not specified. Additional packages for subsequent console generations must increment package major version beyond existing package versions.

## Parent
This element's parent is the Game element.

## Requirement
This element is required to be set.

## Platform
This element pertains to PC and Console.

## Behavior
* Attributes are Version, Name, ResourceId and Publisher.
* Default value of Version attribute is 1.0.0.0. Name, ResourceId and Publisher attributes have no default. 
* Allowed value of Version attribute is a four part number (i.e. 1.0.0.0), Name attribute is an ASCII value between 3 and 50 characters long, ResourceId attribute is up to 30 ASCII characters and Publisher attribute is a string that conforms to the LADPv3 Distinguished Names section in the [RFC 2253](https://www.ietf.org/rfc/rfc2253.txt) standard.

## Remarks
* ResourceId will become part of the PackageFullName. This allows for a way to differentiate packages if Name and Publisher attribute are the same value.
* An example of an allowed value of a Publisher attribute is "CN=Microsoft Corporation, O=Microsoft Corporation, L=Redmond, S=Washington, C=US".
* To acquire the appropriate Publisher attribute value, please see your product information in Partner Center.

## See Also
[MicrosoftGame.config Reference - Table of Contents](gc-microsoftgameconfig-toc.md)  