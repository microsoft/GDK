---
author: joannaleecy
title: multiplayer_c (contents)
description: Multiplayer C API
kindex: multiplayer_c
ms.author: migreen
ms.topic: navigation
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# multiplayer_c  



  
## Enumerations  
  
| Enumeration | Description |  
| --- | --- |  
| [XblMatchmakingStatus](enums/xblmatchmakingstatus.md) | Defines values that indicate the status of a matchmaking request for a session. |  
| [XblMultiplayerInitializationStage](enums/xblmultiplayerinitializationstage.md) | Defines values that indicate the initialization stage of a session during managed initialization. |  
| [XblMultiplayerMeasurementFailure](enums/xblmultiplayermeasurementfailure.md) | Defines values that indicate why Quality of Service (QoS) measurement failed during session initialization. |  
| [XblMultiplayerMetrics](enums/xblmultiplayermetrics.md) | Defines values that indicate the type of metric used to measure matchmaking Quality of Service (QoS) for a session. |  
| [XblMultiplayerSessionChangeTypes](enums/xblmultiplayersessionchangetypes.md) | Defines values that indicate change types for a multiplayer session. |  
| [XblMultiplayerSessionMemberStatus](enums/xblmultiplayersessionmemberstatus.md) | Defines values that indicate the status of a member of a session. |  
| [XblMultiplayerSessionRestriction](enums/xblmultiplayersessionrestriction.md) | Defines values that indicate restrictions on the users who can join a session. |  
| [XblMultiplayerSessionStatus](enums/xblmultiplayersessionstatus.md) | Defines values that indicate the current status of a session. |  
| [XblMultiplayerSessionVisibility](enums/xblmultiplayersessionvisibility.md) | Defines values that indicate the visibility or accessibility of a session. |  
| [XblMultiplayerSessionWriteMode](enums/xblmultiplayersessionwritemode.md) | Defines values that indicate the mode used when creating or writing to a multiplayer session. |  
| [XblMutableRoleSettings](enums/xblmutablerolesettings.md) | Defines values that indicate which multiplayer role settings are mutable. |  
| [XblNetworkAddressTranslationSetting](enums/xblnetworkaddresstranslationsetting.md) | Defines values that indicate the current network address translation (NAT) settings for a console connecting to Xbox Live. |  
| [XblTournamentArbitrationState](enums/xbltournamentarbitrationstate.md) | Defines values that indicate the arbitration state of a tournament game. DEPRECATED. This enumeration will be removed in a future release. |  
| [XblTournamentArbitrationStatus](enums/xbltournamentarbitrationstatus.md) | Defines values that indicate the status of a tournament game result. DEPRECATED. This enumeration will be removed in a future release. |  
| [XblTournamentGameResult](enums/xbltournamentgameresult.md) | Defines values that indicate the state of a tournament game. DEPRECATED. This enumeration will be removed in a future release. |  
| [XblTournamentGameResultSource](enums/xbltournamentgameresultsource.md) | Defines values that indicate the source for a tournament game state. DEPRECATED. This enumeration will be removed in a future release. |  
| [XblTournamentRegistrationReason](enums/xbltournamentregistrationreason.md) | Defines values that indicate reasons why the team is under selected tournament registration state. DEPRECATED. It will be removed in a future release |  
| [XblTournamentRegistrationState](enums/xbltournamentregistrationstate.md) | Defines values that indicate the team session registration state for a tournament. DEPRECATED. This enumeration will be removed in a future release. |  
| [XblWriteSessionStatus](enums/xblwritesessionstatus.md) | Defines values that indicate the write status of a multiplayer session. |  
  
## Functions  
  
