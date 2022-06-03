---
title: Example code for Multiplayer Activity
description: Provides example code for setting, getting, and deleting an activity, as well as sending invites and adding player interactions to recent players.
kindex: Example code for Multiplayer Activity
ms.topic: conceptual
author: joannaleecy
ms.author: thboard
ms.date: 05/12/2020
ms.localizationpriority: high
edited: 03/19/2021
security: public
---

<a id="top"></a>

# Example code for Multiplayer Activity

This topic is intended as a quickstart guide for basic use of the Multiplayer
Activity Client APIs. This topic discusses managing activities, sending invites,
and adding players to the recent players list.

[Activities](#activities)  
[Invites](#invites)  
[Recent players](#recent-players)  


<a id="activities"></a>

## Activities

### Setting an activity

Whenever a title starts or joins a multiplayer experience, it should create an
activity. Doing this allows the shell, along with other players in your title, to
see the player's activity and allows other players to potentially join the game
in progress. If a player wants to join an activity for your title and it's not
running, it's activated and the connection string passed to it.

Titles should update the activity as players join or leave. This provides a more
rich view of the activity to other players and informs them if the
activity is full.

For information about activity fields, see [Activity
contents](../concepts/live-mpa-activities.md#activity-contents).

A code example for setting an activity is as follows. It applies to creating
an activity as well as updating an existing activity.


```cpp
auto async = std::make_unique<XAsyncBlock>();
async->queue = queue;
async->callback = [](XAsyncBlock* async)
{
    std::unique_ptr<XAsyncBlock> asyncBlockPtr{ async }; // Take ownership of XAsyncBlock.
    HRESULT hr = XAsyncGetStatus(async, false);
};

XblMultiplayerActivityInfo info{};
info.connectionString = "dummyConnectionString";
info.joinRestriction = XblMultiplayerActivityJoinRestriction::Followed;
info.maxPlayers = 10;
info.currentPlayers = 1;
info.groupId = "dummyGroupId";

HRESULT hr = XblMultiplayerActivitySetActivityAsync(
    xblContext,
    &info,
    false,
    async.get()
);

if (SUCCEEDED(hr))
{
    async.release();
}
```

For more information, see the following:

* [XAsyncBlock](../../../../../reference/system/xasync/structs/xasyncblock.md)  
* [XAsyncGetStatus](../../../../../reference/system/xasync/functions/xasyncgetstatus.md)  
* [XblMultiplayerActivityInfo](../../../../../reference/live/xsapi-c/multiplayer_activity_c/structs/xblmultiplayeractivityinfo.md)  
* [XblMultiplayerActivityJoinRestriction](../../../../../reference/live/xsapi-c/multiplayer_activity_c/enums/xblmultiplayeractivityjoinrestriction.md)  
* [XblMultiplayerActivitySetActivityAsync](../../../../../reference/live/xsapi-c/multiplayer_activity_c/functions/xblmultiplayeractivitysetactivityasync.md)  

 [Return to the top of this topic.](#top)  

<a id="getting-an-activity"></a>

### Getting activities

Titles might want to know the activities of other players. For instance, a title might
want to display an in-game UI of a player's friends in the title alongside their
activities.

A code example for retrieving an activity is as follows.


```cpp
auto async = std::make_unique<XAsyncBlock>();
async->queue = queue;
async->callback = [](XAsyncBlock* async)
{
    std::unique_ptr<XAsyncBlock> asyncBlockPtr{ async }; // Take ownership of XAsyncBlock.

    size_t resultSize{};
    HRESULT hr = XblMultiplayerActivityGetActivityResultSize(async, &resultSize);
    if (SUCCEEDED(hr))
    {
        std::vector<uint8_t> buffer(resultSize);
        XblMultiplayerActivityInfo* activityInfo{};
        size_t resultCount{};
        hr = XblMultiplayerActivityGetActivityResult(async, buffer.size(), buffer.data(), &activityInfo, &resultCount, nullptr);
        if (SUCCEEDED(hr))
        {
            // ...
        }
    }
};

HRESULT hr = XblMultiplayerActivityGetActivityAsync(
    xblContext,
    &xuid,
    1,
    async.get()
);

if (SUCCEEDED(hr))
{
    async.release();
}
```

For more information, see the following:

* [XAsyncBlock](../../../../../reference/system/xasync/structs/xasyncblock.md)  
* [XblMultiplayerActivityGetActivityResultSize](../../../../../reference/live/xsapi-c/multiplayer_activity_c/functions/xblmultiplayeractivitygetactivityresultsize.md)  
* [XblMultiplayerActivityInfo](../../../../../reference/live/xsapi-c/multiplayer_activity_c/structs/xblmultiplayeractivityinfo.md)  
* [XblMultiplayerActivityGetActivityResult](../../../../../reference/live/xsapi-c/multiplayer_activity_c/functions/xblmultiplayeractivitygetactivityresult.md)  
* [XblMultiplayerActivityGetActivityAsync](../../../../../reference/live/xsapi-c/multiplayer_activity_c/functions/xblmultiplayeractivitygetactivityasync.md)  

 [Return to the top of this topic.](#top)

### Deleting an activity

When a player ends or leaves a multiplayer activity, the title should delete
the activity by using the following code.


```cpp
auto async = std::make_unique<XAsyncBlock>();
async->queue = queue;
async->callback = [](XAsyncBlock* async)
{
    std::unique_ptr<XAsyncBlock> asyncBlockPtr{ async }; // Take ownership of XAsyncBlock.
    HRESULT hr = XAsyncGetStatus(async, false);
};

HRESULT hr = XblMultiplayerActivityDeleteActivityAsync(xblContext, async.get());

if (SUCCEEDED(hr))
{
    async.release();
}
```

For more information, see the following:

* [XAsyncBlock](../../../../../reference/system/xasync/structs/xasyncblock.md)  
* [XAsyncGetStatus](../../../../../reference/system/xasync/functions/xasyncgetstatus.md)  
* [XblMultiplayerActivityDeleteActivityAsync](../../../../../reference/live/xsapi-c/multiplayer_activity_c/functions/xblmultiplayeractivitydeleteactivityasync.md)  

 [Return to the top of this topic.](#top)

<a id="invites"></a>

## Invites

### Sending invites without UI

Players might want to send invites directly to one or more other players. Before
sending an invite, the title should ensure that an activity is set. This ensures that there's 
continuity between the shell and your title because the shell sends invites based on the
current activity.

To send an invite without UI, after an activity is set using [XblMultiplayerActivitySetActivityAsync](../../../../../reference/live/xsapi-c/multiplayer_activity_c/functions/xblmultiplayeractivitysetactivityasync.md) (see example above), the title should call the [XblMultiplayerActivitySendInvitesAsync](../../../../../reference/live/xsapi-c/multiplayer_activity_c/functions/xblmultiplayeractivitysendinvitesasync.md) API, passing along an
array of players to invite and the same connection string that's used in your current
activity.

For information about an invite's contents, see [Invites](../concepts/live-mpa-invites.md#invites).

A code example for sending invites without UI is as follows.


```cpp
auto async = std::make_unique<XAsyncBlock>();
async->queue = queue;
async->callback = [](XAsyncBlock* async)
{
    std::unique_ptr<XAsyncBlock> asyncBlockPtr{ async }; // Take ownership of XAsyncBlock.
    HRESULT hr = XAsyncGetStatus(async, false);
};

HRESULT hr = XblMultiplayerActivitySendInvitesAsync(
    xblContext,
    &xuid,
    1,
    true, // Setting false will send the invite to only players on the sender's platform.
    "dummyConnectionString",
    async.get()
);

if (SUCCEEDED(hr))
{
    async.release();
}
```

For more information, see the following:

* [XAsyncBlock](../../../../../reference/system/xasync/structs/xasyncblock.md)  
* [XAsyncGetStatus](../../../../../reference/system/xasync/functions/xasyncgetstatus.md)  
* [XblMultiplayerActivitySendInvitesAsync](../../../../../reference/live/xsapi-c/multiplayer_activity_c/functions/xblmultiplayeractivitysendinvitesasync.md)  

### Sending invites with UI

Players might want to send invites directly to one or more other players. Before
sending an invite, the title should ensure that an activity is set. This ensures that there's 
continuity between the shell and your title because the shell sends invites based on the
current activity.

To send an invite with UI, after an activity is set using [XblMultiplayerActivitySetActivityAsync](../../../../../reference/live/xsapi-c/multiplayer_activity_c/functions/xblmultiplayeractivitysetactivityasync.md) (see example above), the title should call the [XGameUiShowMultiplayerActivityGameInviteAsync](../../../../../reference/system/xgameui/functions/xgameuishowmultiplayeractivitygameinviteasync.md) API passing along the requesting user.  It will use the current activity of the title and invite players using its connection string and settings.

For information about an invite's contents, see [Invites](../concepts/live-mpa-invites.md#invites).

A code example for sending invites with UI is as follows.

```cpp
auto async = std::make_unique<XAsyncBlock>();
async->queue = queue;
async->callback = [](XAsyncBlock* async)
{
    std::unique_ptr<XAsyncBlock> asyncBlockPtr{ async }; // Take ownership of XAsyncBlock.
    HRESULT hr = XGameUiShowMultiplayerActivityGameInviteResult(async);
    if (hrAsync == S_OK) 
    { 
        // Handle success 
    } 
    else 
    { 
        // Likely will only happen during development – usually indicates 
        // an invalid user was passed in or that there is no multiplayer activity set
    }     
};

HRESULT hr = XGameUiShowMultiplayerActivityGameInviteAsync(
    async.get()
    requestingUser
);

if (SUCCEEDED(hr))
{
    async.release();
}
```

For more information, see the following:

* [XAsyncBlock](../../../../../reference/system/xasync/structs/xasyncblock.md)  
* [XAsyncGetStatus](../../../../../reference/system/xasync/functions/xasyncgetstatus.md)  
* [XGameUiShowMultiplayerActivityGameInviteAsync](../../../../../reference/system/xgameui/functions/xgameuishowmultiplayeractivitygameinviteasync.md)
* [XGameUiShowMultiplayerActivityGameInviteResult](../../../../../reference/system/xgameui/functions/xgameuishowmultiplayeractivitygameinviteresult.md)

 [Return to the top of this topic.](#top)

### Receiving invites

To be notified when a player has accepted an invitation, titles can register for
invite notifications by using `XGameInviteRegisterForEvent`. Each time an invite is accepted, a formatted URI
is passed to the title through the registered callback. The URI can be parsed to determine
the invite sender, receiver, and connection string. The connection string is title-specific
and is set when the multiplayer activity is created. For titles that are using the Multiplayer Activity
service, the full format of the URI is shown in the following table.

Platform | Format
------|--------------
Microsoft Game Development Kit (GDK) or Xbox One Software Development Kit on console | `ms-xbl-<titleId>://inviteAccept?invitedUser=<xuid>&sender=<xuid>&connectionString=<connectionString>`
Microsoft Game Development Kit (GDK) or Universal Windows Platform (UWP) on PC | `ms-xbl-multiplayer://inviteAccept?invitedUser=<xuid>&sender=<xuid>&connectionString=<connectionString>`


When invite notifications are no longer needed, the callback can be unregistered by using `XGameInviteUnregisterForEvent`.
A code example for registering and handling accepted invites is as follows.


```cpp
void CALLBACK MyXGameInviteEventCallback(
    _In_opt_ void* context,
    _In_ const char* inviteUri)
{
    if (inviteUri != nullptr)
    {
        std::string uri{ inviteUri };
        size_t invitedUserBegin = uri.find("invitedUser=");
        size_t senderBegin = uri.find("sender=");
        std::string invitedUser = uri.substr(invitedUserBegin, uri.find('&', invitedUserBegin) - invitedUserBegin);
        std::string sender = uri.substr(senderBegin, uri.find('&', senderBegin) - senderBegin);
        std::string connectionString = uri.substr(uri.find("connectionString="));

        // ...
    }
}

XTaskQueueRegistrationToken token = { 0 };
HRESULT hr = XGameInviteRegisterForEvent(
    queue,
    nullptr,
    MyXGameInviteEventCallback,
    &token
    );

// ...
bool result = XGameInviteUnregisterForEvent(token, true);
```

For more information, see the following:

* [XGameInviteRegisterForEvent](../../../../../reference/system/xgameinvite/functions/xgameinviteregisterforevent.md)  
* [XGameInviteUnregisterForEvent](../../../../../reference/system/xgameinvite/functions/xgameinviteunregisterforevent.md)  

 [Return to the top of this topic.](#top)

<a id="recent-players"></a>

## Recent players

To update the player's recent players
list, the title should submit lists of other players who have had a meaningful
interaction with the current player. The list is unidirectional, meaning that each player's client is
responsible for updating their own list, and players lists don't affect
each other's lists.  

For instance, suppose that a group of players is together in a pre-game lobby and are
matched together. Each player would update their list with all other `xuids` in
the lobby when the match begins. If a new player were to join, they
could be written individually.  
> [!NOTE]
> You can decide what defines a meaningful interaction. For one title, it could be being present in a lobby. For another, it could be a player shooting another player. For a third, it could be merely having another player visible on-screen.  

In scenarios where you might not want teams of players to be seen until a match
session starts, you could delay writing the list of players until the time at
which you would like them visible to one another. To flush the client-side recent
players list, you can call `XblMultiplayerActivityFlushRecentPlayersAsync` if you
require an immediate force-flush. Otherwise, the recent players list will be
flushed automatically every five seconds.  

Code examples for updating the recent players list and flushing updates are
as follows.

### Updating recent players


```cpp
XblMultiplayerActivityRecentPlayerUpdate update{ xuid };
HRESULT hr = XblMultiplayerActivityUpdateRecentPlayers(xblContext, &update, 1);
```

For more information, see the following:

* [XblMultiplayerActivityRecentPlayerUpdate](../../../../../reference/live/xsapi-c/multiplayer_activity_c/structs/xblmultiplayeractivityrecentplayerupdate.md)  
* [XblMultiplayerActivityUpdateRecentPlayers](../../../../../reference/live/xsapi-c/multiplayer_activity_c/functions/xblmultiplayeractivityupdaterecentplayers.md)  

 [Return to the top of this topic.](#top)

### Flushing recent players


```cpp
auto async = std::make_unique<XAsyncBlock>();
async->queue = queue;
async->callback = [](XAsyncBlock* async)
{
    std::unique_ptr<XAsyncBlock> asyncBlockPtr{ async }; // Take ownership of XAsyncBlock.
    HRESULT hr = XAsyncGetStatus(async, false);
};

HRESULT hr = XblMultiplayerActivityFlushRecentPlayersAsync(xblContext, async.get());
if (SUCCEEDED(hr))
{
    async.release();
}
```

For more information, see the following:

* [XAsyncBlock](../../../../../reference/system/xasync/structs/xasyncblock.md)  
* [XAsyncGetStatus](../../../../../reference/system/xasync/functions/xasyncgetstatus.md)  
* [XblMultiplayerActivityFlushRecentPlayersAsync](../../../../../reference/live/xsapi-c/multiplayer_activity_c/functions/xblmultiplayeractivityflushrecentplayersasync.md)  

 [Return to the top of this topic.](#top)  