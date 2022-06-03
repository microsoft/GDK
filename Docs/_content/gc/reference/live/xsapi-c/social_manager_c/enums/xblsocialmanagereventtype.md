---
author: joannaleecy
title: XblSocialManagerEventType
description: The types of possible social manager events.
kindex: XblSocialManagerEventType
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
quality: good
applies-to: pc-gdk
---

# XblSocialManagerEventType  

The types of possible social manager events.    

## Syntax  
  
```cpp
enum class XblSocialManagerEventType  : uint32_t  
{  
    UsersAddedToSocialGraph,  
    UsersRemovedFromSocialGraph,  
    PresenceChanged,  
    ProfilesChanged,  
    SocialRelationshipsChanged,  
    LocalUserAdded,  
    SocialUserGroupLoaded,  
    SocialUserGroupUpdated,  
    UnknownEvent  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| UsersAddedToSocialGraph | Fired when one or more users are added to social graph. Users are added to the graph if they are tracked by a list group or if they are followed by the local user. |  
| UsersRemovedFromSocialGraph | Fired when one or more users are removed from social graph. User's will be removed from the social graph if they aren't followed by the local user, nor are they tracked by any list groups. |  
| PresenceChanged | Users presence record has changed. This event implies that the set of users tracked by filter groups may have changed (i.e. if the group was created with an XblPresenceFilter). |  
| ProfilesChanged | Users profile information has changed. |  
| SocialRelationshipsChanged | Relationship to users has changed. This event implies that the set of users tracked by filter groups may have changed (i.e. if the group was created with an XblRelationshipFilter). |  
| LocalUserAdded | Fired when the initial social graph has been loaded for a local user. |  
| SocialUserGroupLoaded | Fired when all users tracked by a social group are in social graph. |  
| SocialUserGroupUpdated | After updating a list based user group with [XblSocialManagerUpdateSocialUserGroup](../functions/xblsocialmanagerupdatesocialusergroup.md), this event is fired to indicate all of the new users are in the social graph. If they are not already part of the graph, the new users will be added. Note that this event doesn't apply for filter based user groups. |  
| UnknownEvent | Unknown. |  
  
## Member of
  
[XblSocialManagerEvent](../structs/xblsocialmanagerevent.md)
  
## Requirements  
  
**Header:** social_manager_c.h
  
## See also  
[social_manager_c](../social_manager_c_members.md)  
  
  