---
author: jgup
title: Win32 file IO with Game Saves (XGameSaveFiles)
description: Describes how to use Win32 file IO with game saves
kindex:
- XGameSaveFiles, overview
- Game saves, Win32
- Win32 game saves
ms.author: jgup
ms.topic: conceptual
security: public
edited: 00/00/0000
---

# Win32 file IO with Game Saves (XGameSaveFiles)

XGameSaveFiles offers an alternative solution for cloud saves on console, PC, and xCloud.
Using XGameSaveFiles allows developers to use normal Win32 file IO functions such as CreateFile and
WriteFile in their saves systems. 

## Comparing XGameSaveFiles to XGameSave

The following table showcases the differences between XGameSaveFiles and XGameSave

|Feature|XGameSaveFiles|XGameSave|
|---|---|---|
|Support for Win32 file IO APIs        |Yes                               |No                             |
|Support for batched updates           |No                                |Yes                            |
|Updates are uploaded during gameplay  |No                                |Yes                            |
|Support for sync-on-demand            |No                                |Yes                            |
|Cross-VM writes on Xbox/xCloud        |No                                |Yes                            |
|Initialization API                    |XGameSaveFilesGetFolderWithUiAsync|XGameSaveInitalizeProviderAsync|
|Default storage limit per user        |256 MB                            |256 MB                         |
|File size limit                       |64 MB\*                           |16 MB                          |

\* If the game needs to support interop between XGameSaveFiles and XGameSave, the game will need
to limit their files sizes to 16 MB.

Games cannot mix the usage of XGameSaveFiles with the usage of XGameSave. Games much choose which cloud save system
they want to use. If the game is using XGameSaveFiles and later calls XGameSaveInitializeProvider, it will error out 
with E_GS_PROVIDER_MISMATCH. Equally, if the game was using XGameSave and later calls XGameSaveFilesGetFolderWithUiAsync,
that will also error out with E_GS_PROVIDER_MISMATCH.

## Choosing between using XGameSaveFiles and XGameSave

Both XGameSave and XGameSaveFiles offer a save system that allows for cloud saves that can be shared between
console, PC, and xCloud. 

Beyond the differences highlighted in the table above, XGameSave offers the most robust solution where 
developers can easily batch up their writes and ensure that those writes happen as an atomic action. 
XGameSaveFiles is optimal for developers who already have a Win32 style save system on PC and want to minimize 
the cost of porting that solution to something that works for PC Game Pass.

## When updates are uploaded with XGameSaveFiles

Updates to save games are not the game responsibility and will be handled automatically when the
game is not "active". Not being "active" has different meanings on our different platforms.

Not "active" on console or xCloud means:
- Game is suspended
- Game is terminated
- User whose saves are getting tracked is signed out

Not "active" on PC means:
- Game is terminated
- User whose saves are getting tracked is signed out
- Power state change on the PC 
- 30 minutes have elapsed where either the game is in the background or the game hasn't done any 
  new writes to XGameSaveFiles

## Using XGameSaveFiles

In order to use XGameSaveFiles, the developer must call [XGameSaveFilesGetFolderWithUiAsync](../../../reference/system/xgamesavefiles/functions/xgamesavefilesgetfolderwithuiasync.md), 
passing in the XUser handle for the user whose saves are to be managed and the SCID (Xbox Live service configuration ID)
for the game. When the developer then calls [XGameSaveFilesGetFolderWithUiResult](../../../reference/system/xgamesavefiles/functions/xgamesavefilesgetfolderwithuiresult.md),
they will get the folder to which they can use for game saves, both reading and writing to that folder using
the standard Win32 file IO APIs such as CreateFile, WriteFile, etc..

Developers will need to be aware that the Win32 file IO APIs will return the following errors:

|Error|Description in context of XGameSaveFiles|
|---|---|
|STATUS_NAME_TOO_LONG         |The directory name is too long|
|STATUS_OBJECT_NAME_INVALID   |The directory name contains characters not valid in our cloud service|
|STATUS_NAME_TOO_LONG         |The file name (discounting the directory) is too long|
|STATUS_FILE_TOO_LARGE        |The file size has exceeded 64 MB|
|STATUS_FILE_TOO_LARGE        |The game has exceeded their per-user maximum quota for game saves|
|STATUS_INSUFFICIENT_RESOURCES|The game has exceeded their allotted storage space on the device|

Developers wanting to know how much of their per-user quota is remaining can call 
[XGameSaveFilesGetRemainingQuota](../../../reference/system/xgamesavefiles/functions/xgamesavefilesgetremainingquota.md).

## Directory and file name limitations with XGameSaveFiles

While XGameSaveFiles hides most of the details of the cloud save system from the developer, there are directory
and file name limitations that result because these are backed by Azure blob storage. At a high-level, the 
full directory path will map to a container and the file name will map to a blob. Consider the following 
example of what a game might use for their save:

```
[ROOT]/Save1/BraveNewWorld/state001.dat
```

