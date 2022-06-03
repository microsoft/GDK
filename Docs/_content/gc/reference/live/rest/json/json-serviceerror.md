---
title: ServiceError (JSON)
description: " ServiceError (JSON)"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# ServiceError (JSON)
Contains information about an error returned when a call to the service failed. 
<a id="ID4EN"></a>

 
## ServiceError
 
The ServiceError object has the following specification.
 
| Member| Type| Description| 
| --- | --- | --- | 
| code| 32-bit signed integer | The type of error. See the table below for possible values. | 
| source| string | The name of the service that raised the error. For example, a value of <code>ReputationFD</code> indicates that the error was in the reputation service. | 
| description| string| A description of the error. | 
 
<a id="ID4EBC"></a>

 
### Error Codes
 
| Value| Description| 
| --- | --- | --- | --- | --- | 
| 0| Success No error| 
| 4000| Invalid Request Body The JSON document submitted with a POST request failed validation. See the description field for details. | 
| 4100| User Does Not Exist The XUID contained in the request URI does not represent a valid user on XBOX Live.| 
| 4500| Authorization Error The caller is not authorized to perform the requested operation.| 
| 5000| Service Error There was an internal error in the service| 
| 5300| Service Unavailable The service is unavailable.| 
   
<a id="ID4EQE"></a>

 
## Sample JSON syntax
 

```json
{
    "code": 4000,
    "source": "ReputationFD",
    "description": "No targetXuid field was supplied in the request"
}
    
```

  
<a id="ID4EZE"></a>

 
## See also
 
<a id="ID4E2E"></a>

 
##### Parent 

[JavaScript Object Notation (JSON) Object Reference](atoc-xboxlivews-reference-json.md)

   