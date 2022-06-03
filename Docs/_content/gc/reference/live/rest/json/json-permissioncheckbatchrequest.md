---
title: PermissionCheckBatchRequest (JSON)
description: " PermissionCheckBatchRequest (JSON)"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# PermissionCheckBatchRequest (JSON)
Collection of PermissionCheckBatchRequest objects. 
<a id="ID4EP"></a>

 
## PermissionCheckBatchRequest
 
The PermissionCheckBatchRequest object has the following specification.
 
| Member| Type| Description| 
| --- | --- | --- | 
| Users| Array of Users| Required. Array of targets to check permission against. Each entry in this array is either an Xbox User ID (XUID) or an anonymous off-network user for cross-network scenarios ("anonymousUser":"allUsers"). | 
| Permissions| Array of [PermissionId Enumeration](../enums/privacy-enum-permissionid.md)| Required. The permissions to check against each user.| 
  
<a id="ID4E3B"></a>

 
## Sample JSON syntax
 

```json
{
    "users":
    [
        {"xuid":"12345"},
        {"xuid":"54321"}
    ],
    "permissions":
    [
        "ShareFriendList",
        "ShareGameHistory"
    ]
}
    
```

  
<a id="ID4EFC"></a>

 
## See also
 
<a id="ID4EHC"></a>

 
##### Parent 

[JavaScript Object Notation (JSON) Object Reference](atoc-xboxlivews-reference-json.md)

   