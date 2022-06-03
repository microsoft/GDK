---
author: joannaleecy
title: XblSocialManagerEvent
description: An event that something in the social graph has changed.
kindex: XblSocialManagerEvent
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
quality: good
applies-to: pc-gdk
---

# XblSocialManagerEvent  

An event that something in the social graph has changed.  

## Syntax  
  
```cpp
typedef struct XblSocialManagerEvent {  
    XblUserHandle user;  
    XblSocialManagerEventType eventType;  
    hr eventType;  
    XblSocialManagerUserGroupHandle groupAffected;  
    XblSocialManagerUser* usersAffected[XBL_SOCIAL_MANAGER_MAX_AFFECTED_USERS_PER_EVENT];  
} XblSocialManagerEvent  
```
  
### Members  
  
*user*  
Type: XblUserHandle  
  
The user whose graph got changed.
  
*eventType*  
Type: [XblSocialManagerEventType](../enums/xblsocialmanagereventtype.md)  
  
The type of event this is.
  
*eventType*  
Type: hr  
  
Error that occurred, or S_OK.
  
*groupAffected*  
Type: XblSocialManagerUserGroupHandle  
  
The user group that was loaded for XblSocialManagerEventType::SocialUserGroupLoaded or updated. For XblSocialManagerEventType::SocialUserGroupUpdated. Will be null for other types of events.
  
*usersAffected*  
Type: [XblSocialManagerUser*](xblsocialmanageruser.md)[XBL_SOCIAL_MANAGER_MAX_AFFECTED_USERS_PER_EVENT]  
  
The users affected. Returned pointers valid until the next XblSocialManagerDoWork call.
  
## Argument of
  
[XblSocialManagerDoWork](../functions/xblsocialmanagerdowork.md)
  
## Requirements  
  
**Header:** social_manager_c.h
  
## See also  
[social_manager_c](../social_manager_c_members.md)  
  
  