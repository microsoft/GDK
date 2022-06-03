---
title: ServiceErrorResponse (JSON)
description: " ServiceErrorResponse (JSON)"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# ServiceErrorResponse (JSON)
When a service error is encountered, an appropriate HTTP error code will be returned. Optionally, the service may also include a ServiceErrorResponse object as defined below. In production environments, less data may be included. 
<a id="ID4EN"></a>

 
## ServiceErrorResponse
 
The ServiceErrorResponse object has the following specification.
 
| Member| Type| Description| 
| --- | --- | --- | 
| <b>errorCode</b>| 32-bit signed integer| Code associated with the error (can be null).| 
| <b>errorMessage</b>| string| Additional details about the error.| 
  
<a id="ID4EVB"></a>

 
## Sample JSON syntax
 

```json
{
   "errorCode": 8377,
   "errorMessage": "XUID specified in the claim does not match URI XUID."
 }
    
```

  
<a id="ID4E5B"></a>

 
## See also
 
<a id="ID4EAC"></a>

 
##### Parent 

[JavaScript Object Notation (JSON) Object Reference](atoc-xboxlivews-reference-json.md)

   