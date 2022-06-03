---
author: M-Stahl
title: Users and input devices
description: Describes how games determine which input devices are associated to a specified user.
kindex: Users and input devices
ms.author: jgup
ms.topic: conceptual
edited: 06/08/2020
security: public
---

# Users and input devices

Games need to know which input devices are associated to a specified user.
This is key to answering the following questions:

* Who took an action in the game?

* Who gets the achievement?

* Who's making the purchase?

This topic covers some key concepts that help you handle these associations and answer
these kinds of questions.

## Differences in user model from Xbox One ERA and Microsoft Game Development Kit (GDK)

Whether developing a new Microsoft Game Development Kit (GDK) title or porting a previous title from Xbox One ERA, implementing user and input device management can be confusing when accustomed to the user model from Xbox One ERA.

* Titles that need users, such as when game saves or achievements are needed, must establish a primary 
user. This primary user is a title-only construct and not provided by the system.

* The title only knows about users added via a call to [XUserAddAsync](../../../reference/system/xuser/functions/xuseraddasync.md). The title is 
not informed of any actions taken by the system for users that it hasn't added.

* When a device that was previously associated to a title user is associated to a user that the title 
is unaware of, the title is only informed of a device association event without a new user.

* If a device that wasn't associated to a title user becomes associated to another user that also wasn't
added with [XUserAddAsync](../../../reference/system/xuser/functions/xuseraddasync.md), then the title is not informed of the association event.

* The Account Picker acts differently based on how it was brought up (System Guide vs 
[XUserAddAsync](../../../reference/system/xuser/functions/xuseraddasync.md)).
> [!NOTE]
> The UserManagement sample covers user management and input device pairing 
> behavior across a wide variety of game situations. It also handles XR requirements as they relate to users 
> and input devices. For more information about samples, see 
> [Microsoft Game Development Kit samples](../../../samples/gdk-samples-home.md).

## How to identify a specified user

Games use the *local ID* to interact with input devices. The local ID is an 
identifier that stays with the user throughout their lifetime within the game session. The local ID is usable across
any processes that a game spawns or if the game
calls [XLaunchNewGame](../../../reference/system/xgame/functions/xlaunchnewgame.md). Don't use the local ID to identify a user
across gaming sessions. 

To get the local ID for a user, use the [XUserGetLocalId](../../../reference/system/xuser/functions/xusergetlocalid.md) function.

## How to identify a particular input device

Gaming devices, such as gamepads, arcade sticks, and wheels, all have a
unique *device ID* that's represented by an [APP_LOCAL_DEVICE_ID](../../../reference/system/xuser/structs/app_local_device_id.md) structure.
This device ID persists across multiple launches of the game or
restarts of the system. The device ID is different between two
different games running on the same system.

If you're using `XInput` on the console, you can get the device ID by using
[XInputGetDeviceId](../../../reference/input/xinputongameinput/functions/xinputgetdeviceid.md).

If you're using [GameInput](../../../input/overviews/input-overview.md), you can get the device ID from the
`deviceId` member of the [GameInputDeviceInfo](../../../reference/input/gameinput/structs/gameinputdeviceinfo.md) object that's returned from
a call to [IGameInputDevice::GetDeviceInfo](../../../reference/input/gameinput/interfaces/igameinputdevice/methods/igameinputdevice_getdeviceinfo.md).

## User Model

When a title needs to have users, for example when game saves or achievements are needed, the title is 
fully responsible for establishing a primary user. This primary user must be maintained even when 
allowing for multiple users to sign in. The title must also allow the primary user to be changed as 
needed. A method to do so would be to have a *Switch User* prompt that brings up an Account Picker 
with [XUserAddAsync](../../../reference/system/xuser/functions/xuseraddasync.md).

The Account Picker lists all the users who have previously signed in on the
console, has an **Add new** button for signing in to new accounts, and allows signing in temporary
guest users. Any of these user accounts can be selected, regardless of the user's true
identity. The system supports users who are choosing to play as others in this
way.

Microsoft Game Development Kit (GDK) titles do not have full knowledge of users on the system. Instead, users can only 
be added to a title via a call to [XUserAddAsync](../../../reference/system/xuser/functions/xuseraddasync.md). Users added in this way are the 
only users the title can interact with. The system will not inform the title about actions made for 
users that the title hasn't added. As a result, the title should maintain its own list of users.

The Account Picker can be brought up two different ways: from the System Guide and via 
[XUserAddAsync](../../../reference/system/xuser/functions/xuseraddasync.md). This picker behaves differently in these two circumstances:

