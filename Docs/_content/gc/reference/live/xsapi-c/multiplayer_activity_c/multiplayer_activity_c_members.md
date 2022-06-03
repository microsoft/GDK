---
author: joannaleecy
title: multiplayer_activity_c (contents)
description: Multiplayer Activity C API
kindex: multiplayer_activity_c
ms.author: migreen
ms.topic: navigation
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# multiplayer_activity_c  



  
## Enumerations  
  
| Enumeration | Description |  
| --- | --- |  
| [XblMultiplayerActivityEncounterType](enums/xblmultiplayeractivityencountertype.md) | Enumerates types of recent player encounters. |  
| [XblMultiplayerActivityJoinRestriction](enums/xblmultiplayeractivityjoinrestriction.md) | Enumerates who can join a player's current activity. |  
| [XblMultiplayerActivityPlatform](enums/xblmultiplayeractivityplatform.md) | Enumerates the platforms on which a title can be activated. |  
  
## Functions  
  
| Function | Description |  
| --- | --- |  
| [XblMultiplayerActivityAddInviteHandler](functions/xblmultiplayeractivityaddinvitehandler.md) | Registers an event handler for multiplayer activity invites. |  
| [XblMultiplayerActivityDeleteActivityAsync](functions/xblmultiplayeractivitydeleteactivityasync.md) | Clears the multiplayer activity for the local user. |  
| [XblMultiplayerActivityFlushRecentPlayersAsync](functions/xblmultiplayeractivityflushrecentplayersasync.md) | Immediately writes any pending recent-players updates to Xbox Live. |  
| [XblMultiplayerActivityGetActivityAsync](functions/xblmultiplayeractivitygetactivityasync.md) | Get the multiplayer activity for a set of users. You can query at most 30 users with each call. |  
| [XblMultiplayerActivityGetActivityResult](functions/xblmultiplayeractivitygetactivityresult.md) | Gets the results for a successful get activity call. |  
| [XblMultiplayerActivityGetActivityResultSize](functions/xblmultiplayeractivitygetactivityresultsize.md) | Gets the buffer size needed to store the results of a get activity call. |  
| [XblMultiplayerActivityInviteHandler](functions/xblmultiplayeractivityinvitehandler.md) | Event handler for multiplayer activity invites. |  
| [XblMultiplayerActivityRemoveInviteHandler](functions/xblmultiplayeractivityremoveinvitehandler.md) | Unregisters an event handler for multiplayer activity invites. |  
| [XblMultiplayerActivitySendInvitesAsync](functions/xblmultiplayeractivitysendinvitesasync.md) | Sends invites to Xbox user IDs to join the caller's current activity. |  
| [XblMultiplayerActivitySetActivityAsync](functions/xblmultiplayeractivitysetactivityasync.md) | Sets or updates the multiplayer activity for a local user. |  
| [XblMultiplayerActivityUpdateRecentPlayers](functions/xblmultiplayeractivityupdaterecentplayers.md) | Appends to a player's list of recent players. If an encountered user is already in the list, it updates the existing recent-player entry. |  
  
## Structures  
  
| Structure | Description |  
| --- | --- |  
| [XblMultiplayerActivityInfo](structs/xblmultiplayeractivityinfo.md) | Information about a player's activity while playing a title. |  
| [XblMultiplayerActivityInviteData](structs/xblmultiplayeractivityinvitedata.md) | Describes multiplayer activity invites. |  
| [XblMultiplayerActivityRecentPlayerUpdate](structs/xblmultiplayeractivityrecentplayerupdate.md) | Describes a recent player encounter. |  
