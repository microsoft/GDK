---
title: Receiving invites
description: Describes how to add multiplayer invites to your Xbox Live title.
kindex:
- Receiving invites
- invites
author: joannaleecy
ms.author: jeffshi
ms.topic: conceptual
ms.localizationpriority: medium
ms.date: 10/01/2019
edited: 03/05/2021
security: public
---

# Receiving invites

Use this topic to add game invites to your Xbox Live title. To receive multiplayer invites, 
your game registers for the multiplayer protocol and game invite callbacks.
Your game receives invites for the local user, and then joins that user to the multiplayer session.

## Prerequisite

To receive game invite notifications on a Windows PC, install the Xbox Game Bar. 
The Xbox Game Bar app is installed by default on Windows 10, OS version 1903 or later. 
Select **Windows Key**+**G** to launch the Xbox Game Bar app to verify that it's installed correctly.  
  > [!NOTE]
> If Xbox Game Bar isn't installed on your Windows PC, you can install it from the [Microsoft Store](https://www.microsoft.com/store/productId/9NZKPSTSNW4P).

## Registering for multiplayer protocol

Registering for multiplayer protocol tells the system how to launch your game when the user accepts a multiplayer game invite.
To register the multiplayer protocol, you need to add a `MultiplayerProtocol` element to your [MicrosoftGame.config](../../../../../system/overviews/microsoft-game-config/MicrosoftGameConfig-toc.md) file as shown in the following code.

```xml
    <MultiplayerProtocol>true</MultiplayerProtocol>
```

If you have multiple executables in the package, you can specify which executable handles the multiplayer protocol by using the `Executable` attribute as shown in the following code.

```xml
    <MultiplayerProtocol Executable="MyExecutableForMultiplayer.exe">true</MultiplayerProtocol>
```


## Registering for multiplayer game invite callbacks

To receive multiplayer game invite callbacks, you must register for game invite callbacks by using the [XGameInviteRegisterForEvent](../../../../../reference/system/xgameinvite/functions/xgameinviteregisterforevent.md) API as shown in the following code.  
  
For more information about the registering and unregistering game invite callback, see [XGameInviteRegisterForEvent](../../../../../reference/system/xgameinvite/functions/xgameinviteregisterforevent.md) and [XGameInviteUnregisterForEvent](../../../../../reference/system/xgameinvite/functions/xgameinviteunregisterforevent.md). 
  
### Flat C
  
```cpp
#include <XTaskQueue.h>
#include <XGameInvite.h>  
  
XTaskQueueHandle g_taskQueue;  
XTaskQueueRegistrationToken g_gameInviteEventToken;  
  
void OnGameInvite(void* context, const char* inviteUri)  
{  
    if (inviteUri != nullptr)
    {
        std::string inviteString(inviteUri);
        auto pos = inviteString.find("handle=");
        auto handleId = inviteString.substr(pos + 7, 36);
        // Now call XblMultiplayerManagerJoinLobby
    }
}  
  
void InitializeGame()  
{  
    XGameInviteRegisterForEvent(g_taskQueue, nullptr, OnGameInvite, &g_gameInviteEventToken);  
}  
  
void ShutdownGame()  
{  
    XGameInviteUnregisterForEvent(g_gameInviteEventToken);  
}  
```
  
To properly handle the "accepted invite from 
a suspended state" scenario, the title must store the `inviteUri` that's passed into the `OnGameInvite()` handler method in the 
sample code above from the [XGameInviteRegisterForEvent](../../../../../reference/system/xgameinvite/functions/xgameinviteregisterforevent.md) callback. Then the title must 
wait for the `RegisterAppStateChangeNotification` which notifies when the game has fully resumed before the title proceeds to 
operate on the session by using the details that are provided in the `inviteUri`.  

For more information about `RegisterAppStateChangeNotification`, see [Xbox Game Life Cycle (NDA topic)](../../../../../system/overviews/xbox-game-life-cycle.md).  

## Parsing inviteUrl from XGameInviteEventCallback

When your game receives the [XGameInviteEventCallback](../../../../../reference/system/xgameinvite/functions/xgameinviteeventcallback.md) event, you can access the `inviteUrl` string. 
The `inviteUrl` is in one of the following formats.
  
### For accepting a game invite

When the user accepts a game invite, the game receives the game invite callback with an `inviteUri` as shown in the following code. 

```cpp
    "ms-xbl-multiplayer://inviteHandleAccept?handle=%s&invitedXuid=%s&senderXuid=%s&context=%s"
    
    // for example:
    // "ms-xbl-multiplayer://inviteHandleAccept?handle=00000000-0000-1234-5678-1234567890ab&invitedXuid=1234567890123456&senderXuid=6543210987654321&context="
```

The URI always starts with "ms-xbl-multiplayer//", and then the following handles.
 * `inviteHandleAccept` indicates that the callback was initiated because the user accepted a game invite.
 * `handle` is the invite handle you use to join the multiplayer session.
 * `invitedXuid` is the ID of the Xbox Live user who's invited to the multiplayer session.
 * `senderXuid` is the ID of the Xbox Live user who sent the game invite.
 * `context` is the additional (optional) context the sender might have included.


### For joining a game session in progress

When the user attempts to join a multiplayer session, the game would receive an invite callback with an `inviteUri` as shown in the following code.  
  
```cpp
    "ms-xbl-multiplayer://activityHandleJoin?&handle=%s&joinerXuid=%s&joineeXuid=%s"
```
  
The URI always starts with "ms-xbl-multiplayer//", and then the following handles.
 * `activityHandleJoin` indicates that the callback was initiated because the user accepted a game invite.
 * `handle` is the activity handle you use to join the multiplayer session.
 * `joinerXuid` is the ID of the Xbox Live user who's attempting to join the multiplayer session.
 * `joineeXuid` is the ID of the Xbox Live user who's currently in the multiplayer session.


## Joining a multiplayer game session with handleId

### Using Multiplayer Manager

If you're using Multiplayer Manager, you can join the user to the multiplayer session by using the [XblMultiplayerManagerJoinLobby](../../../../../reference/live/xsapi-c/multiplayer_manager_c/functions/xblmultiplayermanagerjoinlobby.md) 
API and passing in the `handleId` that's extracted from the `inviteUrl`. You can also use the `xblUserHandle` for the 
`invitedXuid` as shown in the following code.

#### Flat C 
  

```cpp
HRESULT hr = XblMultiplayerManagerJoinLobby(handleId, xblUserHandle);
```
  
### Using Multiplayer API directly

If you're using Multiplayer API, use the following steps to configure multiplayer sessions and invites for your title. 
 1. Fetch the multiplayer session document by using the [XblMultiplayerGetSessionByHandleAsync](../../../../../reference/live/xsapi-c/multiplayer_c/functions/xblmultiplayergetsessionbyhandleasync.md) API and pass it in the `handleId`.
 1. Join the local user to the multiplayer session document by using the [XblMultiplayerSessionJoin](../../../../../reference/live/xsapi-c/multiplayer_c/functions/xblmultiplayersessionjoin.md) API.
 1. Write the multiplayer session document to the service to commit this change by using the [XblMultiplayerWriteSessionByHandleAsync](../../../../../reference/live/xsapi-c/multiplayer_c/functions/xblmultiplayerwritesessionbyhandleasync.md) API.
  
## See also
  
[XGameInvite API](../../../../../reference/system/xgameinvite/xgameinvite_members.md)  
[Handling protocol activation to start a game, using Multiplayer Manager](../../mpm/how-to/live-handle-protocol-activation.md)