---
author: joannaleecy
title: social_manager_c (contents)
description: Social Manager C API
kindex: social_manager_c
ms.author: migreen
ms.topic: navigation
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# social_manager_c  



  
## Enumerations  
  
| Enumeration | Description |  
| --- | --- |  
| [XblPresenceFilter](enums/xblpresencefilter.md) | The filter level of information. Title will only show users associated with a particular title. |  
| [XblRelationshipFilter](enums/xblrelationshipfilter.md) | Possible relationship types to filter by. |  
| [XblSocialManagerEventType](enums/xblsocialmanagereventtype.md) | The types of possible social manager events. |  
| [XblSocialManagerExtraDetailLevel](enums/xblsocialmanagerextradetaillevel.md) | Controls how much information is exposed in each xbox_live_social_graph_user. Detail level can only be set on construction of social_manager. |  
| [XblSocialUserGroupType](enums/xblsocialusergrouptype.md) | Identifies type of social user group created. |  
  
## Functions  
  
| Function | Description |  
| --- | --- |  
| [XblSocialManagerAddLocalUser](functions/xblsocialmanageraddlocaluser.md) | Create a social graph for the specified local user. |  
| [XblSocialManagerCreateSocialUserGroupFromFilters](functions/xblsocialmanagercreatesocialusergroupfromfilters.md) | Constructs a XblSocialManagerUserGroup, which is a collection of users with social information. |  
| [XblSocialManagerCreateSocialUserGroupFromList](functions/xblsocialmanagercreatesocialusergroupfromlist.md) | Constructs a social XblSocialManagerUserGroup, which is a collection of users with social information. |  
| [XblSocialManagerDestroySocialUserGroup](functions/xblsocialmanagerdestroysocialusergroup.md) | Destroys a created Social User Group. |  
| [XblSocialManagerDoWork](functions/xblsocialmanagerdowork.md) | Called whenever the title wants to update the social graph and get list of change events. |  
| [XblSocialManagerGetLocalUserCount](functions/xblsocialmanagergetlocalusercount.md) | Get the number of local users currently tracked by SocialManager. |  
| [XblSocialManagerGetLocalUsers](functions/xblsocialmanagergetlocalusers.md) | Returns user handles for all users tracked by SocialManager. |  
| [XblSocialManagerPresenceRecordIsUserPlayingTitle](functions/xblsocialmanagerpresencerecordisuserplayingtitle.md) | Query whether the user associated with the provided presence record is playing a given title id. |  
| [XblSocialManagerRemoveLocalUser](functions/xblsocialmanagerremovelocaluser.md) | Immediately removes a social graph for the specified local user. |  
| [XblSocialManagerSetRichPresencePollingStatus](functions/xblsocialmanagersetrichpresencepollingstatus.md) | Sets whether to enable social manager to poll every 30 seconds from the presence service. |  
| [XblSocialManagerUpdateSocialUserGroup](functions/xblsocialmanagerupdatesocialusergroup.md) | Updates specified social user group to new group of users. |  
| [XblSocialManagerUserGroupGetFilters](functions/xblsocialmanagerusergroupgetfilters.md) | Gets the filters for a filter group. |  
| [XblSocialManagerUserGroupGetLocalUser](functions/xblsocialmanagerusergroupgetlocaluser.md) | Gets local user the group is associated with. |  
| [XblSocialManagerUserGroupGetType](functions/xblsocialmanagerusergroupgettype.md) | Gets the type of a Social Manager user group. |  
| [XblSocialManagerUserGroupGetUsers](functions/xblsocialmanagerusergroupgetusers.md) | Gets an XblSocialManagerUserPtrArray of the users tracked by the user group. |  
| [XblSocialManagerUserGroupGetUsersTrackedByGroup](functions/xblsocialmanagerusergroupgetuserstrackedbygroup.md) | Gets a pointer to an XSAPI owned array of xuids tracked by the group. |  
  
## Handles  
  
| Handle | Description |  
| --- | --- |  
| [XblSocialManagerUserGroupHandle](handles/xblsocialmanagerusergrouphandle.md) | A handle to a social manager user group. |  
  
## Structures  
  
| Structure | Description |  
| --- | --- |  
| [XblPreferredColor](structs/xblpreferredcolor.md) | Preferred color for the user. Set via the shell. |  
| [XblSocialManagerEvent](structs/xblsocialmanagerevent.md) | An event that something in the social graph has changed. |  
| [XblSocialManagerPresenceRecord](structs/xblsocialmanagerpresencerecord.md) | Social manager presence record. Shows information on users current presence status and stores title records. |  
| [XblSocialManagerPresenceTitleRecord](structs/xblsocialmanagerpresencetitlerecord.md) | Social manager version of the presence title record. Gives information about different titles presence information. |  
| [XblSocialManagerUser](structs/xblsocialmanageruser.md) | Xbox Social User that contains profile, presence, preferred color, and title history data. |  
| [XblTitleHistory](structs/xbltitlehistory.md) | Data about whether the user has played the title. |  
