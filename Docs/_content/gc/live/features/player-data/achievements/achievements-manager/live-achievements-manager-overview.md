---
title: Xbox Achievements Manager API overview
description: The Xbox Achievements Manager API simplifies keeping track of and updating the state of an Xbox Live user's achievements.
author: joannaleecy
kindex:
- Achievements Manager overview
- overview of the Achievements Manager
- Xbox Services Achievements Manager overview
ms.author: lraze
ms.date: 11/03/2020
ms.topic: conceptual
ms.localizationpriority: medium
security: public
edited: 00/00/0000
---

# Overview of the Xbox Achievements Manager API

The Xbox Achievements Manager API simplifies keeping track of, and updating the state of an Xbox Live user's achievements.

Xbox provides a way to keep track of a user's progress and accomplishments in their games by awarding Achievements at certain points.
Using the achievements APIs in the Xbox Services API (XSAPI) to keep each local user's Achievement information up to date can be complicated.
Not doing this correctly can result in performance issues, stale data, or being throttled due to calling the Xbox achievement services more frequently than necessary.

The Social Manager solves this problem by:

* Creating a simple API to call.
* Creating up to date information using the real time activity service behind the scenes.
* Developers can call the Achievements Manager API synchronously without any extra strain on the service.

The Achievements Manager masks the complexity of dealing with multiple RTA subscriptions, refreshing data for users, and reducing the number of calls to the achievements service and allows developers to easily get the up to date achievement data.


## Features

The Achievements Manager provides the following features:

* Simplified Achievements API
* Up-to-date achievement state and progress for each user
* Reduce number of calls to Xbox services
  * This directly correlates to overall latency reduction in data acquisition
* Thread safe
* Efficiently keeping data up to date


## Core Concepts

**Achievements**: An Achievement includes Gamerscore and other rewards such as digital artwork, new maps, characters, and stat boosts, as well as the current progress towards completion.

To keep the state of a user's achievements up to date, the function [XblAchievementsManagerDoWork](../../../../../reference/live/xsapi-c/achievements_manager_c/functions/xblachievementsmanagerdowork.md) must be called every frame.
> [!NOTE]
> On Windows there can only be one local user

## API Overview

You will most frequently use the following key APIs.

