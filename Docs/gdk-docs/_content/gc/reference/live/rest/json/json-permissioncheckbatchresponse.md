---
title: PermissionCheckBatchResponse (JSON)
description: " PermissionCheckBatchResponse (JSON)"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# PermissionCheckBatchResponse (JSON)
The results of a batch permission check for a list of permission values for multiple users. 
<a id="ID4EN"></a>

 
## PermissionCheckBatchResponse
 
The PermissionCheckBatchResponse object has the following specification.
 
| Member| Type| Description| 
| --- | --- | --- | 
| Responses| Array of [PermissionCheckBatchUserResponse (JSON)](json-permissioncheckbatchuserresponse.md)| Required. A [PermissionCheckBatchUserResponse (JSON)](json-permissioncheckbatchuserresponse.md) object for each permission that was asked for in the original request, in the same order as in that request.| 
  
<a id="ID4EQB"></a>

 
## Sample JSON syntax
 

```json
{
    "responses":
    [
        {
            "user": {"xuid":"12345"},
            "permissions":
            [
                {
                    "isAllowed":true
                },
                {
                    "isAllowed":true
                }
            ]
        },
        {
            "user": {"xuid":"54321"},
            "permissions":
            [
                {
                    "isAllowed":false,
                    "reasons":
                    [
                        {"reason":"NotAllowed"}
                    ]
                },
                {
                    "isAllowed":false,
                    "reasons":
                    [
                        {"reason":"PrivilegeRestrictsTarget", "restrictedSetting":"AllowProfileViewing"}
                    ]
                }
            ]
        }
    ]
}
    
```

  
<a id="ID4EZB"></a>

 
## See also
 
<a id="ID4E2B"></a>

 
##### Parent 

[JavaScript Object Notation (JSON) Object Reference](atoc-xboxlivews-reference-json.md)

   