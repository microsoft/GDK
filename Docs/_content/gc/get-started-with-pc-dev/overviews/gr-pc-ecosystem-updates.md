---
author: zhooper
title: Overview of PC ecosystem updates
description: Overview of PC ecosystem updates
kindex: Overview of PC ecosystem updates
ms.author: zhooper
ms.topic: conceptual
edited: 02/22/2022
security: public
---

# Overview of PC ecosystem updates

With the release of the March 2022 Microsoft Game Development Kit (GDK), we have made a set of PC ecosystem improvements. These improvements are direct feedback from game developers around our developer experience. They aim to address common areas of friction and provide new capabilities to enabling making PC Microsoft Game Development Kit (GDK) titles easier.

## What is releasing in the March 2022 Microsoft Game Development Kit (GDK)

The changes that we are enabling in the March 2022 Microsoft Game Development Kit (GDK) are as follows:

* MSIXVC packages now install as a [Flat File Install](../../packaging/packaging-flatfileinstall.md). This allows for game files to be accessible via an XboxGames folder that does not require elevation to access, enables modification of game resources by default and removes the need to override file system write, register write or package root write behavior that was tied to package virtualization previously. For more information, please see [Flat File Install Overview](../../packaging/packaging-flatfileinstall.md).
* The [MicrosoftGame.config configVersion](../../reference/system/microsoftgameconfig/microsoftgameconfig-schema.md) has been updated to 1. This schema version makes the MSAAppId and TitleId required if either element was specified. The MSAAppId and TitleId are a key part of enabling consistent Identity across our PC ecosystem and will directly enable many of the capabilities detailed in the below section. For more information on this change, see [MicrosoftGame.config Reference (sample MicrosoftGame.config and schema)](../../reference/system/microsoftgameconfig/microsoftgameconfig-schema.md).

## What's Next

We are planning on enabling future functionality based on the foundation applied with the March 2022 Microsoft Game Development Kit (GDK) changes in a near term release. These updates will improve the developer experience on PC by:
* Removing the need to register a title before launching it on PC. This will make daily iteration less complex and faster.
* Guaranteeing titles launch in a consistent state and with title identity regardless of how their launch is executed (i.e. double click, custom command prompt, custom tool)
* Providing platform solutions to upfront sign-in, cloud save sync and game updates ahead of title launch.
* Ensuring the current working directory is properly set.

We are excited to share more about these features in a future release.

## See also  

[Flat File Install Overview](../../packaging/packaging-flatfileinstall.md)  
[Getting started with PC game development](../gr-get-started-with-pc-dev-toc.md)  
[Utilizing Microsoft Game Development Kit tools to install and launch your PC title](../../tools-pc/launching-on-pc.md)  