You can find a complete description of the Achievements Manager APIs in the [Xbox Live API reference](https://aka.ms/xboxliveuwpdocs).
You can also find the APIs in the **XblAchievementsManager** prefix documentation.

### Adding local users to Achievements Manager

* C API function: [XblAchievementsManagerAddLocalUser](../../../../../reference/live/xsapi-c/achievements_manager_c/functions/xblachievementsmanageraddlocaluser.md)

Adding a local user to Achievements Manager causes the state of all achievements for that user for the current title to be fetched from the service and saved locally.

The Achievements Manager will keep each of that user's achievements for the current title up to date.


### Getting the state of achievements for a user

* C API function: [XblAchievementsManagerGetAchievements](../../../../../reference/live/xsapi-c/achievements_manager_c/functions/xblachievementsmanagergetachievements.md)

Calling this function returns a handle to achievement(s) that match specified criteria. 

Achievements pointed to by the handle are thread-safe copies of the matching achievements.
The data pointed to by the handle will exist until the handle is closed, but may become out of date if the title holds the handle past the next call to [XblAchievementsManagerDoWork](../../../../../reference/live/xsapi-c/achievements_manager_c/functions/xblachievementsmanagerdowork.md).


## Usage

### Using Achievements Manager events

Achievements Manager tells you what happened, in the form of events.
You can use those events to update your UI or perform other logic.

**C API**
```cpp
// some update loop in the game
while(true) 
{ 
    size_t eventsCount{}; 
    const XblAchievementsManagerEvent* events{}; 
    HRESULT hr = XblAchievementsManagerDoWork(&events, &eventsCount); 
    if (FAILED(hr))
    {
        // handle the error
    }

    for (uint32_t i = 0; i < eventsCount; ++i) 
    { 
        // act on the event
        switch (events[i].eventType) 
        { 
        case XblAchievementsManagerEventType::LocalUserInitialStateSynced: 
            // ...
            break; 
        case XblAchievementsManagerEventType::AchievementProgressUpdated: 
            // ...
            break; 
        case XblAchievementsManagerEventType::AchievementUnlocked: 
            // ...
            break; 
        default: 
            break; 
        } 
    } 
} 
```

**Reference**
* [XblAchievementsManagerDoWork](../../../../../reference/live/xsapi-c/achievements_manager_c/functions/xblachievementsmanagerdowork.md)
* [XblAchievementsManagerEvent](../../../../../reference/live/xsapi-c/achievements_manager_c/structs/xblachievementsmanagerevent.md)


#### Events returned

**Local User Initial State Synced**: Triggers when the achievements manager has completed fetching the current state of all of the current title's achievements for the user.
* C API: [XblAchievementsManagerEventType](../../../../../reference/live/xsapi-c/achievements_manager_c/enums/xblachievementsmanagereventtype.md)::LocalUserInitialStateSynced

**Achievement Progress Updated**: Triggers when a user's progress for an achievement of the current title has been updated.
* C API: [XblAchievementsManagerEventType](../../../../../reference/live/xsapi-c/achievements_manager_c/enums/xblachievementsmanagereventtype.md)::AchievementProgressUpdated

**Achievement Unlocked**: Triggers when a user completes all requirements for an achievement of the current title.
* C API: [XblAchievementsManagerEventType](../../../../../reference/live/xsapi-c/achievements_manager_c/enums/xblachievementsmanagereventtype.md)::AchievementUnlocked


#### Additional details

Instead of fetching the state of achievements from the service frequently during the game loop, the Achievements Manager fetches the state of all of a user's achievements when the user is registered with the Achievements Manager.
Then the Achievements Manager receives events from the service detailing updates to a user's achievements, which are then forwarded to the title as **events** returned by the * [XblAchievementsManagerDoWork](../../../../../reference/live/xsapi-c/achievements_manager_c/functions/xblachievementsmanagerdowork.md) function.

**events** is a list of [XblAchievementsManagerEvent](../../../../../reference/live/xsapi-c/achievements_manager_c/structs/xblachievementsmanagerevent.md), and each [XblAchievementsManagerEvent](../../../../../reference/live/xsapi-c/achievements_manager_c/structs/xblachievementsmanagerevent.md) contains a change to an achievement that occurred during the last frame.

More information can be found in the [XblAchievementsManagerEvent](../../../../../reference/live/xsapi-c/achievements_manager_c/structs/xblachievementsmanagerevent.md) API documentation.


### Register a user for whom to track achievements

In this scenario, you want to register a user to the achievements manager to begin tracking updates to that user's achievements, and cache the state of all of those user's achievements locally.

**C API**
```cpp
HRESULT hr = XblAchievementsManagerAddLocalUser(userHandle, nullptr);

if (!SUCCEEDED(hr))
{
    return;
}

// some update loop in the game 
while(true)
{
    const XblAchievementsManagerEvent* events{ nullptr };
    size_t eventCount{ 0 };
    HRESULT hr = XblAchievementsManagerDoWork(&events, &eventCount);
    if (SUCCEEDED(hr))
    {
        return;   
    }
    for (size_t i = 0; i < eventCount; i++)
    {
        // Act on the event
    }
}
```

**Reference**
* [XblAchievementsManagerAddLocalUser](../../../../../reference/live/xsapi-c/achievements_manager_c/functions/xblachievementsmanageraddlocaluser.md)
* [XblAchievementsManagerDoWork](../../../../../reference/live/xsapi-c/achievements_manager_c/functions/xblachievementsmanagerdowork.md)
* [XblAchievementsManagerEvent](../../../../../reference/live/xsapi-c/achievements_manager_c/structs/xblachievementsmanagerevent.md)

#### Events returned

**Local User Initial State Synced**: Triggers when the achievements manager has completed fetching the current state of all of the current title's achievements for the user.
* C API: [XblAchievementsManagerEventType](../../../../../reference/live/xsapi-c/achievements_manager_c/enums/xblachievementsmanagereventtype.md)::LocalUserInitialStateSynced


#### Additional details

The above example shows how to initialize the Achievements Manager for a user, and keep it up to date.

In the game loop, the [XblAchievementsManagerDoWork](../../../../../reference/live/xsapi-c/achievements_manager_c/functions/xblachievementsmanagerdowork.md) function processes and applies any updates made to users' achievements.


### Retrieving a single achievement for a user

In this scenario you want to get the state of a single achievement for a user.

**C API**
```cpp
HRESULT hr = XblAchievementsManagerAddLocalUser(userHandle, nullptr);

if (!XblAchievementsManagerIsUserInitialized(xboxUserId))
{
    return;
}

const XblAchievement* achievement = nullptr; 
uint64_t size; 
XblAchievementsManagerResultHandle resultHandle; 

HRESULT hr = XblAchievementsManagerGetAchievement( 
    xboxUserId, 
    achievementId, 
    &resultHandle 
); 

if(FAILED(hr)) 
{ 
    return; 
} 

hr = XblAchievementsManagerResultGetAchievements( 
    resultHandle, 
    &achievement, 
    &size 
); 
if(FAILED(hr)) 
{ 
    return; 
} 

// make use of achievement struct

XblAchievementsManagerResultCloseHandle(resultHandle); 
```

**Reference**
* [XblAchievement](../../../../../reference/live/xsapi-c/achievements_c/structs/xblachievement.md)
* [XblAchievementsManagerAddLocalUser](../../../../../reference/live/xsapi-c/achievements_manager_c/functions/xblachievementsmanageraddlocaluser.md)
* [XblAchievementsManagerIsUserInitialized](../../../../../reference/live/xsapi-c/achievements_manager_c/functions/xblachievementsmanagerisuserinitialized.md)
* [XblAchievementsManagerGetAchievement](../../../../../reference/live/xsapi-c/achievements_manager_c/functions/xblachievementsmanagergetachievement.md)
* [XblAchievementsManagerResultGetAchievements](../../../../../reference/live/xsapi-c/achievements_manager_c/functions/xblachievementsmanagerresultgetachievements.md)
* [XblAchievementsManagerResultCloseHandle](../../../../../reference/live/xsapi-c/achievements_manager_c/functions/xblachievementsmanagerresultclosehandle.md)


#### Events returned

**Local User Initial State Synced**: Triggers when the achievements manager has completed fetching the current state of all of the current title's achievements for the user.
* C API: [XblAchievementsManagerEventType](../../../../../reference/live/xsapi-c/achievements_manager_c/enums/xblachievementsmanagereventtype.md)::LocalUserInitialStateSynced


### Retrieving all achievements for a user

In this scenario you want to get the state all achievement for a user.

**C API**
```cpp
HRESULT hr = XblAchievementsManagerAddLocalUser(userHandle, nullptr);

if (!XblAchievementsManagerIsUserInitialized(xboxUserId))
{
    return;
}

XblAchievementsManagerResultHandle resultHandle; 
const XblAchievement* achievements; 
uint64_t achievementsCount; 

hr = XblAchievementsManagerGetAchievements( 
    xboxUserId, 
    XblAchievementOrderBy::DefaultOrder, 
    XblAchievementsManagerSortOrder::Unsorted, 
    &resultHandle 
); 

if(FAILED(hr)) 
{ 
    return; 
} 

hr = XblAchievementsManagerResultGetAchievements( 
    resultHandle, 
    &achievements, 
    &achievementsCount 
); 

if(FAILED(hr)) 
{ 
    return; 
} 
 
for (uint32_t i = 0; i < achievementsCount; ++i) 
{ 
    // ... 
} 
XblAchievementsManagerResultCloseHandle(resultHandle); 
```

**Reference**
* [XblAchievement](../../../../../reference/live/xsapi-c/achievements_c/structs/xblachievement.md)
* [XblAchievementOrderBy](../../../../../reference/live/xsapi-c/achievements_c/enums/xblachievementorderby.md)
* [XblAchievementsManagerSortOrder](../../../../../reference/live/xsapi-c/achievements_manager_c/enums/xblachievementsmanagersortorder.md)
* [XblAchievementsManagerAddLocalUser](../../../../../reference/live/xsapi-c/achievements_manager_c/functions/xblachievementsmanageraddlocaluser.md)
* [XblAchievementsManagerIsUserInitialized](../../../../../reference/live/xsapi-c/achievements_manager_c/functions/xblachievementsmanagerisuserinitialized.md)
* [XblAchievementsManagerGetAchievements](../../../../../reference/live/xsapi-c/achievements_manager_c/functions/xblachievementsmanagergetachievements.md)
* [XblAchievementsManagerResultGetAchievements](../../../../../reference/live/xsapi-c/achievements_manager_c/functions/xblachievementsmanagerresultgetachievements.md)
* [XblAchievementsManagerResultCloseHandle](../../../../../reference/live/xsapi-c/achievements_manager_c/functions/xblachievementsmanagerresultclosehandle.md)


#### Events returned

**Local User Initial State Synced**: Triggers when the achievements manager has completed fetching the current state of all of the current title's achievements for the user.
* C API: [XblAchievementsManagerEventType](../../../../../reference/live/xsapi-c/achievements_manager_c/enums/xblachievementsmanagereventtype.md)::LocalUserInitialStateSynced


### Retrieving a subset of achievements for a user

In this scenario you want to get the state a subset of achievements for a user.

**C API**
```cpp
HRESULT hr = XblAchievementsManagerAddLocalUser(userHandle, nullptr);

if (!XblAchievementsManagerIsUserInitialized(xboxUserId))
{
    return;
}

XblAchievementsManagerResultHandle resultHandle; 
const XblAchievement* achievements; 
uint64_t achievementsCount; 

hr = XblAchievementsManagerGetAchievements( 
    xboxUserId, 
    XblAchievementOrderBy::UnlockTime, 
    XblAchievementsManagerSortOrder::Descending, 
    &resultHandle 
); 

if(FAILED(hr)) 
{ 
    return; 
} 

hr = XblAchievementsManagerResultGetAchievements( 
    resultHandle, 
    &achievements, 
    &achievementsCount 
); 

if(FAILED(hr)) 
{ 
    return; 
} 
 
for (uint32_t i = 0; i < achievementsCount; ++i) 
{ 
    // ... 
} 
XblAchievementsManagerResultCloseHandle(resultHandle); 
```

**Reference**
* [XblAchievement](../../../../../reference/live/xsapi-c/achievements_c/structs/xblachievement.md)
* [XblAchievementOrderBy](../../../../../reference/live/xsapi-c/achievements_c/enums/xblachievementorderby.md)
* [XblAchievementsManagerSortOrder](../../../../../reference/live/xsapi-c/achievements_manager_c/enums/xblachievementsmanagersortorder.md)
* [XblAchievementsManagerAddLocalUser](../../../../../reference/live/xsapi-c/achievements_manager_c/functions/xblachievementsmanageraddlocaluser.md)
* [XblAchievementsManagerIsUserInitialized](../../../../../reference/live/xsapi-c/achievements_manager_c/functions/xblachievementsmanagerisuserinitialized.md)
* [XblAchievementsManagerGetAchievements](../../../../../reference/live/xsapi-c/achievements_manager_c/functions/xblachievementsmanagergetachievements.md)
* [XblAchievementsManagerResultGetAchievements](../../../../../reference/live/xsapi-c/achievements_manager_c/functions/xblachievementsmanagerresultgetachievements.md)
* [XblAchievementsManagerResultCloseHandle](../../../../../reference/live/xsapi-c/achievements_manager_c/functions/xblachievementsmanagerresultclosehandle.md)


#### Events returned

**Local User Initial State Synced**: Triggers when the achievements manager has completed fetching the current state of all of the current title's achievements for the user.
* C API: [XblAchievementsManagerEventType](../../../../../reference/live/xsapi-c/achievements_manager_c/enums/xblachievementsmanagereventtype.md)::LocalUserInitialStateSynced


### Retrieving a subset of achievements in a specific state for a user

In this scenario you want to get the state a subset of achievements in a specific progress state for a user.

**C API**
```cpp
HRESULT hr = XblAchievementsManagerAddLocalUser(userHandle, nullptr);

if (!XblAchievementsManagerIsUserInitialized(xboxUserId))
{
    return;
}

XblAchievementsManagerResultHandle resultHandle; 
const XblAchievement* achievements; 
uint64_t achievementsCount; 

hr = XblAchievementsManagerGetAchievementsByState( 
    xboxUserId, 
    XblAchievementOrderBy::DefaultOrder, 
    XblAchievementsManagerSortOrder::Unsorted, 
    XblAchievementProgressState::NotStarted, 
    &resultHandle 
); 

if(FAILED(hr)) 
{ 
    return; 
} 

hr = XblAchievementsManagerResultGetAchievements( 
    resultHandle, 
    &achievements, 
    &achievementsCount 
); 

if(FAILED(hr)) 
{ 
    return; 
} 
 
for (uint32_t i = 0; i < achievementsCount; ++i) 
{ 
    // ... 
} 
XblAchievementsManagerResultCloseHandle(resultHandle); 
```

**Reference**
* [XblAchievement](../../../../../reference/live/xsapi-c/achievements_c/structs/xblachievement.md)
* [XblAchievementOrderBy](../../../../../reference/live/xsapi-c/achievements_c/enums/xblachievementorderby.md)
* [XblAchievementProgressState](../../../../../reference/live/xsapi-c/achievements_c/enums/xblachievementprogressstate.md)
* [XblAchievementsManagerSortOrder](../../../../../reference/live/xsapi-c/achievements_manager_c/enums/xblachievementsmanagersortorder.md)
* [XblAchievementsManagerAddLocalUser](../../../../../reference/live/xsapi-c/achievements_manager_c/functions/xblachievementsmanageraddlocaluser.md)
* [XblAchievementsManagerIsUserInitialized](../../../../../reference/live/xsapi-c/achievements_manager_c/functions/xblachievementsmanagerisuserinitialized.md)
* [XblAchievementsManagerGetAchievementsByState](../../../../../reference/live/xsapi-c/achievements_manager_c/functions/xblachievementsmanagergetachievementsbystate.md)
* [XblAchievementsManagerResultGetAchievements](../../../../../reference/live/xsapi-c/achievements_manager_c/functions/xblachievementsmanagerresultgetachievements.md)
* [XblAchievementsManagerResultCloseHandle](../../../../../reference/live/xsapi-c/achievements_manager_c/functions/xblachievementsmanagerresultclosehandle.md)


#### Events returned

**Local User Initial State Synced**: Triggers when the achievements manager has completed fetching the current state of all of the current title's achievements for the user.
* C API: [XblAchievementsManagerEventType](../../../../../reference/live/xsapi-c/achievements_manager_c/enums/xblachievementsmanagereventtype.md)::LocalUserInitialStateSynced


### Updating an achievement for a user

Updates the progress of an achievement for a user.

**C API**
```cpp
HRESULT hr = XblAchievementsManagerAddLocalUser(userHandle, nullptr);

if (!XblAchievementsManagerIsUserInitialized(xboxUserId))
{
    return;
}

XblAchievementsManagerUpdateAchievement(xboxUserId, achievementId.c_str(), progress);
```

**Reference**
* [XblAchievementsManagerAddLocalUser](../../../../../reference/live/xsapi-c/achievements_manager_c/functions/xblachievementsmanageraddlocaluser.md)
* [XblAchievementsManagerIsUserInitialized](../../../../../reference/live/xsapi-c/achievements_manager_c/functions/xblachievementsmanagerisuserinitialized.md)
* [XblAchievementsManagerUpdateAchievement](../../../../../reference/live/xsapi-c/achievements_manager_c/functions/xblachievementsmanagerupdateachievement.md)


#### Events returned

**Local User Initial State Synced**: Triggers when the achievements manager has completed fetching the current state of all of the current title's achievements for the user.
* C API: [XblAchievementsManagerEventType](../../../../../reference/live/xsapi-c/achievements_manager_c/enums/xblachievementsmanagereventtype.md)::LocalUserInitialStateSynced


#### Additional details

Only Title Managed achievements can be updated using [XblAchievementsManagerUpdateAchievement](../../../../../reference/live/xsapi-c/achievements_manager_c/functions/xblachievementsmanagerupdateachievement.md).
Refer to [Writing an event to power an event-based achievement](../event-based/how-to/live-writing-event-based-achievement.md) for updating event based achievements.


### Cleaning up the Achievements Manager

Removing a user from the Achievements Manager removes the user's cached achievements from the Achievements Manager.
No further events should be received for the removed user. 

**C API**
```cpp
HRESULT hr = XblAchievementsManagerRemoveLocalUser(userHandle);
```

**Reference**
* [XblAchievementsManagerRemoveLocalUser](../../../../../reference/live/xsapi-c/achievements_manager_c/functions/xblachievementsmanagerremovelocaluser.md)