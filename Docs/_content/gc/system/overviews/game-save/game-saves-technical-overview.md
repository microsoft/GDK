---
author: M-Stahl
title: XGameSave technical overview
description: Describes the mechanics of an `XGameSave` update.
kindex:
- Save games, best practices, mechanics, technical, overview
- Game saves, best practices, mechanics, technical, overview
ms.author: jgup
ms.topic: conceptual
edited: 04/13/2020
security: public
---

# XGameSave technical overview

[XGameSave](../../../reference/system/xgamesave/xgamesave_members.md) allows users to save their game data to the cloud. This topic gives an explanation of what goes on behind the scenes when saved data is updated or synced between the console and cloud storage.  

## XGameSaveSubmitUpdateAsync behavior

To save some data with [XGameSave](../../../reference/system/xgamesave/xgamesave_members.md) and later have it stored in the cloud, you need to call the [XGameSaveSubmitUpdateAsync](../../../reference/system/xgamesave/functions/xgamesavesubmitupdateasync.md) method to add, delete, or update the data. When [XGameSaveSubmitUpdateAsync](../../../reference/system/xgamesave/functions/xgamesavesubmitupdateasync.md) is called, the buffers provided to the call by [XGameSaveSubmitBlobWrite](../../../reference/system/xgamesave/functions/xgamesavesubmitblobwrite.md) and [XGameSaveSubmitBlobDelete](../../../reference/system/xgamesave/functions/xgamesavesubmitblobdelete.md) are quickly copied from the app partition into a dedicated memory space in the system partition. After the memory has successfully been copied into the system partition, the [XGameSaveSubmitUpdateAsync](../../../reference/system/xgamesave/functions/xgamesavesubmitupdateasync.md) result is returned, indicating to the app that it's safe to free the memory that it locally allocated for the data.

The system then saves the blobs to the console's hard drive and completes the operation with a final container update that commits the entire operation on that container.

There's a 16 MB cap on the memory in the shared partition for receiving [XGameSaveSubmitUpdateAsync](../../../reference/system/xgamesave/functions/xgamesavesubmitupdateasync.md) data.
If a call to [XGameSaveSubmitUpdateAsync](../../../reference/system/xgamesave/functions/xgamesavesubmitupdateasync.md) can't be immediately serviced by the system because there isn't enough memory free in the dedicated 16 MB buffer, the call is queued for servicing. The system continuously transfers data from the 16 MB buffer to the hard drive. Queued updates are serviced in the order that they were requested in as space becomes available in the 16 MB buffer.  

After updated data is saved to the console's hard drive, it's available to be picked up by the [XGameSave](../../../reference/system/xgamesave/xgamesave_members.md) system and uploaded to the cloud. To complete this upload, the system takes a snapshot of the current container's state and uploads the changes to the cloud. This upload occurs during periodic intervals during gameplay or when the game is suspended or terminated.  

The cloud upload process is similar to copying changed data to the console's hard drive. Individual blobs are uploaded to the service. The update operation is committed by a final update to a container file that references all the other uploaded blobs.
In an upload to the cloud, this consolidation into a single and final update ensures that all the data that's referenced in an [XGameSaveSubmitUpdateAsync](../../../reference/system/xgamesave/functions/xgamesavesubmitupdateasync.md) call is committed in its entirety or the container is left unchanged.
In this way, even if a system goes offline or loses power during an upload operation, a user could go to another Xbox One console, download data from the cloud, and continue play with a consistent view of all the containers.
> [!IMPORTANT]
> Data dependencies across containers aren't safe. The results of individual `XGameSaveSubmitUpdateAsync` calls are guaranteed to be applied entirely or not at all.

[XGameSaveSubmitUpdateAsync](../../../reference/system/xgamesave/functions/xgamesavesubmitupdateasync.md) calls must not assume that a future [XGameSaveSubmitUpdateAsync](../../../reference/system/xgamesave/functions/xgamesavesubmitupdateasync.md) call will be completed successfully to leave the container in a valid state.
In other words, apps can't rely on more than one [XGameSaveSubmitUpdateAsync](../../../reference/system/xgamesave/functions/xgamesavesubmitupdateasync.md) call to save all the required data into a container.
Each [XGameSaveSubmitUpdateAsync](../../../reference/system/xgamesave/functions/xgamesavesubmitupdateasync.md) call must leave the contents of the specified container in a valid state for the app to read later.

To illustrate this issue, consider a scenario where a container tracks the amount of gold and food held by a character named Bob.
The game can store two blobs named gold and food.
Bob starts with 100 gold units and no food units in his inventory as shown in the following diagram.

