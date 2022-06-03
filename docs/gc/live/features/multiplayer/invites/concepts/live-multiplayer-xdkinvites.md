---
title: Invites across Xbox One Software Development Kit/GDK title versions
description: How to support multiplayer invites and joining across Xbox One Software Development Kit and GDK title versions.
kindex:
- Invites across Xbox One Software Development Kit/GDK title versions
- cross-device
author: joannaleecy
ms.author: kkline
ms.topic: conceptual
ms.localizationpriority: medium
ms.date: '09/22/2020'
edited: 00/00/0000
security: public
---

# Invites across Xbox One Software Development Kit and Microsoft Game Development Kit title versions

The Multiplayer system supports multiplayer sessions, SmartMatch matchmaking, invites, and activity (join-in-progess) across Xbox One Software Development Kit/GDK title versionsas long as these share the same Xbox title ID. Multiplayer service support for Xbox One Software Development Kit/GDK title versions that use different Xbox title IDs is not possible.

In this context it is important to note that Xbox One Software Development Kit and GDK does not refer to the underlying hardware. Xbox One Software Development Kit titles use the same package on both Xbox One and Xbox Series console hardware. GDK titles allow a package distinction between Xbox One and Xbox Series console hardware, resulting in different configuration options.

## Partner Center platform configuration

In Partner Center the *Xbox Live Settings* configuration allows to specify the platforms that are supported for a title. For Xbox consoles the available hardware categories are:

- *Xbox One* for Xbox One, Xbox One S and Xbox One X consoles.
- *Xbox Series X\|S* for Xbox Series X and Xbox Series S consoles.

Invite behavior depends on the selected console types and the available title versions (Xbox One Software Development Kit/GDK).


### Existing Xbox One Software Development Kit title version only

Existing Xbox One Software Development Kit titles that do not have a GDK do not require any configuration changes to enable invites/activity between Xbox One and Xbox Series consoles.

For Xbox One Software Development Kit titles released prior to Xbox Series consoles, only *Xbox One* is selected in the Partner Center configuration. On Xbox Series consoles Xbox One Software Development Kit titles are run in backwards compatibility and functionally treated as the same console type. This results in invite/activity across both console types. This behavior was put in place as a simplification to avoid requiring to re-publish configuration changes just for enabling this behavior.


### Existing Xbox One Software Development Kit title version and GDK title version

For titles that are releasing a new GDK title version for Xbox Series consoles in addition to an existing Xbox One Software Development Kit title version used on Xbox One consoles, configuration changes are required to enable the desired invite/activity behavior.


#### MPSD titles

Titles that use the Multiplayer Session Directory service for invite/activity need to enable both *Xbox One* and *Xbox Series X\|S* hardware categories to enable invites/activity between Xbox One Xbox One Software Development Kit and Xbox Series GDK title versions.

In addition to Partner Center configuration, the `crossplay` MPSD session capability further determines the invite/activity behavior:

- `crossplay` set to *true* (default)  
  Invites/activity across all selected hardware categories is enabled.
- `crossplay` set to *false*  
  Invites/activity is only enabled within the selected hardware categories, not across different hardware categories. This allows to isolate specific hardware categories (e.g. Xbox Series consoles) for certain game modes. Invites that are sent users on another hardware cetegory are silently discarded.


#### MPA titles

The behavior of titles that use the Multiplayer Activity service is dependent on the selected hardware categories as well as the `allowCrossPlatformJoin` field specified for invites/activity. To support invites/activity on a hardware category it must be enabled in Partner Center.

The `allowCrossPlatformJoin` field is used to determine how invite/activity behave:

- `allowCrossPlatformJoin` set to *true* (default)  
  Invites/activity are enabled across all hardware categories specified in the Partner Center configuration.
- `allowCrossPlatformJoin` set to *false* 
  Invites/activity are only available on hardware category that matches the local device. Invites that are sent users on another hardware cetegory are silently discarded.

MPA must be used on both Xbox One Software Development Kit and GDK title versions for correct functionality.


#### Granular restrictions for invites/activity

Titles with different game modes may prefer to keep certain competitive multiplayer experiences within the same hardware type. An example of this would be to allow invites/activity for casual game modes between Xbox One and Xbox Series consoles, but restrict competitve game modes to the identical hardware only.

As mentioned above, invites/activity can be limited through the use the `allowCrossPlatformJoin` for MPA or the `crossplay` capability in MPSD session templates. Titles can further identify the specific local hardware through [`XSystemGetDeviceType`](../../../../../reference/system/xsystem/functions/xsystemgetdevicetype.md). This information can be used to for granular matchmaking or to reject a player that does not use the expected hardware type. For these failures titles must display a clear failure message.

Titles with only an Xbox One Software Development Kit title version are strongly encouraged to use the default MPSD/MPA behavior outlined in the sections below. Disabling `crossplay` or `allowCrossPlatformJoin` can result in incorrect behavior of invite/activity between different console types. 

Titles are encouraged to avoid restricting matchmaking and invites/activity as much as possible to provide gameplay to the largest number of players.
  
## See also  
  
* [Multiplayer Activity feature overview](../../mpa/live-mpa-overview.md)  
* [MPSD session template constants](../../mpsd/concepts/live-session-template-constants.md)  