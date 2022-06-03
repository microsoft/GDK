---
title: Setting up sandboxes
description: How to get critical IDs and set up sandboxes.
kindex:
- Setting up sandboxes
- Sandbox, Sandbox ID
- TitleID
- Service Configuration ID (SCID)
ms.topic: conceptual
author: joannaleecy
ms.author: dapayn
ms.assetid: 1e4b261e-5962-bb5f-cd61-4c61eb2e1944
ms.localizationpriority: medium
edited: 02/06/2020
security: public
---

# Setting up sandboxes


<a id="ID4ET"></a>

## Overview  

This topic describes how to get the required IDs to set up sandboxes and configure your application for use of Xbox services.

A sandbox provides content isolation for an individual Development Kit, providing a clean environment for development and testing.

Xbox services provide online features such as events, achievements, and multiplayer functionality.

To enable sandboxes and use Xbox services, you'll need to obtain several IDs to configure your dev kit and your title.

These can be done with the same process.

The process is as follows.  
1. Get your IDs.  
1. Set your sandboxes on your dev kits.  
1. Bind the TitleID to your title, along with other optional identifiers.

<a id="ID4EKB"></a>

### Critical IDs  

There are three IDs that are critical for the development of titles and applications for Xbox One (or later): the sandbox ID, the TitleID, and the service configuration identifier (SCID).

While it's necessary to have a sandbox ID to use a dev kit, the TitleID and SCID aren't required for initial development but are required for any use of Xbox Live services.
We therefore recommend that you obtain all three at the same time.


<a id="ID4EWB"></a>

#### Sandbox IDs  

The sandbox provides content isolation for your dev kit during development, ensuring that you have a clean environment for developing and testing your title.
The sandbox ID identifies your sandbox.
A console may only access one sandbox at any one time, though one sandbox can be accessed by multiple consoles.

Sandbox IDs are case-sensitive.


<a id="ID4E6B"></a>

#### TitleID  

The TitleID uniquely identifies your title to Xbox Live services.
The TitleID is used throughout the services to enable your users to access things such as your title's Xbox Live content, their user statistics, and achievements, and to enable Xbox Live multiplayer functionality. 

Title IDs can be case-sensitive, depending on how and where they're used.


<a id="ID4EIC"></a>

#### Service configuration identifier (SCID)  

As a part of development, you'll create events, achievements, and a host of other online features.
These are all part of your service configuration and require the SCID for access.

Unlike a prior version of the Xbox OS, titles developed for the Microsoft GDK Game OS have only a single SCID, so all instances of a title within a particular sandbox shares the same configuration.

Microsoft GDK Game OS SCIDs are always a GUID with the same value as the TitleID, prepended with zeros.
For the vast majority of interactions with Xbox Live from a Microsoft Game Development Kit (GDK) title, the SCID no longer needs to be explicitly specified, but it might be required if it's directly interacting with the Xbox Live REST endpoints.

SCIDs are case-sensitive.


<a id="ID4EVC"></a>

## Obtaining your IDs

For the moment, you'll obtain your IDs by working with your developer account manager.


<a id="ID4EPD"></a>

## Setting up a sandbox

You won't be able to start your dev kit without setting your sandbox ID.
To do this, open an GDK command window and use the [Configuration (xbconfig.exe) (NDA topic)](../../../tools-console/xbox-tools-and-apis/commandlinetools/xbconfig.md) command as follows.  
1. Check your current sandbox. Enter **xbconfig sandboxid** at the command prompt.
1. If it's not what you expect, change your sandbox ID. Enter **xbconfig sandboxid=&lt;*your sandbox id*>**  at the command prompt.
1. Restart your console by using [Reboot (xbreboot.exe) (NDA topic)](../../../tools-console/xbox-tools-and-apis/commandlinetools/xbreboot.md) at the command prompt.
1. Verify that your sandbox has been correctly reset. Enter **xbconfig sandboxid** at the command prompt.


<a id="ID4E5E"></a>

## Adding the TitleID and other optional identifiers to your binary  

While the sandbox is configured on a platform level for each dev kit, the TitleID is bound to a specific binary.
To add a TitleID to your binary, modify the [MicrosoftGame.config](../../../system/overviews/microsoft-game-config/MicrosoftGameConfig-toc.md) file for that binary by adding a new node in the `<Game>` node as follows.

```xml
<?xml version="1.0" encoding="utf-8"?>
<Game configVersion="1">
    ...
    <TitleId>yourTitleId</TitleId>
    <StoreId>yourStoreId</StoreId>
    <MSAAppId>yourMSAAppId</MSAAppId>
    ...
</Game>  
```> [!NOTE]
> : As of the March 2022 Microsoft Game Development Kit (GDK), the MSAAppId and TitleId are required if either one of them is specified in the MicrosoftGame.config. For more information, see [MicrosoftGame.config Element - MSAAppId](../../../reference/system/microsoftgameconfig/elements/microsoftgameconfig-element-msaappid.md) and [MicrosoftGame.config Element - TitleId](../../../reference/system/microsoftgameconfig/elements/microsoftgameconfig-element-titleid.md).

<a id="ID4EAH"></a>

## The RequiresXboxLive flag  

If the **RequiresXboxLive** flag is set to true, the title won't launch unless there's an active connection to Xbox Live, and the title clears authentication with Xbox Live.
This ensures that the title has taken the latest content updates.
If connectivity is lost while the title is running, the title is suspended, and subsequently terminated.

Only "internet required" titles should mark **RequiresXboxLive** as true. Note that marking your title in this way doesn't guarantee that the required services for the title are up and running.
**RequiresXboxLive** is similarly a node under `Game` within the [MicrosoftGame.config](../../../system/overviews/microsoft-game-config/MicrosoftGameConfig-toc.md) file.