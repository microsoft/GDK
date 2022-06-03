---
title: PermissionCheckBatchUserResponse (JSON)
description: " PermissionCheckBatchUserResponse (JSON)"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# PermissionCheckBatchUserResponse (JSON)
The reasons of a batch permission check for list of permission values for a single target user. 
<a id="ID4EN"></a>

 
## PermissionCheckBatchUserResponse
 
The PermissionCheckBatchUserResponse object has the following specification.
 
| Member| Type| Description| 
| --- | --- | --- | 
| User| string| Required. This member is <b>true</b> if the requesting user is allowed to perform the requested action with the target user.| 
| Permissions| Array of [PermissionCheckResponse (JSON)](json-permissioncheckresponse.md)| Required. A [PermissionCheckResponse (JSON)](json-permissioncheckresponse.md) for each permission that was asked for in the original request, in the same order as in the request.| 
  
<a id="ID4E4B"></a>

 
## Sample JSON syntax
 

```json
{
    "User": {"Xuid": "12345"},
    "Permissions":
    [
        {
            "isAllowed": true
        },
        {
            "isAllowed": false
        },
        {
            "isAllowed": false,
            "reasons":
            [
                {"reason": "BlockedByRequestor"},
                {"reason": "MissingPrivilege", "restrictedSetting": "VideoCommunications"}
            ]
        }
    ]
}
    
```

  
<a id="ID4EGC"></a>

 
## See also
 
<a id="ID4EIC"></a>

 
##### Parent 

[JavaScript Object Notation (JSON) Object Reference](atoc-xboxlivews-reference-json.md)

   