| Case | [XUserAddAsync](../../../reference/system/xuser/functions/xuseraddasync.md) Account Picker | Guide Account Picker |
| ---- | ------------------------------------------------ | -------------------- |
| Selecting user that hasn't signed in to the title | The user becomes signed in to both the system and the title. | The user is only signed in to the system. The title is not informed of the sign-in. |
| Selecting user that has already signed in to the title | The user is already signed-in to the title, so no further user state changes happen. | The user is already signed-in to the title, so no further user state changes happen. |
> [!NOTE]
> The set of users signed-in to a title is always a sub-set of the users 
> signed in to the system. A title cannot have users signed-in that the system doesn't have signed-in. 
> However, the system can have users that the title does not know about.

User Events can be handled via an [XUserChangeEventCallback](../../../reference/system/xuser/functions/xuserchangeeventcallback.md) registered 
with [XUserRegisterForChangeEvent](../../../reference/system/xuser/functions/xuserregisterforchangeevent.md). Events will only be called for 
users that have been signed in with [XUserAddAsync](../../../reference/system/xuser/functions/xuseraddasync.md). When a user signs out from the 
system, the title must react accordingly and either remove the user from the title or allow the player 
to try to sign in the user again.

## Input Device Associations

The Microsoft Game Development Kit (GDK) allows for users to have any number of input devices associated to them. This can 
be challenging when porting older titles that may assume a 1:1 mapping between users and devices.

Device associations are usually made via the Account Picker. The input device that selects the user from 
the UI becomes associated with that user. Associations can change from other cases too, such as when a 
user is signed out or when [XUserAddAsync](../../../reference/system/xuser/functions/xuseraddasync.md) is used without UI via the 
[AddDefaultUserSilently](../../../reference/system/xuser/enums/xuseraddoptions.md) and [AddDefaultUserAllowingUI](../../../reference/system/xuser/enums/xuseraddoptions.md) options.

The Account Picker behaves different for associations as well based on how the picker was brought up:

| Case | [XUserAddAsync](../../../reference/system/xuser/functions/xuseraddasync.md) Account Picker | Guide Account Picker |
| ---- | ------------------------------------------------ | -------------------- |
| Selecting user that hasn't signed in to the title | After the user is signed in to the title, the device that completed the prompt becomes associated to the user. | The user is signed in to the system (if not already signed in) and the device that completed the prompt is associated to that user. Since the title doesn't know about this user, it will be informed that the device is unassociated. |
| Selecting user that has already signed in to the title | The device that completed the prompt becomes associated to the system and title user. | The device that completed the prompt becomes associated to the system and title user.

If the user was automatically signed in the title without an Account Picker by a call to 
[XUserAddAsync](../../../reference/system/xuser/functions/xuseraddasync.md) utilizing one of the [AddDefaultUserSilently](../../../reference/system/xuser/enums/xuseraddoptions.md) or 
[AddDefaultUserAllowingUI](../../../reference/system/xuser/enums/xuseraddoptions.md) options, the input device pairings that the system had 
are communicated to the title.

To be notified of user device association changes, you can register an 
[XUserDeviceAssociationChangedCallback](../../../reference/system/xuser/functions/xuserdeviceassociationchangedcallback.md) callback with the 
[XUserRegisterForDeviceAssociationChanged](../../../reference/system/xuser/functions/xuserregisterfordeviceassociationchanged.md) method. You can 
also call [XUserFindForDevice](../../../reference/system/xuser/functions/xuserfindfordevice.md) to look up an association for a specific device.
> [!NOTE]
> Since the title can only know about users that have been added with 
> [XUserAddAsync](../../../reference/system/xuser/functions/xuseraddasync.md), user device association callbacks and methods can only return users 
> that the title has previously added.

## Matching the user to a default audio endpoint

Headsets or microphones are frequently provided with games. Following are some important
questions to ask.

* Does the user have a headset? If so, which headset are they likely using?
    What's the default communication-rendering audio endpoint?

* Does the user have a microphone associated to them? What's the
    default communication-capturing endpoint?

To answer these questions for a specific user, games can call
[XUserGetDefaultAudioEndpointUtf16](../../../reference/system/xuser/functions/xusergetdefaultaudioendpointutf16.md). Just as user-to-device
associations can change, the default audio endpoints associated to a
specific user can also change. To detect these association changes, games
should call [XUserRegisterForDefaultAudioEndpointUtf16Changed](../../../reference/system/xuser/functions/xuserregisterfordefaultaudioendpointutf16changed.md) and pay attention
to the resulting callback.