---
author: M-Stahl
title: Using the Game Chat 2 C++ API
description: Describes how to use the C++ API of Game Chat 2 to add voice and text communication to your game.
kindex: Using Game Chat 2
ms.author: jkepner
ms.topic: conceptual
ms.date: '09/12/2019'
edited: 11/02/2020
security: public
---

# Using the Game Chat 2 C++ API

This topic provides a brief walk-through of using the C++ API of Game Chat 2 to add voice and text communication to your game.



## Prerequisites

Game Chat 2 requires that your project has been set up for the GDK. For details about how to get set up, see [Get started with Xbox console development (NDA topic)](../../../getstarted/gc-getstarted-toc.md).

Compiling Game Chat 2 requires including the primary *GameChat2.h* header.
To link properly, your project must also include *GameChat2Impl.h* in at least one compilation unit (we recommend a common precompiled header because these stub function implementations are small and easy for the compiler to generate as "inline").

The Game Chat 2 interface doesn't require a project to choose between compiling with C++/CX versus traditional C++. It can be used with either. The implementation also doesn't throw exceptions as a means of non-fatal error reporting. You can consume it easily from exception-free projects, if you prefer. The implementation does, however, throw exceptions as a means of fatal error reporting. (For more details, see the [Failure model](using-game-chat-2.md#FAILURE_MODEL) section later in this topic.)

## Initialization


Begin interacting with the library by initializing the Game Chat 2 singleton instance with parameters that apply to the lifetime of the singleton's initialization. The singleton instance is initialized by calling [chat_manager::initialize](../../../reference/chat/gamechat2/classes/chat_manager/methods/chat_manager_initialize.md), shown as follows.

```cpp
chat_manager::singleton_instance().initialize(...);
```
> [!NOTE]
> You must register for suspend and resume events via `RegisterAppStateChangeNotification`. On suspend, you must clean up Game Chat 2 with [chat_manager::cleanup()](../../../reference/chat/gamechat2/classes/chat_manager/methods/chat_manager_cleanup.md). On resume, you should reinitialize Game Chat 2. It might crash if you attempt to use it across a suspend/resume cycle.

<a id="configuring_users"></a>

## Configuring users

### Adding users to your Microsoft Game Development Kit (GDK) title

Before you add users to the Game Chat 2 instance, ensure that they're added to the GDK title.
This is done by using the [XUserAddAsync API](../../../reference/system/xuser/functions/xuseraddasync.md). For more information about using this API, see [User identity and XUser](../../../system/overviews/user/player-identity-xuser.md).

After you have the `XUserHandle` for the user that you want to add to Game Chat 2, you need to get the user's Xbox User ID (XUID) by using the [XUserGetId API](../../../reference/system/xuser/functions/xusergetid.md).
The user must be online, and you must have the user's consent for this step.

[XUserGetId](../../../reference/system/xuser/functions/xusergetid.md) provides the XUID as a  `uint64_t`. You must convert the XUID into a `std::wstring` for use with Game Chat 2.

Following is a code example that shows how to add a user to Game Chat 2 after you have an `XUserHandle`.> [!NOTE]
> Be aware that calling [XUserResolveIssueWithUiAsync](../../../reference/system/xuser/functions/xuserresolveissuewithuiasync.md) displays a system dialog box.


```cpp
HRESULT
AddChatUserFromXUserHandle(
    _In_ XUserHandle user,
    _In_ XTaskQueueHandle queueHandle,
    _Outptr_result_maybenull_ Xs::game_chat_2::chat_user** chatUser
    )
{
    *chatUser = nullptr;
    uint64_t xuid;
    HRESULT hr = XUserGetId(user, &xuid);
    if (hr == E_GAMEUSER_RESOLVE_USER_ISSUE_REQUIRED)
    {
        XAsyncBlock* asyncBlock = new (std::nothrow) XAsyncBlock;
        if (asyncBlock != nullptr)
        {
            ZeroMemory(asyncBlock, sizeof(*asyncBlock));
            asyncBlock->queue = queueHandle;
            hr = XUserResolveIssueWithUiAsync(user, nullptr, asyncBlock);
            if (SUCCEEDED(hr))
            {
                hr = XAsyncGetStatus(asyncBlock, true);
                if (SUCCEEDED(hr))
                {
                    hr = XUserGetId(user, &xuid);
                }
            }
            delete asyncBlock;
        }
        else
        {
            hr = E_OUTOFMEMORY;
        }
    }

    if (SUCCEEDED(hr))
    {
        try
        {
            std::wstring xuidString = std::to_wstring(xuid);

            // If the user has already been added, this will return the existing user.
            *chatUser = Xs::game_chat_2::chat_manager::singleton_instance().add_local_user(xuidString.c_str());
        }
        catch (const std::bad_alloc&)
        {
            hr = E_OUTOFMEMORY;
        }
    }

    return hr;
}
```

<a id="adding_users_to_game_chat_2">

### Adding users to Game Chat 2

After the instance is initialized, you must add the local users to the Game Chat 2 instance by using [chat_manager::add_local_user](../../../reference/chat/gamechat2/classes/chat_manager/methods/chat_manager_add_local_user.md). In this example, User A represents a local user.

```cpp
chat_user* chatUserA = chat_manager::singleton_instance().add_local_user(<user_a_xuid>);
```

Next, add the remote users and the identifiers that are used to represent the remote "endpoint" that the user is on.
An *endpoint* is an instance of the app that's running on a remote device.

In this example, User B is on endpoint X. Users C and D are on endpoint Y.
Endpoint X is arbitrarily assigned identifier "1". Endpoint Y is arbitrarily assigned identifier "2".

Inform Game Chat 2 of the remote users with the following calls.

```cpp
chat_user* chatUserB = chat_manager::singleton_instance().add_remote_user(<user_b_xuid>, 1);
chat_user* chatUserC = chat_manager::singleton_instance().add_remote_user(<user_c_xuid>, 2);
chat_user* chatUserD = chat_manager::singleton_instance().add_remote_user(<user_d_xuid>, 2);
```

Next, configure the communication relationship between each remote user and the local user.
In this example, suppose that User A and User B are on the same team. Bidirectional communication is allowed.
`c_communicationRelationshipSendAndReceiveAll` is a constant that's defined in *GameChat2.h* to represent bidirectional communication.

Set User A's relationship to User B by using [chat_user_local::set_communication_relationship](../../../reference/chat/gamechat2/classes/chat_user/chat_user_local/methods/chat_user_local_set_communication_relationship.md).

```cpp
chatUserA->local()->set_communication_relationship(chatUserB, c_communicationRelationshipSendAndReceiveAll);
```

Suppose that Users C and D are "spectators" and should be allowed to listen to User A but not speak.
`c_communicationRelationshipSendAll` is a constant that's defined in *GameChat2.h* to represent this unidirectional communication.

Set the relationships as follows.

```cpp
chatUserA->local()->set_communication_relationship(chatUserC, c_communicationRelationshipSendAll);
chatUserA->local()->set_communication_relationship(chatUserD, c_communicationRelationshipSendAll);
```

For examples with relationship settings from all four local users, see the [scenarios](using-game-chat-2.md#scenarios) section later in this topic.

If at any point there are remote users who have been added to the singleton instance but haven't been configured to communicate with any local users&mdash;that's okay.
This can be expected in scenarios where users are determining teams or can arbitrarily change speaking channels.

Game Chat 2 only caches information (for example, privacy relationships and reputation) for users who have been added to the instance, so it's useful to inform Game Chat 2 of all possible users&mdash;even if they can't speak to any local users at a particular point in time.

Finally, suppose that User D has left the game and should be removed from the local Game Chat 2 instance.
This can be done by using [chat_manager::remove_user](../../../reference/chat/gamechat2/classes/chat_manager/methods/chat_manager_remove_user.md), shown as follows.

```cpp
chat_manager::singleton_instance().remove_user(chatUserD);
```

Calling `chat_manager::remove_user()` can invalidate the user object. If you're using [real-time audio manipulation](real-time-audio-manipulation.md), see [Chat user lifetimes](real-time-audio-manipulation.md#chat-user-lifetimes) for more information. Otherwise, the user object is invalidated immediately when `chat_manager::remove_user()` is called. A subtle restriction on when users can be removed is detailed in the [Processing state changes](#processing-state-changes) section later in this topic.

<a id="processing_data_frames"></a>

## Processing data frames

Game Chat 2 doesn't have its own transport layer. It must be provided by the app.
This plug-in is managed by the app's regular, frequent calls to the [chat_manager::start_processing_data_frames()](../../../reference/chat/gamechat2/classes/chat_manager/methods/chat_manager_start_processing_data_frames.md) and [chat_manager::finish_processing_data_frames()](../../../reference/chat/gamechat2/classes/chat_manager/methods/chat_manager_finish_processing_data_frames.md) pair of methods. These methods are how Game Chat 2 provides outgoing data to the app.

These methods are designed to operate quickly. They can be polled frequently on a dedicated networking thread.
This provides a convenient place to retrieve all queued data without worrying about the unpredictability of network timing or multithreaded callback complexity.

When `chat_manager::start_processing_data_frames()` is called, all queued data is reported in an array of [game_chat_data_frame](../../../reference/chat/gamechat2/structs/game_chat_data_frame.md) structure pointers.
Apps should iterate over the array, inspect the target endpoints, and use the app's networking layer to deliver the data to the appropriate remote app instances.

After the array is finished with all the [game_chat_data_frame](../../../reference/chat/gamechat2/structs/game_chat_data_frame.md) structures, the array should be passed back to Game Chat 2 to release the resources by calling `chat_manager:finish_processing_data_frames()`.
This is shown in the following example.

```cpp
uint32_t dataFrameCount;
game_chat_data_frame_array dataFrames;
chat_manager::singleton_instance().start_processing_data_frames(&dataFrameCount, &dataFrames);
for (uint32_t dataFrameIndex = 0; dataFrameIndex < dataFrameCount; ++dataFrameIndex)
{
    game_chat_data_frame const* dataFrame = dataFrames[dataFrameIndex];

    // Title-written function responsible for sending packet to remote instances of GameChat 2.
    HandleOutgoingDataFrame(
        dataFrame->packet_byte_count,
        dataFrame->packet_buffer,
        dataFrame->target_endpoint_identifier_count,
        dataFrame->target_endpoint_identifiers,
        dataFrame->transport_requirement
        );
}
chat_manager::singleton_instance().finish_processing_data_frames(dataFrames);
```

The more frequently the data frames are processed, the lower the audio latency is that's apparent to the user.
The audio is coalesced into 40 ms data frames. This is the suggested polling period.


<a id ="processing-state-changes"></a>

## Processing state changes

Game Chat 2 provides updates to the app, such as received text messages, through the app's regular, frequent calls to the [chat_manager::start_processing_state_changes()](../../../reference/chat/gamechat2/classes/chat_manager/methods/chat_manager_start_processing_state_changes.md) and [chat_manager::finish_processing_state_changes()](../../../reference/chat/gamechat2/classes/chat_manager/methods/chat_manager_finish_processing_state_changes.md) pair of methods.
These methods operate quickly, so that they can be called every graphics frame in your UI rendering loop.
This provides a convenient place to retrieve all queued changes without worrying about the unpredictability of network timing or multithreaded callback complexity.


When `chat_manager::start_processing_state_changes()` is called, all queued updates are reported in an array of [game_chat_state_change](../../../reference/chat/gamechat2/structs/game_chat_state_change.md) structure pointers.
Apps should iterate over the array, inspect the base structure for its more specific type, cast the base structure to the corresponding more detailed type, and then handle that update as appropriate.

After the array is finished with all [game_chat_state_change](../../../reference/chat/gamechat2/structs/game_chat_state_change.md) objects that are currently available, the array should be passed back to Game Chat 2 to release the resources by calling `chat_manager::finish_processing_state_changes()`.
This is shown in the following example.

```cpp
uint32_t stateChangeCount;
game_chat_state_change_array gameChatStateChanges;
chat_manager::singleton_instance().start_processing_state_changes(&stateChangeCount, &gameChatStateChanges);

std::list<Xs::game_chat_2::chat_user*> usersWithPrivilegeIssues;
std::list<Xs::game_chat_2::chat_user*> usersWithPrivilegeCheckIssues;
for (uint32_t stateChangeIndex = 0; stateChangeIndex < stateChangeCount; ++stateChangeIndex)
{
    switch (gameChatStateChanges[stateChangeIndex]->state_change_type)
    {
        case game_chat_state_change_type::text_chat_received:
        {
            HandleTextChatReceived(static_cast<const game_chat_text_chat_received_state_change*>(gameChatStateChanges[stateChangeIndex]));
            break;
        }

        case Xs::game_chat_2::game_chat_state_change_type::transcribed_chat_received:
        {
            HandleTranscribedChatReceived(static_cast<const Xs::game_chat_2::game_chat_transcribed_chat_received_state_change*>(gameChatStateChanges[stateChangeIndex]));
            break;
        }
        case Xs::game_chat_2::game_chat_state_change_type::communication_relationship_adjuster_changed:
        {
            HandleAdjusterChangedStateReceived(static_cast<const Xs::game_chat_2::game_chat_communication_relationship_adjuster_changed_state_change*>(gameChatStateChanges[stateChangeIndex]), usersWithPrivilegeIssues, usersWithPrivilegeCheckIssues);
            break;
        }

        ...
    }
}
chat_manager::singleton_instance().finish_processing_state_changes(gameChatStateChanges);
```

Because `chat_manager::remove_user()` immediately invalidates the memory that's associated with a user object, and state changes may contain pointers to user objects, `chat_manager::remove_user()` must not be called while processing state changes.


## Text chat

To send text chat, use [chat_user\::chat_user_local\::send_chat_text()](../../../reference/chat/gamechat2/classes/chat_user/chat_user_local/methods/chat_user_local_send_chat_text.md).
This is shown in the following example.

```cpp
chatUserA->local()->send_chat_text(L"Hello");
```

Game Chat 2 generates a data frame that contains this message. The target endpoints for the data frame are those associated with users who have been configured to receive text from the local user.
When the data is processed by the remote endpoints, the message is exposed via [game_chat_text_chat_received_state_change](../../../reference/chat/gamechat2/structs/game_chat_text_chat_received_state_change.md).

As with voice chat, privilege and privacy restrictions are respected for text chat.
If a pair of users has been configured to allow text chat, but privilege or privacy restrictions disallow that communication, the text message is dropped.



## Accessibility

Accessibility requires supporting text chat input and display.

Text input is required because, even on platforms or game genres that historically haven't had widespread physical keyboard use, users can configure the system to use text-to-speech assistive technologies.

Similarly, text display is required because users can configure the system to use speech-to-text.

These preferences can be detected on local users by calling the [chat_user\::chat_user_local\::text_to_speech_conversion_preference_enabled()](../../../reference/chat/gamechat2/classes/chat_user/chat_user_local/methods/chat_user_local_text_to_speech_conversion_preference_enabled.md) and [chat_user::chat_user_local::speech_to_text_conversion_preference_enabled()](../../../reference/chat/gamechat2/classes/chat_user/chat_user_local/methods/chat_user_local_speech_to_text_conversion_preference_enabled.md) methods, respectively. We recommend that you enable text conditionally, based on user preferences.

### Text-to-speech

When a user has text-to-speech enabled, [chat_user\::chat_user_local\::text_to_speech_conversion_preference_enabled()](../../../reference/chat/gamechat2/classes/chat_user/chat_user_local/methods/chat_user_local_text_to_speech_conversion_preference_enabled.md) returns `true`. When this state is detected, the app must provide a method of text input.

After you have the text input provided by a real or virtual keyboard, pass the string to the [chat_user\::chat_user_local\::synthesize_text_to_speech()](../../../reference/chat/gamechat2/classes/chat_user/chat_user_local/methods/chat_user_local_synthesize_text_to_speech.md) method. Game Chat 2 detects and synthesizes audio data that's based on the string and the user's accessibility voice preference.
This is shown in the following example.

```cpp
chat_userA->local()->synthesize_text_to_speech(L"Hello");
```

The audio that's synthesized as part of this operation is transported to all users who have been configured to receive audio from this local user.
If `chat_user::chat_user_local::synthesize_text_to_speech()` is called on a user who doesn't have text-to-speech enabled, Game Chat 2 takes no action.


### Speech-to-text

When a user has speech-to-text enabled, [chat_user\::chat_user_local\::speech_to_text_conversion_preference_enabled()](../../../reference/chat/gamechat2/classes/chat_user/chat_user_local/methods/chat_user_local_speech_to_text_conversion_preference_enabled.md) returns `true`. When this state is detected, the app must be prepared to provide UI that's associated with transcribed chat messages. Game Chat 2 automatically transcribes each remote user's audio and exposes it via a [game_chat_transcribed_chat_received_state_change](../../../reference/chat/gamechat2/structs/game_chat_transcribed_chat_received_state_change.md) struct.


### Speech-to-text performance considerations

When speech-to-text is enabled, the Game Chat 2 instance on each remote device initiates a WebSocket connection with the speech services endpoint.
Each remote Game Chat 2 client uploads audio to the speech services endpoint through this WebSocket. The speech services endpoint occasionally returns a transcription message to the remote device.
The remote device then sends the transcription message (that is, a text message) to the local device. The transcribed message is given by Game Chat 2 to the app to render.

Therefore, the primary performance cost of speech-to-text is network usage.
Most of the network traffic is the upload of encoded audio.
The WebSocket uploads audio that has already been encoded by Game Chat 2 in the "normal" voice chat path. The app has control over the bit rate via [chat_manager::set_audio_encoding_bitrate](../../../reference/chat/gamechat2/classes/chat_manager/methods/chat_manager_set_audio_encoding_bitrate.md).

<a id ="ui"></a>

## UI

We recommend that anywhere users are shown UI, particularly in a list of gamertags such as a scoreboard, that you also display muted/speaking icons as feedback for the user.
This is done by calling [chat_user::chat_indicator()](../../../reference/chat/gamechat2/classes/chat_user/methods/chat_user_chat_indicator.md) to retrieve a [game_chat_user_chat_indicator](../../../reference/chat/gamechat2/enums/game_chat_user_chat_indicator.md) enumeration that represents the current, instantaneous status of chat for that user. The following example demonstrates retrieving the indicator value for a [chat_user](../../../reference/chat/gamechat2/classes/chat_user/chat_user.md) object pointed to by the `chatUserA` variable to determine a particular icon constant value to assign to an `iconToShow` variable.

```cpp
switch (chatUserA->chat_indicator())
{
   case game_chat_user_chat_indicator::silent:
   {
       iconToShow = Icon_InactiveSpeaker;
       break;
   }

   case game_chat_user_chat_indicator::talking:
   {
       iconToShow = Icon_ActiveSpeaker;
       break;
   }

   case game_chat_user_chat_indicator::local_microphone_muted:
   {
       iconToShow = Icon_MutedSpeaker;
       break;
   }
   ...
}
```

The value that's reported by [chat_user::chat_indicator()](../../../reference/chat/gamechat2/classes/chat_user/methods/chat_user_chat_indicator.md) is expected to change frequently, for example, as players start and stop talking.
As a result, it's designed to support apps polling it every UI frame.

## Muting

The [chat_user\::chat_user_local\::set_microphone_muted()](../../../reference/chat/gamechat2/classes/chat_user/chat_user_local/methods/chat_user_local_set_microphone_muted.md) method can be used to switch the mute state of a local user's microphone. When the microphone is muted, no audio from that microphone is captured. If the user is on a shared device, such as Kinect, the mute state applies to all users.

The [chat_user\::chat_user_local\::microphone_muted()](../../../reference/chat/gamechat2/classes/chat_user/chat_user_local/methods/chat_user_local_microphone_muted.md) method can be used to retrieve the mute state of a local user's microphone. This method only reflects whether the local user's microphone has been muted in the software via a call to `chat_user::chat_user_local::set_microphone_muted()`. This method doesn't reflect a mute that's controlled by hardware, for example, via a button on the user's headset.

There's no method for retrieving the hardware mute state of a user's audio device through Game Chat 2.

The [chat_user\::chat_user_local\::set_remote_user_muted()](../../../reference/chat/gamechat2/classes/chat_user/chat_user_local/methods/chat_user_local_set_remote_user_muted.md) method can be used to switch the mute state of a remote user in relation to a particular local user. When the remote user is muted, the local user won't hear any audio or receive any text messages from the remote user.


## Bad reputation auto-mute

Typically, remote users start off unmuted.
Game Chat 2 starts the users in a muted state when:

1. The remote user isn't friends with the local user.
1. The remote user has a bad reputation flag.

When users are muted due to this operation, `chat_user::chat_indicator()` returns `game_chat_user_chat_indicator::reputation_restricted`.
This state is overridden by the first call to `chat_user::chat_user_local::set_remote_user_muted()` that includes the remote user as the target user.


## Privilege and privacy

In addition to the communication relationship that's configured by the game, Game Chat 2 enforces privilege and privacy restrictions.
Game Chat 2 performs privilege and privacy restriction lookups when a user is first added. The user's `chat_user::chat_indicator()` always returns `game_chat_user_chat_indicator::silent` until those operations have been completed.

If communication with a user is affected by a privilege or privacy restriction, the user's `chat_user::chat_indicator()` returns `game_chat_user_chat_indicator::platform_restricted`.
Platform communication restrictions apply to both voice and text chat. There will never be an instance where text chat is blocked by a platform restriction, but voice chat isn't, or vice versa.

[chat_user\::chat_user_local\::get_effective_communication_relationship()](../../../reference/chat/gamechat2/classes/chat_user/chat_user_local/methods/chat_user_local_get_effective_communication_relationship.md) can be used to help distinguish when users can't communicate due to incomplete privilege and privacy operations.
It returns the communication relationship that's enforced by Game Chat 2 in the form of [game_chat_communication_relationship_flags](../../../reference/chat/gamechat2/enums/game_chat_communication_relationship_flags.md) and is the reason that the relationship might not be equal to the configured relationship in the form of a [game_chat_communication_relationship_adjuster](../../../reference/chat/gamechat2/enums/game_chat_communication_relationship_adjuster.md) enumeration.

For example, if the lookup operations are still in progress, the [game_chat_communication_relationship_adjuster](../../../reference/chat/gamechat2/enums/game_chat_communication_relationship_adjuster.md) will be `game_chat_communication_relationship_adjuster::initializing`.
This method shouldn't be used to influence UI. (For more information, see the [UI](#ui) section earlier in this topic.)

If Game Chat 2 encounters a privilege issue, it will be reported in the [communication_relationship_adjuster_changed](../../../reference/chat/gamechat2/structs/game_chat_stream_state_change.md) state change.

If Game Chat 2 fails to retrieve the user's privilege for an unrecoverable reason, it will be reported as a `game_chat_communication_relationship_adjuster::privilege_check_failure` adjuster.

If Game Chat 2 fails to retrieve the user's privilege for a reason that the user might be able to resolve, it will be reported as a `game_chat_communication_relationship_adjuster::resolve_user_issue` adjuster.

If the user is missing privileges that might be resolvable with UI, it will be reported as a `game_chat_communication_relationship_adjuster::privilege` adjuster.

In these cases, communication will be restricted.

Here's an example of how to check if a user has one of the following common issues.

1. Users need to give consent to Xbox Live for Game Chat 2 to check privileges.
2. The user's account is configured to deny privileges (for example, being a child account and therefore unable to use chat).

```cpp
void
HandleAdjusterChangedStateReceived (
    _In_ const Xs::game_chat_2::game_chat_communication_relationship_adjuster_changed_state_change* adjusterChange,
    _Inout_ std::list<Xs::game_chat_2::chat_user*>& usersWithPrivilegeIssues,
    _Inout_ std::list<Xs::game_chat_2::chat_user*>& usersWithPrivilegeCheckIssues
    )
{
    Xs::game_chat_2::game_chat_communication_relationship_flags communicationRelationship;
    Xs::game_chat_2::game_chat_communication_relationship_adjuster communicationRelationshipAdjuster;
    adjusterChange->local_user->local()->get_effective_communication_relationship(
        adjusterChange->target_user,
        &communicationRelationship,
        &communicationRelationshipAdjuster);

    if (communicationRelationshipAdjuster == Xs::game_chat_2::game_chat_communication_relationship_adjuster::privilege)
    {
        // The local user has privilege issues.
        usersWithPrivilegeIssues.push_back(adjusterChange->local_user);
    }
    else if (communicationRelationshipAdjuster == Xs::game_chat_2::game_chat_communication_relationship_adjuster::resolve_user_issue)
    {
        // The local user has an issue checking privileges.
        usersWithPrivilegeCheckIssues.push_back(adjusterChange->local_user);
    }
}
```

For issues that are reported with the `game_chat_communication_relationship_adjuster::privilege` adjuster, you can call [XUserResolvePrivilegeWithUiAsync](../../../reference/system/xuser/functions/xuserresolveprivilegewithuiasync.md) with `XUserPrivilegeOptions::None` and `XUserPrivilege::Communications` to attempt to resolve the issue.

For issues that are reported with the `game_chat_communication_relationship_adjuster::resolve_user_issue` adjuster, you can call [XUserResolveIssueWithUiAsync](../../../reference/system/xuser/functions/xuserresolveissuewithuiasync.md) with `nullptr` for the URL to attempt to resolve the issue.

We recommend that you show UI that indicates there's a privilege issue. Allow the user to decide if they want to attempt to resolve the issue, either through a button press or a menu option.

The user might be unable or unwilling to resolve the issue.
If the user does resolve the issue, it will take effect next time the user is added to Game Chat 2.
> [!NOTE]
> [chat_manager\::remove_user()](../../../reference/chat/gamechat2/classes/chat_manager/methods/chat_manager_remove_user.md) must not be called while processing state changes (that is, after [chat_manager\::start_processing_state_changes()](../../../reference/chat/gamechat2/classes/chat_manager/methods/chat_manager_start_processing_state_changes.md) has been called and before the corresponding call to [chat_manager\::finish_processing_state_changes()](../../../reference/chat/gamechat2/classes/chat_manager/methods/chat_manager_finish_processing_state_changes.md)). Calling `chat_manager\::remove_user()` while state changes are being processed can invalidate the memory that's associated with the removed user.
> If you see a `game_chat_communication_relationship_adjuster::privilege` adjuster and want to try to resolve user privileges, you should wait until after processing state changes to try this.

To get the `XUserHandle` from an XUID, which is required to call `XUserResolvePrivilegeWithUiAsync`, you can use the [XUserFindUserById](../../../reference/system/xuser/functions/xuserfinduserbyid.md) API to get a new `XUserHandle`. Alternatively, you can hold on to the one that you acquired with [XUserAddAsync](../../../reference/system/xuser/functions/xuseraddasync.md), and keep track of which XUID maps to it.

Here's an example of how to resolve these issues.

```cpp
// If we got an Xs::game_chat_2::game_chat_communication_relationship_adjuster::resolve_user_issue,
// we need to try and fix our issue, if we haven't already, and then remove and re-add that user.
for (Xs::game_chat_2::chat_user* localUser : usersWithPrivilegeCheckIssues)
{
    auto asyncBlock = std::make_unique<XAsyncBlock>();
    ZeroMemory(asyncBlock.get(), sizeof(*asyncBlock));
    asyncBlock->queue = g_asyncQueue;

    XUserHandle userHandle;
    hr = XUserFindUserById(localUser->local()->xbox_user_id(), &userHandle);
    if (SUCCEEDED(hr))
    {
        hr = XUserResolveIssueWithUiAsync(
            userHandle,
            nullptr,
            asyncBlock.get());
        if (SUCCEEDED(hr))
        {
            hr = XAsyncGetStatus(asyncBlock.get(), true);
            if (SUCCEEDED(hr))
            {
                // Remove and re-add the user after fixing the privileges.
                // Users must not be removed while processing state changes.
            }
            asyncBlock.release();
        }
    }
}

// If we got an Xs::game_chat_2::game_chat_communication_relationship_adjuster::resolve_user_privilege,
// we need to try and resolve the privileges, if we haven't already, and then remove and re-add that user.
for (Xs::game_chat_2::chat_user* localUser : usersWithPrivilegeIssues)
{
    auto asyncBlock = std::make_unique<XAsyncBlock>();
    ZeroMemory(asyncBlock.get(), sizeof(*asyncBlock));
    asyncBlock->queue = g_asyncQueue;

    XUserHandle userHandle;
    hr = XUserFindUserById(localUser->local()->xbox_user_id(), &userHandle);
    if (SUCCEEDED(hr))
    {
        hr = XUserResolvePrivilegeWithUiAsync(
            userHandle,
            XUserPrivilegeOptions::None,
            XUserPrivilege::Communications,
            asyncBlock.get());
        if (SUCCEEDED(hr))
        {
            hr = XAsyncGetStatus(asyncBlock.get(), true);
            if (SUCCEEDED(hr))
            {
                // Remove and re-add the user after fixing the privileges.
                // Users must not be removed while processing state changes.
            }
            asyncBlock.release();
        }
    }
}
```


## Cleanup

When the app no longer needs communications via Game Chat 2, you should call [chat_manager::cleanup()](../../../reference/chat/gamechat2/classes/chat_manager/methods/chat_manager_cleanup.md).
This allows Game Chat 2 to reclaim resources that were allocated to manage communications.

<a id ="FAILURE_MODEL"></a>

## Failure model

The Game Chat 2 implementation doesn't throw exceptions as a means of non-fatal error reporting. You can consume it easily from exception-free projects, if you prefer.
Game Chat 2 does, however, throw exceptions to inform you about fatal errors.

These errors are a result of API misuse, such as adding a user to the Game Chat instance before initializing the instance or accessing a user object after it has been removed from the Game Chat 2 instance.

These errors are expected to be caught early in development and can be corrected by modifying the pattern that's used to interact with Game Chat 2.
When such an error occurs, a hint as to what caused the error is printed to the debugger before the exception is raised.

<a id ="scenarios"></a>

## How to configure popular scenarios


### Push-to-talk

Push-to-talk should be implemented with [chat_user::chat_user_local::set_microphone_muted()](../../../reference/chat/gamechat2/classes/chat_user/chat_user_local/methods/chat_user_local_set_microphone_muted.md).
Call `set_microphone_muted(false)` to allow speech and `set_microphone_muted(true)` to restrict it.
This method provides the lowest latency response from Game Chat 2.

### Teams

Suppose that User A and User B are on Team Blue, and User C and User D are on Team Red.
Each user is in a unique instance of the app.

On User A's device:

```cpp
chatUserA->local()->set_communication_relationship(chatUserB, c_communicationRelationshipSendAndReceiveAll);
chatUserA->local()->set_communication_relationship(chatUserC, game_chat_communication_relationship_flags::none);
chatUserA->local()->set_communication_relationship(chatUserD, game_chat_communication_relationship_flags::none);
```

On User B's device:

```cpp
chatUserB->local()->set_communication_relationship(chatUserA, c_communicationRelationshipSendAndReceiveAll);
chatUserB->local()->set_communication_relationship(chatUserC, game_chat_communication_relationship_flags::none);
chatUserB->local()->set_communication_relationship(chatUserD, game_chat_communication_relationship_flags::none);
```

On User C's device:

```cpp
chatUserC->local()->set_communication_relationship(chatUserA, game_chat_communication_relationship_flags::none);
chatUserC->local()->set_communication_relationship(chatUserB, game_chat_communication_relationship_flags::none);
chatUserC->local()->set_communication_relationship(chatUserD, c_communicationRelationshipSendAndReceiveAll);
```

On User D's device:

```cpp
chatUserD->local()->set_communication_relationship(chatUserA, game_chat_communication_relationship_flags::none);
chatUserD->local()->set_communication_relationship(chatUserB, game_chat_communication_relationship_flags::none);
chatUserD->local()->set_communication_relationship(chatUserC, c_communicationRelationshipSendAndReceiveAll);
```


### Broadcast

Suppose that User A is the leader, giving orders. Users B, C, and D can only listen.
Each player is on a unique device.

On User A's device:

```cpp
chatUserA->local()->set_communication_relationship(chatUserB, c_communicationRelationshipSendAll);
chatUserA->local()->set_communication_relationship(chatUserC, c_communicationRelationshipSendAll);
chatUserA->local()->set_communication_relationship(chatUserD, c_communicationRelationshipSendAll);
```

On User B's device:

```cpp
chatUserB->local()->set_communication_relationship(chatUserA, c_communicationRelationshipReceiveAll);
chatUserB->local()->set_communication_relationship(chatUserC, game_chat_communication_relationship_flags::none);
chatUserB->local()->set_communication_relationship(chatUserD, game_chat_communication_relationship_flags::none);
```

On User C's device:

```cpp
chatUserC->local()->set_communication_relationship(chatUserA, c_communicationRelationshipReceiveAll);
chatUserC->local()->set_communication_relationship(chatUserB, game_chat_communication_relationship_flags::none);
chatUserC->local()->set_communication_relationship(chatUserD, game_chat_communication_relationship_flags::none);
```

On User D's device:

```cpp
chatUserD->local()->set_communication_relationship(chatUserA, c_communicationRelationshipReceiveAll);
chatUserD->local()->set_communication_relationship(chatUserB, game_chat_communication_relationship_flags::none);
chatUserD->local()->set_communication_relationship(chatUserC, game_chat_communication_relationship_flags::none);
```

## See also

[Intro to Game Chat 2](game-chat-2-intro.md)

[Real-time audio manipulation](real-time-audio-manipulation.md)

[API contents (GameChat2)](../../../reference/chat/gamechat2/gamechat2_members.md)

[Microsoft Game Development Kit](../../../GDKIntroduction.md)