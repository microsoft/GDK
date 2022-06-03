---
author: joannaleecy
title: privacy_c (contents)
description: Privacy C API
kindex: privacy_c
ms.author: migreen
ms.topic: navigation
security: public
edited: 00/00/0000
applies-to: pc-gdk
---

# privacy_c  



  
## Enumerations  
  
| Enumeration | Description |  
| --- | --- |  
| [XblAnonymousUserType](enums/xblanonymoususertype.md) | Represents the different classes of non-Xbox Live users that we can check permissions for. |  
| [XblPermission](enums/xblpermission.md) | Actions that a client can check permission for. |  
| [XblPermissionDenyReason](enums/xblpermissiondenyreason.md) | This describes the various ways that we expose to a requestor why a permission check may fail. |  
| [XblPrivacySetting](enums/xblprivacysetting.md) | All of the things protected by the Privacy Engine. |  
| [XblPrivilege](enums/xblprivilege.md) | Controls user's privileges. |  
  
## Functions  
  
| Function | Description |  
| --- | --- |  
| [XblPrivacyBatchCheckPermissionAsync](functions/xblprivacybatchcheckpermissionasync.md) | Check multiple permissions with multiple target users. Each permission will be checked against each target user. |  
| [XblPrivacyBatchCheckPermissionResult](functions/xblprivacybatchcheckpermissionresult.md) | Get the results for an XblPrivacyBatchCheckPermissionAsync call. |  
| [XblPrivacyBatchCheckPermissionResultSize](functions/xblprivacybatchcheckpermissionresultsize.md) | Get the result size for an XblPrivacyBatchCheckPermissionAsync call. |  
| [XblPrivacyCheckPermissionAsync](functions/xblprivacycheckpermissionasync.md) | Check a single permission with a single target user. |  
| [XblPrivacyCheckPermissionForAnonymousUserAsync](functions/xblprivacycheckpermissionforanonymoususerasync.md) | Check a single permission for class of anonymous users. |  
| [XblPrivacyCheckPermissionForAnonymousUserResult](functions/xblprivacycheckpermissionforanonymoususerresult.md) | Get the result for an XblPrivacyCheckPermissionForAnonymousUserAsync call. |  
| [XblPrivacyCheckPermissionForAnonymousUserResultSize](functions/xblprivacycheckpermissionforanonymoususerresultsize.md) | Get the result size for an XblPrivacyCheckPermissionForAnonymousUserAsync call. |  
| [XblPrivacyCheckPermissionResult](functions/xblprivacycheckpermissionresult.md) | Get the result for an XblPrivacyCheckPermissionAsync call. |  
| [XblPrivacyCheckPermissionResultSize](functions/xblprivacycheckpermissionresultsize.md) | Get the result size for an XblPrivacyCheckPermissionAsync call. |  
| [XblPrivacyGetAvoidListAsync](functions/xblprivacygetavoidlistasync.md) | Get the list of Xuids the calling user should avoid during multiplayer matchmaking. |  
| [XblPrivacyGetAvoidListResult](functions/xblprivacygetavoidlistresult.md) | Get result for an XblPrivacyGetAvoidListAsync call. |  
| [XblPrivacyGetAvoidListResultCount](functions/xblprivacygetavoidlistresultcount.md) | Get result count for an XblPrivacyGetAvoidListAsync call. |  
| [XblPrivacyGetMuteListAsync](functions/xblprivacygetmutelistasync.md) | Get the list of Xuids that the calling user should not hear (mute) during multiplayer matchmaking. |  
| [XblPrivacyGetMuteListResult](functions/xblprivacygetmutelistresult.md) | Get result for an XblPrivacyGetMuteListAsync call. |  
| [XblPrivacyGetMuteListResultCount](functions/xblprivacygetmutelistresultcount.md) | Get result count for an XblPrivacyGetMuteListAsync call. |  
  
## Structures  
  
| Structure | Description |  
| --- | --- |  
| [XblPermissionCheckResult](structs/xblpermissioncheckresult.md) | Struct describing the result of a permission check request. |  
| [XblPermissionDenyReasonDetails](structs/xblpermissiondenyreasondetails.md) | This struct gives details about why permission is denied. |  
