---
author: M-Stahl
title: XGameSave best practices
description: Describes best practices in using XGameSave.
kindex:
- Save games, best practices
- Game saves, best practices
ms.author: jgup
ms.topic: conceptual
edited: 04/09/2020
security: public
---

# XGameSave best practices

This topic outlines several best practices for how to use the `XGameSave` API.

*  [When to acquire a storage space](#storage)
*  [Lifetime of the storage space](#lifetime)
*  [When to use sync on demand](#syncondemand)
*  [Protecting against accidental overwrites](#overwrites)
*  [When to save](#save)
*  [General guidance](#guidance)

<a id="storage"></a>

## When to acquire a storage space

In general, games should try and obtain an `XGameSave` storage space after a user has signed in 
and indicated that they want to play the game. Games get the storage space by calling either 
[XGameSaveInitializeProvider](../../../reference/system/xgamesave/functions/xgamesaveinitializeprovider.md) or 
[XGameSaveInitializeProviderAsync](../../../reference/system/xgamesave/functions/xgamesaveinitializeproviderasync.md).

The execution time for acquiring a user's connected storage space can vary. Games should take this 
action during main execution rather than in response to a user starting to sign out or in response 
to receiving a suspend notification from the system. You should also consider aligning the 
acquisition of connected storage space with long sequences of data loading so that the operations 
can execute in parallel.

When your game requests access to an `XGameSave` storage space, the system performs a synchronizing 
process to keep the user's saved data in a consistent state across Xbox One consoles and to make 
their data available for offline play. Because synchronizing can take varying amounts of 
time and might require the user to make decisions, the system might display UI to the user at 
various stages of the process.

The user can navigate away from your app by pressing the Xbox button at any time, even if 
synchronization UI is active. The system hides the UI, and the synchronization continues as far 
as it can without user interaction. When the user navigates back to the app, the UI is displayed 
again unless the synchronization has been completed. The system never makes an assumption about a user 
selection when the UI is hidden.

<a id="lifetime"></a>

## Lifetime of the storage space

In general, it's a best practice that after the game has an `XGameSaveProviderHandle` to a given
storage space that the game hold on to that handle for the lifetime of that game session. Holding on to the 
handle has no adverse performance effects on the game. Attempting to acquire that handle again after it has
been released might take time. 

<a id="syncondemand"></a>

## When to use sync on demand

Most games shouldn't use sync on demand. Games can choose to use sync on demand when they 
get their storage space, passing `true` to the `syncOnDemand` parameter of either 
[XGameSaveInitializeProvider](../../../reference/system/xgamesave/functions/xgamesaveinitializeprovider.md) or 
[XGameSaveInitializeProviderAsync](../../../reference/system/xgamesave/functions/xgamesaveinitializeproviderasync.md).

Sync on demand changes when the game synchronizes saves.

*  When *not using* sync on demand, all synchronization happens when the storage space is 
   obtained. Depending on the size of the save games and other conditions, the user may see 
   UI appear over the game.
*  When *using* sync on demand, synchronization only happens when the game attempts to read
   data from a storage container by calling either [XGameSaveReadBlobData](../../../reference/system/xgamesave/functions/xgamesavereadblobdata.md)
   or [XGameSaveReadBlobDataAsync](../../../reference/system/xgamesave/functions/xgamesavereadblobdataasync.md). If a synchronization is 
   required, this might show UI to the user.

Sync on demand should only be used if all the following conditions are true.

1.  The game has a large number of containers, and each one is large.
2.  The game isn't in the middle of active gameplay when it needs to read from the storage 
    container for the first time&mdash;remember, the first read might prompt a need to synchronize 
    the whole container.
3.  The game session only needs to access a limited number of the containers. 

<a id="overwrites"></a>

## Protecting against accidental overwrites

Synchronization of saved games can take time. Users can choose to cancel the sync of their 
saved games. When they do this, the storage space and its containers might not be on the local 
device or might only be partially synchronized. Games need to protect themselves to ensure 
that they don't make incorrect assumptions on what might have been downloaded.

When you call [XGameSaveCreateContainer](../../../reference/system/xgamesave/functions/xgamesavecreatecontainer.md) on an already created 
container that's already on the device, it opens that container, allowing the game 
to do updates to that container.

When you call [XGameSaveCreateContainer](../../../reference/system/xgamesave/functions/xgamesavecreatecontainer.md) and that container 
doesn't exist on the device&mdash;either because it wasn't synchronized yet or because the game 
is intentionally creating a new container&mdash;it will create a new container. If 
the intent was to do something new, this is expected. If this happens because 
something wasn't synchronized, there can be data loss when the newly (and unintentionally) 
created container conflicts with the one in the cloud.

Protection against this scenario is straightforward: always enumerate the containers you 
are interested in before calling `create`. Games can enumerate the containers by calling 
either [XGameSaveEnumerateContainerInfo](../../../reference/system/xgamesave/functions/xgamesaveenumeratecontainerinfo.md) or 
[XGameSaveEnumerateContainerInfoByName](../../../reference/system/xgamesave/functions/xgamesaveenumeratecontainerinfobyname.md).

<a id="save"></a>

## When to save

Whenever a game receives a suspend notification, the game should at least save relevant 
data, enabling the system to return to a contextually appropriate state for the user.

If your game design uses periodic, automatic, or user-initiated saves, `XGameSave` can be 
called more often than when receiving a suspend notification. Doing so is a good way to 
reduce the risk of losing data because of a loss of power or a crash.

When a user signs out, the `XUser` object for that user remains valid, assuming that the game has 
taken a sign-out deferral. With that deferral, the game can perform final save operations 
by using the `XGameSave` API. 

<a id="guidance"></a>

## General guidance

### Don't store dependent data across containers 
Don't store data that has dependencies across more than one container. Containers can be 
separated because of incomplete synchronization, a loss of power, or other error conditions. Data 
stored in a single container must be self-sufficient and self-consistent.

### Don't discourage users from turning off the console or navigating away 
Your title shouldn't discourage users from turning off the console or navigating away 
from your app when saving. On Xbox One, your title receives a suspend event and has one 
second to use the `XGameSave` API to save state. The system ensures that data is properly 
committed to the hard drive before it shuts down completely or enters its low-power state. 
The same suspension process occurs if the user ejects your title's disc to play another one.

### Tell the user when the game is trying to load data 
When your game is waiting for an [XGameSaveInitializeProvider](../../../reference/system/xgamesave/functions/xgamesaveinitializeprovider.md) 
call to be completed, visually indicate to the user that the app is trying to load data. Although 
the system provides UI during the synchronization process when your app is running in full-screen display, 
this UI is hidden if the user navigates to the Home screen. This situation is likely if the 
system is synchronizing a lot of data for the requested `XGameSave` storage space.

### Retain XGameSave storage spaces 
Retain `XGameSaveProviderHandle` rather than try to acquire them every time a read or write 
event occurs. There are no negative effects on performance or robustness caused by retaining a 
handle for an extended time.
> [!NOTE]
> If at any point any of the `XGameSave` APIs return `E_GS_HANDLE_EXPIRED`, 
the game should drop all `XGameSave` objects and acquire `XGameSaveProviderHandle` again. 

### Keep data sizes small 
Keep the size of saved data small. All user data in the storage space is uploaded to the cloud 
when the console is online. Optimize your data formats to ensure minimal delays and bandwidth usage.

Even beyond the physical size of the saved data, consider the number of blobs within the container.
Even if the container is only 1 MB, and if that container has 1,000 blobs and each one is 1 KB, it would take longer 
to sync than if the container had fewer blobs that were much bigger.

### Verify that users don't mind not saving 
Check for `E_GS_OUT_OF_LOCAL_STORAGE` errors that are returned from 
[XGameSaveInitializeProvider](../../../reference/system/xgamesave/functions/xgamesaveinitializeprovider.md) and 
[XGameSaveSubmitUpdate](../../../reference/system/xgamesave/functions/xgamesavesubmitupdate.md). Query users to see if they really want to play 
without saving. If a user indicates that they want to save games, retry the operation.

### Check the user's quota and prompt to clear space 
Check for an `E_GS_QUOTA_EXCEEDED` error that's returned by [XGameSaveSubmitUpdate](../../../reference/system/xgamesave/functions/xgamesavesubmitupdate.md). 
If your game receives this message, notify users that they can't save any more data until they've 
freed up some space. Present them with UI that enables them to do so. Each user gets 256 MB of data 
per game.

### Save the state of menus for restoration later 
Save menu state and other game settings in addition to saving core game data. If the user plays 
another game and then comes back to yours, restore them to a contextually appropriate menu state.

### Respond to signed-in user changes 
Users can sign out while your game is suspended. When your game is resumed, it should determine 
if the set of users who are signed in has changed. Consider navigating to an appropriate location within 
the game, such as a menu, when this occurs.


## See also

[Game saves overview](game-saves.md)  
[XGameSave API reference](../../../reference/system/xgamesave/xgamesave_members.md)