---
author: M-Stahl
title: Game saves overview
description: Describes how you can use the `XGameSave` API to save data that can roam between different devices to the cloud.
kindex:
- Save games overview
- Game saves overview
- Connected Storage overview
- Cloud saves overview
ms.author: jgup
ms.topic: conceptual
edited: 05/08/2020
security: public
---

# Game saves

The `XGameSave` API allows games to save game data to local storage that's synchronized to the cloud whenever the game 
is connected to the internet. Saved data is available on any other connected device after synchronization. The 
exact granularity of the data preserved is specific to each game. You're encouraged to save game state as 
accurately as possible to offer the best resume experience.

You should divide game save data into logical groupings that are independently updateable rather than writing 
monolithic saves. This allows games to reduce the amount of data they write in various situations, reducing local 
resource consumption and other IO usage. The API also allows titles to update more than one data item in an 
atomic operation that's guaranteed to succeed entirely or not take effect at all (for example, in the case of a
 mid-save catastrophic failure).

Because users can quickly switch among titles with Xbox One, you should design your game to keep your current 
state ready to save on short notice in anticipation of receiving a `Suspend` event, which can happen virtually at any 
time. The `XGameSave` API uses RAM outside the title reservation as the first point of storage to maximize 
title write speed during the short suspend time window. The system then persists the data to durable storage, 
reconciles it with any other data writes since the last upload, and schedules data uploads. After being stored and queued for 
upload, the system is robust to various failures such as network connectivity loss or a power failure.

## XGameSave API 

The `XGameSave` API delivers the following features.

* Provides a total of 256 MB of storage per user per TitleID/service configuration identifier (SCID). 
* Provides handling in case of power failures. 
* Data is automatically synchronized to the cloud. 
* Cloud-backed data is available across Xbox One devices. 
* Platform handles cross-device syncing and conflict management independent of the title. 
* There's a 16-MB limit on the amount of data that can be uploaded per call to [XGameSaveSubmitUpdate](../../../reference/system/xgamesave/functions/xgamesavesubmitupdate.md) 
(or [XGameSaveSubmitUpdateAsync](../../../reference/system/xgamesave/functions/xgamesavesubmitupdateasync.md)).

When a game has reached its storage limit for a user, calls to `XGameSaveSubmitUpdate` and 
`XGameSaveSubmitUpdateAsync` fail. Games that want to know how much of their quota is still available can call either 
[XGameSaveGetRemainingQuota](../../../reference/system/xgamesave/functions/xgamesavegetremainingquota.md) or [XGameSaveGetRemainingQuotaAsync](../../../reference/system/xgamesave/functions/xgamesavegetremainingquotaasync.md).

The `XGameSave` API provides support for both asynchronous and synchronous (blocking) calls, depending on your preferred programming 
model. Note that because this API does IO, some calls can take an arbitrary amount of time to run. Don't call any of the 
synchronous APIs from critical game engine threads. Consider marking your critical game engine threads by calling 
[XThreadSetTimeSensitive](../../../reference/system/xthread/functions/xthreadsettimesensitive.md).

## Configuring your game for XGameSave

When using the `XGameSave` API, all read and write operations are associated with an Xbox Live Primary SCID. A particular game 
might have multiple service configurations, each with its own ID. The SCID is required to 
initialize the `XGameSave` API and must be passed into [XGameSaveInitializeProviderAsync](../../../reference/system/xgamesave/functions/xgamesaveinitializeproviderasync.md). 
You must initialize the provider before taking any other action with the `XGameSave` API.

Working with your developer account manager (DAM), you can also access save game data from another game (for example, a current 
version of a game wants to read the save game data from a previous version of that game.)
   
## XGameSave Concepts

To properly understand the API, some useful concepts are as follows.

* **Storage space:** A *storage space* represents all the save data for a user. By default, this is limited to 256 MB per 
user TitleID/SCID.
* **Storage container:** Storage spaces can be made up of multiple *storage containers*. Each storage container could 
represent a save game for the user or any other logical block that might make sense to the game. Each storage container 
has a name.
* **Storage blob:** Each storage container is made up of *blobs*. Each blob has a name. The blobs are the data that make 
up a particular storage container.

## XGameSave storage space

At a high level, all data in the `XGameSave` system is associated with either a user or a machine (for example, an individual 
Xbox One console). All data that's saved by an app for a particular user or machine is stored in an `XGameSave` storage space.