**Figure 1.  Bob starts with 100 gold units**

![Example diagram. Bob has 100 gold units.](../../../../../resources/gamecore/secure/images/en-us/xgamesave/submitupdatesasync_example_scenario1.png)  
  
Bob now spends 50 gold units.
The game prepares an [XGameSaveSubmitUpdateAsync](../../../reference/system/xgamesave/functions/xgamesavesubmitupdateasync.md) call, which updates the value of the gold blob to 50.

The system captures the updated blob and information about the container update to the updates buffer.
The system then copies the value of the new blob to the hard drive as shown in the following diagram.

**Figure 2.  The system captures the updated information and copies the values to the hard drive**

![Example diagram. Bob spends 50 gold units.](../../../../../resources/gamecore/secure/images/en-us/xgamesave/submitupdatesasync_example_scenario2.png)  
  
The system updates the container file on the hard drive to reference the new blob as shown in the following diagram.
Eventually, the system removes the unreferenced blob in a garbage collection operation.

**Figure 3.  The system updates the container file on the hard drive and removes the unreferenced blob**

![Example diagram. Overwriting the new gold value for Bob in Connected Storage.](../../../../../resources/gamecore/secure/images/en-us/xgamesave/submitupdatesasync_example_scenario3.png)  
  > [!NOTE]
> The more blobs you use per [XGameSaveSubmitUpdateAsync](../../../reference/system/xgamesave/functions/xgamesavesubmitupdateasync.md) call, the more time is required to complete the necessary atomic operations of the file system operations to robustly store the data.
The details of data storage in the preceding example is far too small, but it's intended to clearly illustrate the behavior of the atomic update of multiple blobs in one container.


### Updating multiple blobs&mdash;the wrong way

Consider a scenario in which Bob wants to buy some food.
One unit of gold buys one unit of food, and Bob wants to buy 25 units of food.

The app could issue one [XGameSaveSubmitUpdateAsync](../../../reference/system/xgamesave/functions/xgamesavesubmitupdateasync.md) call to add 25 units of food and then another one to subtract 25 units of gold from the *Bob\_Inventory* container.
Even if the completed handlers for both [XGameSaveSubmitUpdateAsync](../../../reference/system/xgamesave/functions/xgamesavesubmitupdateasync.md) calls have been called, there's a potential for incorrect results because of events like power loss, which might stop the data from being written to the hard drive or cause an incomplete sync to the cloud.

The following diagrams explain the steps taken by the system, and the result of a power loss at any one of the steps.

Assume that the data from both [XGameSaveSubmitUpdateAsync](../../../reference/system/xgamesave/functions/xgamesavesubmitupdateasync.md) calls is already in the system's update buffer, and the game's completion handlers for both calls have been invoked.

First, the system writes the data for the new value of the food blob to the hard drive as shown in the following diagram.

**Figure 4.  The system writes the value of the food blob to the hard drive**

![Example diagram. The system writes the value of the food blob to the hard drive.](../../../../../resources/gamecore/secure/images/en-us/xgamesave/update_method_wrong_way_1.png)  
  
Next, the system updates the container to reference the newly written value.
As the following diagram illustrates, if power was lost after this step and before the next one, Bob would gain 25 food units without having the corresponding gold units deducted from his inventory.

**Figure 5.  The system updates the container to reference the newly written value**

![Example diagram. The system updates the container to reference the newly written value.](../../../../../resources/gamecore/secure/images/en-us/xgamesave/update_method_wrong_way_2.png)  
  
Next, the system writes the data for the new value of the gold blob to the hard drive as shown in the following diagram.
The value for gold referenced by the *Bob\_Inventory* container still hasn't been updated. Bob has 25 more gold units than he should, but we're one step closer to the results we want.

**Figure 6.  The system writes the data for the new value of the gold blob to the hard drive**

![Example diagram. The system writes the data for the new value of the gold blob to the hard drive.](../../../../../resources/gamecore/secure/images/en-us/xgamesave/update_method_wrong_way_3.png)  
  
Finally, the system updates the container file to reference the newly written blob for gold—the intended result as shown in the following diagram.

**Figure 7.  The system updates the container file to reference the newly written gold blob**

![Example diagram. The system updates the container file to reference the newly written gold blob.](../../../../../resources/gamecore/secure/images/en-us/xgamesave/update_method_wrong_way_4.png)  
  

### Updating multiple blobs&mdash;the right way

