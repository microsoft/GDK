---
author: joannaleecy
title: XblPermissionDenyReasonDetails
description: This struct gives details about why permission is denied.
kindex: XblPermissionDenyReasonDetails
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
quality: good
applies-to: pc-gdk
---

# XblPermissionDenyReasonDetails  

This struct gives details about why permission is denied.  

## Syntax  
  
```cpp
typedef struct XblPermissionDenyReasonDetails {  
    XblPermissionDenyReason reason;  
    XblPrivilege restrictedPrivilege;  
    XblPrivacySetting restrictedPrivacySetting;  
} XblPermissionDenyReasonDetails  
```
  
### Members  
  
*reason*  
Type: [XblPermissionDenyReason](../enums/xblpermissiondenyreason.md)  
  
Reason why permission was denied. Additional detail maybe found in restrictedPrivilege or restrictedPrivacySetting depending on what the reason is.
  
*restrictedPrivilege*  
Type: [XblPrivilege](../enums/xblprivilege.md)  
  
Active when the deny reason is either XblPermissionDenyReason::MissingPrivilege or XblPermissionDenyReason::PrivilegeRestrictsTarget. Unknown otherwise.
  
*restrictedPrivacySetting*  
Type: [XblPrivacySetting](../enums/xblprivacysetting.md)  
  
Active when the deny reason is XblPermissionDenyReason::PrivacySettingsRestrictsTarget. Unknown otherwise.
  
## Member of
  
* [XblPermissionCheckResult](xblpermissioncheckresult.md)
  
## Requirements  
  
**Header:** privacy_c.h
  
## See also  
[privacy_c](../privacy_c_members.md)  
  
  