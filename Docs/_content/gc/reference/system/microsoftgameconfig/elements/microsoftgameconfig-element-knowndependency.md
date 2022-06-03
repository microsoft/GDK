---
author: M-Stahl
title: KnownDependency Element (MicrosoftGame.config)
description: MicrosoftGame.config Reference for KnownDependency Element.
kindex: KnownDependency
ms.author: zhooper
ms.topic: conceptual
edited: 01/06/2020
security: public
---

# MicrosoftGame.config Element - KnownDependency

Shortcut to specify one of the commonly used framework packages. Attribute specification of name is required and MinVersion is set automatically. Refer to the ST_KnownDependency section in the following schema for a list of possible shortcuts.

## Parent
This element's parent is the DependencyList element.

## Requirement
This element is optional and is not required to be set. 

## Platform
This element only pertains to PC devices.

## Behavior
* No attributes.
* No default value.
* Allowed value is DX11 (for DirectX Runtime dependencies), VC11 (for Visual Studio C++ Runtime for Visual Studio 2012), VC12 (for Visual Studio C++ Runtime for Visual Studio 2013) and VC14 (for Visual Studio C++ Runtime for Visual Studio 2015, 2017, and 2019).

## Remarks

### Differences between Dependency and KnownDependency elements.
The KnownDependency element is intended to provide a simpler way to specificy common dependencies. Please refer to the schema for a list of allowed values. The KnownDependency element also uses a minimum verison by default and does not require this to be set.

The Dependency element requires specification of the full identity name of the framework package in addition to requiring a minimum version to be set.

We recommend using KnownDependency for common dependencies that are specified and only using Dependency if you want finer grain control of a specific framework package or framework package version.

## See Also
[MicrosoftGame.config Reference - Table of Contents](gc-microsoftgameconfig-toc.md)  