The proper way to ensure that the amount of gold and food in Bob's inventory is atomically updated, with no possibility of incorrect intermediate state due to power loss, is to update both blobs in a single [XGameSaveSubmitUpdateAsync](../../../reference/system/xgamesave/functions/xgamesavesubmitupdateasync.md) call.
The system then takes the following steps.

First, the system writes the data for the new value of the food blob to the hard drive as shown in the following diagram.

**Figure 8.  The system writes the data for the new value of the food blob**

![Example diagram. The system writes the data for the new value of the food blob.](../../../../../resources/gamecore/secure/images/en-us/xgamesave/update_method_right_way_1.png)  
  
Next, the system writes the data for the new value of the gold blob to the hard drive as shown in the following diagram.

**Figure 9.  The system writes the data for the new value of the gold blob**

![Example diagram. The system writes the data for the new value of the gold blob.](../../../../../resources/gamecore/secure/images/en-us/xgamesave/update_method_right_way_2.png)  
  
Finally, the system updates the container file to reference both of the new blobs as shown in the following diagram.

**Figure 10.  The system updates the container file to reference both new blobs**

![Example diagram. The system updates the container file to reference both new blobs.](../../../../../resources/gamecore/secure/images/en-us/xgamesave/update_method_right_way_3.png)  
  
While this example is very simple, it illustrates the importance of making all the modifications to the data in a container, which must be atomically applied by issuing a single [XGameSaveSubmitUpdateAsync](../../../reference/system/xgamesave/functions/xgamesavesubmitupdateasync.md) call with all the updates we want.
By doing so for the case of purchasing food with gold, the app avoids a potential race condition that could incorrectly update only one of the values and leave the character with too much gold.

## Synchronizing an XGameSave storage space

When synchronizing an `XGameSave` storage space, the `XGameSave` service goes through four processes:  

- Connectivity check
- Lock acquisition
- Container listing, comparison, and merger logic
- Container download

When your app requests access to an `XGameSave` storage space, the system performs a synchronizing process to keep the user's saved data in a consistent state across Xbox One consoles and to make their data available for offline play.
Because synchronizing can take varying amounts of time and might require the user to make decisions, the system might display UI to the user at various stages of the process.

The user can navigate away from your app by pressing the Xbox button at any time, even if the synchronization UI is active.
The system hides the UI, and the synchronization continues as far as it can without user interaction.

When the user navigates back to the app, the UI is displayed again unless the synchronization has been completed.
The system never makes an assumption about a user selection when the UI is hidden.

Because the system displays no synchronization UI when the user is at the Home screen, it's important that the app render contextually appropriate visuals while an [XGameSaveInitializeProvider](../../../reference/system/xgamesave/functions/xgamesaveinitializeprovider.md) call is being completed. The continued rendering indicates to the user that the app is still interactive and is waiting for data to load.

The following diagram outlines the high-level sequence that the system follows when an app requests an `XGameSave` storage space.
If the entire sequence takes more than a few seconds, the system-drawn synchronization UI is displayed.

**Figure 11.  Sequence followed by the system when an app requests XGameSave storage space**

![Sequence followed by the system when an app requests Connected Storage space.](../../../../../resources/gamecore/secure/images/en-us/xgamesave/app_requests_connected_storage_space.png)  
  
The system goes through four stages when it services an [XGameSaveInitializeProvider](../../../reference/system/xgamesave/functions/xgamesaveinitializeprovider.md) request.

-   Connectivity check
-   Lock acquisition
-   Container listing, comparison, and merger logic
-   Container download


### Connectivity check

To start servicing an [XGameSaveInitializeProvider](../../../reference/system/xgamesave/functions/xgamesaveinitializeprovider.md) request, the system checks for connectivity.
If the console is offline, the entire synchronization process is skipped. The `XGameSave` storage space for the specified user is marked as offline for the current session.

Any data that's modified will be reconciled with cloud storage the next time your app accesses the same user's `XGameSave` storage space, and the system can reach the Title Storage service.
No UI is ever shown for this case.

### Lock acquisition

After verifying connectivity, the system attempts to acquire exclusive access to the cloud storage space that's associated with your app and the supplied user.
This is accomplished by placing a lock file in the `XGameSave` storage area of your Title Storage.
If the console is online, can reach the service, and is able to acquire the lock in a short period of time, no UI is presented, and the synchronization process continues.

After the system has acquired a lock for a particular `XGameSave` storage space and returned an instance of an `XGameSave` storage space to your app, none of your app's API calls operating on data within that `XGameSave` storage space block on successful web requests.
The lock provides sufficient protection so that even if a user were to unplug the network cable from the system after your app has acquired an `XGameSave` storage space, the API calls operate based on the locally available data.

