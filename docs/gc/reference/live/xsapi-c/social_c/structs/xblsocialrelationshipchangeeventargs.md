---
author: joannaleecy
title: XblSocialRelationshipChangeEventArgs
description: Event arguments for a social relationship change.
kindex: XblSocialRelationshipChangeEventArgs
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblSocialRelationshipChangeEventArgs  

Event arguments for a social relationship change.  

## Syntax  
  
```cpp
typedef struct XblSocialRelationshipChangeEventArgs {  
    uint64_t callerXboxUserId;  
    XblSocialNotificationType socialNotification;  
    uint64_t* xboxUserIds;  
    size_t xboxUserIdsCount;  
} XblSocialRelationshipChangeEventArgs  
```
  
### Members  
  
*callerXboxUserId*  
Type: uint64_t  
  
The Xbox user ID for the user who's social graph changes are being listed for.
  
*socialNotification*  
Type: [XblSocialNotificationType](../enums/xblsocialnotificationtype.md)  
  
The type of notification change.
  
*xboxUserIds*  
Type: uint64_t*  
  
The Xbox user ids who the event is for.
  
*xboxUserIdsCount*  
Type: size_t  
  
The number of strings in the xboxUserIds array.
  
## Requirements  
  
**Header:** social_c.h
  
## See also  
[social_c](../social_c_members.md)  
  
  