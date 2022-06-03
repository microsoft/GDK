---
title: JavaScript Object Notation (JSON) Object Reference
description: " JavaScript Object Notation (JSON) Object Reference"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# JavaScript Object Notation (JSON) Object Reference
 
JavaScript Object Notation (JSON) is a lightweight, standards-based, object-oriented notation for encapsulating data on the web.
 
Xbox Live Services defines JSON objects that are used in requests to, and responses from, the service. This section provides reference information about each JSON object used with Xbox Live Services.

 
<a id="ID4EHB"></a>
 
## In this section

| Article | Description |
|---------|-------------|
| [Achievement (JSON)](json-achievementv2.md) | An Achievement object (version 2).
| [ActivityRecord (JSON)](json-activityrecord.md) | A formatted and localized string about one or more users' rich presence.
| [ActivityRequest (JSON)](json-activityrequest.md) | A request for information about one or more users' rich presence.
| [AggregateSessionsResponse (JSON)](json-aggregatesessionsresponse.md) | Contains aggregated data for a user's fitness sessions.
| [BatchRequest (JSON)](json-batchrequest.md) | An array of properties with which to filter presence information, such as users, devices, and titles.
| [DeviceEndpoint (JSON)](json-deviceendpoint.md) | The endpoint for a device.
| [DeviceRecord (JSON)](json-devicerecord.md) | Information about a device, including its type and the titles active on it.
| [Feedback (JSON)](json-feedback.md) | Contains feedback information about a player.
| [GameClip (JSON)](json-gameclip.md) | A recording of gameplay.
| [GameClipsServiceErrorResponse (JSON)](json-gameclipsserviceerrorresponse.md) | An optional part of the response to the /users/{ownerId}/scids/{scid}/clips/{gameClipId}/uris/format/{gameClipUriType} API.
| [GameClipThumbnail (JSON)](json-gameclipthumbnail.md) | Contains the information related to an individual thumbnail. There can be multiple sizes per clip, and it is up to the client to select the proper one for display.
| [GameClipUri (JSON)](json-gameclipuri.md) | The URI for a recording of gameplay.
| [GameMessage (JSON)](json-gamemessage.md) | A JSON object defining data for a message in a game session's message queue.
| [GameResult (JSON)](json-gameresult.md) | A JSON object representing data that describes the results of a game session.
| [GameSession (JSON)](json-gamesession.md) | A JSON object representing game data for a multiplayer session.
| [GameSessionSummary (JSON)](json-gamesessionsummary.md) | A JSON object representing summary data for a game session.
| [GetClipResponse (JSON)](json-getclipresponse.md) | Wraps the game clip.
| [HopperStatsResults (JSON)](json-hopperstatsresults.md) | A JSON object representing the statistics for a hopper.
| [InitialUploadRequest (JSON)](json-initialuploadrequest.md) | The body of a POST GameClip upload request.
| [InitialUploadResponse (JSON)](json-initialuploadresponse.md) | The body of a POST GameClip upload response.
| [inventoryItem (JSON)](json-inventoryitem.md) | The core inventory item represents the standard item on which an entitlement can be granted.
| [LastSeenRecord (JSON)](json-lastseenrecord.md) | Information about when the system last saw a user, available when the user has no valid DeviceRecord.
| [MatchTicket (JSON)](json-matchticket.md) | A JSON object representing a match ticket, used by players to locate other players through the multiplayer session directory (MPSD).
| [MediaAsset (JSON)](json-mediaasset.md) | The media assets associated with the achievement or its rewards.
| [MediaRecord (JSON)](json-mediarecord.md) | A record about the media used by the Bing catalog or provider catalog.
| [MediaRequest (JSON)](json-mediarequest.md) | A request for media used by the Bing catalog or provider catalog.
| [MultiplayerActivityDetails (JSON)](json-multiplayeractivitydetails.md) | A JSON object representing the **Microsoft.Xbox.Services.Multiplayer.MultiplayerActivityDetails**.
| [MultiplayerSessionReference (JSON)](json-multiplayersessionreference.md) | A JSON object representing the **MultiplayerSessionReference**. 
| [MultiplayerSessionRequest (JSON)](json-multiplayersessionrequest.md) | The request JSON object passed for an operation on a **MultiplayerSession** object.
| [MultiplayerSession (JSON)](json-multiplayersession.md) | A JSON object representing the **MultiplayerSession**. 
| [PagingInfo (JSON)](json-paginginfo.md) | Contains paging information for results that are returned in pages of data.
| [PeopleList (JSON)](json-peoplelist.md) | Collection of [Person](json-person.md) objects.
| [PermissionCheckBatchRequest (JSON)](json-permissioncheckbatchrequest.md) | Collection of PermissionCheckBatchRequest objects.
| [PermissionCheckBatchResponse (JSON)](json-permissioncheckbatchresponse.md) | The results of a batch permission check for a list of permission values for multiple users.
| [PermissionCheckBatchUserResponse (JSON)](json-permissioncheckbatchuserresponse.md) | The reasons of a batch permission check for list of permission values for a single target user.
| [PermissionCheckResponse (JSON)](json-permissioncheckresponse.md) | The results of a check from a single user for a single permission setting against a single target user.
| [PermissionCheckResult (JSON)](json-permissioncheckresult.md) | The results of a check from a single user for a single permission setting against a single target user.
| [Person (JSON)](json-person.md) | Metadata about a single Person in the People system.
| [PersonSummary (JSON)](json-personsummary.md) | Collection of [Person (JSON)](json-person.md) objects.
| [Player (JSON)](json-player.md) | Contains data for a player in a game session.
| [PresenceRecord (JSON)](json-presencerecord.md) | Data about the online presence of a single user.
| [Profile (JSON)](json-profile.md) | The personal profile settings for a user.
| [Progression (JSON)](json-progression.md) | The user's progression toward unlocking the achievement.
| [Property (JSON)](json-property.md) | Contains property data provided by the client for matchmaking request criteria.
| [QueryClipsResponse (JSON)](json-queryclipsresponse.md) | Wraps the list of return game clips along with paging information for the list.
| [quotaInfo (JSON)](json-quota.md) | Contains quota information about a title group.
| [Requirement (JSON)](json-requirement.md) | The unlock criteria for the Achievement and how far the user is toward meeting them.
| [ResetReputation (JSON)](json-resetreputation.md) | Contains the new base Reputation scores to which a user's existing scores should be changed.
| [Reward (JSON)](json-reward.md) | The reward associated with the achievement.
| [RichPresenceRequest (JSON)](json-richpresencerequest.md) | Request for information about which rich presence information should be used.
| [ServiceError (JSON)](json-serviceerror.md) | Contains information about an error returned when a call to the service failed.
| [ServiceErrorResponse (JSON)](json-serviceerrorresponse.md) | When a service error is encountered, an appropriate HTTP error code will be returned. Optionally, the service may also include a ServiceErrorResponse object as defined below. In production environments, less data may be included.
| [SessionEntry (JSON)](json-sessionentry.md) | Contains data for a fitness session.
| [TitleAssociation (JSON)](json-titleassociation.md) | A title that is associated with the achievement.
| [TitleBlob (JSON)](json-titleblob.md) | Contains information about a title from storage.
| [TitleRecord (JSON)](json-titlerecord.md) | Information about a title, including its name and a last-modified timestamp.
| [TitleRequest (JSON)](json-titlerequest.md) | Request for information about a title.
| [User (JSON)](json-user.md) | Contains user leaderboard data.
| [UserClaims (JSON)](json-userclaims.md) | Returns information about the current authenticated user.
| [UserList (JSON)](json-userlist.md) | A collection of [User](json-user.md) objects.
| [UserSettings (JSON)](json-usersettings.md) | Returns settings for current authenticated user.
| [UserTitle (JSON)](json-usertitlev2.md) | Contains user title data.
| [VerifyStringResult (JSON)](json-verifystringresult.md) | Result codes corresponding to each string submitted to [/system/strings/validate](../uri/stringserver/uri-systemstringsvalidate.md).
| [XuidList (JSON)](json-xuidlist.md) | List of XUIDs on which to perform an operation.


<a id="ID4ENH"></a>
 
## See also

 
<a id="ID4EPH"></a>
 
##### Parent 

[Xbox Live Services RESTful Reference](../atoc-xboxlivews-reference.md)

 
<a id="ID4EZH"></a>
 
##### External links

[ECMA International Standard 262: ECMAScript Language Specification](https://www.ecma-international.org/publications/files/ECMA-ST/ECMA-262.pdf)