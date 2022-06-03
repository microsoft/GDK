---
title: Mod support for PC GDK titles
description: Describes how mods are supported for PC GDK titles.
kindex: Mods
author: M-Stahl
ms.author: brianhud
ms.topic: conceptual
edited: 02/02/2022
security: public
---

# Mod support for PC GDK titles

With the March 2022 Microsoft Game Development Kit (GDK), modification of game resources is now enabled by default and no longer requires any configuration steps to enable directly. This change is aimed to reduce the steps involved and confusion around modding for PC Microsoft Game Development Kit (GDK) titles. After your title is installed, your game files will now live in a subfolder under the `[drive]:\XboxGames` folder and all game resources, outside of the game executable, will be fully modifiable.

## DRM Recommendations

We strongly recommend that you use the [XStoreQueryGameLicenseAsync](../reference/system/xstore/functions/xstorequerygamelicenseasync.md) API to verify ownership of the title as described in the [basic DRM and license checks](../commerce/pc-specific-considerations/xstore-basic-drm-and-license-checks.md) page.
