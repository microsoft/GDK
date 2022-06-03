---
title: Multiplayer Session Directory overview
description: Describes how a title can share information to connect users in a multiplayer session by using Multiplayer Session Directory (MPSD).
kindex:
- Multiplayer Session Directory overview
- mpsd
ms.topic: conceptual
ms.assetid: a9b029ea-4cc1-485a-8253-e1c74184f35e
ms.localizationpriority: medium
author: joannaleecy
ms.author: migreen
ms.date: 04/04/2017
edited: 00/00/0000
security: public
---

<a id="top"></a>

# Multiplayer Session Directory overview

This topic describes how the Multiplayer Session Directory (MPSD) service enables titles to share the basic information that's needed to connect a group of users.

MPSD coordinates with the shell and console operating system when invites are sent and accepted, and when users are joined via a gamercard.

MPSD centralizes a game's multiplayer system metadata across multiple clients.
MPSD ensures that session functionality is synchronized and consistent.

MPSD is a service that operates in the Xbox Live cloud.
It's wrapped by the `XblMultiplayer` functions.

This topic covers the following:
* [MPSD sessions](#mpsd-sessions)
* [MPSD change notification handling and disconnect detection](#mpsd-change-notification-handling-and-disconnect-detection)
* [MPSD handles to sessions](#mpsd-handles-to-sessions)
* [Synchronization of session updates](#synchronization-of-session-updates)
* [Call MPSD](#calling-mpsd)
* [Multiplayer Session Explorer](#multiplayer-session-explorer)

<a id="mpsd-sessions"></a>

## MPSD sessions

An MPSD session is identified by its `XblMultiplayerSessionHandle` and represents a scenario in which one or more users play a game.
A session is stored by MPSD as a secure JSON document in the Xbox Live cloud.

Specifically, an MPSD session has the following characteristics.
-   It's created and managed by titles.
-   It has a unique URI. For more information, see [Session Directory URIs](/en-us/gaming/xbox-live/api-ref/xbox-live-rest/uri/sessiondirectory/atoc-reference-sessiondirectory).
-   It enables connectivity among users, called session members.
-   It stores data that enables gameplay, like per-member attributes, game settings, bootstrapping information, and game server information.

Every session contains players' Xbox user identifiers (XUIDs) and secure device association address data.

MPSD supports several kinds of sessions for setting up various kinds of multiplayer games, including the following variations.

| Session variation | Description |
|---|---|
| Game session | The pattern for gameplay. A game session can be peer-to-peer, peer-to-host, peer-to-server, or a hybrid of these types. |
| Ticket session | A helper session that's used to track the state of a match during matchmaking. It's often also a lobby session and can sometimes be a game session. For more information, see [Matchmaking overview](../matchmaking/live-matchmaking-overview.md). |
|Target session | A helper session that was created during matchmaking to represent the matched gameplay. It's almost always also a game session. For more information, see [Matchmaking overview](../matchmaking/live-matchmaking-overview.md). |
| Lobby session | A helper session that was used to accommodate invited players who are waiting to join a game session. Many titles create both a lobby session and a game session. |


 [Return to the top of this topic.](#top)
<a id="mpsd-change-notification-handling-and-disconnect-detection"></a>

## MPSD change notification handling and disconnect detection

Clients connect to MPSD by using the Real-Time Activity (RTA) service web socket.

The connection is used to do the following:
-   Send down brief notifications (shoulder taps) when session changes occur, based on event subscriptions that titles initiate.
-   Detect user disconnections.
-   Set users as inactive and then remove them from the session, based on disconnect detection.

### Make user connections

The Xbox Services API (XSAPI) library manages the connection between the client and MPSD.

1. The title calls [XblMultiplayerSetSubscriptionsEnabled](../../../../reference/live/xsapi-c/multiplayer_c/functions/xblmultiplayersetsubscriptionsenabled.md). This method tells XSAPI that the client intends to use an RTA connection for multiplayer purposes.

2. When the title makes its first call to [XblMultiplayerWriteSessionAsync](../../../../reference/live/xsapi-c/multiplayer_c/functions/xblmultiplayerwritesessionasync.md) or [XblMultiplayerWriteSessionByHandleAsync](../../../../reference/live/xsapi-c/multiplayer_c/functions/xblmultiplayerwritesessionbyhandleasync.md), with the current user set to the Active state, a connection is created and hooked up to MPSD.
> [!NOTE]
> To enable session notifications and detect disconnections, the session template must set `connectionRequiredForActiveMembers` to `true`.

### Subscribe for session changes

MPSD uses a shoulder tap as a lightweight notification that something of interest has changed.
When subscriptions are enabled, the title can subscribe for shoulder taps on session changes with a call to [XblMultiplayerSessionSetSessionChangeSubscription](../../../../reference/live/xsapi-c/multiplayer_c/functions/xblmultiplayersessionsetsessionchangesubscription.md).

For more information, see the [Subscribe for MPSD session change notifications](how-to/live-mpsd-how-tos.md#sfmscn) section in the Multiplayer tasks topic.

### Handle shoulder taps

When a change to a session matches the title's subscription for that session, MPSD notifies the title of the change by using the [XblMultiplayerSessionChangedHandler](../../../../reference/live/xsapi-c/multiplayer_c/functions/xblmultiplayersessionchangedhandler.md) handler.
The title should then retrieve the session and compare the retrieved version of the session with the previous cached view and take the appropriate action.

### Handle notifications of connection state changes

The title can be notified about changes in the health of the connection to MPSD.

Two events signal these changes.
-   [XblMultiplayerSessionSubscriptionLostHandler](../../../../reference/live/xsapi-c/multiplayer_c/functions/xblmultiplayersessionsubscriptionlosthandler.md) handler&mdash;fired when the title's connection to MPSD by using the RTA service is lost. When this event occurs, the title should shut down multiplayer.
-   [XblRealTimeActivityConnectionStateChangeHandler](../../../../reference/live/xsapi-c/real_time_activity_c/functions/xblrealtimeactivityconnectionstatechangehandler.md) handler&mdash;fired upon a temporary change in the health of the title's connection to the RTA service. The title isn't required to take any action upon receiving this event, but the event might be useful for diagnostic purposes.

### Disconnect clients

Clients for your title disconnect from MPSD when the title disables notifications with a call to [XblMultiplayerSetSubscriptionsEnabled](../../../../reference/live/xsapi-c/multiplayer_c/functions/xblmultiplayersetsubscriptionsenabled.md).
Shortly after this call, the [XblMultiplayerSessionSubscriptionLostHandler](../../../../reference/live/xsapi-c/multiplayer_c/functions/xblmultiplayersessionsubscriptionlosthandler.md) handler fires, indicating that a client has disconnected from MPSD.
> [!NOTE]
> In earlier multiplayer versions, titles called `XblRealTimeActivityDeactivate` to disconnect from the RTA service.
> For the 2015 Multiplayer service, this method has no effect.
> The disconnection occurs automatically after [XblMultiplayerSetSubscriptionsEnabled](../../../../reference/live/xsapi-c/multiplayer_c/functions/xblmultiplayersetsubscriptionsenabled.md) is called with a `false` value and if there are no users of the web socket connection, like an RTA service subscription to the Presence service.

### Disconnect detection

MPSD uses its disconnect detection feature to quickly find out when a user disconnects ungracefully.
Causes of an ungraceful disconnect include when a player's network fails or when a title crashes.

MPSD changes the disconnected player's state from Active to Inactive and notifies other session members of the change as appropriate, based on the members' subscriptions to the session.

#### Handle RTA reconnects

XSAPI attempts to reconnect to RTA on disconnects and resubmit RTA subscriptions. (For more information, see [Best Practices for the RTA service](../../general/rta/concepts/live-rta-best-practices.md).) Resubmitting the multiplayer RTA subscription updates the connection ID that's used to associate a user in an MPSD session with a client RTA connection.

XSAPI notifies the title that the MPSD connection ID has changed via [XblMultiplayerAddConnectionIdChangedHandler](../../../../reference/live/xsapi-c/multiplayer_c/functions/xblmultiplayeraddconnectionidchangedhandler.md). Inside the callback, the title must write the new connection ID to the MPSD session. The new connection ID can be written to the session by calling [XblMultiplayerSessionCurrentUserSetStatus](../../../../reference/live/xsapi-c/multiplayer_c/functions/xblmultiplayersessioncurrentusersetstatus.md) and then writing to the session by calling [XblMultiplayerWriteSessionAsync](../../../../reference/live/xsapi-c/multiplayer_c/functions/xblmultiplayerwritesessionasync.md). 

 
```cpp
void* context{ nullptr };
XblFunctionContext connectionIdChangedFunctionContext = XblMultiplayerAddConnectionIdChangedHandler(
    xblContextHandle,
    [](void* context) {
        XblMultiplayerSessionHandle sessionHandle; // Retrieve the MPSD session to update
        XblMultiplayerSessionCurrentUserSetStatus(sessionHandle, XblMultiplayerSessionMemberStatus::Active);

        auto asyncBlock = std::make_unique<XAsyncBlock>();
        asyncBlock->queue = queue;
        asyncBlock->context = nullptr;
        asyncBlock->callback = [](XAsyncBlock* asyncBlock)
        {
            std::unique_ptr<XAsyncBlock> asyncBlockPtr{ asyncBlock };

            XblMultiplayerSessionHandle sessionHandle;
            HRESULT hr = XblMultiplayerWriteSessionResult(asyncBlock, &sessionHandle);
            if (SUCCEEDED(hr))
            {
                // If the write call succeeds, the connection ID has been updated and no further action is needed.
            }
            else
            {
                // If the write call fails, it's likely that the user has been removed from the session.
            }
        };

        auto hr = XblMultiplayerWriteSessionAsync(xblContextHandle, sessionHandle, XblMultiplayerSessionWriteMode::UpdateExisting, asyncBlock.get());
        if (SUCCEEDED(hr))
        {
            asyncBlock.release();
        }
    }, 
    context);
```

 [Return to the top of this topic.](#top)

<a id="mpsd-handles-to-sessions"></a>

## MPSD handles to sessions

An MPSD session handle is an abstract and immutable reference to a session that can also contain additional typed data.
It's similar to a file handle.
All handles have a handle ID (GUID) and a full session reference that consists of a service configuration ID (SCID), session template, and session name.
A handle can't be updated, but it can be created, read, and deleted.
> [!NOTE]
> A handle can point to a session that doesn't exist.
> Creating a handle by using a nonexistent session name doesn't cause a new session to be created.

### Handle Types

2015 Multiplayer supports invite handles and activity handles.

#### Invite handles

An invite handle represents an invitation (invite) to a specific user.
Type-specific data includes source user, target user, and context string describing the invite; for example, a specific game mode.

An invite handle grants read-write access to an open session.
If the session is closed, the handle grants read-only session access.
> [!NOTE]
> MPSD can create an invite&mdash;even if the session is full or closed.



### Create an invite handle

To create an invite handle, the title calls [XblMultiplayerSendInvitesAsync](../../../../reference/live/xsapi-c/multiplayer_c/functions/xblmultiplayersendinvitesasync.md).
This method sends an invite to the specified users in a notification that the recipients can act on to accept the invite.

### Create an activity handle

To create an activity handle, the title calls [XblMultiplayerSetActivityAsync](../../../../reference/live/xsapi-c/multiplayer_c/functions/xblmultiplayersetactivityasync.md).
MPSD sets the new handle ID as the session member's bound activity.

If there was a previous bound activity, MPSD deletes the corresponding handle.
When the active member becomes inactive or leaves the session, MPSD deletes the bound activity handle.

### Use handles

The title uses handles when a user accepts an invite (invite handle) and when a user joins a friend's current activity (activity handle).

In both of these cases, the title must take the following actions.
1.  Get the handle ID from the title activation parameters.
2.  Create a local MPSD session object, and then join it as active.
3.  Write the session, passing in the appropriate handle.

 [Return to the top of this topic.](#top)
<a id="synchronization-of-session-updates"></a>

## Synchronization of session updates

A session is a shared resource that can be created or updated by any of its members. As a result, conflicting writes can occur.
This can lead to unexpected outcomes if, for example, one title overwrites the changes made by another title.
The MPSD approach to resolving these conflicts is to support optimistic concurrency and a read-modify-write pattern.

Synchronization of session updates by MPSD use two related, high-level implementation patterns.

* An arbiter updates shared portions of the session. If your implementation involves a single arbiter, you can avoid using synchronized updates for most write operations. The title can avoid synchronization for the following cases.
    * Any update that the arbiter makes to shared portions of the session, unless they're related to communicating the arbiter's identity
    * Any update that a title makes to the member area within the session
    > [!NOTE]
    > Although the previously mentioned update types don't need synchronization, it's still important to synchronize any updates to the [XblMultiplayerSessionProperties](../../../../reference/live/xsapi-c/multiplayer_c/structs/xblmultiplayersessionproperties.md)`::HostDeviceToken` property.
    > This property is used to communicate the identity of the arbiter, for example, as part of arbiter migration.

* All clients update shared portions of the session. In this case, all updates to shared portions of the session must be synchronized. However, titles can still write to their own member areas without synchronization.

### Update session synchronization by using the Multiplayer API

The following multiplayer API methods implement optimistic concurrency.

-   [XblMultiplayerWriteSessionAsync](../../../../reference/live/xsapi-c/multiplayer_c/functions/xblmultiplayerwritesessionasync.md)
-   [XblMultiplayerWriteSessionByHandleAsync](../../../../reference/live/xsapi-c/multiplayer_c/functions/xblmultiplayerwritesessionbyhandleasync.md)

Each write method accepts a [XblMultiplayerSessionWriteMode](../../../../reference/live/xsapi-c/multiplayer_c/enums/xblmultiplayersessionwritemode.md) value.
Passing the value `SynchronizedUpdate` uses optimistic concurrency for updates.

Other values in the enumeration help resolve potential conflicts upon the initial creation of a session.
Any write to a portion of the MPSD session that can potentially be written to by another title must use a synchronized update.
However, not all writes must be protected.

If your title attempts to write the local session object to MPSD by using one of the write session methods, it might receive an HTTP/412 status code. In this case it should refresh the local copy by issuing a [XblMultiplayerGetSessionAsync](../../../../reference/live/xsapi-c/multiplayer_c/functions/xblmultiplayergetsessionasync.md) call to get the latest server version of the session before attempting the write again.
Otherwise, the local session document continues to contain the bad data and the calls to write the session continue to fail.
> [!NOTE]
> When the title calls one of the write session methods, an updated version of the session might be returned.
> If an updated version of the session is returned, the title should replace its local cached copy with the new version in a thread-safe way.

### Update session synchronization by using the Multiplayer REST API

MPSD supports optimistic concurrency in session updates through REST functionality by using the HTTP "if-match" header with ETag settings and the read-modify-write pattern.
The ETag passed in the write request should be the one that the MPSD returns with the previous read request.

 [Return to the top of this topic.](#top)
<a id="calling-mpsd"></a>

## Call MPSD

The title can access MPSD in the following ways to use the multiplayer system and matchmaking.
-   We recommend that you use the multiplayer API, which contains classes that act as wrappers for RESTful functionality. For more information, see `XblMultiplayer` prefix functions. For SmartMatch matchmaking, use the matchmaking API, represented by the `XblMatchmaking` prefix functions.
-   Use direct standard HTTP calls to the multiplayer and matchmaking REST APIs that are included in the [Xbox Live Services RESTful Reference](/gaming/xbox-live/api-ref/xbox-live-rest/atoc-xboxlivews-reference). The applicable URIs are described in the Session Directory URIs (for multiplayer) and Matchmaking URIs (for matchmaking) sections. Related JSON objects are described in the JavaScript Object Notation (JSON) Object Reference section.

### Use the Multiplayer API to call MPSD

We recommend that you call MPSD by using the multiplayer and matchmaking APIs in XSAPI.
> [!NOTE]
> The examples are written by using the multiplayer and matchmaking APIs and the other elements of XSAPI.

Using wrapper code for the underlying REST functionality enables a more traditional approach to using client-side API methods, without the need to handle HTTP traffic for each call.

### Use the Multiplayer REST API to interact with MPSD

The title, or its service, can use standard HTTP calls to the multiplayer REST API and the matchmaking REST API.
When using REST functionality directly, the caller issues `DELETE`, `PUT`, `POST`, and `GET` calls against the session directory URIs for most actions.
On a `PUT` request, the request body is merged into the existing session.

If there's no existing session, the request body is used to create a new session, along with the session template that's stored on [Partner Center](https://partner.microsoft.com/dashboard).

All fields are optional, and only deltas must be specified.
Therefore, `{}` is a valid `PUT` request with zero deltas.

To perform a hypothetical `PUT` request that returns the result of the merge without affecting the server's official copy of the session, you can append the query-string `?nocommit=true` to the `PUT` request.

The requests and responses for the multiplayer and matchmaking REST API methods are JSON documents.
For a multiplayer session request structure, see [MultiplayerSessionRequest (JSON)]( https://docs.microsoft.com/en-us/gaming/xbox-live/api-ref/xbox-live-rest/json/json-multiplayersessionrequest).

An associated response structure is shown in [MultiplayerSession (JSON)](/gaming/xbox-live/api-ref/xbox-live-rest/json/json-multiplayersession).
The response structure frames the session members as a linked list and fills in other read-only properties of the session and its members.

### Query for sessions and session templates (REST)

Your titles can query for session information at the service configuration and the session template levels.
This section describes queries that use the multiplayer REST API.

#### Query for basic session information

You can set up queries for basic session information by using the session directory and matchmaking URIs.
The result of a query is a JSON array of session references, with some session data included inline.
By default, a query retrieves up to 100 nonprivate sessions.
> [!NOTE]
> Every query must include either a keyword filter, an XUID filter, or both.

#### Query for session templates

To retrieve the list of session templates for the SCID, and the details of a specific session template, use the `GET` method for one of the following URIs.
-   /serviceconfigs/{scid}/sessiontemplates
-   /serviceconfigs/{scid}/sessiontemplates/{sessionTemplateName}

#### Query for session state

To query for session state, use the `GET` method for one of the following URIs.
-   /serviceconfigs/{scid}/sessions
-   /serviceconfigs/{scid}/sessiontemplates/{sessionTemplateName}/sessions

 [Return to the top of this topic.](#top)
<a id="multiplayer-session-explorer"></a>

## Multiplayer Session Explorer

Multiplayer Session Explorer is a tool that's built into MPSD for browsing sessions, session templates, and localization strings.
The tool is intended to be used only for development sandboxes.

### Access Multiplayer Session Explorer
> [!NOTE]
> To use the tool, you must be signed in. Your browsing is limited to sessions that have the signed-in user as a member.

To access Multiplayer Session Explorer, open your browser on your Xbox One (or later) console, press the **View** button, and enter *https://sessiondirectory.xboxlive.com/debug* in the **Address** box.
> [!NOTE]
> You will receive an HTTP/404 status code if you attempt to access the tool in the RETAIL sandbox. For more information about this code, see [Multiplayer session status codes](how-to/live-mpsd-status-codes.md).

### Open the main page

1.  Open the main page of the tool. It displays the security context (signed-in user and sandbox) and a list of SCIDs in the sandbox.

2.  Press the **Menu** button to pin this page to Home so that you don't have to reenter the URI.

#### Display available sessions and templates

1.  Select an SCID in the tool to display a list of sessions in that SCID that include the signed-in user as a member.

2.  On this same page, you can select the SCID and display the session templates and localization strings in the service configuration for the SCID. These items are ingested through [Partner Center](https://partner.microsoft.com/dashboard).

### Display the full contents of a session

In Multiplayer Session Explorer, select a session name to display the full contents of the corresponding session.

The session as shown by MPSD might differ from the response to a standard `GET` method for the session's URI for the following reasons.

-   The GET call might be using an older contract version in the X-Xbl-Contract-Version header. Multiplayer Session Explorer always displays the session by using the most up-to-date contract version.

-   When a session is requested normally via `GET`, transformations and side effects can be triggered, like expired timeouts. Multiplayer Session Explorer displays a snapshot of the session as it's stored, without executing any logic, transformations, or side-effects.

-   The `nextTimer` JSON object field isn't present on MPSD sessions because it's computed at the same time as the side effects.

 [Return to the top of this topic.](#top)
<a id="see-also"></a>

## See also

* The [Session overview](concepts/live-mpsd-details.md#session-overview) section in the Multiplayer Session advanced topics topic
* [Multiplayer session status codes](how-to/live-mpsd-status-codes.md)
* The [Update an MPSD session](how-to/live-mpsd-how-tos.md#update-an-mpsd-session) section in the Multiplayer tasks topic
* The [Join an MPSD session from a title activation](how-to/live-mpsd-how-tos.md#jamsfata) section in the Multiplayer tasks topic
* The [Subscribe for MPSD session change notifications](how-to/live-mpsd-how-tos.md#sfmscn) section in the Multiplayer tasks topic
* [Matchmaking overview](../matchmaking/live-matchmaking-overview.md)

 [Return to the top of this topic.](#top)

