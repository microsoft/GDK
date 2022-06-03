---
author: M-Stahl
title: XGameSave development tools
description: Describes the tools that help you develop your game so that it can use `XGameSave`.
kindex:
- Save games, development tools
- Game saves, development tools
ms.author: jgup
ms.topic: conceptual
edited: 04/10/2020
security: public
---

# XGameSave development tools

You can develop your game so that it can use `XGameSave`. The following tools help you do so. 

* xbstorage
* Gamesaveutil 
* Fiddler

## Managing XGameSave with xbstorage on console

*xbstorage* is a development tool that enables managing the local connected storage data 
on an Xbox One Development Kit from a development PC.

This tool allows clearing local `XGameSave` storage spaces from the hard drive, as well as 
importing and exporting individual user-connected or machine-connected storage spaces by using .xml files.

When an operation is performed on a local `XGameSave` storage space, the system behaves as if that 
operation had been performed by the app itself. Copying the data from a connected storage space 
to a local file causes synchronization with the cloud prior to copying.

Similarly, copying data from an .xml file on the development PC to a `XGameSave` storage container 
on the Xbox One dev kit causes the console to start uploading that data to the cloud. There are 
exceptions: if the dev kit can't acquire the lock or if there's a conflict between the 
containers on the console and those in the cloud. In such cases, the console behaves as if 
the user had decided not to resolve the conflict&mdash;for example, by picking one version of the 
container to keep&mdash;and the console behaves as if it were playing offline until the next time 
the title is started.

The xbstorage `reset` command clears the local storage of all service configuration identifiers (SCIDs) and the user's saved data but 
doesn't alter the data stored in the cloud. This is useful for setting a console to the state 
it would be in if the user were roaming to a console and downloading data from the cloud upon playing a title.

For more information about xbstorage, see [Manage Connected Storage (xbstorage.exe)](../../../tools-console/xbox-tools-and-apis/commandlinetools/xbstorage.md).

## Managing XGameSave with Gamesaveutil on desktop

*Gamesaveutil* is a tool that's part of the Windows SDK and allows you to manage locally 
cached `XGameSave` storage for your game with all the same functions that xbstorage provides.

For details about using this tool, see the [Gamesaveutil](/gaming/xbox-live/features/cloud-storage/connected-storage/concepts/live-connected-storage-xb-storage#gamesaveutil) section in the Managing local Connected Storage topic on Microsoft Docs.
> [!NOTE]
> The Gamesaveutil documentation on Microsoft Docs has references to 
Connected Storage. Connected Storage was the name that this technology had in the context of the Universal Windows Platform (UWP) and 
ERA. The `XGameSave` API talks to the same service as the Connected Storage API. 

## Monitoring Connected Storage network activity by using Fiddler
It can be helpful to determine whether your console is interacting with the service when 
cloud storage operations are performed. Using *Fiddler* can help determine whether your console 
is successfully making calls to the service or if it's encountering authorization errors. For 
information about setting up Fiddler on Xbox One, see 
[How to use Fiddler with Xbox One](../../../networking/overviews/tools/fiddler-setup-networking.md).

## See also

[Game Saves overview](game-saves.md)  
[XGameSave API reference](../../../reference/system/xgamesave/xgamesave_members.md)