There are a few possible error scenarios during the lock acquisition step.

#### Syncing UI  

If the console is online but has not acquired the lock from the service within a short time, a "syncing" UI is displayed.

#### Breaking the lock  

If the user has played the app on another console since they last played on the current one, it's possible that the other console has exclusive access to the storage space and is in the middle of uploading data.
It's also possible that another console has started uploading data but has lost its connection or power before finishing.

Both of these cases are referred to as *lock contention*, and in either case, the system presents UI to explain that another console is uploading data.
The user can wait for this process to be completed or work with the data that's currently available in the cloud.

If the user chooses to work with cloud data, the system takes the lock for itself (breaks the lock), acquiring exclusive access to the cloud storage for the user and app.
The upload from the other console is canceled, and the synchronization process continues.

### Container listing, comparison, and merger logic

After acquiring a lock, the system requests a listing of all the containers in the cloud for the specified app and user.
The system then compares the contents of the local hard drive with the data in the cloud and proceeds according to the results of the comparison.

#### Local data matches the cloud

If there have been no changes from other consoles and the data in the cloud and local hard drive is identical, the synchronization is complete. [XGameSaveInitializeProvider](../../../reference/system/xgamesave/functions/xgamesaveinitializeprovider.md) returns with a result at this time, and your app can proceed with loads and saves.

#### No local data

If the cloud has data but the local console doesn't, the data from the cloud is downloaded locally.
This could occur, for example, when the user is playing at a friend's house for the first time.

#### Same containers, modified locally and in the cloud

If the user has modified containers in the cloud by playing on another console and has modified the same containers when using the current console offline, the data can't be automatically merged.
The user is asked to choose which data to keep.
In the event of conflicts, the user can choose a replacement policy: the local data or cloud data is always kept or the user can select **Cancel** and defer making the choice.
If the user chooses the cloud or local data as a replacement policy, containers with the same name&mdash;but with different contents&mdash;are resolved accordingly.

If the user selects **Cancel**, the game has access to the save system in a non-resolved state, as if the user were playing offline.
In this case, the conflict resolution UI is presented again the next time the app requests access to the `XGameSave` storage space if the console is online.


### Container download

After any conflicts have been resolved, the system has all the information necessary to identify which containers need to be downloaded from the cloud.
All the required containers are downloaded, and the result is returned from [XGameSaveInitializeProvider](../../../reference/system/xgamesave/functions/xgamesaveinitializeprovider.md) if it was called or via [XGameSaveInitializeProviderResult](../../../reference/system/xgamesave/functions/xgamesaveinitializeproviderresult.md) if [XGameSaveInitializeProviderAsync](../../../reference/system/xgamesave/functions/xgamesaveinitializeproviderasync.md) was called instead. The app can then proceed with loads and saves.

There are a few possible errors scenarios during the container download step.

#### Insufficient local storage  
In the case of insufficient local hard drive space for the required containers, users are presented with UI asking them to free hard disk space by removing locally saved data.
To help them avoid permanently deleting important data that isn't backed up in the cloud, the UI clearly indicates data that is simply local cache and data that is unique to the current console.

When the UI is presented to the user, the following occurs.

-   If the user frees up sufficient space, the synchronization continues and is completed.

-   If the user cancels out of the UI without freeing sufficient space, the return value from the `XGameSave` Initialize Provider is `E_GS_OUT_OF_LOCAL_STORAGE`. The app should confirm that the user intends to play without being able to save data. If the user agrees, the app should proceed without saving data for that user. If the user indicates they want to save data while playing, the app should repeat the [XGameSaveInitializeProvider](../../../reference/system/xgamesave/functions/xgamesaveinitializeprovider.md) call, which again displays the UI to free up space.

#### User cancels synchronization  
If the user doesn't want to wait for the synchronization to complete and selects **Cancel**, the user is informed that not all the saved data will be available. The game, however, isn't. The result of the [XGameSaveInitializeProvider](../../../reference/system/xgamesave/functions/xgamesaveinitializeprovider.md) call is returned at this time, and the app can proceed with loads and saves.

#### Network time-out  
If the data download times out because of a problem with network connectivity or service availability, the user is given the option to retry the synchronization.
If the user chooses not to, they are informed that not all the saved data is available and that the game is unaware of the missing data. The result of the [XGameSaveInitializeProvider](../../../reference/system/xgamesave/functions/xgamesaveinitializeprovider.md) call is returned at this time, and the app can proceed with loads and saves.  
  