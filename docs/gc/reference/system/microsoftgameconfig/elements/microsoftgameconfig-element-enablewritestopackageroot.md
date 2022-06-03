---
author: M-Stahl
title: EnableWritesToPackageRoot Element (MicrosoftGame.config).
description: MicrosoftGame.config Reference for EnableWritesToPackageRoot Element.
kindex: EnableWritesToPackageRoot
ms.author: zhooper
ms.topic: conceptual
edited: 01/06/2020
security: public
---

# MicrosoftGame.config Element - EnableWritesToPackageRoot (DEPRECATED)

Set to true if your game needs to write to the package install location.

## Parent
This element's parent is the DesktopRegistration element.

## Requirement
This element is optional and is not required to be set. 

## Platform
This element only pertains to PC devices.

## Behavior
* No attributes.
* Default value is false.
* Allowed values are true or false.

## Remarks
* As of the March 2022 Microsoft Game Development Kit (GDK), this element is now deprecated due to changes in how packages are installed. For more information, see [Flat File Install Overview](../../../../packaging/packaging-flatfileinstall.md).
* If this element is set in your MicrosoftGame.config, it will be ignored in the March 2022 Microsoft Game Development Kit (GDK) and future releases.
* If these elements are present in a MicrosoftGame.config that has been updated to `Game configVersion="1"`, an error will be presented when attempting to package your title. The error will output "The DesktopRegistration entries "modFolder", "enableWritesToPackageRoot", "disableRegistryWriteVirtualization" and "disableFilesystemWriteVirtualization" are deprecated in configVersion >= 1". Removing these elements from the MicrosoftGame.config will resolve this issue. For more information on `Game configVersion="1"` and if it affects your title, see [MicrosoftGame.config Version Details](../microsoftgameconfig-schema.md#MicrosoftGameConfig-VersionDetails).

## See Also
[MicrosoftGame.config Reference - Table of Contents](gc-microsoftgameconfig-toc.md)  