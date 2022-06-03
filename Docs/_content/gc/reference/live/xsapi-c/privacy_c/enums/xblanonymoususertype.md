---
author: joannaleecy
title: XblAnonymousUserType
description: Represents the different classes of non-Xbox Live users that we can check permissions for.
kindex: XblAnonymousUserType
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
quality: good
applies-to: pc-gdk
---

# XblAnonymousUserType  

Represents the different classes of non-Xbox Live users that we can check permissions for.    

## Syntax  
  
```cpp
enum class XblAnonymousUserType  : uint32_t  
{  
    Unknown = 0,  
    CrossNetworkUser,  
    CrossNetworkFriend  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| Unknown | Invalid XblAnonymousUserType. Returned if service returns unrecognized XblAnonymousUserType |  
| CrossNetworkUser | A non Xbox Live user. |  
| CrossNetworkFriend | A non Xbox Live user that a title recognizes as an in-game friend. |  
  
## Member of
  
[XblPermissionCheckResult](../structs/xblpermissioncheckresult.md)
  
## Argument of
  
[XblPrivacyCheckPermissionForAnonymousUserAsync](../functions/xblprivacycheckpermissionforanonymoususerasync.md)  
[XblPrivacyBatchCheckPermissionAsync](../functions/xblprivacybatchcheckpermissionasync.md)
  
## Requirements  
  
**Header:** privacy_c.h
  
## See also  
[privacy_c](../privacy_c_members.md)  
  
  