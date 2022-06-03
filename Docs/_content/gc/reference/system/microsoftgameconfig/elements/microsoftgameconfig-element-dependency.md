---
author: M-Stahl
title: Dependency Element (MicrosoftGame.config)
description: MicrosoftGame.config Reference for Dependency Element.
kindex: Dependency
ms.author: zhooper
ms.topic: conceptual
edited: 01/06/2020
security: public
---

# MicrosoftGame.config Element - Dependency

Specific framework package and version that are required to be installed ahead of the title. Attribute specification of name and MinVersion must be set.

## Parent
This element's parent is the DependencyList element.

## Requirement
This element is optional and is not required to be set. 

## Platform
This element only pertains to PC devices.

## Behavior
* Attributes are Name and MinVersion.
* No default value.
* Allowed values are the attributes Name and MinVersion.

## Remarks
* Name attribute is package name of the dependency. It is expected to be an ASCII string between 3 and 50 characters.
* MinVersion attribute is a four part version number (i.e. 11.0.61135.0).

### Differences between Dependency and KnownDependency elements.
The KnownDependency element is intended to provide a simpler way to specificy common dependencies. Please refer to the schema for a list of allowed values. The KnownDependency element also uses a minimum verison by default and does not require this to be set.

The Dependency element requires specification of the full identity name of the framework package in addition to requiring a minimum version to be set.

We recommend using KnownDependency for common dependencies that are specified and only using Dependency if you want finer grain control of a specific framework package or framework package version.

## See Also
[MicrosoftGame.config Reference - Table of Contents](gc-microsoftgameconfig-toc.md)  