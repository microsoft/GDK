---
title: Multiplayer FAQ and troubleshooting
description: Provides FAQs and troubleshooting for the Multiplayer system.
kindex: Multiplayer FAQ and troubleshooting
author: joannaleecy
ms.author: migreen
ms.topic: conceptual
ms.assetid: 75823f10-b342-4e20-b885-e5ad4392bc3d
ms.localizationpriority: medium
ms.date: 04/04/2017
edited: 02/20/2021
security: public
---

# Multiplayer FAQ and troubleshooting

### How can I access the new Multiplayer API from a service?

For more information, see the section [Calling MPSD](../mpsd/live-mpsd-overview.md#calling-mpsd) in the topic "Multiplayer Session Directory overview."

### Can my title subscribe to changes for more than one session?

Yes, a title can subscribe to receive changes on a maximum of 10 sessions per connection.

### Will a player be removed immediately if a network connection is lost or the player turns off the console?

The web socket connection enables Multiplayer Session Directory (MPSD) to rapidly detect client disconnection and set the client to Inactive. Session members are removed as soon as the time-out for Inactive removal expires. For more information, see the section [Session timeouts](../mpsd/concepts/live-mpsd-details.md#session-timeouts) in the topic "Multiplayer Session advanced topics."

### How do I determine what service configuration ID (SCID), session template, and sandbox to use?

If you weren't involved in the initial registration of your title, which is when this information was created, you don't have direct access to this information. Contact your developer account manager (DAM), who can get this data for you.

### Do you have an example of a request body that I can compare to the one for my title?

See the request structure in [MultiplayerSessionRequest (JSON)](/ gaming/xbox-live/api-ref/xbox-live-rest/json/json-multiplayersessionrequest).

### What should I do if I get an HTTP 403 status code when calling MPSD?

This is usually a permissions or scope issue. Collect Fiddler traces to get more information, and then check the messages returned as part of the `HttpResponse` body for common 403 messages.

- "The requested service configuration cannot be accessed."
   - Confirm that you're using an account that has access to the sandbox.
   - Confirm that you're in the correct sandbox.
   - If you're using certificate authentication and getting this error, contact your DAM.
- "The requested session cannot be accessed. The calling user must have multiplayer privilege, and private sessions can only be read by session members."
   - You don't have the ability to see the session, possibly because you're trying to access a session that has a visibility of Private. If the visibility is set to Private, only members of that session can read the session document.   > [!NOTE]
   > A player must have an Xbox Live Gold account to register a new session. Without Gold account privileges, requests to register a new session return HTTP 403.
- "The request body can't contain existing member references unless the authentication principal includes a server."
   - You can't join another player to a session on behalf of that player. You can only invite. To invite a player, set the index to `reserve_<number>`.

### What should I do if I get an HTTP 404 status code when calling MPSD?

Collect Fiddler traces to get more information, and then do the following steps.

1. Check the message returned as part of the `HttpResponse` body for common 404 messages, such as the following.
   - "The requested service config is either invalid or not configured for sessions." Ensure that you're using the correct SCID.
   - "The requested session wasn't found." Ensure that the session is created and that the session template is correct before retrieving it. You can create a session with a `PUT` call.
1. Check the URI you're using.
1. Restart the console, or log in as a different player.
1. Check the Game Developer Forums for the error code or other solutions.
1. Confirm that the session wasn't deleted because it was empty. Sessions can become empty because players time out. When this happens, it's frequently because all session members are in a state to which a time-out is applied, such as Ready or Inactive. For more information, see the section [Session user states](../mpsd/concepts/live-mpsd-details.md#session-user-states) in the topic "Multiplayer Session advanced topics."

### Why am I getting an HTTP 404 status code when calling [XblMultiplayerWriteSessionByHandleAsync](../../../../reference/live/xsapi-c/multiplayer_c/functions/xblmultiplayerwritesessionbyhandleasync.md) or [XblMultiplayerGetSessionByHandleAsync](../../../../reference/live/xsapi-c/multiplayer_c/functions/xblmultiplayergetsessionbyhandleasync.md)?

If your title uses a handle to access an MPSD session in response to a join protocol activation that contains a handle ID, the handle ID in the protocol activation might be stale for one of the following reasons.

- The UI view in the Xbox shell from which the title initiated the join might be out of date. Some UI views, such as the player's profile card, don't automatically refresh join handles while they're open. To avoid receiving the HTTP 404 status code, the title should close and reopen the view to refresh the data before joining.
- The player that the title is joining might have switched activity sessions after the title selected the join operation from the Xbox shell UI. This reason is rare.

In either of these cases, your title code should show the joining player an error message indicating that the join failed.

### Why am I getting an HTTP 412 status code when calling MPSD?

The following request returns HTTP 412 if the session already exists.

```uri
PUT /serviceconfigs/00000000-0000-0000-0000-000000000000/sessiontemplates/quick/sessions/foo HTTP/1.1
Content-Type: application/json
If-None-Match: *
```

The following request returns HTTP 412 if the session ETag doesn't match the `If-Match` header.

```uri
PUT /serviceconfigs/00000000-0000-0000-0000-000000000000/sessiontemplates/quick/sessions/foo HTTP/1.1
Content-Type: application/json
If-Match: 9555A7DE-8B91-40E4-8CFB-0629312C9C7D
```

For more information, see the section [Synchronization of session updates](../mpsd/live-mpsd-overview.md#synchronization-of-session-updates) in the topic "Multiplayer Session Directory overview."


### Why am I getting an HTTP 400, 405, 409, 503, or similar status code when calling MPSD?

Collect Fiddler traces to get more information, and then check messages returned as part of the `HttpResponse` body. With this information, you should be able to identify and fix the error. If not, search the developer forums for solutions.

You can also get the response body if you're using Xbox Services API (XSAPI), as described in [Troubleshooting Xbox Live services APIs](../../../test-release/troubleshooting/live-troubleshooting-apis.md). Alternatively, your code can use [HCTraceSetClientCallback](../../../../reference/live/httpclient/trace/functions/hctracesetclientcallback.md) to send output to your title UI.

### What can or should I change in the session templates for my title?

Session templates are patterns for your sessions, and you can't override the constants already set in the templates. However, you can add new properties to the templates. For more information, see [Multiplayer session templates](../mpsd/concepts/live-session-templates.md) and [Multiplayer Session Directory overview](../mpsd/live-mpsd-overview.md).

### Why am I getting an error that says my session isn't initialized?

The following is an example of the error message you might receive.

`400 - \[ResponseBody\]: This session is configured for managed initialization requiring at least 2 members to start.`

The session can't be created because not enough session member reservations with the `initialize` field set to `true` are included in the request. Your code can set this field for a member by using the `initializeRequested` parameter of [XblMultiplayerSessionAddMemberReservation](../../../../reference/live/xsapi-c/multiplayer_c/functions/xblmultiplayersessionaddmemberreservation.md) or [XblMultiplayerSessionJoin](../../../../reference/live/xsapi-c/multiplayer_c/functions/xblmultiplayersessionjoin.md).

When initialization is specified in your session template, ensure that `"initialize": true` is set for enough of the member reservations to pass matchmaking Quality of Service (QoS) requirements. For more information, see [Target session initialization and QoS](../matchmaking/concepts/live-matchmaking-target-session.md).

### Why is my session not being created when I get an HTTP 204 status code?

This status code indicates that no players were added to the session when you created it. If no players are in the session when it's created and the session-empty time-out is zero (default), the session isn't created.

Ensure that you include at least one player when creating a session. For dedicated server scenarios, obtain a player who's trying to create a match or who needs to create a match and make that player the initial player in the match. Alternatively, you can change or remove the session-empty time-out. For more information, see the section [Session timeouts](../mpsd/concepts/live-mpsd-details.md#session-timeouts) in the topic "Multiplayer Session advanced topics."

### When should I poll MPSD?

Your titles must avoid polling MPSD. If a title must discover changes to MPSD sessions, it should subscribe for session change events. For more information, see the section [Subscribe for MPSD session change notifications](../mpsd/how-to/live-mpsd-how-tos.md#sfmscn) in the topic "Multiplayer tasks."

### Can I use XblMultiplayerQuerySessionsAsync to implement session browse or matchmaking?

The [XblMultiplayerQuerySessionsAsync](../../../../reference/live/xsapi-c/multiplayer_c/functions/xblmultiplayerquerysessionsasync.md) method is intended for infrequent calls to help with debugging. Because of service limitations, the session results from this API aren't real time and might be incomplete when called more frequently.

To implement session browse functionality, see the section "Search handles" in [Multiplayer session browse](live-session-browse.md). To implement matchmaking, see [Using SmartMatch matchmaking](../matchmaking/concepts/live-matchmaking-how-tos.md).

### What happens if a player who was reserved or invited to a session doesn't join it?

It depends on whether the title is running when the player is notified that the game session is ready.

If the player is in the title and doesn't accept the game session notification from the title UI, the title has the responsibility to remove the player from the game session by using the [XblMultiplayerSessionLeave](../../../../reference/live/xsapi-c/multiplayer_c/functions/xblmultiplayersessionleave.md) method.

If the title is constrained or not running, the shell provides a notification that informs the player that a slot is available. If the player declines or ignores the system notification, MPSD removes that player from the game session.

### Why would a created session not be found by matchmaking?

On Xbox One, simply creating a session isn't enough for matchmaking to find the new session. You must create a match ticket to start advertising the session to the matchmaking service. For more information, see [Matchmaking overview](../matchmaking/live-matchmaking-overview.md).

### If a game session has open player slots and supports join-in-progress, why would players not be able to find the session after it started?

When a game session starts, it's no longer advertised on the matchmaking service. If player slots become available within the session and the arbiter (host) wants to attract new players, the arbiter must create a new match ticket for the in-progress session by calling the [XblMatchmakingCreateMatchTicketAsync](../../../../reference/live/xsapi-c/matchmaking_c/functions/xblmatchmakingcreatematchticketasync.md) method. The ticket advertises the session again and finds more players. For more information, see [Matchmaking overview](../matchmaking/live-matchmaking-overview.md).

### If a game session is open, can a player who has just joined a game simply join the session and start playing without waiting for the reservation?

Yes. This is especially useful when your title uses multiple sessions to track subgroups of players within a game session. The joining player might join the session that represents the player's group and then need to join the larger game session.

### When large game sessions are playing in my title, why aren't all session members seeing the game invite notification?

When your title adds a player to the session through joining, the title always sets the `InitializeRequested` member of [XblMultiplayerSessionMember](../../../../reference/live/xsapi-c/multiplayer_c/structs/xblmultiplayersessionmember.md) to `true`. This tells MPSD to wait for the rest of the session members before moving the game out of the initialization stage. Otherwise, players have a very short time in which to join and can miss notifications of session changes.