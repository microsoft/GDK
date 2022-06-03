---
author: joannaleecy
title: XblSocialRelationshipFilter
description: Defines the relationship filters available for social groups.
kindex: XblSocialRelationshipFilter
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
quality: good
applies-to: pc-gdk
---

# XblSocialRelationshipFilter  

Defines the relationship filters available for social groups.    

## Syntax  
  
```cpp
enum class XblSocialRelationshipFilter  : uint32_t  
{  
    All,  
    Favorite,  
    LegacyXboxLiveFriends  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| All | All the people on the user's people list. |  
| Favorite | Filters to only the people on the user's people list that have the attribute "Favorite" associated with them. |  
| LegacyXboxLiveFriends | Filters to only the people on the user's people list that are also legacy Xbox Live friends. |  
  
## Argument of
  
[XblSocialGetSocialRelationshipsAsync](../functions/xblsocialgetsocialrelationshipsasync.md)
  
## Requirements  
  
**Header:** social_c.h
  
## See also  
[social_c](../social_c_members.md)  
  
  