| Function | Description |  
| --- | --- |  
| [XblFormatSecureDeviceAddress](functions/xblformatsecuredeviceaddress.md) | Formats a secure device address given a unique device id for platforms that don't support SDAs. |  
| [XblMultiplayerAddConnectionIdChangedHandler](functions/xblmultiplayeraddconnectionidchangedhandler.md) | Registers an event handler for notifications when the multiplayer connection id changes. Use the returned XblFunctionContext to unregister the handler. |  
| [XblMultiplayerAddSessionChangedHandler](functions/xblmultiplayeraddsessionchangedhandler.md) | Registers an event handler for notifications when a multiplayer session changes. If the RTA subscription has not been explicitly enabled with [XblMultiplayerSetSubscriptionsEnabled](functions/xblmultiplayersetsubscriptionsenabled.md), adding session changed handlers will enable it automatically. Use the returned XblFunctionContext to unregister the handler. |  
| [XblMultiplayerAddSubscriptionLostHandler](functions/xblmultiplayeraddsubscriptionlosthandler.md) | Registers an event handler for notifications when a multiplayer subscription is lost. Use the returned XblFunctionContext to unregister the handler. |  
| [XblMultiplayerClearActivityAsync](functions/xblmultiplayerclearactivityasync.md) | Clears the user's current activity session for the specified serviceConfigurationId. |  
| [XblMultiplayerConnectionIdChangedHandler](functions/xblmultiplayerconnectionidchangedhandler.md) | A callback method to be called when the multiplayer connection id changes. |  
| [XblMultiplayerCreateSearchHandleAsync](functions/xblmultiplayercreatesearchhandleasync.md) | Create a search handle associated with an existing session. This makes the session queryable. |  
| [XblMultiplayerCreateSearchHandleResult](functions/xblmultiplayercreatesearchhandleresult.md) | Get the result from an XblMultiplayerCreateSearchHandleAsync. |  
| [XblMultiplayerDeleteSearchHandleAsync](functions/xblmultiplayerdeletesearchhandleasync.md) | Delete a search handle from the MPSD service. |  
| [XblMultiplayerGetActivitiesForSocialGroupAsync](functions/xblmultiplayergetactivitiesforsocialgroupasync.md) | DEPRECATED - Call [XblMultiplayerGetActivitiesWithPropertiesForSocialGroupAsync](functions/xblmultiplayergetactivitieswithpropertiesforsocialgroupasync.md), which also populates `CustomSessionProperties` in the result.<br /> Queries for the current activity for a social group of players associated with a particular "owner" player. |  
| [XblMultiplayerGetActivitiesForSocialGroupResult](functions/xblmultiplayergetactivitiesforsocialgroupresult.md) | Gets the result of a call to [XblMultiplayerGetActivitiesForSocialGroupAsync](functions/xblmultiplayergetactivitiesforsocialgroupasync.md). |  
| [XblMultiplayerGetActivitiesForSocialGroupResultCount](functions/xblmultiplayergetactivitiesforsocialgroupresultcount.md) | Gets the number of [XblMultiplayerActivityDetails](structs/xblmultiplayeractivitydetails.md) objects returned. |  
| [XblMultiplayerGetActivitiesForUsersAsync](functions/xblmultiplayergetactivitiesforusersasync.md) | DEPRECATED - Call [XblMultiplayerGetActivitiesWithPropertiesForUsersAsync](functions/xblmultiplayergetactivitieswithpropertiesforusersasync.md), which also populates `CustomSessionProperties` in the result.<br /> Queries for the current activity for a set of players specified by Xbox user ID. |  
| [XblMultiplayerGetActivitiesForUsersResult](functions/xblmultiplayergetactivitiesforusersresult.md) | Gets the result of a call to [XblMultiplayerGetActivitiesForUsersAsync](functions/xblmultiplayergetactivitiesforusersasync.md). |  
| [XblMultiplayerGetActivitiesForUsersResultCount](functions/xblmultiplayergetactivitiesforusersresultcount.md) | Gets the number of [XblMultiplayerActivityDetails](structs/xblmultiplayeractivitydetails.md) objects returned. |  
| [XblMultiplayerGetActivitiesWithPropertiesForSocialGroupAsync](functions/xblmultiplayergetactivitieswithpropertiesforsocialgroupasync.md) | Queries for the current activity for a social group of players associated with a particular "owner" player. |  
| [XblMultiplayerGetActivitiesWithPropertiesForSocialGroupResult](functions/xblmultiplayergetactivitieswithpropertiesforsocialgroupresult.md) | Gets the result of a call to [XblMultiplayerGetActivitiesWithPropertiesForSocialGroupAsync](functions/xblmultiplayergetactivitieswithpropertiesforsocialgroupasync.md). |  
| [XblMultiplayerGetActivitiesWithPropertiesForSocialGroupResultSize](functions/xblmultiplayergetactivitieswithpropertiesforsocialgroupresultsize.md) | Gets the size of [XblMultiplayerActivityDetails](structs/xblmultiplayeractivitydetails.md) objects returned. |  
| [XblMultiplayerGetActivitiesWithPropertiesForUsersAsync](functions/xblmultiplayergetactivitieswithpropertiesforusersasync.md) | Queries for the current activity for a set of players specified by Xbox user ID. |  
| [XblMultiplayerGetActivitiesWithPropertiesForUsersResult](functions/xblmultiplayergetactivitieswithpropertiesforusersresult.md) | Gets the result of a call to [XblMultiplayerGetActivitiesWithPropertiesForUsersAsync](functions/xblmultiplayergetactivitieswithpropertiesforusersasync.md). |  
| [XblMultiplayerGetActivitiesWithPropertiesForUsersResultSize](functions/xblmultiplayergetactivitieswithpropertiesforusersresultsize.md) | Gets the size of [XblMultiplayerActivityDetails](structs/xblmultiplayeractivitydetails.md) objects returned. |  
| [XblMultiplayerGetSearchHandlesAsync](functions/xblmultiplayergetsearchhandlesasync.md) | Search for sessions by their associated search handles. |  
| [XblMultiplayerGetSearchHandlesResult](functions/xblmultiplayergetsearchhandlesresult.md) | Get handles to the local search handle objects returned from XblMultiplayerGetSearchHandlesAsync call. |  
| [XblMultiplayerGetSearchHandlesResultCount](functions/xblmultiplayergetsearchhandlesresultcount.md) | Get the number of search handles returned from an XblMultiplayerGetSearchHandlesAsync call. |  
| [XblMultiplayerGetSessionAsync](functions/xblmultiplayergetsessionasync.md) | Gets an existing session object with all its attributes from the server. |  
| [XblMultiplayerGetSessionByHandleAsync](functions/xblmultiplayergetsessionbyhandleasync.md) | Gets a session object with all its attributes from the server, given a session handle id. |  
| [XblMultiplayerGetSessionByHandleResult](functions/xblmultiplayergetsessionbyhandleresult.md) | Gets the result of an XblMultiplayerGetSessionByHandleAsync call. |  
| [XblMultiplayerGetSessionResult](functions/xblmultiplayergetsessionresult.md) | Gets the result of an XblMultiplayerGetSessionResult call. |  
| [XblMultiplayerQuerySessionsAsync](functions/xblmultiplayerquerysessionsasync.md) | Retrieve a list of sessions with various filters. |  
| [XblMultiplayerQuerySessionsResult](functions/xblmultiplayerquerysessionsresult.md) | Gets the results of a session query. |  
| [XblMultiplayerQuerySessionsResultCount](functions/xblmultiplayerquerysessionsresultcount.md) | Gets the number of sessions that matched a session query. |  
| [XblMultiplayerRemoveConnectionIdChangedHandler](functions/xblmultiplayerremoveconnectionidchangedhandler.md) | Unregisters an event handler for multiplayer connection id changed notifications. |  
| [XblMultiplayerRemoveSessionChangedHandler](functions/xblmultiplayerremovesessionchangedhandler.md) | Unregisters an event handler for multiplayer session change notifications. |  
| [XblMultiplayerRemoveSubscriptionLostHandler](functions/xblmultiplayerremovesubscriptionlosthandler.md) | Unregisters an event handler for multiplayer subscription lost notifications. |  
| [XblMultiplayerSearchHandleCloseHandle](functions/xblmultiplayersearchhandleclosehandle.md) | Decrements the reference count to a local search handle details object. |  
| [XblMultiplayerSearchHandleDuplicateHandle](functions/xblmultiplayersearchhandleduplicatehandle.md) | Increments the reference count to a local search handle details object. |  
| [XblMultiplayerSearchHandleGetCreationTime](functions/xblmultiplayersearchhandlegetcreationtime.md) | Get the creation time of the search handle. |  
| [XblMultiplayerSearchHandleGetCustomSessionPropertiesJson](functions/xblmultiplayersearchhandlegetcustomsessionpropertiesjson.md) | Get the custom session properties for the associated session. |  
| [XblMultiplayerSearchHandleGetId](functions/xblmultiplayersearchhandlegetid.md) | Get the Id for the search handle object. |  
| [XblMultiplayerSearchHandleGetJoinRestriction](functions/xblmultiplayersearchhandlegetjoinrestriction.md) | Get join restriction of the session associated with the search handle. |  
| [XblMultiplayerSearchHandleGetMemberCounts](functions/xblmultiplayersearchhandlegetmembercounts.md) | Get the current and max number of members in the associated session. |  
| [XblMultiplayerSearchHandleGetNumberAttributes](functions/xblmultiplayersearchhandlegetnumberattributes.md) | Get a pointer to an array of attributes attached with the search handle. |  
| [XblMultiplayerSearchHandleGetSessionClosed](functions/xblmultiplayersearchhandlegetsessionclosed.md) | Get whether or not the session associated with the search handle is temporaraly closed for joining. |  
| [XblMultiplayerSearchHandleGetSessionOwnerXuids](functions/xblmultiplayersearchhandlegetsessionownerxuids.md) | Get a pointer to an array of Xuids who own the session associated with the search handle. |  
| [XblMultiplayerSearchHandleGetSessionReference](functions/xblmultiplayersearchhandlegetsessionreference.md) | Get the session reference for the session the search handle is associated with. |  
| [XblMultiplayerSearchHandleGetStringAttributes](functions/xblmultiplayersearchhandlegetstringattributes.md) | Get a pointer to an array of attributes attached with the search handle. |  
| [XblMultiplayerSearchHandleGetTags](functions/xblmultiplayersearchhandlegettags.md) | Get a pointer to an array of tags attached with the search handle. |  
| [XblMultiplayerSearchHandleGetVisibility](functions/xblmultiplayersearchhandlegetvisibility.md) | Get visibility of the session associated with the search handle. |  
| [XblMultiplayerSendInvitesAsync](functions/xblmultiplayersendinvitesasync.md) | Invites the specified users to a session. This will result in a notification being shown to each invited user using standard invite text. If a user accepts that notification the title will be activated. |  
| [XblMultiplayerSendInvitesResult](functions/xblmultiplayersendinvitesresult.md) | Invites the specified users to a session. This will result in a notification being shown to each invited user using standard invite text. If a user accepts that notification the title will be activated. |  
| [XblMultiplayerSessionAddMemberReservation](functions/xblmultiplayersessionaddmemberreservation.md) | Add a new member reservation on the session for the specified xuid and member constants. |  
| [XblMultiplayerSessionChangedHandler](functions/xblmultiplayersessionchangedhandler.md) | A callback method to be called when a session changes. |  
| [XblMultiplayerSessionCloseHandle](functions/xblmultiplayersessionclosehandle.md) | Decrements the reference count to a local session object. |  
| [XblMultiplayerSessionCompare](functions/xblmultiplayersessioncompare.md) | Checks the deltas between 2 sessions and returns an Or'ed MultiplayerSessionChangeType. Useful to compare a session object passed to XblMultiplayerWriteSessionAsync with the session object returned. |  
| [XblMultiplayerSessionConstantsSetArbitrationTimeouts](functions/xblmultiplayersessionconstantssetarbitrationtimeouts.md) | Sets the arbitration timeouts for the session. This can only be set when creating a new session. |  
| [XblMultiplayerSessionConstantsSetCapabilities](functions/xblmultiplayersessionconstantssetcapabilities.md) | Sets the capabilities constants for the session. This can only be set when creating a new session. |  
| [XblMultiplayerSessionConstantsSetCloudComputePackageJson](functions/xblmultiplayersessionconstantssetcloudcomputepackagejson.md) | This can only be set when creating a new session. Can only be specified if the 'cloudCompute' capability is set. Enables clients to request that a cloud compute instance be allocated on behalf of the session. |  
| [XblMultiplayerSessionConstantsSetMaxMembersInSession](functions/xblmultiplayersessionconstantssetmaxmembersinsession.md) | Sets the maximum number of members in this session. |  
| [XblMultiplayerSessionConstantsSetMeasurementServerAddressesJson](functions/xblmultiplayersessionconstantssetmeasurementserveraddressesjson.md) | The set of potential server connection strings that should be evaluated. |  
| [XblMultiplayerSessionConstantsSetMemberInitialization](functions/xblmultiplayersessionconstantssetmemberinitialization.md) | If a 'memberInitialization' object is set, the session expects the client system or title to perform initialization following session creation and/or as new members join the session. This can only be set when creating a new session. |  
| [XblMultiplayerSessionConstantsSetPeerToHostRequirements](functions/xblmultiplayersessionconstantssetpeertohostrequirements.md) | These thresholds apply to each connection from a host candidate. This can only be set when creating a new session. |  
| [XblMultiplayerSessionConstantsSetPeerToPeerRequirements](functions/xblmultiplayersessionconstantssetpeertopeerrequirements.md) | These thresholds apply to each pairwise connection for all members in a session. This can only be set when creating a new session. |  
| [XblMultiplayerSessionConstantsSetQosConnectivityMetrics](functions/xblmultiplayersessionconstantssetqosconnectivitymetrics.md) | Enables or disables connectivity metrics for the session. This can only be set when creating a new session. |  
| [XblMultiplayerSessionConstantsSetTimeouts](functions/xblmultiplayersessionconstantssettimeouts.md) | Sets the timeouts for the session. This can only be set when creating a new session. |  
| [XblMultiplayerSessionConstantsSetVisibility](functions/xblmultiplayersessionconstantssetvisibility.md) | Sets the visibility of this session. |  
| [XblMultiplayerSessionCreateHandle](functions/xblmultiplayersessioncreatehandle.md) | Creates a new local multiplayer session. |  
| [XblMultiplayerSessionCurrentUser](functions/xblmultiplayersessioncurrentuser.md) | Returns the current User in the session. |  
| [XblMultiplayerSessionCurrentUserDeleteCustomPropertyJson](functions/xblmultiplayersessioncurrentuserdeletecustompropertyjson.md) | Delete a custom property on the current user. |  
| [XblMultiplayerSessionCurrentUserSetCustomPropertyJson](functions/xblmultiplayersessioncurrentusersetcustompropertyjson.md) | Set a custom property on the current user to the specified JSON string. The member must first be joined to the session. |  
| [XblMultiplayerSessionCurrentUserSetEncounters](functions/xblmultiplayersessioncurrentusersetencounters.md) | Sets a list of group names for the current user indicating which groups that user encountered during a multiplayer session. An encounter is a brief interaction with another group. |  
| [XblMultiplayerSessionCurrentUserSetGroups](functions/xblmultiplayersessioncurrentusersetgroups.md) | Sets a string vector of group names for the current user indicating which groups that user was part of during a multiplayer session. |  
| [XblMultiplayerSessionCurrentUserSetMembersInGroup](functions/xblmultiplayersessioncurrentusersetmembersingroup.md) | Set a collection of members in the group. The member must first be joined to the session. |  
| [XblMultiplayerSessionCurrentUserSetQosMeasurements](functions/xblmultiplayersessioncurrentusersetqosmeasurements.md) | Sets a collection of XblMultiplayerQosMeasurements for the members. This is only useful when the title is manually managing QoS. (If the platform is automatically performing QoS, this does not need to be called) |  
| [XblMultiplayerSessionCurrentUserSetRoles](functions/xblmultiplayersessioncurrentusersetroles.md) | Set the role info of the local member. The member must first be joined to the session. |  
| [XblMultiplayerSessionCurrentUserSetSecureDeviceAddressBase64](functions/xblmultiplayersessioncurrentusersetsecuredeviceaddressbase64.md) | Set the base64 encoded secure device address of the member. The member must first be joined to the session. |  
| [XblMultiplayerSessionCurrentUserSetServerQosMeasurements](functions/xblmultiplayersessioncurrentusersetserverqosmeasurements.md) | Sets measurements JSON for the servers. This is only useful when the title is manually managing QoS. (If the platform is automatically performing QoS, this does not need to be called) |  
| [XblMultiplayerSessionCurrentUserSetStatus](functions/xblmultiplayersessioncurrentusersetstatus.md) | Set the current user to active or inactive. The member must first be joined to the session. |  
| [XblMultiplayerSessionDeleteCustomPropertyJson](functions/xblmultiplayersessiondeletecustompropertyjson.md) | Deletes a session custom property. |  
| [XblMultiplayerSessionDuplicateHandle](functions/xblmultiplayersessionduplicatehandle.md) | Increments the reference count to a local session object. |  
| [XblMultiplayerSessionEtag](functions/xblmultiplayersessionetag.md) | The ETag returned with this session. |  
| [XblMultiplayerSessionGetInfo](functions/xblmultiplayersessiongetinfo.md) | Gets some basic info about the session. Represents the info in the root of the MPSD session document. |  
| [XblMultiplayerSessionGetInitializationInfo](functions/xblmultiplayersessiongetinitializationinfo.md) | Get the info about session initialization. |  
| [XblMultiplayerSessionGetMember](functions/xblmultiplayersessiongetmember.md) | Gets the session member with a specified MemberId. |  
| [XblMultiplayerSessionGetRoleByName](functions/xblmultiplayersessiongetrolebyname.md) | Fetches the XblMultiplayerRole object by role type name and role name. |  
| [XblMultiplayerSessionHostCandidates](functions/xblmultiplayersessionhostcandidates.md) | Host candidates are an ordered list of device tokens, ordered by preference as specified by XblMultiplayerMetrics in the session constants. |  
| [XblMultiplayerSessionJoin](functions/xblmultiplayersessionjoin.md) | Joins the local user to the session, sets the user to active. |  
| [XblMultiplayerSessionLeave](functions/xblmultiplayersessionleave.md) | Call if the user who either created or got the session leaves the session. |  
| [XblMultiplayerSessionMatchmakingServer](functions/xblmultiplayersessionmatchmakingserver.md) | A multiplayer session server that contains properties associated with a target session reference. |  
| [XblMultiplayerSessionMembers](functions/xblmultiplayersessionmembers.md) | Gets the collection of members that are in the session or entering the session together. |  
| [XblMultiplayerSessionMembersAccepted](functions/xblmultiplayersessionmembersaccepted.md) | The number of members that have accepted and are added to the session and are no longer pending. |  
| [XblMultiplayerSessionPropertiesSetJoinRestriction](functions/xblmultiplayersessionpropertiessetjoinrestriction.md) | Restricts who can join "open" sessions. (Has no effect on reservations, which means it has no impact on "private" and "visible" sessions.) |  
| [XblMultiplayerSessionPropertiesSetKeywords](functions/xblmultiplayersessionpropertiessetkeywords.md) | A collection of keywords associated with the session. (Optional, might be empty) |  
| [XblMultiplayerSessionPropertiesSetReadRestriction](functions/xblmultiplayersessionpropertiessetreadrestriction.md) | Restricts who can read "open" sessions. (Has no effect on reservations, which means it has no impact on "private" and "visible" sessions.) |  
| [XblMultiplayerSessionPropertiesSetTurnCollection](functions/xblmultiplayersessionpropertiessetturncollection.md) | Sets the collection of session MemberIds indicating whose turn it is. |  
| [XblMultiplayerSessionRawServersJson](functions/xblmultiplayersessionrawserversjson.md) | A JSON string containing a collection of servers for this multiplayer session. This Json object has the info that is parsed to create the XblMultiplayerArbitrationServer, XblMultiplayerMatchmakingServer, and XblMultiplayerTournamentsServer objects. |  
| [XblMultiplayerSessionReferenceCreate](functions/xblmultiplayersessionreferencecreate.md) | Creates an [XblMultiplayerSessionReference](structs/xblmultiplayersessionreference.md) object from a service configuration ID (SCID), session template name, and session name. |  
| [XblMultiplayerSessionReferenceIsValid](functions/xblmultiplayersessionreferenceisvalid.md) | Verifies whether an [XblMultiplayerSessionReference](structs/xblmultiplayersessionreference.md) object is well formed. |  
| [XblMultiplayerSessionReferenceToUriPath](functions/xblmultiplayersessionreferencetouripath.md) | Returns the URI path representation of a session reference. |  
| [XblMultiplayerSessionReferenceParseFromUriPath](functions/xblmultiplayersessionreferenceparsefromuripath.md) | Returns the session reference parsed from a URI. |  
| [XblMultiplayerSessionRoleTypes](functions/xblmultiplayersessionroletypes.md) | A set of role types associated with this session. |  
| [XblMultiplayerSessionSessionConstants](functions/xblmultiplayersessionsessionconstants.md) | A set of constants associated with this session. These can only be set when creating the session. |  
| [XblMultiplayerSessionSessionProperties](functions/xblmultiplayersessionsessionproperties.md) | Get the properties associated with the session. Any player can modify these properties. |  
| [XblMultiplayerSessionSessionReference](functions/xblmultiplayersessionsessionreference.md) | The uniquely identifying information for the session. |  
| [XblMultiplayerSessionSetAllocateCloudCompute](functions/xblmultiplayersessionsetallocatecloudcompute.md) | If this property is set an allocation of the 'cloudComputePackage' will be attempted. |  
| [XblMultiplayerSessionSetClosed](functions/xblmultiplayersessionsetclosed.md) | If set to true, makes the session "closed", meaning that new users will not be able to join unless they already have a reservation. |  
| [XblMultiplayerSessionSetCustomPropertyJson](functions/xblmultiplayersessionsetcustompropertyjson.md) | Set a session custom property to the specified JSON string. |  
| [XblMultiplayerSessionSetHostDeviceToken](functions/xblmultiplayersessionsethostdevicetoken.md) | Sets the device token of the host. |  
| [XblMultiplayerSessionSetInitializationSucceeded](functions/xblmultiplayersessionsetinitializationsucceeded.md) | This can only be set when creating a new session. |  
| [XblMultiplayerSessionSetLocked](functions/xblmultiplayersessionsetlocked.md) | Sets if a session is locked or not. If locked, members that leave the session will be able to come back into the session, allowing no additional users to take that spot. |  
| [XblMultiplayerSessionSetMatchmakingResubmit](functions/xblmultiplayersessionsetmatchmakingresubmit.md) | Sets if a match needs to be resubmitted or not. |  
| [XblMultiplayerSessionSetMatchmakingServerConnectionPath](functions/xblmultiplayersessionsetmatchmakingserverconnectionpath.md) | Forces a specific server connection string to be used, useful in preserveSession=always cases. |  
| [XblMultiplayerSessionSetMatchmakingTargetSessionConstantsJson](functions/xblmultiplayersessionsetmatchmakingtargetsessionconstantsjson.md) | Sets the properties of the matchmaking. This should only be set by a client acting as a matchmaking service. |  
| [XblMultiplayerSessionSetMutableRoleSettings](functions/xblmultiplayersessionsetmutablerolesettings.md) | Sets the max member count and/or target member counts for a role. |  
| [XblMultiplayerSessionSetRawServersJson](functions/xblmultiplayersessionsetrawserversjson.md) | Sets the JSON string containing a collection of servers for this multiplayer session. |  
| [XblMultiplayerSessionSetServerConnectionStringCandidates](functions/xblmultiplayersessionsetserverconnectionstringcandidates.md) | The ordered list of case-insensitive connection strings that the session could use to connect to a game server. Generally titles should use the first on the list, but sophisticated titles could use a custom mechanism for choosing one of the others (e.g. based on load). |  
| [XblMultiplayerSessionSetSessionChangeSubscription](functions/xblmultiplayersessionsetsessionchangesubscription.md) | Configures the set of session changes that this client will be subscribed to. |  
| [XblMultiplayerSessionSubscribedChangeTypes](functions/xblmultiplayersessionsubscribedchangetypes.md) | Returns an OR'd set of XblMultiplayerSessionChangeTypes values representing the aspects of the session that the current xboxlivecontext is subscribed to, of XblMultiplayerSessionChangeTypes::None if there is none. |  
| [XblMultiplayerSessionSubscriptionLostHandler](functions/xblmultiplayersessionsubscriptionlosthandler.md) | A callback method to be called when a rta subscription is lost. |  
| [XblMultiplayerSessionTimeOfSession](functions/xblmultiplayersessiontimeofsession.md) | The time when the server returned the session. |  
| [XblMultiplayerSessionWriteStatus](functions/xblmultiplayersessionwritestatus.md) | After call XblMultiplayerWriteSessionAsync, the status of the write. |  
| [XblMultiplayerSetActivityAsync](functions/xblmultiplayersetactivityasync.md) | Sets the passed session as the user's current activity, which will be displayed in Xbox dashboard user experiences (e.g. friends and gamercard) as associated with the currently running title. If the session is joinable, it may also be displayed as such in those user experiences. |  
| [XblMultiplayerSetSubscriptionsEnabled](functions/xblmultiplayersetsubscriptionsenabled.md) | Explicitly starts or stops the multiplayer service connectivity via RTA. Enabling the RTA subscription enables: 1. Callbacks when the local Users's sessions change, using the MultiplayerSession object. Handlers are added with [XblMultiplayerAddSessionChangedHandler](functions/xblmultiplayeraddsessionchangedhandler.md). 2. Automatic removal of members from sessions when the RTA connection underlying this multiplayer subscription is broken. |  
| [XblMultiplayerSetTransferHandleAsync](functions/xblmultiplayersettransferhandleasync.md) | The access rights the caller has to the origin session are extended to the target session. |  
| [XblMultiplayerSetTransferHandleResult](functions/xblmultiplayersettransferhandleresult.md) | Gets the result of a XblMultiplayerSetTransferHandleAsync operation. |  
| [XblMultiplayerSubscriptionsEnabled](functions/xblmultiplayersubscriptionsenabled.md) | Indicates whether multiplayer subscriptions are currently enabled. Note that subscriptions can be enabled/disabled explicitly using [XblMultiplayerSetSubscriptionsEnabled](functions/xblmultiplayersetsubscriptionsenabled.md), but they will also be enabled automatically if a session changed handler is added. |  
| [XblMultiplayerWriteSessionAsync](functions/xblmultiplayerwritesessionasync.md) | Writes a new or updated multiplayer session to the service. The session must have a valid session reference. If it was not created with one, use XblMultiplayerWriteSessionByHandleAsync instead. |  
| [XblMultiplayerWriteSessionByHandleAsync](functions/xblmultiplayerwritesessionbyhandleasync.md) | Writes a new or updated multiplayer session to the service, using the specified handle to the session. |  
| [XblMultiplayerWriteSessionByHandleResult](functions/xblmultiplayerwritesessionbyhandleresult.md) | Gets the result of a XblMultiplayerWriteSessionAsync operation. |  
| [XblMultiplayerWriteSessionResult](functions/xblmultiplayerwritesessionresult.md) | Gets the result of a XblMultiplayerWriteSessionAsync operation. |  
  
