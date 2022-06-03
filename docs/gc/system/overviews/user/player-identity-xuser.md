---
author: M-Stahl
title: User identity and XUser
description: Describes how Xbox One manages the identity of the users interacting with the game with an `XUser` object. Each `XUser` instance represents a user who is signed in to the game.
kindex: User identity and XUser
ms.author: jgup
ms.topic: conceptual
edited: 04/22/2020
security: public
---

# User identity and XUser


Xbox One manages the identity of the users who interact with the game
with an `XUser` object. Each `XUser` instance represents a user
who is signed in to the game. Each user is represented by 
`XUserHandle`. Games can do the following by using `XUserHandle`.

* Query for the Xbox Live sign-in state.
* Fetch the gamertag of the users. 
* Fetch the gamer picture of the users. 
* Determine the age group of the users.
* Determine which privileges are allowed for the user who is allowed to participate in 
real-time communication or participate in multiplayer sessions.
* Fetch an authenticated token.
> [!NOTE]
> Different `XUserHandle` values could point to the same user.
To compare if two *different* `XUserHandle` values point to
different users, games can use the `XUserCompare` function.

## XUser identifiers

There are two different identifiers associated to a given `XUser`: the
local ID and the Xbox Live ID (XUID).

The *local ID* is an identifier that stays with the user throughout
that user's lifetime within the game session. Use the local ID across any processes 
that a game spawns or if the game calls `XLaunchNewGame`.  However, don't use the  
local ID to identify a user across gaming sessions. 

To get the local ID for a user, use the `XUserGetLocalId` function.

The *Xbox Live ID (XUID)* is the identifier that must be used when
communicating with Xbox Live or when invoking title-callable UI (TCUI). To
get the XUID for a user, use the `XUserGetId` function. User consent
might be required to get the XUID. If this consent is required and isn't
granted, `XUserGetId` returns
E_GAMEUSER_RESOLVE_USER_ISSUE_REQUIRED. To resolve the issue and collect consent, 
games should then call `XUserResolveIssueWithUiAsync`.

## XUser states

Users can be in one of three states: they're signed in to Xbox
Live, they're in the process of signing out of Xbox Live, or they're signed out
completely. Games can query for this state of a specified user by using the
`XUserGetState` function. Games can also register for change
notifications by using the `XUserRegisterForChangeEvent` function.

Don't judge network connectivity based on the `XUser` state. If the
`XUserState` is `SignedIn`, this indicates that at some point the
user was authenticated with Xbox Live and can be treated as an active
user. However, the network might not be connected.

## Adding or removing users to game

Unlike the model for the Xbox One ERA, a game can interact only
with those users who the game has requested by calling the `XUserAddAsync`
function. For example, suppose that two users are signed in to the
console: user A and user B.

1.  Someone launches the game. For this scenario, it doesn't matter who did so.

2.  The game registers for user state changes by using
    `XUserRegisterForChangeEvent`.

3.  The game calls `XUserAddAsync`, and user A signs in to the game.

4.  The game now has `XUserHandle` that represents user A.

5.  From the guide, user B chooses to sign out.

6.  No sign-in change event is fired to the game. The game never knew
    about user B.

7.  From the guide, user A chooses to sign out.

8.  The game gets a change event that indicates first that user A is in the
    process of signing out and then, ultimately, a different event
    that indicates that user A is now signed out.

While games have the ability to add users to their game, there are only
a few ways to remove users by using one of the following methods.

* The game could close all handles that represent the user by using the
    `XUserCloseHandle` function.
* The user uses the guide to sign out from the console.
* The user signs in to a different device.

## Types of users 

Xbox One supports two types of users: Xbox Live users and guests.

*Xbox Live users* have full capabilities as users on the system. They're
initially created by adding a new account in the Account Picker, a
system-provided UI for signing users in. Xbox Live users persist on the
console until they're removed explicitly with the Settings app.

*Xbox Live guests* have a single session on a console. They're
created when they choose in the Account Picker to play as a guest and
are sponsored by another signed-in Xbox Live user. Guests persist until
they sign out, until the sponsoring Xbox Live user signs out, or until
the console is turned off.

Games that want to allow guests must specify the `AllowGuest`
option when they call `XUserAddAsync`.

## Patterns to add users<a id="pattern_for_adding"></a>

Games must always attempt to establish an initial user. There are two primary
ways to achieve this.

#### Option 1: Determining the user as soon as possible without showing UI

1.  Call `XUserAddAsync` by using `AddDefaultUserSilently`. This function 
    tries to determine who launched the game without showing any UI. 
2.  The call to `XUserAddAsync` could fail with `E\_GAMEUSER\_NO\_DEFAULT\_USER`.
    If this happens, no one was signed in when the game was first launched. 
    To establish the initial user, the game needs to call 
    `XUserAddAsync` without using the `AddDefaultUserSilently` flag. Unlike
    the "silent" option, this call ensures that all issues with consent are
    fully resolved and that if the call succeeds, the user is signed in to Xbox
    Live. The game can create an Xbox Live context for that user.
	
#### Option 2: Determining the user with the possibility of showing UI

Call `XUserAddAsync` by using `AddDefaultUserAllowingUI`. Just like the 
previous option (with "silent"), this function tries to determine who 
launched the game. Unlike the previous option, if the default user can't
be determined, it shows UI to allow players to sign in or select themselves. 
If `XUserAddResult` succeeds, the game has a user who is fully 
signed in to Xbox Live and the game can create an Xbox Live context for that 
user.

For sample code that demonstrates these steps, see [How to: best practice to sign in a user](xuser_howto_best_practice_signing_in.md). 


## Managing XUserHandle

Each `XUserHandle` represents a user. However, it's possible for
multiple such handles to each represent the same user. Games should use 
the following basic pattern.

1. Maintain a collection of `XUserHandle` instances that represent the
    collection of users that the game cares about.

2. Register for `XUser` state changes by calling
    `XUserRegisterForChangeEvent`. When you see that a user is getting
    signed out, update your collection users.

3. When you get a new `XUserHandle` from `XUserAddAsync`, be sure
    to check if this represents a new user. You can
    directly compare with the handles by using `XUserCompare`. You can also 
    compare by using the local ID found by calling `XUserGetLocalId`.

4. If you have multiple `XUserHandle` instances 
    representing the same user, use `XUserCloseHandle` to remove the extra
    instances.