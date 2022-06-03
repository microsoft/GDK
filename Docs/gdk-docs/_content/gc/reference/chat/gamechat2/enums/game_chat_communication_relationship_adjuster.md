---
author: M-Stahl
title: game_chat_communication_relationship_adjuster
description: Defines the extra adjustment steps applied by Game Chat 2 to a communication relationship that was previously set by calling [chat_user_local::set_communication_relationship](../classes/chat_user/chat_user_local/methods/chat_user_local_set_communication_relationship.md).
kindex: game_chat_communication_relationship_adjuster
ms.author: jkepner
ms.topic: reference
ms.date: '09/12/2019'
edited: 10/08/2020
security: public
applies-to: pc-gdk
---

# game_chat_communication_relationship_adjuster
  
Defines the extra adjustment steps applied by Game Chat 2 to a communication relationship that was previously set by calling [chat_user_local::set_communication_relationship](../classes/chat_user/chat_user_local/methods/chat_user_local_set_communication_relationship.md).  
  
<a id="syntaxSection"></a>
  
## Syntax
  
```cpp
enum class game_chat_communication_relationship_adjuster  
{  
    uninitialized,  
    initializing,  
    none,  
    privilege,  
    privacy,  
    reputation,  
    conflict_with_other_user,  
    privilege_check_failure,  
    resolve_user_issue,
    service_unavailable,
}  
```  
  
<a id="constantsSection"></a>
  
## Constants
  
| Constant | Description |  
| --- | --- |  
| uninitialized | No relationship has been set by the app for the pair of users. <br/><br/> Game Chat 2 cannot initialize the adjusters for a pair of users until a relationship has been set that allows communication in at least one direction. |  
| initializing | Game Chat 2 is initializing information about one of the target users regarding privilege, privacy, or reputation. <br/><br/> The effective communication is set to `none` while the adjuster is in this state. |  
| none | Game Chat 2 is applying no extra adjustment to this relationship. <br/><br/> The effective relationship is set to what was specified by the most recent call to [chat_user_local::set_communication_relationship](../classes/chat_user/chat_user_local/methods/chat_user_local_set_communication_relationship.md). |  
| privilege | Game Chat 2 is restricting communication due to the local user's communication privilege, which the local user might be able to resolve with UI. <br/><br/> The [game_chat_communication_relationship_flags::send_microphone_audio](game_chat_communication_relationship_flags.md), [game_chat_communication_relationship_flags::send_text_to_speech_audio](game_chat_communication_relationship_flags.md), and [game_chat_communication_relationship_flags::send_text](game_chat_communication_relationship_flags.md) relationship flags are set to false from the relationship while this adjuster is applied. The app can call the [XUserResolvePrivilegeWithUiAsync](../../../system/xuser/functions/xuserresolveprivilegewithuiasync.md) method, specifying the [XUserPrivilegeOptions::None](../../../system/xuser/enums/xuserprivilegeoptions.md) constant in the `options` parameter and the [XUserPrivilege::Communications](../../../system/xuser/enums/xuserprivilege.md) constant in the `privilege` parameter, to attempt to resolve the issue. The user may be unable or unwilling to resolve the issue. If the user does resolve the issue, the resoluton takes effect the next time the user is added to Game Chat 2. |  
| privacy | Game Chat 2 is restricting communication due to the local user's privacy settings in relation to the remote user. <br/><br/> The [game_chat_communication_relationship_flags::receive_audio](game_chat_communication_relationship_flags.md) and [game_chat_communication_relationship_flags::receive_text](game_chat_communication_relationship_flags.md) relationship flags are set to false from the relationship while this adjuster is applied. In addition, the [game_chat_communication_relationship_flags::send_microphone_audio](game_chat_communication_relationship_flags.md), [game_chat_communication_relationship_flags::send_text_to_speech_audio](game_chat_communication_relationship_flags.md), and [game_chat_communication_relationship_flags::send_text](game_chat_communication_relationship_flags.md) relationship flags might be set to false based on the nature of the privacy restriction. |  
| reputation | Game Chat 2 is restricting communication because the user has an "Avoid Me" reputation designated by the Xbox Live service. <br/><br/> The [game_chat_communication_relationship_flags::receive_audio](game_chat_communication_relationship_flags.md) and [game_chat_communication_relationship_flags::receive_text](game_chat_communication_relationship_flags.md) relationship flags are set to false from the relationship while this adjuster is applied. |  
| conflict_with_other_user | The user is on a shared device, such as Kinect, and the relationship has been modified due to the other user's relationship settings. <br/><br/> The conflict is resolved based on the settings specified in the [chat_manager::initialize](../classes/chat_manager/methods/chat_manager_initialize.md) method. |  
| privilege_check_failure | Game Chat 2 is restricting communication due to a failure to retrieve the user's privileges. <br/><br/> The [game_chat_communication_relationship_flags::send_microphone_audio](game_chat_communication_relationship_flags.md), [game_chat_communication_relationship_flags::send_text_to_speech_audio](game_chat_communication_relationship_flags.md) and [game_chat_communication_relationship_flags::send_text](game_chat_communication_relationship_flags.md) relationship flags are set to false from the relationship while this adjuster is applied. |  
| resolve_user_issue | Game Chat 2 is restricting communication due to a failure to retrieve the user's privileges, which the user might be able to resolve with UI. <br/><br/> The [game_chat_communication_relationship_flags::send_microphone_audio](game_chat_communication_relationship_flags.md), [game_chat_communication_relationship_flags::send_text_to_speech_audio](game_chat_communication_relationship_flags.md), and [game_chat_communication_relationship_flags::send_text](game_chat_communication_relationship_flags.md) relationship flags are set to false from the relationship while this adjuster is applied. The app can call [XUserResolveIssueWithUiAsync](../../../system/xuser/functions/xuserresolveissuewithuiasync.md), specifying `nullptr` for the `url` parameter, to attempt to resolve the issue. The user may be unable or unwilling to resolve the issue. If the user does resolve the issue, the resoluton takes effect the next time the user is added to Game Chat 2. |  
| service_unavailable | Game Chat 2 is restricting communication because Xbox Live is temporarily unavailable and user communication settings couldn't be retrieved. |  
  
<a id="remarksSection"></a>
  
## Remarks
  
This enumeration describes the extra adjustment steps, if any, applied by Game Chat 2 to a communication relationship that was previously set by calling [chat_user_local::set_communication_relationship](../classes/chat_user/chat_user_local/methods/chat_user_local_set_communication_relationship.md). You can call [chat_user_local::get_effective_communication_relationship](../classes/chat_user/chat_user_local/methods/chat_user_local_get_effective_communication_relationship.md) to discover the relationship flags and relationship adjuster, if any, applied by Game Chat 2 to the existing relationship. The adjusters described in this enumeration are listed in order of precedence; in other words, if a particular relationship is affected by both privilege restrictions (on the local user) and privacy restrictions (on the remote user), invoking `chat_user_local::get_effective_communication_relationship` returns `privilege` in the `communicationRelationshipAdjuster` parameter. For more information about communication relationships, see [Using the Game Chat 2 C++ API](../../../../chat/overviews/game-chat2/using-game-chat-2.md).  
  
<a id="requirementsSection"></a>
  
## Requirements
  
**Header:** GameChat2.h  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
<a id="seealsoSection"></a>
  
## See also
  
[Intro to Game Chat 2](../../../../chat/overviews/game-chat2/game-chat-2-intro.md)  
[GameChat2 members](../gamechat2_members.md)  
  