- The "\[ROOT\]" is what will get returned by [XGameSaveFilesGetFolderWithUiAsync](../../../reference/system/xgamesavefiles/functions/xgamesavefilesgetfolderwithuiasync.md).
- Everything following "\[ROOT\]" up to and including the final forward slash will map to a container.
  - Container names are limited to uppercase letters (A-Z), lowercase letters (a-z), numbers (0-9), underscore (_), period (.),
    hyphen (-), and forward slash (/)
  - Container names are limited to 256 characters
  - Container names may not end in a period, contain two consecutive periods, or start with a period or hyphen.
- Everything following the final forward slash (the file name) will map to a blob
  - Filenames are limited to 65 characters but can otherwise be Unicode characters that are supported in NTFS
- The full resulting path including the filename (but not the "\[ROOT\]") must be less than MAX_PATH (260
  characters)

## XGameSaveFiles development tools

XGameSaveFiles uses the same development tools as XGameSave. While the APIs are different, they leverage 
the exact same XGameSave storage spaces and data. The following tools will help you with development of 
XGameSaveFiles.

- xbstorage 
- xgamesaveutil 
- Fiddler 

### Managing XGameSave data with xbstorage on console

Xbstorage.exe is the development tool that enables managing the local XGameSave data on an Xbox Development 
Kit from a development PC.

This tool allows clearing local XGameSave storage spaces from the hard drive, as well as importing and exporting 
individual user-connected or machine-connected storage spaces by using .xml files.

When an operation is performed on a local XGameSave storage space, the system behaves as if that operation had been 
performed by the app itself. Copying the data from an XGameSave storage space to a local file causes synchronization 
with the cloud prior to copying.

Similarly, copying data from an .xml file on the development PC to a XGameSave storage container on the Xbox One 
devkit causes the console to start uploading that data to the cloud. There are exceptions: if the dev kit can’t 
acquire the lock or if there’s a conflict between the containers on the console and those in the cloud. In such 
cases, the console behaves as if the user had decided not to resolve the conflict—for example, by picking one 
version of the container to keep—and the console behaves as if it were playing offline until the next time the 
title is started.

The xbstorage reset command clears the local storage of all service configuration identifiers (SCIDs) and the 
user’s saved data but doesn’t alter the data stored in the cloud. This is useful for setting a console to the 
state it would be in if the user were roaming to a console and downloading data from the cloud upon playing a 
title.

For more information about xbstorage.exe, see [Manage XGameSave data on console (xbstorage.exe)](../../../tools-console/xbox-tools-and-apis/commandlinetools/xbstorage.md).

### Managing XGameSave data with xgamesaveutil on PC

Xgamesaveutil.exe is the development tool that enables managing the local XGameSave data for games running on the 
PC. It has the same functionality as the xbstorage tool used to manage saves on the console. 

For more information about xgamesaveutil.exe, see [Manage XGameSave data on PC (xgamesaveutil.exe)](../../../tools-pc/commandlinetools/gr-xgamesaveutil.md).

### Monitoring XGameSave network activity by using Fiddler

It can be helpful to determine whether your device is interacting with the service when 
cloud storage operations are performed. Using *Fiddler* can help determine whether your device 
is successfully making calls to the service or if it's encountering authorization errors. 

For information about setting up Fiddler on console, see 
[How to use Fiddler with Xbox consoles](../../../networking/overviews/tools/fiddler-setup-networking.md).

For information about setting up Fiddler on PC, see 
[Fiddler on Windows PC](../../../networking/overviews/tools/fiddler-pc.md).

## Interop between XGameSaveFiles and XGameSave and Connected Storage

While XGameSave and Connected Storage are able to easily share save state between them without any game-written code, the same
is not entirely true when trying to move those same saves to a game leveraging XGameSaveFiles. While this may not
be a common scenario, there are situations where the game might want interop with XGameSaveFiles. The typical reason might be:
- The publisher has an existing game on console that is already using either connected storage or XGameSave
- The publisher doesn't want to update that existing game to use XGameSaveFiles
- The publisher feels like adding XGameSaveFiles to their PC game is easier than XGameSave but still want to support cross-save
  progression between the PC and console and xCloud

Moving between XGameSave and XGameSaveFiles is fairly straightforward. When the title calls 
[XGameSaveFilesGetFolderWithUiAsync](../../../reference/system/xgamesavefiles/functions/xgamesavefilesgetfolderwithuiasync.md), there will be a mapping of containers and blobs 
to directories and files using the following rules:

- Any forward slash (L'/') in the container name will be used to create the directory structure in which the file will reside
- The following characters are invalid for XGameSaveFiles and if encountered will get mapped to an underscore (L'_')
  - All characters from L'\\0' through L'\\001f', inclusive
- The following characters are invalid for XGameSaveFiles and if encountered will get mapped to a period (L'.')
  - Double quotes (L'"')
  - Less than (L'<')
  - Greater than (L'>')
  - Pipe symbol (L'|')
  - Asterix (L'*')
  - Question mark (L'?')
  - Back slash (L'\\')
- Any forward slash (L'/') in the blob name will be mapped to a period (L'.') in the filename

When moving from XGameSaveFiles back to XGameSave, the original container and blob names will be restored, 
assuming that the filenames weren't changed or moved.

## See also

[XGameSaveFiles reference](../../../reference/system/xgamesavefiles/xgamesavefiles_members.md)
   