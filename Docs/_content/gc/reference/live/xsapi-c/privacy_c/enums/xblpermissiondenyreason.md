---
author: joannaleecy
title: XblPermissionDenyReason
description: This describes the various ways that we expose to a requestor why a permission check may fail.
kindex: XblPermissionDenyReason
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
quality: good
applies-to: pc-gdk
---

# XblPermissionDenyReason  

This describes the various ways that we expose to a requestor why a permission check may fail.    

## Syntax  
  
```cpp
enum class XblPermissionDenyReason  : uint32_t  
{  
    Unknown = 0,  
    NotAllowed = 2,  
    MissingPrivilege = 3,  
    PrivilegeRestrictsTarget = 4,  
    BlockListRestrictsTarget = 5,  
    MuteListRestrictsTarget = 7,  
    PrivacySettingsRestrictsTarget = 9,  
    CrossNetworkUserMustBeFriend = 12  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| Unknown | Permission was denied, but either no reason was given or the privacy service threw an unexpected error. |  
| NotAllowed | The request was processed successfully, but the requestor is not allowed to perform the action. No reason is given. |  
| MissingPrivilege | The requestor was missing a privilege necessary for the action. |  
| PrivilegeRestrictsTarget | A privilege value for the requestor has a restriction that doesn't allow interaction with the target. For instance, a parental control only allows interaction with friends and the target isn't a friend. |  
| BlockListRestrictsTarget | The requestor has blocked the target user. |  
| MuteListRestrictsTarget | The requestor has muted the target user. |  
| PrivacySettingsRestrictsTarget | A privacy value for the requestor has a restriction that doesn't allow interaction with the target. For instance, a parental control only allows interaction with friends and the target isn't a friend. |  
| CrossNetworkUserMustBeFriend | The target is a cross-network user, but cross-network privacy settings indicated only friends are allowed. Cross-network friends are (currently) only managed at the title level, so the title must validate that the user are friends. |  
  
## Member of
  
* [XblPermissionDenyReasonDetails](../structs/xblpermissiondenyreasondetails.md)
  
## Requirements  
  
**Header:** privacy_c.h
  
## See also  
[privacy_c](../privacy_c_members.md)  
  
  