---
title: Sending invites
description: Provides example code for sending multiplayer invites.
kindex:
- Sending invites
- invites
author: joannaleecy
ms.author: jeffshi
ms.topic: conceptual
ms.localizationpriority: medium
ms.date: 10/01/2019
edited: 03/05/2021
security: public
---

# Sending invites

Use this topic to configure user-to-user multiplayer game sessions on Xbox Live.  

Your game sends invites to other users to join your game session. There are two ways to send a game invite to other users. 
You can use the Title-Callable UI (TCUI) (System UI overlay), or you can use a title-implemented custom UI.


## Using the Title-Callable UI (TCUI) (System UI overlay)

Calling the [XGameUiShowSendGameInviteAsync](../../../../../reference/system/xgameui/functions/xgameuishowsendgameinviteasync.md) API retrieves the standard System UI overlay for inviting friends. 
This displays a UI that the user can navigate to select friends or users from the [Recent Players list](../../mpa/concepts/live-mpa-recent-players.md) 
to invite to the game. When the user selects **Confirm**, the invite is sent to the selected users.

## Using a title-implemented custom UI



Your title can implement a custom UI for viewing online friends and inviting them to game sessions. 
Use the [XblMultiplayerSendInvitesAsync](../../../../../reference/live/xsapi-c/multiplayer_c/functions/xblmultiplayersendinvitesasync.md) API to send invites to a set of users that are defined 
by their [XboxUserId (XUID)](../../mpa/concepts/live-mpa-activities.md) as shown in the following code.
This is useful if you prefer to use your own in-game UI instead of the stock System UI.

### Flat C  
  

```cpp
auto asyncBlock = std::make_unique<XAsyncBlock>();
asyncBlock->queue = queue;
asyncBlock->context = nullptr;
asyncBlock->callback = [](XAsyncBlock* asyncBlock)
{
    std::unique_ptr<XAsyncBlock> asyncBlockPtr{ asyncBlock }; // Take ownership of the XAsyncBlock*
    size_t handlesCount = 1; // must be equal to invites that are requested
    XblMultiplayerInviteHandle handles[1] = {};
    HRESULT hr = XblMultiplayerSendInvitesResult(asyncBlock, handlesCount, handles);
};

uint64_t xuids[1] = {};
xuids[0] = targetXuid;
size_t xuidsCount = 1;

HRESULT hr = XblMultiplayerSendInvitesAsync(
    xblContextHandle,
    &sessionReference,
    xuids,
    xuidsCount,
    titleId,
    contextStringId,
    customActivationContext,
    asyncBlock.get());
if (SUCCEEDED(hr))
{
    // The call succeeded, so release the std::unique_ptr ownership of XAsyncBlock* since the callback will take ownership.
    // If the call fails, the std::unique_ptr will keep ownership and delete the XAsyncBlock*
    asyncBlock.release();
}
```

## See also  
  
[XAsyncBlock](../../../../../reference/system/xasync/structs/xasyncblock.md)  
[XblMultiplayerInviteHandle](../../../../../reference/live/xsapi-c/multiplayer_c/structs/xblmultiplayerinvitehandle.md)  
[XblMultiplayerSendInvitesAsync](../../../../../reference/live/xsapi-c/multiplayer_c/functions/xblmultiplayersendinvitesasync.md)  
[XblMultiplayerSendInvitesResult](../../../../../reference/live/xsapi-c/multiplayer_c/functions/xblmultiplayersendinvitesresult.md)  
[XGameInvite (API Reference)](../../../../../reference/system/xgameinvite/xgameinvite_members.md)  
[Handling protocol activation to start a game, using Multiplayer Manager](../../mpm/how-to/live-handle-protocol-activation.md)  
[Sending game invites using Multiplayer Manager](../../mpm/how-to/live-send-game-invites.md)  