## Handles  
  
| Handle | Description |  
| --- | --- |  
| [XblMultiplayerSearchHandle](handles/xblmultiplayersearchhandle.md) | A handle to an search details object that is associated with a MPSD sessions. The object has filterable and queryable attributes about the session. |  
| [XblMultiplayerSessionHandle](handles/xblmultiplayersessionhandle.md) | Handle to a local multiplayer session. This handle will be used to query and change the local session object. Anytime the changes made to the local session object will not be reflected in the multiplayer service until a subsequent call to [XblMultiplayerWriteSessionAsync](functions/xblmultiplayerwritesessionasync.md). |  
  
## Structures  
  
| Structure | Description |  
| --- | --- |  
| [XblDeviceToken](structs/xbldevicetoken.md) | Token that represents a unique device participating in the session. It's a case-insensitive string that can be used for equality comparisons. |  
| [XblFormattedSecureDeviceAddress](structs/xblformattedsecuredeviceaddress.md) | A formatted secure device address. |  
| [XblMultiplayerActivityDetails](structs/xblmultiplayeractivitydetails.md) | Represents a users current multiplayer activity, along with some details about the corresponding session. |  
| [XblMultiplayerArbitrationServer](structs/xblmultiplayerarbitrationserver.md) | Represents the arbitration server that supports a multiplayer session. DEPRECATED. This structure will be removed in a future release. |  
| [XblMultiplayerInviteHandle](structs/xblmultiplayerinvitehandle.md) | A handle that corresponds to an outstanding invite that has been sent. |  
| [XblMultiplayerMatchmakingServer](structs/xblmultiplayermatchmakingserver.md) | Represents the matchmaking server that supports a multiplayer session. |  
| [XblMultiplayerMemberInitialization](structs/xblmultiplayermemberinitialization.md) | Represents requirements for a new Multiplayer service session. |  
| [XblMultiplayerPeerToHostRequirements](structs/xblmultiplayerpeertohostrequirements.md) | Represents requirements for each connection between a host candidate and session members. |  
| [XblMultiplayerPeerToPeerRequirements](structs/xblmultiplayerpeertopeerrequirements.md) | Represents requirements for a connection between session members. |  
| [XblMultiplayerRole](structs/xblmultiplayerrole.md) | Represents role info for a multiplayer role. |  
| [XblMultiplayerRoleType](structs/xblmultiplayerroletype.md) | Represents a category of roles for a multiplayer session. |  
| [XblMultiplayerSessionCapabilities](structs/xblmultiplayersessioncapabilities.md) | Represents the capabilities of a Multiplayer service session. |  
| [XblMultiplayerSessionChangeEventArgs](structs/xblmultiplayersessionchangeeventargs.md) | Arguments passed to the event handler when a session change occurs. |  
| [XblMultiplayerSessionConstants](structs/xblmultiplayersessionconstants.md) | Represents constants for a multiplayer session. |  
| [XblMultiplayerSessionHandleId](structs/xblmultiplayersessionhandleid.md) | Represents a handle ID of a multiplayer session. |  
| [XblMultiplayerSessionInfo](structs/xblmultiplayersessioninfo.md) | Basic info about a local multiplayer session. |  
| [XblMultiplayerSessionInitArgs](structs/xblmultiplayersessioninitargs.md) | Optional args when creating a new local multiplayer session. |  
| [XblMultiplayerSessionInitializationInfo](structs/xblmultiplayersessioninitializationinfo.md) | Present during member initialization. |  
| [XblMultiplayerSessionMember](structs/xblmultiplayersessionmember.md) | Represents a read only reference to member in a multiplayer session. |  
| [XblMultiplayerSessionMemberRole](structs/xblmultiplayersessionmemberrole.md) | Represents a session member's role in the session. |  
| [XblMultiplayerSessionNumberAttribute](structs/xblmultiplayersessionnumberattribute.md) | An associative attribute that can be attached to a multiplayer session search handle when it is created. Attribute names be lower-case alphanumeric, and start with a letter. |  
| [XblMultiplayerSessionProperties](structs/xblmultiplayersessionproperties.md) | A set of properties associated with this session. Any player can modify these properties. |  
| [XblMultiplayerSessionQuery](structs/xblmultiplayersessionquery.md) | Queries the visible multiplayer sessions based on the configuration of this request. |  
| [XblMultiplayerSessionQueryResult](structs/xblmultiplayersessionqueryresult.md) | Session information returned from a XblMultiplayerQuerySessionsAsync call. |  
| [XblMultiplayerSessionReference](structs/xblmultiplayersessionreference.md) | Represents a reference to a multiplayer session. |  
| [XblMultiplayerSessionReferenceUri](structs/xblmultiplayersessionreferenceuri.md) | Represents a URI path representation of a session reference. |  
| [XblMultiplayerSessionStringAttribute](structs/xblmultiplayersessionstringattribute.md) | An associative attribute that can be attached to a multiplayer session search handle when it is created. Attribute names be lower-case alphanumeric, and start with a letter. |  
| [XblMultiplayerSessionTag](structs/xblmultiplayersessiontag.md) | A searchable tag that can be attached to a multiplayer session search handle when it is created. Tags must be alphanumeric and start with a letter. They're case-insensitive. |  
| [XblMultiplayerTournamentsServer](structs/xblmultiplayertournamentsserver.md) | Represents the tournament server that supports a multiplayer session. DEPRECATED. This structure will be removed in a future release. |  
| [XblMultiplayerTournamentTeam](structs/xblmultiplayertournamentteam.md) | Represents a team in a tournament. DEPRECATED. This structure will be removed in a future release. |  
| [XblTournamentGameResultWithRank](structs/xbltournamentgameresultwithrank.md) | Represents the result of a multiplayer game. DEPRECATED. This structure will be removed in a future release. |  
| [XblTournamentReference](structs/xbltournamentreference.md) | Represents a reference to a tournament reference. DEPRECATED. This structure will be removed in a future release. |  
| [XblTournamentTeamResult](structs/xbltournamentteamresult.md) | Represents a team result for a multiplayer game. DEPRECATED. This structure will be removed in a future release. |  
