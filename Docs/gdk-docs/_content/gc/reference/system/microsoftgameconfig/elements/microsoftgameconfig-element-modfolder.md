---
author: M-Stahl
title: ModFolder Element (MicrosoftGame.config)
description: MicrosoftGame.config Reference for ModFolder Element.
kindex: ModFolder
ms.author: zhooper
ms.topic: conceptual
edited: 01/06/2020
security: public
---

# MicrosoftGame.config Element - ModFolder (DEPRECATED)

Defines the location of end-user mods for your game files.

## Parent
This element's parent is the DesktopRegistration element.

## Requirement
This element is optional and is not required to be set. 

## Platform
This element only pertains to PC devices.

## Behavior
* Attribute is Name.
* Default value for Name attribute is `<PackageName>_Mods`.
* Allowed value for Name attribute is any valid folder name located at the root of the package.

## Remarks
* As of the March 2022 GDK, this element is now deprecated due to changes in how packages are installed. For more information, see [Flat File Install Overview](../../../../packaging/packaging-flatfileinstall.md).
* If this element is set in your MicrosoftGame.config, it will be ignored in the March 2022 Microsoft Game Development Kit (GDK) and future releases.
* If these elements are present in a MicrosoftGame.config that has been updated to `Game configVersion="1"`, an error will be presented when attempting to package your title. The error will output "The DesktopRegistration entries "modFolder", "enableWritesToPackageRoot", "disableRegistryWriteVirtualization" and "disableFilesystemWriteVirtualization" are deprecated in configVersion >= 1". Removing these elements from the MicrosoftGame.config will resolve this issue. For more information on `Game configVersion="1"` and if it affects your title, see [MicrosoftGame.config Version Details](../microsoftgameconfig-schema.md#MicrosoftGameConfig-VersionDetails).

## See Also
[MicrosoftGame.config Reference - Table of Contents](gc-microsoftgameconfig-toc.md)  