Each user of your game gets an `XGameSave` storage space with a limit of 256 MB total storage. It's important to note that 
this storage is dedicated to only your game&mdash;this storage isn't shared with other games.

To acquire a storage space, your game calls [XGameSaveInitializeProvider](../../../reference/system/xgamesave/functions/xgamesaveinitializeprovider.md) or 
[XGameSaveInitializeProviderAsync](../../../reference/system/xgamesave/functions/xgamesaveinitializeproviderasync.md). If you pass 
in `XUserHandle`, the provider automatically gets and synchronizes the storage space for that user. All containers 
inside the space are synced, so this is a potentially long-running operation&mdash;especially if the user has saved 
data on one device and is resuming gameplay for the first time on a different device. After this operation finishes, 
subsequent iterations with the storage space don't require any response from the cloud to be completed.

When initializing the provider, games can choose to use "sync on demand." When using this option, the initial sync 
downloads only the necessary metadata about containers from the cloud. This operation is fast, and under good network 
conditions, the user isn't likely to see a loading screen. Full downloads only happen when the container is actually 
accessed (that is, one or more blobs are read or a blob query is performed).

The decision whether to synchronize on demand or all at once is up to you. If the amount of data 
saved by the game is small, or you just want a single point when all the data is synchronized, we strongly 
recommend that you don't use "sync on demand." However, if your game uses particularly large saves and the user doesn't 
need all the save data to play the game, using "sync on demand" may significantly improve the user 
experience by only fetching the data when it's needed.

![alert](../../../../../resources/gamecore/images/en-us/common/note.gif) **NOTE:** When using "sync on demand," each access of a container that requires synchronization can 
show the user various dialog boxes such as "Sync progress" or "Conflict" if what is currently on the 
device is in contention with what might be in the cloud.

See the [Sync on Demand (NDA topic)](games-saves-sync-on-demand.md) overview for more details.

## XGameSave containers and blobs

The XGameSave *storage container*, or *container* for short, is the basic unit of storage. Each `XGameSave` storage space 
can contain numerous containers.

Data is stored in containers as one or more buffers called *blobs*. For each container, there's a container file 
that contains references to the data file for each blob in the container.

The storage portion of this API is designed to easily transfer data from the game to persisted storage in a safe, 
reliable, and transactional manner. We want to make sure that the backing data for a container is always consistent. As such, we want the whole operation to succeed or fail atomically. We don’t want to have a partial update where some 
blob data is inconsistent with other data within the container. To do this, we provide an update context 
that blob writes and deletes are submitted to. When that's ready, the whole context is submitted.

To start doing an update to a container, the game must first get a container handle by calling 
[XGameSaveCreateContainer](../../../reference/system/xgamesave/functions/xgamesavecreatecontainer.md). The game must then call 
[XGameSaveCreateUpdate](../../../reference/system/xgamesave/functions/xgamesavecreateupdate.md) to get an update context. After the game has the update context, it 
can make calls to [XGameSaveSubmitBlobWrite](../../../reference/system/xgamesave/functions/xgamesavesubmitblobwrite.md) or [XGameSaveSubmitBlobDelete](../../../reference/system/xgamesave/functions/xgamesavesubmitblobdelete.md). 
When the game is ready to submit the batch of changes, it calls either [XGameSaveSubmitUpdate](../../../reference/system/xgamesave/functions/xgamesavesubmitupdate.md) 
or [XGameSaveSubmitUpdateAsync](../../../reference/system/xgamesave/functions/xgamesavesubmitupdateasync.md). All changes described within the update are applied 
atomically. All blobs are updated as requested, or the entire operation is aborted, and the container 
remains in the state that it was prior to starting the update. Games are limited to a maximum of 16 MB of data for each 
update.

![alert](../../../../../resources/gamecore/images/en-us/common/note.gif) **NOTE:** The `XGameSave` API requires your title to have its TitleID and SCID 
properly configured in order to work. For more information about these required IDs, see [Setting up sandboxes for Xbox 
Live development](../../../live/test-release/sandboxes/live-setting-up-sandboxes.md). Your game must be enabled for Xbox Live in Partner Center.

If you don't configure your SCID and TitleID properly, your `XSaveGame` API calls fail with the following error 
code.

E_GS_NO_ACCESS - 0x80830002 - The operation failed because the title does not have access to the container storage 
spaces.

## See also

[XGameSave](../../../reference/system/xgamesave/xgamesave_members.md)

   